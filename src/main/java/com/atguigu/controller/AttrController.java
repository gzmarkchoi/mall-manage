package com.atguigu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttrController {
	
	
	@RequestMapping("goto_attr_add")
	public String goto_attr_add() {

		return "attrAdd";
	}
}
