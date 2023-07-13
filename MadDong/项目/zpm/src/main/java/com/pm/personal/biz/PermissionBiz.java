package com.pm.personal.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pm.entity.Permission;
import com.pm.personal.dao.PermissionDao;

@Service
public class PermissionBiz {
	@Autowired
	private PermissionDao permissionDao;
	
	public List<Permission> findAllByUserId(int userId){
		return permissionDao.findAllByUserId(userId);
	}

	public List<Permission> findAllByRoleId(int roleId){
		return permissionDao.findAllByRoleId(roleId);
	}

	public List<Permission> findAll(){
		return permissionDao.findAll();
	};

	public void deleteById(int perId){
		permissionDao.deleteById(perId);
	}

	public Permission findById(int perId){
		return permissionDao.findById(perId);
	}

	public void updatePer(Permission permission){
		permissionDao.updatePer(permission);
	}

	public int savePer(Permission per){
		return permissionDao.save(per);
	}
}
