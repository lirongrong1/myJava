package com.baway.controller;

import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baway.bean.Email;
import com.baway.service.Services;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private Services services;
	
	/**
	 * 查询所有
	 * @return
	 */
	@ResponseBody
	@RequestMapping("select")
	public PageInfo select(@RequestParam(value="pageNum",defaultValue="1")int pageNum,@RequestParam(value="pageSize",defaultValue="2") int pageSize
			,@RequestParam(value="status",defaultValue="0")int status,
			@RequestParam(value="order",defaultValue="0")int order
			){
		System.out.println("进入查询的方法");
		PageHelper.startPage(pageNum, pageSize);
		List<Email> list = services.selectAll(status,order);
		System.out.println(status+"---"+order);
		PageInfo pageInfo = new PageInfo(list);
		System.out.println(pageInfo);
		return  pageInfo;
	}
	

}
