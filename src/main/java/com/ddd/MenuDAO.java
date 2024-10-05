package com.ddd;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MenuDAO {
	
	ArrayList<MenuDTO> selectCoffee();
	ArrayList<MenuDTO> selectDessert();


}
