package com.we.art.gallery.model.service.serviceimpl;

import java.util.ArrayList;
import java.util.Comparator;
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
	public int insertAllGalleryInfo(List<Gallery> galleryList, String userId) {
		int res = 0;
		List<Gallery> dataList = galleryRepository.selectGalleryInfoByUserId(userId);
		List<Gallery> updateList = new ArrayList<Gallery>();
		List<Gallery> insertList = new ArrayList<Gallery>();
		
		for(Gallery oldData : dataList) {
			for(Gallery newData : galleryList) {
				if(oldData.getImgOrder().equals(newData.getImgOrder())) {
					updateList.add(newData);
					System.out.println(updateList);
				}else {
					insertList.add(newData);
				}
			}
		}
		
		if(!insertList.isEmpty()) {
			res += galleryRepository.insertAllGalleryInfo(insertList);
		}
		
		if(!updateList.isEmpty()) {
			res += galleryRepository.updateAllGalleryInfo(updateList);
		}
		
		return res;
	}

	@Override
	public int updateGalleryInfo(List<MultipartFile> files, String userId) {
		
		return 0;
	}

	@Override
	public List<Gallery> selectGalleryInfoByUserId(String userId) {
		List<Gallery> dataList = galleryRepository.selectGalleryInfoByUserId(userId);
		List<Gallery> commandList = new ArrayList<Gallery>();
		
		for(int i=0; i<12; i++) {
			commandList.add(null);
		}
		
		for(Gallery item : dataList) {
			int idx = Integer.parseInt(item.getImgOrder())-1;
			commandList.set(idx, item);
		}
		
		return commandList;
	}

	@Override
	public String selectGalleryInforByImgOrder(String imgOrder, String userId) {
		// TODO Auto-generated method stub
		return galleryRepository.selectGalleryInforByImgOrder(imgOrder, userId);
	}
	
}
