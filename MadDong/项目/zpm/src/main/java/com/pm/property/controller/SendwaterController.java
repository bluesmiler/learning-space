package com.pm.property.controller;

import com.pm.entity.Sendwater;
import com.pm.entity.User;
import com.pm.exception.MyException;
import com.pm.property.biz.SendwaterBiz;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * @author cjd
 *
 */
@Controller
@RequestMapping("/sendwater")
public class SendwaterController {
	@Resource
	private SendwaterBiz sendwaterBiz;
	
	static Logger logger = Logger.getLogger(RepairsController.class);
	
	@RequestMapping("/preInsert")
	public String preInsert(){
		return "/property/addSendwater";
	}
	@RequestMapping("/insertSelective")
	public String insertSelective(Sendwater sendwater, HttpSession session) throws MyException{
		User user=(User) SecurityUtils.getSubject().
				getPrincipals().
				getPrimaryPrincipal();
		sendwater.setUser(user);
		sendwater.setOrderTime(new Date());
		sendwaterBiz.insertSelective(sendwater);
		return "/comm/HelpControllerList";
	}
	@RequestMapping("/list")
	public String findAll(Model model){
		List<Sendwater> sendwaterList=sendwaterBiz.findAll();
		int totalCount=sendwaterBiz.findCount();
		model.addAttribute("sendwaterList",sendwaterList);
		model.addAttribute("totalCount",totalCount);
		return "/property/sendwaterList";
	}
	@RequestMapping("/deleteBatch")
	public void deleteBatch(String arr, HttpServletResponse response)throws MyException{
		String [] split=arr.split(",");
		int[] cjd=new int[split.length];
		for (int i=0;i<split.length;i++){
			cjd[i]=Integer.parseInt(split[i]);
		}
		sendwaterBiz.deleteBatch(cjd);
	}
}
