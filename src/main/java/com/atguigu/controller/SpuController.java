package com.atguigu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.service.SpuServiceInf;
import com.atguigu.util.MyFileUpload;

@Controller
public class SpuController {

	@Autowired
	SpuServiceInf spuServiceInf;

	@RequestMapping("goto_spu_add")
	public String goto_spu_add(ModelMap map, T_MALL_PRODUCT spu) {
		map.put("spu", spu);

		return "spuAdd";
	}

	@RequestMapping("spu_add")
	public ModelAndView spu_add(@RequestParam("files") MultipartFile[] files, T_MALL_PRODUCT spu) {
		// upload product pictures
		List<String> listImages = MyFileUpload.uploadImages(files);

		// save product information
		spuServiceInf.saveSpu(listImages, spu);

		ModelAndView mv = new ModelAndView("redirect:/goto_spu_add.do");
		mv.addObject("flbh1", spu.getFlbh1());
		mv.addObject("Flbh2", spu.getFlbh2());
		mv.addObject("pp_id", spu.getPp_id());

		return mv;
	}

	@RequestMapping("get_spu_list")
	@ResponseBody
	public List<T_MALL_PRODUCT> get_spu_list(int pp_id, int flbh2) {

		List<T_MALL_PRODUCT> listSpu = spuServiceInf.getSpuList(pp_id, flbh2);

		return listSpu;
	}
}
