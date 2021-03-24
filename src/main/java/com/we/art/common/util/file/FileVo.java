package com.we.art.common.util.file;

import java.sql.Date;

import com.we.art.common.code.ConfigCode;


public class FileVo {
	private int fIdx;
	private String typeIdx;
	private String orignFileName;
	private String renameFileName;
	private String savePath;
	private Date regDate;
	private int isDel;
	
	public int getfIdx() {
		return fIdx;
	}
	
	public void setfIdx(int fIdx) {
		this.fIdx = fIdx;
	}
	
	public String getTypeIdx() {
		return typeIdx;
	}
	
	public void setTypeIdx(String typeIdx) {
		this.typeIdx = typeIdx;
	}
	
	public String getOriginFileName() {
		return orignFileName;
	}
	
	public void setOriginFileName(String orginFileName) {
		this.orignFileName = orginFileName;
	}
	
	public String getRenameFileName() {
		return renameFileName;
	}
	
	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}
	
	public String getSavePath() {
		return savePath;
	}
	
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public int getIsDel() {
		return isDel;
	}
	
	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}
	public String getFullPath() {
		return ConfigCode.UPLOAD_PATH+ savePath;
	}
	@Override
	public String toString() {
		return "FileVO [fIdx=" + fIdx + ", typeIdx=" + typeIdx + ", orginFileName=" + orignFileName
				+ ", renameFileName=" + renameFileName + ", savePath=" + savePath + ", regDate=" + regDate + ", isDel="
				+ isDel + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
