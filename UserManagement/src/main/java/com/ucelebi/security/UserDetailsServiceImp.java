package com.ucelebi.security;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ucelebi.data.UserRepository;
import com.ucelebi.entity.User;


@Service
public class UserDetailsServiceImp implements UserDetailsService {

	@Autowired
	UserRepository userRepository;
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Optional<User> user= userRepository.findByUserName(username);
		
		user.orElseThrow(()->new UsernameNotFoundException("User Not Found "+username));
		
		return user.map(UserDetailsImp::new).get();
	}

}
