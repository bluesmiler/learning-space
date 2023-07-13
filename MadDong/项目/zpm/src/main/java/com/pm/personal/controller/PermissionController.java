package com.pm.personal.controller;

import com.pm.entity.Permission;
import com.pm.personal.biz.PermissionBiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/permission")
public class PermissionController {
    @Autowired
    private PermissionBiz permissionBiz;

    @RequestMapping("/toEdit/{perId}")
    public String toEdit(@PathVariable("perId") int perId,Model model){
       Permission permission = permissionBiz.findById(perId);
       model.addAttribute("per",permission);

        return "/personal/editper";
    }

    @RequestMapping("/list")
    public String perList(Model model){
        List<Permission> permissionList = permissionBiz.findAll();
        model.addAttribute("perList",permissionList);
        return "/personal/perList";
    }
    @ResponseBody
    @RequestMapping("/delete")
    public String deletePermission(int perId){
        permissionBiz.deleteById(perId);

        return "success";
    }
    @RequestMapping("/updatePer")
    public String updatePer(Permission permission){
        permissionBiz.updatePer(permission);
        return "redirect:/permission/list";
    }


    @RequestMapping("/toAddPer")
    public String toAddPer(){
        return "/personal/addPer";
    }

    @RequestMapping("/addPer")
    public String addPer(Permission per){
        permissionBiz.savePer(per);
        return "redirect:/permission/list";
    }
}
