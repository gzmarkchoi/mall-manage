package com.atguigu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.mapper.SkuMapper;

@Service
public class SkuServiceImpl implements SkuServiceInf {

	@Autowired
	SkuMapper skuMapper;

	@Override
	public void save_sku(T_MALL_SKU sku, T_MALL_PRODUCT spu, List<OBJECT_T_MALL_ATTR> list_attr) {

		// save SKU, return SKU Id
		sku.setShp_id(spu.getId());
		skuMapper.insert_sku(sku);

		Map<Object, Object> map = new HashMap<>();
		map.put("shp_id", spu.getId());
		map.put("sku_id", sku.getId());
		map.put("list_av", list_attr);

		skuMapper.insert_sku_av(map);
	}

}
