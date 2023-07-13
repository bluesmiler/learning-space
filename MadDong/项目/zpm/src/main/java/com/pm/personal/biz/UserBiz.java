package com.pm.personal.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pm.entity.User;
import com.pm.personal.dao.UserDao;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserBiz {
	@Autowired
	private UserDao userDao;
	
	public User findUserByPhone(String phone){
		return userDao.findUserByPhone(phone);
	}
	
	public User findUserById(int userId) {
		return userDao.findUserById(userId);
	}

	public void saveUser(User user){
		try{
			userDao.insertUser(user);

		}catch (Exception e){
			e.printStackTrace();
		}
	}

	public List<User> findAllMember(){
		return userDao.findAllMember();
	}


	public int deleteUserById(int userId){

		return userDao.deleteUserById(userId);
	}

	public void updateUser(User user){
		userDao.updateUser(user);
	}

	
	public List<User> findAllManager(){
		return userDao.findAllManager();
	}

}
