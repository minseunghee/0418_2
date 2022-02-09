package com.board.mij.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.board.mij.domain.UserVO;
import com.board.mij.mapper.UserMapper;

@Service("com.board.mij.service.UserService")
public class UserService {

	@Resource(name = "com.board.mij.mapper.UserMapper")
	UserMapper mUserMapper;
	
	public int userRegister(UserVO user) throws Exception {
		return mUserMapper.userRegister(user);
	}

	public String userGetSalt(String username) throws Exception {
		return mUserMapper.userGetSalt(username);
	}
	
	public String userLogin(UserVO user) throws Exception {
		return mUserMapper.userLogin(user);
	}

	public UserVO userDuplicateCheck(String username) throws Exception  {
		return mUserMapper.userDuplicateCheck(username);
	}
	
}
