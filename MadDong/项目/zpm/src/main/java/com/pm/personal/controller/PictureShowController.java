package com.pm.personal.controller;

import com.pm.utils.Constants;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

@Controller
public class PictureShowController {
    @RequestMapping("/show/{name}")
    public void showPicture(@PathVariable("name") String name, HttpServletResponse response){
        File file = new File(Constants.IMAGE_PATH + name);

        if (file.exists()) {
            try {
//				response.setHeader("Content-Disposition", "attachment;filename="+name);
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
            PrintWriter out = null;
            try {
                out = response.getWriter();
            } catch (IOException e) {
                e.printStackTrace();
            }
            out.print("图片不存在");
        }
    }
}
