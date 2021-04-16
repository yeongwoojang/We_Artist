package com.we.art.user.model.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
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
//		persistInfo.setPassword(encoder.encode(persistInfo.getPassword())); //회원가입좀 하겠습니다 - 장영우
		persistInfo.setPassword(persistInfo.getPassword());
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
		//내부적으로 Map<String,List<k>> 를 구현
	      MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
	      body.add("mail-template", "temp_join");
	      body.add("userId", persistInfo.getUserId());
	      body.add("authPath", authPath);
	      
	      //RestTemplate의 기본 Content-type은 application/json
	      //Content-type을 form-url-encoded로 설정해서 통신해보기
	      RequestEntity<MultiValueMap<String, String>> request = 
	            RequestEntity
	            .post(ConfigCode.DOMAIN+"/mail")
	            .header("content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	            .body(body);
	      
	      ResponseEntity<String> response = http.exchange(request, String.class);
	      mail.send(persistInfo.getEmail(), "회원 가입을 축하드립니다.", response.getBody());
	}

	@Override
	public int selectUserByEmail(String email) {
		return userRepository.selectUserByEmail(email);
	}

	@Override
	public User selectUserForLogin(User user) {
		User userInfo = userRepository.selectUserById(user.getUserId());
		//회원가입좀 하겠습니다 - 장영우
//		if(userInfo == null || !encoder.matches(user.getPassword(), userInfo.getPassword())) {
//			return null;
//		} 
		if(userInfo ==null) {
			return null;
		}
		return userInfo;
	}

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
				fileVo.setUserId(userId); // 파일 저장시 필요한 userId
				userRepository.insertFile(fileVo); // TB_FILE 테이블에 파일 넣기
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

	
}
