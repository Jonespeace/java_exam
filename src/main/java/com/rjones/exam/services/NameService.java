package com.rjones.exam.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rjones.exam.models.BabyName;
import com.rjones.exam.repositories.NameRepository;

@Service
public class NameService {
	
	@Autowired
	private NameRepository nameRepo;
	
	//Get all
	public List<BabyName> allNames() {
		return nameRepo.findAll();
	}
	
	//Get one
	public BabyName oneName(Long id) {
		Optional<BabyName> optionalName = nameRepo.findById(id);
		if(optionalName.isPresent()) {
			return optionalName.get();
		}
		else {
			return null;
		}
	}
	
	//New
	public BabyName createName(BabyName newName) {
		return nameRepo.save(newName);
	}
	
	//Edit
	public BabyName editName(BabyName oneName) {
		return nameRepo.save(oneName);
	}
	
	//Delete
	public void delete(Long id) {
		nameRepo.deleteById(id);
	}

}
