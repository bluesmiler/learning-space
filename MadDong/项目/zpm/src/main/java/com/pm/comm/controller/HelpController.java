package com.pm.comm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pm.comm.biz.HelpBiz;
import com.pm.comm.biz.HelpPictureBiz;
import com.pm.entity.*;
import com.pm.utils.Constants;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;
/**
 * @Author  WangShiWen
 * @Description: 推送文章展示
 * @Date: 11:29 2017/10/28
 **/
@Controller
@RequestMapping("/help")
public class HelpController {
    @Resource
    HelpBiz helpBiz;
    @Resource
    HelpPictureBiz helpPictureBiz;

    /**
     * @Author WangShiWen
     * @Description: 显示界面
     * @Date: 11:31 2017/10/28 0028
     **/
    @RequestMapping("/list")
    public String list(Model model,@RequestParam(required=true,defaultValue="1") Integer page) {
        PageHelper.startPage(page, 5);
        List<Help> list = helpBiz.findByAll();
        PageInfo<Help> p=new PageInfo<Help>(list);
        model.addAttribute("page", p);
        model.addAttribute("list", list);
        return "/comm/HelpControllerList";
    }


/**
 * @Author  WangShiWen
 * @Description: 显示图片
 * @Date: 12:10 2017/10/28 0028
 **/
    @RequestMapping("/doshow")
    public void doshow(String helpPictureName,HttpServletResponse response){
        File file = new File(Constants.IMAGE_PATH+helpPictureName);
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
        }
    }

        @RequestMapping("/skip")
        public String skip() {
            return "/comm/helpAdd";
        }

        /**
         * @Author WangShiWen
         * @Description: 添加帖子
         * @Date: 11:31 2017/10/28 0028
         **/
        @RequestMapping("/add")
        public String add(Help help, MultipartHttpServletRequest request) throws IOException {
            HelpPicture helpPicture = new HelpPicture();
            User user = (User) SecurityUtils.getSubject().getPrincipals().getPrimaryPrincipal();
            MultipartFile file = request.getFile("file");
            String fileNmae = UUID.randomUUID().toString();
            File newfile = new File(Constants.IMAGE_PATH + fileNmae);
            file.transferTo(newfile);
            helpPicture.setHelpPictureAttribute(fileNmae);
            helpPicture.setHelpPictureName(file.getOriginalFilename());
            help.setUser(user);
            helpBiz.saveHelp(help);
            helpPicture.setHelpId(help.getHelpId());
            helpPictureBiz.savePicture(helpPicture);
            return "/comm/sharelist";
        }
        /**
         * @Author  WangShiWen
         * @Description: 详情
         * @Date: 11:08 2017/10/30 0030
         **/
        @RequestMapping("/findId/{helpId}")
        public String findId(@PathVariable("helpId") Integer helpId,Model model){
            Help help = helpBiz.findById(helpId);
            model.addAttribute("help",help);
            return "/comm/HelpFindId";
        }
}
