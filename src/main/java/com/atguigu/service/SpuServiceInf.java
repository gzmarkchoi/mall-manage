package com.atguigu.service;

import java.util.List;

import com.atguigu.bean.T_MALL_PRODUCT;

public interface SpuServiceInf {

	public void saveSpu(List<String> listImages, T_MALL_PRODUCT spu);

	public List<T_MALL_PRODUCT> getSpuList(int pp_id, int flbh2);

}
