package com.rjones.exam.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.rjones.exam.models.LoginUser;
import com.rjones.exam.models.User;
import com.rjones.exam.repositories.UserRepository;



@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepo;
	
	public User join(User newUser, BindingResult result) {
		
		//Finds user in database by email
		Optional<User> optionalUser = userRepo.findByEmail(newUser.getEmail());
		
		//If email exists, reject
		if(optionalUser.isPresent()) {
			result.rejectValue("email", "unique", "This email already exists");
		}
		
		//Reject is password doesn't match confirm password
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "match", "Password do not match");
		}
		
		//if result has errors, return
		if(result.hasErrors()) {
			return null;
		}
		
		//Hash and save password
		String hash = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hash);
		return userRepo.save(newUser);
	}
	
	public User login(LoginUser newLogin, BindingResult result) {
		
		//Find user in database by email
		Optional<User> optionalUser = userRepo.findByEmail(newLogin.getEmail());
		
		//If email exists, reject
		if(!optionalUser.isPresent()) {
			result.rejectValue("email", "unique", "This email has not joined");
			return null;
		}
		
		//grab the user from potential user
		User user = optionalUser.get();
		
		
		//if BCrpyt passwords don't match
		if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "matches", "Password is not correct");
		}
		
		//if result has errors, return
		if(result.hasErrors()) {
			return null;
		}
		
		//Return user from database
		return user;
	}
}
