package com.baway.test;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.baway.bean.Email;
import com.baway.bean.EmailExample;
import com.baway.bean.EmailExample.Criteria;
import com.baway.dao.EmailMapper;

@ContextConfiguration(value={"classpath:applicationContext.xml"})
@RunWith(value=SpringJUnit4ClassRunner.class)
public class UserTest {
	@Autowired 
	private EmailMapper emailMapper;
	@Test
	public void add() throws Exception, XMLParserException{
		List<String> warnings = new ArrayList<String>();
		   boolean overwrite = true;
		   File configFile = new File("mbg.xml");
		   ConfigurationParser cp = new ConfigurationParser(warnings);
		   Configuration config = cp.parseConfiguration(configFile);
		   DefaultShellCallback callback = new DefaultShellCallback(overwrite);
		   MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
		   myBatisGenerator.generate(null);
	}
	
	@Test
	public void selectAll(){
		
		EmailExample emailExample = new EmailExample();
		Criteria criteria = emailExample.createCriteria();
		criteria.andStatusEqualTo(2);
		List<Email> list = emailMapper.selectAll(null);
		for (Email email : list) {
			System.out.println(email.toString());
		}
		
	}

}
