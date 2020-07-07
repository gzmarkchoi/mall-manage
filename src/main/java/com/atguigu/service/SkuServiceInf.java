package com.atguigu.service;

import java.util.List;

import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;

public interface SkuServiceInf {

	void save_sku(T_MALL_SKU sku, T_MALL_PRODUCT spu, List<OBJECT_T_MALL_ATTR> list_attr);

}
