package com.pm.personal.dao;


import com.pm.entity.User;

import java.util.List;

public interface UserDao {
	
	User findUserByPhone(String phone);

	User findUserById(int userId);

	void insertUser(User user);

	void updateUser(User user);

	List<User> findAllMember();

	int deleteUserById(int userId);

	List<User> findAllManager();
}
