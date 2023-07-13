package com.pm.personal.biz;
import com.pm.entity.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

import com.pm.exception.MyException;

@Service
public class SecurityBiz {

    public void login(String phone, String password)throws MyException{
        Subject user = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(phone, password);
        try {
            user.login(token);
        }catch (AuthenticationException e){
            e.printStackTrace();
            throw new MyException("认证失败");
        }
    }

    public void logout(){
        Subject user = SecurityUtils.getSubject();
        user.logout();

    }


}
