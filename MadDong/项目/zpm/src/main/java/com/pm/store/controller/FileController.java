package com.pm.store.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import com.pm.utils.Constants;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
@RequestMapping("/ck")
public class FileController {
	static Logger logger = Logger.getLogger(FileController.class);
	
	@RequestMapping("/upload")
	public void upload(MultipartHttpServletRequest request, PrintWriter out){
		try {
			MultipartFile file = request.getFile("upload");
			String fileName = UUID.randomUUID().toString();
			File newFile = new File(Constants.IMAGE_PATH + fileName);
			file.transferTo(newFile);
			String callback = request.getParameter("CKEditorFuncNum");   
	        out.println("<script type=\"text/javascript\">");  
	        out.println("window.parent.CKEDITOR.tools.callFunction("+ callback + ",'" +
	        		request.getContextPath() + "/show/"+ fileName + "','')");
	        out.println("</script>"); 
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}


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

					}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
