package com.we.art.user.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.we.art.user.model.vo.User;

@Mapper
public interface UserRepository {
	
	//아이디로 회원을 조회해서 나온 결과를 Member 객체에 매핑
	@Select("SELECT * FROM tb_user WHERE user_id = #{userId}")
	User selectUserById(String userId);
	   
	@Select("select count(*) from tb_user where email = #{email}")
	int selectUserByEmail(String email);
	
	@Insert("insert into tb_user(user_id,password,email,name,phone,nickname,login_method)"
			+ " values(#{userId},#{password},#{email},#{name},#{phone},#{nickName},#{loginMethod})")
	int insertUser(User persistInfo);

}
