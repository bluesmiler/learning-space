package com.pm.personal.controller;

import com.pm.comm.biz.CommBiz;
import com.pm.comm.biz.CommVoBiz;
import com.pm.comm.biz.HomeBiz;
import com.pm.entity.*;
import com.pm.entity.vo.Project;
import com.pm.personal.biz.RoleBiz;
import com.pm.personal.biz.UnitBiz;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pm.exception.MyException;
import com.pm.personal.biz.SecurityBiz;
import com.pm.personal.biz.UserBiz;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;



@Controller
@RequestMapping("/user")
public class SecurityController {
	@Autowired
    private SecurityBiz securityBiz;
	
	@Autowired
	private UserBiz userBiz;

	@Autowired
	private CommBiz commBiz;
	@Autowired
	private RoleBiz roleBiz;
	@Autowired
	private UnitBiz unitBiz;

	@Autowired
	private HomeBiz homeBiz;

	@Autowired
	private CommVoBiz commVoBiz;

	@RequestMapping("/toLogin")
	public String toLogin(){

		return "/personal/login";

	}
	@RequestMapping("/welcome")
	public String welcome(){
		return "/welcome";
	}

	@RequestMapping("/logout")
	public String logout(){
		securityBiz.logout();
		return "/personal/login";
	}

	@RequestMapping("/toRegister")
	public String toRegister(){

		return "/personal/register";

	}
	@RequestMapping("/toAddManager")
	public String toAddManager(Model model){
		Role role = roleBiz.findRoleByName("管理员");
		model.addAttribute("role",role);
		return "/personal/addManager";

	}

	@RequestMapping("/addManager")
	public String saveManager(User user){
		userBiz.saveUser(user);
		return "redirect:/user/manager";
	}

	@RequestMapping("/toEdit/{userId}")
	public String toEdit(@PathVariable("userId") int userId,Model model){
		User user = userBiz.findUserById(userId);
		List<Project> commVoList = commVoBiz.findAll();
		List<Role> roleList = roleBiz.findAll();
		model.addAttribute("user",user);
		model.addAttribute("roleList",roleList);
		model.addAttribute("commVoList",commVoList);

		return "/personal/adduser";
	}
	@RequestMapping("/userList")
	public String userList(Model model){
		List<User> userList = userBiz.findAllMember();
		int total = userList.size();
		model.addAttribute("userList",userList);
		model.addAttribute("total",total);
		return "/personal/memberlist";
	}

    
    @RequestMapping("/login")
    public String login(String phone, String password,String validateCode,HttpSession session,Model model)
			throws MyException{
    	String code = (String) session.getAttribute("validateCode");
		if(!validateCode.equals(code)){
    		model.addAttribute("reminder","验证码输入错误");
    		return "/personal/login";
		}
			try {
				securityBiz.login(phone, password);


			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("reminder","用户名或者密码错误");
				return "/personal/login";
			}
		    Subject subject = SecurityUtils.getSubject();

			if(subject.hasRole("管理员")||subject.hasRole("超级管理员")){
				User user =(User)subject.getPrincipals().getPrimaryPrincipal();
				model.addAttribute("user",user);
				return "/index";
			}else {
				return "redirect:/help/list";
			}

    }

    @RequestMapping("/register")
    public String register(User user,String validateCode,HttpSession session,Model model ){
		String code = (String) session.getAttribute("validateCodeReg");
		if(!validateCode.equals(code)){
			model.addAttribute("reminder","验证码输入错误");
			return "/personal/register";
		}

		userBiz.saveUser(user);
    	return "/personal/login";
    }
    @RequestMapping("/user")
	@ResponseBody
    public String findUser(String phone){
    	User user = userBiz.findUserByPhone(phone);
    	if(null != user){
			return "fail";
		}
		return "success";
	}
	@RequestMapping("/delete")
	@ResponseBody
	public String deleteUserById(int userId, PrintWriter out)throws MyException{

		int count = 0;
    	try{
			count = userBiz.deleteUserById(userId);
			if(count==1){
				out.print("success");
				return "success";
			}else {
				return null;
			}
		}catch (Exception e){
			e.printStackTrace();
			throw new MyException("删除错误");
		}

	}

	@RequestMapping("/toUpdatePwd/{userId}")
	public String toUpdatePwd(@PathVariable("userId") int userId,Model model){
		User user = userBiz.findUserById(userId);
		model.addAttribute("user",user);
		return "/personal/changePwd";
	}

	@RequestMapping("/updatePwd")
	public String updatePwd(User user, HttpServletResponse response){
		userBiz.updateUser(user);

		return "redirect:/user/userList";
	}

	@RequestMapping("/insertMember")
	public String saveUser(User user){


		return null;
	}


	@RequestMapping("/manager")
	public String listAllManager(Model model){
		List<User> userList = userBiz.findAllManager();
		int total = userList.size();
		model.addAttribute("userList",userList);
		model.addAttribute("total",total);
		return "/personal/managerList";
	}



    
}
