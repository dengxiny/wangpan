package com.ssm.service;

import java.util.List;

import com.ssm.bean.Pictures;

public interface MainService {
	public void insert(String email,String a);

	public String select(int videoID);

	public int selectCount(Pictures pic);

	public List<Pictures> selectList(Pictures pic, int pagecode, int pagerecord);
}
