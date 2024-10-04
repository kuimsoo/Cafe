package com.ddd;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
		
		
	ArrayList<MenuDTO> arStore = Menudao.selectMenu();
	
	model.addAttribute("arStore", arStore);	
	
		return "menu";
	}
	
	
	
	
}
