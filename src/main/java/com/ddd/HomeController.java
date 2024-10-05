package com.ddd;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import jakarta.servlet.http.HttpServletRequest;



@Controller	
public class HomeController {
	
	@Autowired MenuDAO Menudao;


	@GetMapping("/")
	public String home() {
		
		return "test";
	}
	
	@GetMapping("/menu")
	public String menu(HttpServletRequest req,Model model) {
		
		
	ArrayList<MenuDTO> arStore = Menudao.selectCoffee();
	
	model.addAttribute("arStore", arStore);	
	
		return "menu";
	}
	
	@PostMapping("/selectDessert")
	@ResponseBody
	public String selectDessert(HttpServletRequest req) {
		ArrayList<MenuDTO> a = Menudao.selectDessert();
		JSONArray Ar = new JSONArray();
		for(MenuDTO Adto : a) {
			JSONObject T = new JSONObject();
			T.put("id",Adto.getId());
			T.put("name",Adto.getName());
			T.put("price",Adto.getPrice());
			T.put("image_path",Adto.getImage_path());
			T.put("info",Adto.getInfo());		
			Ar.put(T);
		}
		return Ar.toString();
	}
	
	
	
	
	
}
