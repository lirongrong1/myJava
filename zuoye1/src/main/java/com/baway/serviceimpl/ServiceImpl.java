package com.baway.serviceimpl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baway.bean.Email;
import com.baway.bean.EmailExample;
import com.baway.bean.EmailExample.Criteria;
import com.baway.dao.EmailMapper;
import com.baway.service.Services;
@Service
@Transactional
public class ServiceImpl implements Services{
@Autowired
private EmailMapper emailMapper;

@Override
public List<Email> selectAll(int status, int order) {
	if(status==0 && order==0){
		EmailExample example = new EmailExample();
		Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(0);
		example.setOrderByClause("date");
		return emailMapper.selectAll(null);
	}else{
		EmailExample example = new EmailExample();
		Criteria criteria = example.createCriteria();
		if(status!=0){
			criteria.andStatusEqualTo(status);
		}
		if(order!=0){
			example.setOrderByClause("date desc");
		}
		return emailMapper.selectAll(example);
	}
}

}
