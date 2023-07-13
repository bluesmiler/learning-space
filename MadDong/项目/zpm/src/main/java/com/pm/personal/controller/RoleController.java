package com.pm.personal.controller;

import com.mchange.v1.util.ArrayUtils;
import com.pm.entity.Permission;
import com.pm.entity.Role;
import com.pm.entity.RolePermission;
import com.pm.personal.biz.PermissionBiz;
import com.pm.personal.biz.RoleBiz;
import com.pm.personal.biz.RolePermissionBiz;
import org.apache.ibatis.reflection.ArrayUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleBiz roleBiz;
    @Autowired
    private PermissionBiz permissionBiz;

    @Autowired
    private RolePermissionBiz roleP;

    @RequestMapping("/toEdit/{roleId}")
    public String toEdit(@PathVariable("roleId") int roleId,Model model){
        Role role = roleBiz.findRoleById(roleId);
        model.addAttribute("role",role);
        List<Permission> perList = permissionBiz.findAll();
        model.addAttribute("perList",perList);
        return "/personal/editrole";
    }


    @RequestMapping("/list")
    public String findRole(Model model){
        List<Role> roleList = roleBiz.findAll();
        model.addAttribute("roleList",roleList);
        return "/personal/roleList";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String deleteRole(int roleId){
        roleBiz.deleteById(roleId);
        roleP.deleteByRoleId(roleId);
        return "success";

    }

    @RequestMapping("/toAddRole")
    public String toAddRole(Model model){
        List<Permission> permissionList = permissionBiz.findAll();
        model.addAttribute("perList",permissionList);
         return "/personal/addRole";
    }

    @RequestMapping("/addRole")
    public String addRole(Role role,String ids){
        roleBiz.saveRole(role);
        int roleId = role.getRoleId();
        if(ids.length()!=0){
            List<RolePermission> list = new ArrayList<>();
            String[] id = ids.split(",");
            for(int i=0;i<id.length;i++){
                RolePermission rolePermission = new RolePermission();
                rolePermission.setRoleId(roleId);
                rolePermission.setPerId(Integer.parseInt(id[i]));
                list.add(rolePermission);
            }
            roleP.saveBatchRP(list);
        }
        return "redirect:/role/list";
    }

    @RequestMapping("/updateRole")
    public String updateRole(Role role,String idsIni,String ids){

        roleBiz.updateByRole(role);
        String[] idIni =idsIni.split(",");
        String[] id = ids.split(",");

        String insertId = "";
        String deleteId = "";

        if(idsIni.length()!=0){
            for(int i=0;i<idIni.length;i++){
                boolean flag = true;
                for(int j=0;j<id.length;j++){
                    if(idIni[i].equals(id[j])){
                        flag=false;
                    }
                }
                if(flag){
                    deleteId+=idIni[i]+",";
                }
            }
        }


        for(int i=0;i<id.length;i++){
            boolean flag = true;
            for(int j=0;j<idIni.length;j++){
                if(idIni[j].equals(id[i])){
                    flag=false;
                }
            }
            if(flag){
                insertId+=id[i]+",";
            }
        }

        if(deleteId.length()!=0){
            String[] perArray = deleteId.split(",");
            roleP.deleteBatch(role.getRoleId(),perArray);
        }
        if(insertId.length()!=0){
            String[] perArray = insertId.split(",");
            roleP.saveBatch(role.getRoleId(),perArray);
        }

        return "redirect:/role/list";
    }
}
