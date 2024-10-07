package com.ddd;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface MenuDAO {
	
	ArrayList<MenuDTO> selectCoffee();
	ArrayList<MenuDTO> selectDessert();
	//ArrayList<MenuDTO> selectMenu();
	void insertCoffee(String name,int price,String decaf,String image_path,String info);
	void updateCoffee(String name,int price,String decaf,String image_path,String info,int id);
	void deleteCoffee(int id);
}
