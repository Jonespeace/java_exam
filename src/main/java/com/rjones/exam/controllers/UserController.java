package com.rjones.exam.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.rjones.exam.models.LoginUser;
import com.rjones.exam.models.User;
import com.rjones.exam.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;


@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	//Display login and registration form
	@GetMapping("/")
	public String loginPage(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("login", new LoginUser());
		return "login.jsp";
	}
	
	@PostMapping("/join")
	public String join(@Valid @ModelAttribute("newUser")User newUser, BindingResult result, 
			HttpSession session, Model model) {
	
		User joinedUser = userService.join(newUser, result);
		
		if(result.hasErrors()) {
			model.addAttribute("login", new LoginUser());
			return "login.jsp";			
		}
		else {
			session.setAttribute("userId", joinedUser.getId());
			session.setAttribute("name", joinedUser.getName());
			return "redirect:/home";
		}
	}
	
	@PostMapping("/login") 
	public String login(@Valid @ModelAttribute("login")LoginUser newLogin, BindingResult result, 
		HttpSession session, Model model) {
	
		User currentUser = userService.login(newLogin, result);
	
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "login.jsp";			
		}
		else {
			session.setAttribute("userId", currentUser.getId());
			session.setAttribute("name", currentUser.getName());
			return "redirect:/home";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
