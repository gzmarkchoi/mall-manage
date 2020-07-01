package com.atguigu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AttrController {
	
	
	@RequestMapping("goto_attr_add")
	public String goto_attr_add(int flbh2, ModelMap map) {
		map.put("flbh2", flbh2);
		
		return "attrAdd";
	}
	
	@RequestMapping("attr_add")
	public ModelAndView attr_add(int flbh2) {
		ModelAndView mv = new ModelAndView("redirect:/goto_attr_add.do");
		mv.addObject("flbh2", flbh2);
		
		return mv;
	}
}
