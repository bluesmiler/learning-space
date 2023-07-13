package com.pm.property.controller;

import com.pm.comm.biz.CommBiz;
import com.pm.entity.ComplainWithBLOBs;
import com.pm.entity.Picture;
import com.pm.entity.User;
import com.pm.entity.vo.PropertyPicture;
import com.pm.exception.MyException;
import com.pm.property.biz.ComplainBiz;
import com.pm.property.biz.PictureBiz;
import com.pm.property.biz.PropertyPictureBiz;
import com.pm.utils.Constants;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @author cjd
 *
 */
@Controller
@RequestMapping("/complain")
public class ComplainController {
	@Resource
	private ComplainBiz complainBiz;
	@Resource
	private PictureBiz pictureBiz;
	@Resource
	private PropertyPictureBiz propertyPictureBiz;
	@Resource
	private CommBiz commBiz;
	static Logger logger = Logger.getLogger(RepairsController.class);
	@RequestMapping("/preInsert")
	public String preInsert(){
		return "/property/addComplain";
	}
	@RequestMapping("/insertSelective")
	public String insertSelective(@RequestParam("fileAttach") MultipartFile[] files,ComplainWithBLOBs complainWithBLOBs,
								  HttpSession session)throws MyException{
		User user=(User) SecurityUtils.getSubject().
				getPrincipals().
				getPrimaryPrincipal();
		complainWithBLOBs.setUser(user);
		complainWithBLOBs.setFdbSituation(0);
		complainBiz.insertSelective(complainWithBLOBs);
		System.out.println(complainWithBLOBs);
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
				picture.setComplainId(complainWithBLOBs.getComplainId());
				Picture pt=new Picture();
				pt.setPictureId(picture.getPictureId());
				picture.setPicture(pt);
				propertyPictureBiz.insertSelective(picture);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			throw new MyException("ComplainController insertSelective 异常");
		}
		return "/comm/HelpControllerList";
	}
	@RequestMapping("/updateSelective")
	public String updateSelective(ComplainWithBLOBs complainWithBLOBs) throws MyException{
		complainBiz.updateSelective(complainWithBLOBs);
		return "";
	}
	@RequestMapping("/list")
	public String findAll(Model model, @RequestParam(name = "pageNum",defaultValue = "1") int pageNum, @RequestParam(defaultValue = "20") int pageSize){
		List<ComplainWithBLOBs> complainList=complainBiz.findAll(pageNum,pageSize);
		int totalCount=complainBiz.findCount();
		model.addAttribute("complainList",complainList);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("totalCount",totalCount);
		return "/property/complainList";
	}
	@RequestMapping("/delete")
	public void delete(@RequestParam(name = "complainId")int complainId){
		complainBiz.deleteByPrimaryKey(complainId);
	}
	@RequestMapping("/deleteBatch")
	public void deleteBatch(String arr, HttpServletResponse response)throws MyException{
		String [] split=arr.split(",");
		int[] cjd=new int[split.length];
		for (int i=0;i<split.length;i++){
			cjd[i]=Integer.parseInt(split[i]);
		}
		complainBiz.deleteBatch(cjd);
	}
	@RequestMapping("/complainDetail/{complainId}")
	public String complainDetail(Model model, @PathVariable("complainId") int complainId){
		ComplainWithBLOBs complainWithBLOBs=complainBiz.findById(complainId);
		model.addAttribute("complainWithBLOBs",complainWithBLOBs);
		List<PropertyPicture> propertyPictureList=propertyPictureBiz.findByComplainId(complainWithBLOBs.getComplainId());
		model.addAttribute("propertyPictureList",propertyPictureList);

		return "/property/complainDetail";
	}

	@RequestMapping("/preUpdate/{complainId}")
	public String preUpdate(@PathVariable("complainId")int complainId,Model model){
		ComplainWithBLOBs complainWithBLOBs=complainBiz.findById(complainId);
		model.addAttribute("complainWithBLOBs",complainWithBLOBs);
		return "/property/complainUpdate";
	}
	@RequestMapping("/update")
	public String update(ComplainWithBLOBs complainWithBLOBs){
		complainBiz.updateByPrimaryKeySelective(complainWithBLOBs);
		return "redirect:/complain/list";
	}
	@InitBinder
	public void initBinder(ServletRequestDataBinder binder){
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),
				true));
	}
}
