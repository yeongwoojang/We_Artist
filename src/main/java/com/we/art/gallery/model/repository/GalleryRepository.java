package com.we.art.gallery.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.we.art.gallery.model.vo.Gallery;

@Mapper
public interface GalleryRepository {
	int insertGalleryInfo(List<Gallery> gallerList);
}
