package com.pm.personal.biz;

import com.pm.entity.RolePermission;
import com.pm.personal.dao.RolePermissionDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RolePermissionBiz {
    @Autowired
    private RolePermissionDao rolePermissionDao;

    public void saveBatchRP(List<RolePermission> list){
        rolePermissionDao.saveBatchRP(list);
    }

    public void deleteByRoleId(int roleId){
        rolePermissionDao.deleteByRoleId(roleId);
    }
    public void deleteBatch(int roleId,String[] perArray){
        rolePermissionDao.deleteBatch(roleId,perArray);
    }

    public void saveBatch(int roleId,String[] perArray){
        rolePermissionDao.saveBatch(roleId,perArray);
    }
}
