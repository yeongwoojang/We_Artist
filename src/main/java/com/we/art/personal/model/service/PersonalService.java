package com.we.art.personal.model.service;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.we.art.communication.model.vo.Following;
import com.we.art.user.model.vo.User;

public interface PersonalService {

	public User selectUserByNickName(User user);

	public Following selectUserIsFollowing(Following following);

	public List<User> selectFollowerList(String userId);

	public List<User> selectFollowingList(String userId);

	public int selectFollowerCount(String userId);

	public int selectFollowingCount(String userId);
}
