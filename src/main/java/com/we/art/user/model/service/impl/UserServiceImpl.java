package com.we.art.user.model.service.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.we.art.common.code.ConfigCode;
import com.we.art.common.code.ErrorCode;
import com.we.art.common.exception.ToAlertException;
import com.we.art.common.mail.MailSender;
import com.we.art.common.util.file.FileUtil;
import com.we.art.common.util.file.FileVo;
import com.we.art.user.model.repository.UserRepository;
import com.we.art.user.model.service.UserService;
import com.we.art.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService {
	
	private final UserRepository userRepository;
	
	@Autowired
	private MailSender mail;
	
	@Autowired
	private RestTemplate http;
	
	@Autowired
	private PasswordEncoder encoder;
	
	public UserServiceImpl(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@Override
	public int insertUser(User persistInfo) {
		persistInfo.setPassword(encoder.encode(persistInfo.getPassword())); 
		return userRepository.insertUser(persistInfo);
	}

	@Override
	public User selectUserById(String userId) {
		return userRepository.selectUserById(userId);
	}
	
	@Override
	public User selectUserByNick(String nickName) {
		return userRepository.selectUserByNick(nickName);
	}


	
	@Override
	public void authenticateEmail(User persistInfo, String authPath) {
		//??????????????? Map<String,List<k>> ??? ??????
	      MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
	      body.add("mail-template", "temp_join");
	      body.add("userId", persistInfo.getUserId());
	      body.add("authPath", authPath);
	      
	      //RestTemplate??? ?????? Content-type??? application/json
	      //Content-type??? form-url-encoded??? ???????????? ???????????????
	      RequestEntity<MultiValueMap<String, String>> request = 
	            RequestEntity
	            .post(ConfigCode.DOMAIN+"/mail")
	            .header("content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	            .body(body);
	      
	      ResponseEntity<String> response = http.exchange(request, String.class);
	      mail.send(persistInfo.getEmail(), "?????? ????????? ??????????????????.", response.getBody());
	}

	@Override
	public int selectUserByEmail(String email) {
		return userRepository.selectUserByEmail(email);
	}

	@Override
	public User selectUserForLogin(User user) {
		User userInfo = userRepository.selectUserById(user.getUserId());
		System.out.println(user.getPassword());
		//??????????????? ??????????????? - ?????????
		//if(userInfo == null || !encoder.matches(user.getPassword(), userInfo.getPassword())) {
		//	return null;
		//} 
		if(userInfo ==null) {
			return null;
		}
		return userInfo;
	}

	/*
	@Override
	public User findPassword(String email) {
		email.setPassword(encoder.encode(user.getPassword()));
		return userRepository.findPassword(email);
		}
	*/
	
	@Override
	public String findPassword(String email){
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String result = null;
		
		//System.out.println("login ?????? : " + log);
		
		//???????????? ????????????
		//User user = user.login(login);
		
		//????????? ???????????? ??????????????? ????????? ??????
		if(selectUserByEmail(email) > 0) {
			
			//?????? ???????????? ??????(UUID ?????? - ??????????????? ?????????)
			String tempPw = UUID.randomUUID().toString().replace("-", ""); // -??? ??????
			tempPw = tempPw.substring(0,10); //tempPw??? ??????????????? 10?????? ?????????
			
			System.out.println("?????? ???????????? ?????? : " + tempPw);
			
			//??????????????? Map<String,List<k>> ??? ??????
		      MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		      body.add("mail-template", "temp_email");
		      body.add("email", email);
		      body.add("randPw", tempPw);
		      
		      //RestTemplate??? ?????? Content-type??? application/json
		      //Content-type??? form-url-encoded??? ???????????? ???????????????
		      RequestEntity<MultiValueMap<String, String>> request = 
		            RequestEntity
		            .post(ConfigCode.DOMAIN+"/mail")
		            .header("content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE)
		            .body(body);
		      
		      ResponseEntity<String> response = http.exchange(request, String.class);
		      mail.send(email, "We Artist ?????????????????? ?????????.", response.getBody());
		      
		      // ?????????????????? ????????? ?????? ??????
		      //String rePassword = encoder.encode(tempPw);
		      String password = tempPw;	//????????? ?????? ??????????????????
		      System.out.println(password);
		      userRepository.changePassword(password, email);
			
			result = "Success";
			
			
			
		} else {
			
			result = "Fail";
		}
		return result;
		
		
		
	}

	@Override
	public int updateUser(User persistInfo) {
		persistInfo.setPassword(encoder.encode(persistInfo.getPassword())); 
		return userRepository.updateUser(persistInfo);
	}

	@Override
	public void insertProPic(String userId, List<MultipartFile> files) {
		FileUtil fileUtil = new FileUtil();

		try {
			List<FileVo> fileList = fileUtil.fileUpload(files);
			for(FileVo fileVo : fileList) {
				fileVo.setUserId(userId); // ?????? ????????? ????????? userId
				userRepository.insertFile(fileVo); // TB_FILE ???????????? ?????? ??????
			}
		} catch (Exception e) {
			throw new ToAlertException(ErrorCode.IB01,e);
		}
		
	}
	
	@Override
	public int updateProPic(String userId) {
		
		
		
		return userRepository.updateProPic(userId);
	}

	@Override
	public Map<String, Object> selectProPicByFIdx(String fIdx) {
		FileVo fileList = new FileVo();
		fileList = userRepository.selectProPicByFIdx(fIdx);
		Map<String,Object> commandMap = new HashMap<String,Object>();
		commandMap.put("files",fileList);
		return commandMap;
	}
	
	

	@Override
	public User checkUserForLogin(String userId, String password) {
		User userInfo = userRepository.selectUserById(userId);
		if(userInfo == null || !encoder.matches(password, userInfo.getPassword())) {
			return null;
		} 
		return userInfo;
	}

	

	

	


}


