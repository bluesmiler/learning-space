package com.pm.comm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pm.comm.biz.ShareBiz;
import com.pm.comm.biz.SharePictureBiz;
import com.pm.entity.Share;
import com.pm.entity.SharePicture;
import com.pm.entity.User;
import com.pm.utils.Constants;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import java.io.File;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;
/**
 * @Author  WangShiWen
 * @Description: 邻里分享
 * @Date: 11:36 2017/10/28 0028
 **/
@Controller
@RequestMapping("/share")
public class ShareController {
    @Resource
    ShareBiz shareBiz;
    @Resource
    SharePictureBiz sharePictureBiz;
/**
 * @Author  WangShiWen
 * @Description: 展示+分页
 * @Date: 11:36 2017/10/28 0028
 **/
    @RequestMapping("/list")
    public String list(Model model,@RequestParam(required=true,defaultValue="1") Integer page){
        PageHelper.startPage(page, 5);
        List<Share> list = shareBiz.findByAll();
        PageInfo<Share> p =new PageInfo<Share>(list);
        model.addAttribute("page", p);
        model.addAttribute("list",list);
       return "/comm/sharelist";
    }

    @RequestMapping("/skip")
    public String skip(){
        return "comm/CongGe";
    }
/**
 * @Author  WangShiWen
 * @Description: 添加帖子
 * @Date: 11:36 2017/10/28 0028
 **/
    @RequestMapping("/add")
    public String add(Share share, MultipartHttpServletRequest request) throws IOException {
        SharePicture sharePicture = new SharePicture();
//        User user = (User) session.getAttribute("user");
//        获取用户属性
        User user =(User)SecurityUtils.getSubject().getPrincipals().getPrimaryPrincipal();
        MultipartFile file  = request.getFile("file");
        String fileNmae = UUID.randomUUID().toString();
        File newfile = new File(Constants.IMAGE_PATH + fileNmae);
        file.transferTo(newfile);
        sharePicture.setSharePictureAttribute(fileNmae);
        sharePicture.setSharePictureName(file.getOriginalFilename());
        share.setUser(user);
        shareBiz.saveshare(share);
        sharePicture.setShareId(share.getShareId());
        sharePictureBiz.savepicture(sharePicture);
        return "redirect:/share/list";
    }
    /**
     * @Author  WangShiWen
     * @Description: 显示详情
     * @Date: 9:49 2017/10/30 0030
     **/
    @RequestMapping("/findId/{shareId}")
    public String findId(@PathVariable("shareId")Integer shareId,Model model){
        Share share = shareBiz.findById(shareId);
        model.addAttribute("share",share);
        return "/comm/ShareFindId";
    }

    /**
     * @Author  WangShiWen
     * @Description: 显示图片
     * @Date: 10:05 2017/10/30 0030
     **/
    @RequestMapping("/doshow")
    public void doshow(String sharePictureName,HttpServletResponse response){
        File file = new File(Constants.IMAGE_PATH+sharePictureName);
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
    /**
     * @Author  WangShiWen
     * @Description: 查看个人帖子
     * @Date: 10:14 2017/11/2 0002
     **/
    @RequestMapping("/findsge")
    public String findsge(Share share,Model Model){
        User user =(User) SecurityUtils.getSubject().getPrincipals().getPrimaryPrincipal();
        List<Share> list = shareBiz.findByuserId(user.getUserId());
        Model.addAttribute("list",list);
        return "/comm/ShareGe";
    }
    /**
     * @Author  WangShiWen
     * @Description: 删除个人帖子
     * @Date: 10:19 2017/11/2 0002
     **/
    @RequestMapping("/delete/{shareId}")
    public String delete(@PathVariable("shareId") Integer shareId){
        shareBiz.delete(shareId);
        return "redirect:/share/findsge";
    }
}
