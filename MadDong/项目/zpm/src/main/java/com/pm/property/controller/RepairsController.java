package com.pm.property.controller;

import com.pm.entity.Picture;
import com.pm.entity.Repairs;
import com.pm.entity.User;
import com.pm.entity.vo.PropertyPicture;
import com.pm.exception.MyException;
import com.pm.property.biz.PictureBiz;
import com.pm.property.biz.PropertyPictureBiz;
import com.pm.property.biz.RepairsBiz;
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
@RequestMapping("/repairs")
public class RepairsController {
	@Resource
	private RepairsBiz repairsBiz;
	@Resource
	private PictureBiz pictureBiz;
	@Resource
	private PropertyPictureBiz propertyPictureBiz;
	static Logger logger = Logger.getLogger(RepairsController.class);

	@RequestMapping("/preInsert")
	public String preInsert(){
		return "/property/addRepairs";
	}
	@RequestMapping("/preInsertPC")
	public String preInsertPC(){
		return "/property/addRepairsPC";
	}
	@RequestMapping("/insertSelective")
	public String insertSelective(@RequestParam("fileAttach") MultipartFile[] files,Repairs repairs,HttpSession session) throws MyException{
		User user=(User) SecurityUtils.getSubject().
				getPrincipals().
				getPrimaryPrincipal();
		repairs.setUser(user);
		repairs.setHandleSituation(0);
		repairsBiz.insertSelective(repairs);
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
					picture.setRepId(repairs.getRepId());
					Picture pt=new Picture();
					pt.setPictureId(picture.getPictureId());
					picture.setPicture(pt);
					propertyPictureBiz.insertSelective(picture);
				}
			}
			catch (Exception e) {
				e.printStackTrace();
				logger.error(e);
				throw new MyException("RepairsController insertSelective 异常");
			}
		}
		return "/comm/HelpControllerList";
	}
	@RequestMapping("/updateSelective")
	public String updateSelective(Repairs repairs) throws MyException{
		repairsBiz.updateSelective(repairs);
		return "";
	}
	@RequestMapping("/list")
	public String findAll(Model model, @RequestParam(name = "pageNum",defaultValue = "1") int pageNum, @RequestParam(defaultValue = "20") int pageSize){
		List<Repairs> repairsList=repairsBiz.findAll(pageNum,pageSize);
		int totalCount=repairsBiz.findCount();
		model.addAttribute("repairsList",repairsList);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("totalCount",totalCount);
		return "/property/repairsList";
	}
	@RequestMapping("/repairsDetail/{repId}")
	public String repairsDetail(Model model, @PathVariable("repId") int repId){
		Repairs repairs=repairsBiz.findById(repId);
		model.addAttribute("repairs",repairs);
		List<PropertyPicture> propertyPictureList=propertyPictureBiz.findByRepId(repairs.getRepId());
		model.addAttribute("propertyPictureList",propertyPictureList);
		return "/property/repairsDetail";
	}
	@RequestMapping("/delete")
	public void delete(@RequestParam(name="repId")int repId){
		repairsBiz.deleteByPrimaryKey(repId);
	}
	@RequestMapping("/index")
	public String index(){
		return "/index";
	}
	@RequestMapping("/deleteBatch")
	public void deleteBatch(String arr,HttpServletResponse response)throws MyException{
		String [] split=arr.split(",");
		int[] cjd=new int[split.length];
		for (int i=0;i<split.length;i++){
			cjd[i]=Integer.parseInt(split[i]);
		}
		repairsBiz.deleteBatch(cjd);
	}
	@RequestMapping("/preUpdate/{repId}")
	public String preUpdate(@PathVariable("repId")int repId,Model model){
		Repairs repairs=repairsBiz.findById(repId);
		model.addAttribute("repairs",repairs);
		return "/property/repairsUpdate";
	}
	@RequestMapping("/update")
	public String update(Repairs repairs){
		repairsBiz.updateSelective(repairs);
		return "redirect:/repairs/list";
	}
	@RequestMapping("/chat")
	public String chat(Model model){
		User user=(User) SecurityUtils.getSubject().
				getPrincipals().
				getPrimaryPrincipal();
		model.addAttribute("user",user);
		return "/property/liaotian";
	}
	@InitBinder
	public void initBinder(ServletRequestDataBinder binder){
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),
				true));
	}
}
