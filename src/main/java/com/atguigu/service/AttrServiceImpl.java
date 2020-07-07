package com.atguigu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.mapper.AttrMapper;

@Service
public class AttrServiceImpl implements AttrServiceInf {

	@Autowired
	AttrMapper attrMapper;

	@Override
	public void save_attr(int flbh2, List<OBJECT_T_MALL_ATTR> list_attr) {
		for (int i = 0; i < list_attr.size(); i++) {
			// Insert property
			OBJECT_T_MALL_ATTR attr = list_attr.get(i);
			attrMapper.insert_attr(flbh2, attr);

			attrMapper.insert_values(attr.getId(), attr.getList_value());
		}
	}

	@Override
	public List<OBJECT_T_MALL_ATTR> get_attr_list(int flbh2) {
		return attrMapper.select_attr_list(flbh2);
	}

}
