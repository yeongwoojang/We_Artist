package com.we.art.gallery.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.we.art.gallery.model.vo.Gallery;

@Mapper
public interface GalleryRepository {
	
	int insertAllGalleryInfo(List<Gallery> galleryList);
	
	int updateAllGalleryInfo(List<Gallery> galleryList);
	
	@Select("select * from tb_gallery where user_id = #{userId}")
	List<Gallery> selectGalleryInfoByUserId(String userId);
}
