package com.we.art.common.util.file;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.we.art.common.code.ConfigCode;

/*
	private String fIdx;
	private String fOrigin;
	private String fRename;
	private String fDate;
	private String userId;
	private String fSavePath;
	private int isDel;  
*/
public class FileUtil {
	
	public List<FIleVo> fileUpload(List<MultipartFile> files) throws IOException, Exception{
		
		List<FIleVo> fileDatas = new ArrayList<FIleVo>();
		String fSavePath = getSavePath();
		if(files.size() >= 1 && files.get(0).getOriginalFilename() != null) {
			for(MultipartFile multipartFile : files) {
				String fRename = UUID.randomUUID().toString();
				String fOrigin = multipartFile.getOriginalFilename();
				
				FIleVo fileVo = new FIleVo();
				fileVo.setFOrigin(fOrigin);
				fileVo.setFRename(fRename);
				fileVo.setFSavePath(fSavePath);
				fileDatas.add(fileVo);
				
				saveFile(multipartFile,fileVo);
			}
		}
		return fileDatas;
	}
	
	private String getSavePath() {
		Calendar cal = Calendar.getInstance();
		return cal.get(Calendar.YEAR)
				+"/"+ (cal.get(Calendar.MONTH)+1)
				+"/"+ cal.get(Calendar.DAY_OF_MONTH) + "/";
	}
	
	private void saveFile(MultipartFile multipartFile, FIleVo fileVo) throws Exception, IOException {
		File file = new File(fileVo.getFullPath() + fileVo.getFRename());
		if(!file.exists()) {
			new File(fileVo.getFullPath()).mkdirs();
		}
		multipartFile.transferTo(file);
	}
	
	private void deleteFile(String path, String fRename) {
		File file = new File(ConfigCode.UPLOAD_PATH + path + fRename);
		file.delete();
	}
	
}





















