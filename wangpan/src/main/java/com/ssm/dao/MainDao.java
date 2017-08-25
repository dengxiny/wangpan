package com.ssm.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ssm.bean.Pictures;

public interface MainDao {
void insert(String email,String data);

String select(int videoID);

int selectCount(Pictures pic);

List<Pictures> selectList(Map map);
}
