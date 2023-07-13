package com.hmdp.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.UUID;
import cn.hutool.core.util.RandomUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hmdp.dto.LoginFormDTO;
import com.hmdp.dto.Result;
import com.hmdp.dto.UserDTO;
import com.hmdp.entity.User;
import com.hmdp.mapper.UserMapper;
import com.hmdp.service.IUserService;
import com.hmdp.utils.RegexUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import java.util.Map;
import java.util.concurrent.TimeUnit;

import static com.hmdp.utils.RedisConstants.*;
import static com.hmdp.utils.SystemConstants.USER_NICK_NAME_PREFIX;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author 虎哥
 * @since 2021-12-22
 */
@Slf4j
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Override
    public Result sendCode(String phone, HttpSession session) {
        // 1、校验手机号，是否符合规则
        if (RegexUtils.isPhoneInvalid(phone)) {
            // 2、若不符合，返回错误信息
            return Result.fail("请输入正确的手机号");
        }

        // 3、符合则生成验证码
        String code = RandomUtil.randomNumbers(6);

        //        4、保存验证码到session
        //        session.setAttribute("code", code);

        //4、保存验证码到redis
        stringRedisTemplate.opsForValue().set(LOGIN_CODE_KEY + phone, code, LOGIN_CODE_TTL, TimeUnit.MINUTES);

        // 5、发送验证码
        log.debug("发送短信验证码成功，验证码：{}", code);
        // 返回OK
        return Result.ok();
    }

    @Override
    public Result login(LoginFormDTO loginForm, HttpSession session) {
        String phone = loginForm.getPhone();
        String code = loginForm.getCode();
        String password = loginForm.getPassword();

        //Object cacheCode = session.getAttribute("code");
        //从redis中获取数据
        Object cacheCode = stringRedisTemplate.opsForValue().get(LOGIN_CODE_KEY + phone);

        //1、校验手机号、验证码
        if (RegexUtils.isPhoneInvalid(phone)) {
            // 2、若不符合，返回错误信息
            return Result.fail("请输入正确的手机号");
        }
        if (cacheCode == null || !cacheCode.equals(code)) {
            //2、不一致，报错
            return Result.fail("验证码错误");
        }

        //3、一致，查询手机用户，判断是否存在
        User user = query().eq("phone", phone).one();
        //4、不存在，创建用户并保存
        if (user == null) {
            user = createUserByPhone(phone);
        }
        //5、存在，保存到session中，放行
        //session.setAttribute("user", BeanUtil.copyProperties(user, UserDTO.class));

        //5、存在，保存到redis中，放行
        //5.1、生成Token，作为登陆令牌
        String token = UUID.randomUUID().toString(true);
        //5.2、将User对象转换为Hash存储
        UserDTO userDTO = BeanUtil.copyProperties(user, UserDTO.class);
        Map<String, Object> userMap = BeanUtil.beanToMap(userDTO);
        String tokenKey = LOGIN_USER_KEY + token;
        stringRedisTemplate.opsForHash().putAll(tokenKey, userMap);
        //5.3、设置token有效期
        stringRedisTemplate.expire(tokenKey, LOGIN_USER_TTL, TimeUnit.MINUTES);

        return Result.ok(token);
    }

    private User createUserByPhone(String phone) {
        //1、创建用户
        User user = new User();
        user.setPhone(phone);
        user.setNickName(USER_NICK_NAME_PREFIX + RandomUtil.randomString(8));

        //2、保存用户
        save(user);
        return user;
    }
}
