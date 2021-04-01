package com.we.art.gallery.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface GalleryService {
	
	public int insertGalleryInfo(List<MultipartFile> files, String userId);
	public int updateGalleryInfo(List<MultipartFile> files, String userId);
	
}
