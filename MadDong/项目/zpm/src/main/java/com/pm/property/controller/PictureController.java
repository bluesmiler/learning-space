package com.pm.property.controller;

import com.pm.utils.Constants;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
@RequestMapping("/picture")
@Controller
public class PictureController {
    @RequestMapping("/show/{name}")
    public void show(@PathVariable("name") String name, HttpServletResponse response){
        try {
            File file = new File(Constants.IMAGE_PATH + name);
            if (file.exists()) {
                try {
                    FileInputStream fis = new FileInputStream(file);
                    OutputStream os = response.getOutputStream();
                    byte[] b = new byte[1024];
                    int len = 0;
                    while ((len = fis.read(b)) != -1) {
                        os.write(b, 0, len);
                    }
                    fis.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                System.out.println("file not exsit");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}

