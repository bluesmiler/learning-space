package com.pm.personal.biz;

import com.pm.entity.Role;
import com.pm.personal.dao.RoleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleBiz {
    @Autowired
    private RoleDao roleDao;

    public Role findRoleById(int roleId){
        return roleDao.findById(roleId);
    }

    public List<Role> findAll(){
        return roleDao.findAll();
    }

    public void deleteById(int roleId){
        roleDao.deleteById(roleId);
    }

    public Role findRoleByName(String roleName){
        return roleDao.findRoleByName(roleName);
    }

    public void saveRole(Role role){
        roleDao.saveRole(role);
    }

    public void updateByRole(Role role){
        roleDao.updateByRole(role);
    }


}
