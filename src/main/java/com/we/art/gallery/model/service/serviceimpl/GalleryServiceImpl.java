package com.we.art.gallery.model.service.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.we.art.gallery.model.repository.GalleryRepository;
import com.we.art.gallery.model.service.GalleryService;
import com.we.art.gallery.model.vo.Gallery;

@Service
public class GalleryServiceImpl implements GalleryService{
	
	private final GalleryRepository galleryRepository;
	
	public GalleryServiceImpl(GalleryRepository galleryRepository) {
		
		this.galleryRepository = galleryRepository;
	}
	
	@Override
	public int insertGalleryInfo(List<MultipartFile> files, String userId) {
		List<Gallery> galleryList = new ArrayList<Gallery>();
		
		return 0;
	}

	@Override
	public int updateGalleryInfo(List<MultipartFile> files, String userId) {
		
		return 0;
	}
	
}