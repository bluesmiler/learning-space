package com.pm.comm.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pm.comm.biz.CommentBiz;
import com.pm.comm.biz.CongPictureBiz;
import com.pm.comm.biz.ReplyBiz;
import com.pm.entity.*;
import com.pm.utils.Constants;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pm.comm.biz.CongressHallBiz;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
/**
 * @Author  WangShiWen
 * @Description: 议事厅
 * @Date: 11:34 2017/10/28 0028
 **/
@Controller
@RequestMapping("/cong")
public class CongressController {

	@Resource
    CongressHallBiz congressHallbiz;
	@Resource
	CongPictureBiz congPictureBiz;
	@Resource
	CommentBiz commentBiz;
	@Resource
	ReplyBiz replyBiz;
/**
 * @Author  WangShiWen
 * @Description: 展示+分页
 * @Date: 11:34 2017/10/28 0028
 **/
	@RequestMapping("/list")
	public String list(Model model,@RequestParam(required=true,defaultValue="1") Integer page){
		PageHelper.startPage(page, 5);
		List<CongressHall> list = congressHallbiz.findByAll();
		PageInfo<CongressHall> p=new PageInfo<CongressHall>(list);
		model.addAttribute("page", p);
		model.addAttribute("list",list);
		return "/comm/CongressList";
	}
/**
 * @Author  WangShiWen
 * @Description: 显示图片
 * @Date: 15:58 2017/10/28 0028
 **/
	@RequestMapping("/doshow")
	public void doshow(String congPictureName,HttpServletResponse response){
		File file = new File(Constants.IMAGE_PATH+congPictureName);
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
	public String skip(){
		return "/comm/Geren";
	}

/**
 * @Author  WangShiWen
 * @Description: 添加帖子
 * @Date: 11:34 2017/10/28 0028
 **/

	@RequestMapping("/add")
	public String add(CongressHall congressHall, MultipartHttpServletRequest request) throws IOException {

			CongPictuer congPictuer = new CongPictuer();
			User user =(User) SecurityUtils.getSubject().getPrincipals().getPrimaryPrincipal();
			MultipartFile file  = request.getFile("file");
			String fileNmae = UUID.randomUUID().toString();
			File newfile = new File(Constants.IMAGE_PATH + fileNmae);
			file.transferTo(newfile);
			congPictuer.setCongPictureAttribute(fileNmae);
			congPictuer.setCongPictureName(file.getOriginalFilename());
			congressHall.setUser(user);
			congressHallbiz.saveCong(congressHall);
			congPictuer.setCongressHallId(congressHall.getCongressHallId());
			congPictureBiz.saveCongPicture(congPictuer);
			return "redirect:/cong/list";

	}

	/**
	 * @Author  WangShiWen
	 * @Description: 查看帖子详情+评论+回复
	 * @Date: 16:25 2017/10/29 0029
	 **/
	@RequestMapping("/findId/{congressHallId}")
	public String fandId(@PathVariable("congressHallId") Integer congressHallId, Model model){
		CongressHall congressHall = congressHallbiz.findById(congressHallId);
		model.addAttribute("congressHall",congressHall);
		List<Comment> allList = commentBiz.findById(congressHallId);
		model.addAttribute("allList",allList);

		return "/comm/CongressFindId";
	}

	/**
	 * @Author  WangShiWen
	 * @Description: 添加评论
	 * @Date: 17:23 2017/10/31 0031
	 **/
	@ResponseBody
	@RequestMapping("/addComment")
	public Comment addComment(Comment comment){
		User user =(User) SecurityUtils.getSubject().getPrincipals().getPrimaryPrincipal();
		comment.setUser(user);
		commentBiz.saveComment(comment);
			return comment;
	}

	/**
	 * @Author  WangShiWen
	 * @Description: 添加回复
	 * @Date: 9:31 2017/11/1 0001
	 **/
	@RequestMapping("/addReply")
	public String addReply(Reply reply,String id ){
		User user =(User) SecurityUtils.getSubject().getPrincipals().getPrimaryPrincipal();
		reply.setUser(user);
		replyBiz.saveReply(reply);
		return "redirect:/cong/findId/"+id;
	}
	/**
	 * @Author  WangShiWen
	 * @Description: 查看个人帖子
	 * @Date: 8:58 2017/11/2 0002
	 **/
	@RequestMapping("/findge")
	public String findge(CongressHall congressHall,Model Model){
		User user =(User) SecurityUtils.getSubject().getPrincipals().getPrimaryPrincipal();
		List<CongressHall> list = congressHallbiz.findByuserId(user.getUserId());
		Model.addAttribute("list",list);
		return "comm/CongGe";
	}
	/**
	 * @Author  WangShiWen
	 * @Description: 删除个人帖子
	 * @Date: 9:31 2017/11/2 0002
	 **/
	@RequestMapping("/delete/{congressHallId}")
	public String delete(@PathVariable("congressHallId") Integer congressHallId){
		congressHallbiz.delete(congressHallId);
		return "redirect:/cong/findge";
	}
}
