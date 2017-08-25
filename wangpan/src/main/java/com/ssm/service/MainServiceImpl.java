package com.ssm.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.bean.Pictures;
import com.ssm.dao.MainDao;

@Service("mainService")
public class MainServiceImpl implements MainService{
@Autowired
MainDao maindao;
public void insert(String email,String a){
	Date d=new Date();
	String data=d.toString()+"µ«»Î¡À||||IP «"+a;
	maindao.insert(email, data);
}
public String select(int videoID) {
	// TODO Auto-generated method stub
	return maindao.select(videoID);
}
public int selectCount(Pictures pic) {
	// TODO Auto-generated method stub
	return maindao.selectCount(pic);
}
public List<Pictures> selectList(Pictures pic, int pagecode, int pagerecord) {
	// TODO Auto-generated method stub
	Map map=new HashMap();
	map.put("startnum", (pagecode-1)*pagerecord);
	map.put("pagerecord", pagerecord);
	return maindao.selectList(map);
}
}
