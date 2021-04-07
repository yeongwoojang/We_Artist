package com.we.art.chat.model.vo;

import lombok.Data;

@Data
public class ChatContent {
	private String chatNo;
	private String chatRoomNo;
	private String msg;
	private String msgTime;
	private String msgTo;
	private String msgFrom;
}
