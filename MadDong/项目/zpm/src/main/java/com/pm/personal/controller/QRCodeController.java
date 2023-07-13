package com.pm.personal.controller;

import com.pm.entity.Visitor;
import com.pm.utils.QRCodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/image")
public class QRCodeController {


    public void showQRC(HttpServletResponse response){
        String content = UUID.randomUUID().toString();
        BufferedImage bufferedImage = QRCodeUtil.getImage(content);

        try {
            ImageIO.write(bufferedImage,"png",response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    @RequestMapping("/createVistor")
    public void createQRC (Visitor visitor){

    }

}
