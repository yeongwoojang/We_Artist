package com.we.art.common.util.file;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.we.art.common.code.ConfigCode;


public class FileUtil {

	  
	   public List<FileVo> fileUpload(List<MultipartFile> files) throws IllegalStateException, IOException{
	      //파일 메타정보를 가지고 반환될 list
	      List<FileVo> fileDatas = new ArrayList<>();
	      //파일이 저장될 경로
	      String savePath = getSavePath();
	      if(files.size() >= 1 && files.get(0).getOriginalFilename() != null) {
	         for(MultipartFile multipartFile : files){
	            //저장될 파일명
	            String renameFileName = UUID.randomUUID().toString();
	            //원본 파일명
	            String originFileName = multipartFile.getOriginalFilename();
	            
	            FileVo fileVo = new FileVo();
	            fileVo.setOriginFileName(originFileName);
	            fileVo.setRenameFileName(renameFileName);
	            fileVo.setSavePath(savePath);
	            fileDatas.add(fileVo);
	            
	            saveFile(multipartFile, fileVo);
	         }
	      }
	      return fileDatas;
	   }
	   
	   private String getSavePath() {
	      Calendar cal = Calendar.getInstance();      
	      return cal.get(Calendar.YEAR) 
	            + "/" + (cal.get(Calendar.MONTH) + 1)
	            + "/" + cal.get(Calendar.DAY_OF_MONTH) + "/";
	   }
	   
	   
	   private void saveFile(MultipartFile multipartFile, FileVo fileVo) throws IllegalStateException, IOException {
	      File file = new File(fileVo.getFullPath()+fileVo.getRenameFileName());
	      if(!file.exists()) {
	         new File(fileVo.getFullPath()).mkdirs();
	      }
	      
	      multipartFile.transferTo(file);
	   }
	   
	   public void deleteFile(String path, String renameFileName) {
	      File file = new File(ConfigCode.UPLOAD_PATH + path + renameFileName);
	      file.delete();
	   }
	   
}
