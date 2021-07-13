package com.ucelebi.controller;

import java.security.Identity;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ucelebi.entity.User;
import com.ucelebi.enums.RoleEnum;
import com.ucelebi.service.UserService;

@RestController
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@GetMapping
	public ModelAndView GetAll() {
		List<User> users=new ArrayList<>();
		users=userService.GetAll();
		ModelAndView modelAndView = new ModelAndView("Users");
		modelAndView.addObject("users", users);
		
		return modelAndView;
	}
	
	@GetMapping("/signUp")
	public ModelAndView signUp(Model model) {
		ArrayList<RoleEnum> roles=new ArrayList<>(Arrays.asList(RoleEnum.values()));
		 model.addAttribute("User", new User());
		 model.addAttribute("role",roles);
		return new ModelAndView("CreateUser");
	}
	
	
	@PostMapping("/signUp")
	
	public ModelAndView signUp(HttpSession session, HttpServletRequest request,@ModelAttribute User user) {
		
		if(request.isUserInRole("ROLE_USER")) {
			user.setRole("ROLE_USER");
		}
		
		userService.Add(user);
		
		return new ModelAndView("redirect:/");
	}
	
	@GetMapping("admin/edit")
	public ModelAndView Edit(@RequestParam int id) {
		User user = userService.GetById(id);

		ModelAndView modelAndView = new ModelAndView("CreateUser");
		modelAndView.addObject("User", user);
		return modelAndView;
	}
	
	
	@PostMapping("admin/edit")
	public ModelAndView EditUser(@ModelAttribute User user) {
		
		userService.Add(user);
		return new ModelAndView("redirect:/user");
	}
	
	@GetMapping("admin/delete")
	public ModelAndView Delete(@RequestParam int id) {
		userService.Delete(id);
		
		return new ModelAndView("redirect:/user");
	}
}
