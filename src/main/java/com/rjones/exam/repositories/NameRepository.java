package com.rjones.exam.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.rjones.exam.models.BabyName;

@Repository
public interface NameRepository extends CrudRepository<BabyName, Long> {
	List<BabyName> findAll();
}
