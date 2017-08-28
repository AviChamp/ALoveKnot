package com.annotation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.daoImpl.UserDaoImpl;

public class UniqueValidator implements ConstraintValidator<Unique, String> {

	@Autowired
	UserDaoImpl userDaoImpl;
	
	public boolean isValid(String email, ConstraintValidatorContext conext) {
		if(userDaoImpl==null){
			return true;
		}
		return userDaoImpl.findById(email)==null;
	}

	

}
