package com.atguigu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.atguigu.bean.T_MALL_PRODUCT;

@Controller
public class SpuController {

	@RequestMapping("goto_spu_add")
	public String goto_spu_add(ModelMap map, T_MALL_PRODUCT spu) {
		map.put("spu", spu);
		
		return "spuAdd";
	}
	
	@RequestMapping("spu_add")
	public String spu_add(@RequestParam("files") MultipartFile[] files, T_MALL_PRODUCT spu) {
		// upload pic
		
		// save product information
		
		return "redirect:/goto_spu_add.do";
	}
}
