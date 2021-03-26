package com.we.art.common.chat.model.vo;


import java.util.Date;

import lombok.Data;

@Data
public class Chat {
	private int no;
	private String userId;
	private int srNo;
	private String chatContent;
	private Date sendDate;
	private String validYN;
}
