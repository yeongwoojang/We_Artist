package com.we.art.user.validator;


import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.we.art.user.model.repository.UserRepository;
import com.we.art.user.model.vo.User;

@Component
public class UserValidator implements Validator{

	private final UserRepository userRepository;
	
	public UserValidator(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return User.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Pattern pattern = Pattern.compile("^(?!.*[ㄱ-힣])(?=.*\\W)(?=.*\\d)(?=.*[a-zA-Z])(?=.{8,})");
		User persistInfo = (User) target;
		
		//if(userRepository.se)
		
		
	}
	


}
