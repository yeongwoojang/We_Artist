package com.we.art.user.model.vo;

import lombok.Data;

@Data
public class User {
	private String userId;
	private String password;
	private String email;
	private String name;
	private String phone;
	private String nickName;
	private int fIdx;
	private String loginMethod;
	
}
