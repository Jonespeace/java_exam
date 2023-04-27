package com.rjones.exam.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.rjones.exam.models.BabyName;
import com.rjones.exam.services.NameService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class NameController {
	
	@Autowired
	private NameService nameService;
	
	@GetMapping("/home")
	public String home(HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		List<BabyName> allNames = nameService.allNames();
		model.addAttribute("babyNameList", allNames);
		
		return "nameDashboard.jsp";
	}
	
	@GetMapping("/names/new")
	public String newNameForm(@ModelAttribute("newName")BabyName newName) {
		return "newName.jsp";
	}
	
	@PostMapping("/names/new")
	public String newName(@Valid @ModelAttribute("newName")BabyName newName, BindingResult result) {
		if(result.hasErrors()) {
			return "newName.jsp";
		}
		else {
			nameService.createName(newName);
			return "redirect:/home";
		}
	}
	//Name Details
	@GetMapping ("/names/{id}")
	public String nameDetails(@PathVariable("id")Long id, Model model) {
		BabyName oneName = nameService.oneName(id);
		model.addAttribute("oneName", oneName);
		return "nameDetails.jsp";
	}
	
	@DeleteMapping("/names/{id}")
	public String delete(@PathVariable("id")Long id) {
		nameService.delete(id);
	return "redirect:/home";
	}
	
	@GetMapping("/names/edit/{id}")
	public String editName(@PathVariable("id")Long id, Model model) {
		BabyName oneName = nameService.oneName(id);
		model.addAttribute("oneName", oneName);
		return "editName.jsp";
		
	}
	
	@PutMapping("/names/edit/{id}")
	public String editName(@Valid @ModelAttribute("oneName")BabyName oneName, BindingResult result) {
	if(result.hasErrors()) {
		return "editName.jsp";
	}
	else {
		nameService.editName(oneName);
		return "redirect:/names/"+oneName.getId();
	}
	}
}
