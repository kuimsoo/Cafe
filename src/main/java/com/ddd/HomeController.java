package com.ddd;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

	@Autowired
	MenuDAO Menudao;

	@GetMapping("/")
	public String home() {

		return "test";
	}

	  @GetMapping("/menu") public String menu(Model model) {
	  
	  
	  ArrayList<MenuDTO> arStore = Menudao.selectCoffee();
	  
	  model.addAttribute("arStore", arStore);
	  
	  return "menu"; }
	  
	@PostMapping("/selectDessert")
	@ResponseBody
	public String selectDessert(HttpServletRequest req) {
		ArrayList<MenuDTO> a = Menudao.selectDessert();
		JSONArray Ar = new JSONArray();
		for (MenuDTO Adto : a) {
			JSONObject T = new JSONObject();
			T.put("id", Adto.getId());
			T.put("name", Adto.getName());
			T.put("price", Adto.getPrice());
			T.put("image_path", Adto.getImage_path());
			T.put("info", Adto.getInfo());
			Ar.put(T);
		}
		return Ar.toString();
	}

	@PostMapping("/coffeeimage")
	@ResponseBody
	public String itemimage(HttpServletRequest req, Model model) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;

		MultipartFile file = multipartRequest.getFile("coffeefile");

		String uploadDir = "src/main/resources/static/coffee";
		File uploadDirectory = new File(Paths.get(uploadDir).toAbsolutePath().normalize().toString());
		File destinationFile = new File(uploadDirectory, file.getOriginalFilename());
		try {
			file.transferTo(destinationFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "menu";
	}
	
	@PostMapping("/insertCoffee")
	@ResponseBody
	public String insertCoffee(HttpServletRequest req) {
		
		String name=req.getParameter("name");
		int price=Integer.parseInt(req.getParameter("price"));
		String decaf=req.getParameter("decaf");
		String image_path=req.getParameter("image_path");
		String info=req.getParameter("info");
		
		Menudao.insertCoffee(name,price,decaf,image_path,info);
		
		return "menu";
	}
	@PostMapping("/updateCoffee")
	@ResponseBody
	public String updateCoffee(HttpServletRequest req) {
		
		int id=Integer.parseInt(req.getParameter("id"));
		String name=req.getParameter("name");
		int price=Integer.parseInt(req.getParameter("price"));
		String decaf=req.getParameter("decaf");
		String image_path=req.getParameter("image_path");
		String info=req.getParameter("info");
				
		Menudao.updateCoffee(name,price,decaf,image_path,info,id);
		
		return "menu";
	}
	@PostMapping("/deleteCoffee")
	@ResponseBody
	public String deleteCoffee(HttpServletRequest req) {
		
		int id=Integer.parseInt(req.getParameter("id"));
		
		Menudao.deleteCoffee(id);
		
		return "menu";
	}
}
