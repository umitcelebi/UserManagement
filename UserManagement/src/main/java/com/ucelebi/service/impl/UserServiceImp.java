package com.ucelebi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ucelebi.data.UserRepository;
import com.ucelebi.entity.User;
import com.ucelebi.service.UserService;

@Service
public class UserServiceImp implements UserService{

	@Autowired
	UserRepository userRepository;
	
	@Override
	public List<User> GetAll() {
		
		return userRepository.findAll();
	}

	@Override
	public User GetById(int id) {
		
		return userRepository.getOne(id);
	}

	@Override
	public void Add(User user) {
		user.setActive(true);
		userRepository.save(user);		
	}

	@Override
	public void Delete(int id) {
		userRepository.deleteById(id);
	}

	@Override
	public void Update(User user) {
		userRepository.save(user);
	}

}
