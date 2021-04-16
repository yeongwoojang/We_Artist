package com.we.art.user.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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

	//아이디와 패스워드를 받아서 유저테이블에 일치하는 유저 정보가 있는지 확인한다.
	@Select("SELECT *FROM TB_USER WHERE USER_ID = #{userId} && PASSWORD = #{password}")
	User selectUserForLogin(User user);
	
	@Update("update tb_user set password=#{password}, name=#{name}, phone=#{phone}, nickname=#{nickName} where  user_id = #{userId}")
	int updateUser(User persistInfo);
	
	@Update("update tb_user set password=#{password} where email=#{email}")
	User findPassword(String password, String email);
	
	

	
	
	
}
