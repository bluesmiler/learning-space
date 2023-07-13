package com.pm.personal.realm;

import java.util.ArrayList;
import java.util.List;

import com.pm.entity.Role;
import com.pm.exception.MyException;
import com.pm.personal.biz.RoleBiz;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.pm.entity.Permission;
import com.pm.entity.User;
import com.pm.personal.biz.PermissionBiz;
import com.pm.personal.biz.UserBiz;

public class MyRealm extends AuthorizingRealm {
	@Autowired
	private UserBiz userBiz;
	@Autowired
	private PermissionBiz permissionBiz;
	@Autowired
	private RoleBiz roleBiz;

	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		User user = (User)principals.getPrimaryPrincipal();
		List<Permission> perList = null;
		Role role = null;
		List<String> list = new ArrayList<>();
		List<String> roleList = new ArrayList<>();
		try{
			perList = permissionBiz.findAllByUserId(user.getUserId());
			if(null != user.getRole()){
				if(user.getRole().getRoleId()!=0){
					role = roleBiz.findRoleById(user.getRole().getRoleId());
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		if(null != perList){
			for(Permission per:perList){
				list.add(per.getPerName());
			}
		}
		if(null != role){
			roleList.add(role.getRoleName());
		}

		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		authorizationInfo.addStringPermissions(list);
		authorizationInfo.addRoles(roleList);

		return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String phone = (String)token.getPrincipal();
		User user = null;
		try{
			user = userBiz.findUserByPhone(phone);
		}catch(Exception e){
			e.printStackTrace();

		}
		if(null == user){
			return null;
		}
		String password = user.getPassword();
		
		SimpleAuthenticationInfo simpleAuthenticationInfo = 
				new SimpleAuthenticationInfo(user,password,"myRealm"); 
		return simpleAuthenticationInfo;
	}

}
