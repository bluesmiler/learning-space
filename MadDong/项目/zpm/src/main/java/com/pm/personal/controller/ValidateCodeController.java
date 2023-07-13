package com.pm.personal.controller;

import com.pm.utils.ValidateCodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStream;
@Controller
@RequestMapping("/verificationCode")
public class ValidateCodeController  {

    @RequestMapping("/show/{name}")
    public void showVerificationCode(HttpServletResponse response, HttpSession session) {
        createVerCode(response,session,"validateCode");
    }


    @RequestMapping("/showReg/{name}")
    public void showRegVerificationCode(HttpServletResponse response, HttpSession session) {
        createVerCode(response,session,"validateCodeReg");
    }


    public void createVerCode(HttpServletResponse response,HttpSession session,String verName){
        BufferedImage image = ValidateCodeUtil.getImage(session,verName);
        response.setContentType("image/jpeg");
        OutputStream strm = null;
        try {
            strm = response.getOutputStream();
            ImageIO.write(image, "jpeg", strm);
            strm.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
