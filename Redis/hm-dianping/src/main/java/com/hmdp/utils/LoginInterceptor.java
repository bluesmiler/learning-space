package com.hmdp.utils;

import com.hmdp.dto.UserDTO;
import com.hmdp.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //1、获取session中的用户，并判断是否存在
        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");
        //2、不存在，则拦截，返回401
        if (user == null) {
            response.setStatus(401);
            return false;
        }
        //3、存在，则保存用户信息到ThreadLocal中
        UserHolder.saveUser((UserDTO) user);

        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}
