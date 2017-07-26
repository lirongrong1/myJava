package com.baway.service;

import java.util.List;

import com.baway.bean.Email;

public interface Services {

	List<Email> selectAll(int status, int order);
}
