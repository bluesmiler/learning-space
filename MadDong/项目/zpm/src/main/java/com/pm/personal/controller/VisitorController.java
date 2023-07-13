package com.pm.personal.controller;

import com.pm.entity.User;
import com.pm.entity.Visitor;
import com.pm.personal.biz.VisitorBiz;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/visitor")
public class VisitorController {
    @Autowired
    private VisitorBiz visitorBiz;


    @RequestMapping("/visitorRegister")
    public String visitorRegister(){

        return "/personal/addVisitor";
    }

    @RequestMapping("/visitorAdd")
    @RequiresAuthentication
    @ResponseBody
    public String visitorAdd(Visitor visitor){
        User user = (User) SecurityUtils.getSubject().getPrincipals().getPrimaryPrincipal();
        int userId = user.getUserId();
        String codeName = UUID.randomUUID().toString();
        visitor.setCodeName(codeName);
        visitor.setCommId(user.getHome().getUnit().getComm().getComm_id());
        visitor.setUserId(userId);
        visitorBiz.saveVisitor(visitor);
        return codeName ;
    }

    @RequestMapping("/visitorList")
    public ModelAndView findAll(@ModelAttribute("userId")int userId){
        List<Visitor> list = visitorBiz.findVisitorByUserId(userId);
        ModelAndView model = new ModelAndView("/personal/visitorList");
        model.addObject(list);
        return model;
    }

}
