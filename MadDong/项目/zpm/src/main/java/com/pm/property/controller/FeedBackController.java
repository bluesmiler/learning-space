package com.pm.property.controller;

import com.pm.entity.Feedback;
import com.pm.entity.Picture;
import com.pm.entity.User;
import com.pm.entity.vo.PropertyPicture;
import com.pm.exception.MyException;
import com.pm.property.biz.FeedBackBiz;
import com.pm.property.biz.PictureBiz;
import com.pm.property.biz.PropertyPictureBiz;
import com.pm.utils.Constants;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.UUID;

/**
 * @author cjd
 *
 */
@Controller
@RequestMapping("/feedback")
public class FeedBackController {
	@Resource
	private FeedBackBiz feedBackBiz;
	@Resource
	private PictureBiz pictureBiz;
	@Resource
	private PropertyPictureBiz propertyPictureBiz;
	static Logger logger = Logger.getLogger(RepairsController.class);

	@RequestMapping("/preInsert")
	public String preInsert(){
		return "/property/addFeedBack";
	}
	@RequestMapping("/preInsertPC")
	public String preInsertPC(){
		return "/property/addFeedBackPC";
	}
	@RequestMapping("/insertSelective")
	public String insertSelective(@RequestParam("fileAttach") MultipartFile[] files, Feedback feedback, HttpSession session) throws MyException {
		User user=(User) SecurityUtils.getSubject().
				getPrincipals().
				getPrimaryPrincipal();
		feedback.setUser(user);
		feedBackBiz.insertSelective(feedback);
		if(null!=files){
			try {
				for (MultipartFile multipartFile : files) {
					String originalFilename=multipartFile.getOriginalFilename();
					PropertyPicture picture=new PropertyPicture();
					String fileName = UUID.randomUUID().toString();
					File newFile = new File(Constants.IMAGE_PATH + fileName);
					multipartFile.transferTo(newFile);
					picture.setPictureName(originalFilename);
					picture.setPictureImg(fileName);
					pictureBiz.insertSelective(picture);
					picture.setFbkId(feedback.getFbkId());
					Picture pt=new Picture();
					pt.setPictureId(picture.getPictureId());
					picture.setPicture(pt);
					propertyPictureBiz.insertSelective(picture);
				}
			}
			catch (Exception e) {
				e.printStackTrace();
				logger.error(e);
				throw new MyException("FeedbackController insertSelective 异常");
			}
		}
		return "/comm/HelpControllerList";
	}
	@RequestMapping("/list")
	public String findAll(Model model){
		List<Feedback> feedBackList=feedBackBiz.findAll();
		int totalCount=feedBackBiz.findCount();
		model.addAttribute("feedBackList",feedBackList);
		model.addAttribute("totalCount",totalCount);
		return "/property/feedBackList";
	}
	@RequestMapping("/deleteBatch")
	public void deleteBatch(String arr,HttpServletResponse response)throws MyException{
		String [] split=arr.split(",");
		int[] cjd=new int[split.length];
		for (int i=0;i<split.length;i++){
			cjd[i]=Integer.parseInt(split[i]);
		}
		feedBackBiz.deleteBatch(cjd);
	}
	@RequestMapping("/feedbackDetail/{feedbackId}")
	public String feedbackDetail(Model model, @PathVariable("feedbackId") int feedbackId){
		Feedback feedback=feedBackBiz.findById(feedbackId);
		model.addAttribute("feedback",feedback);
		List<PropertyPicture> propertyPictureList=propertyPictureBiz.findByFeedbackId(feedback.getFbkId());
		model.addAttribute("propertyPictureList",propertyPictureList);
		return "/property/feedbackDetail";
	}
	@RequestMapping("/preUpdate/{fbkId}")
	public String preUpdate(@PathVariable("fbkId")int fbkId,Model model){
		Feedback feedback=feedBackBiz.findById(fbkId);
		model.addAttribute("feedback",feedback);
		return "/property/feedbackUpdate";
	}
	@RequestMapping("/update")
	public String update(Feedback feedback){
		feedBackBiz.updateByPrimaryKeySelective(feedback);
		return "redirect:/feedback/list";
	}
}
