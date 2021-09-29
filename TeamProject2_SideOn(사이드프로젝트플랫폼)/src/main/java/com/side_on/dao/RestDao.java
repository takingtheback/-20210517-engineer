package com.side_on.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.side_on.dto.Rest;

@Mapper
public interface RestDao {

	public List<Rest> selectDashboardRestList();

	public List<Rest> selectRestList();
	
	public Rest selectRest(String restNo);


}
