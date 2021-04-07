package com.we.art.common.util.file;

import com.we.art.common.code.ConfigCode;

import lombok.Data;


@Data
public class FileVo {
	
	private String fIdx;
	private String fOrigin;
	private String fRename;
	private String fDate;
	private String userId;
	private String fSavePath;
	private int isDel;
	
	public String getFullPath() {
		return ConfigCode.UPLOAD_PATH + fSavePath;
	}
}
