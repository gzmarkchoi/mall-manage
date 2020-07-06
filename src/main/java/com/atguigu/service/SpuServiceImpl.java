package com.atguigu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.mapper.SpuMapper;

@Service
public class SpuServiceImpl implements SpuServiceInf {

	@Autowired
	SpuMapper spuMapper;

	@Override
	public void saveSpu(List<String> listImages, T_MALL_PRODUCT spu) {
		// insert SPU info
		// product default image
		spu.setShp_tp(listImages.get(0));
		spuMapper.insert_spu(spu);

		// insert SPU images
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("shp_id", spu.getId());
		map.put("list_image", listImages);
		spuMapper.insert_images(map);
	}

	@Override
	public List<T_MALL_PRODUCT> getSpuList(int pp_id, int flbh2) {

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("pp_id", pp_id);
		map.put("flbh2", flbh2);

		List<T_MALL_PRODUCT> listSpu = spuMapper.select_spu_list(map);

		return listSpu;
	}

}
