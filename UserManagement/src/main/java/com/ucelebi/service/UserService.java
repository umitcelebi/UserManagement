package com.ucelebi.service;

import java.util.List;


import com.ucelebi.entity.User;


public interface UserService {
	List<User> GetAll();
	
	User GetById(int id);
	void Add(User user);
	void Delete(int id);
	void Update(User user);
	
}
