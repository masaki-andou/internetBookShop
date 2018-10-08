package com.projects.test;

import org.junit.After;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.projects.Application;
/**
 * 
* @ClassName: BaseApplicationTest  
* @Description: springboot使用junit测试的基类，其他测试类都继承此类进行junit测试 
* @author mardoner-QQ:2500119268 
* @date Sep 28, 2018  
*
 */
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment=SpringBootTest.WebEnvironment.RANDOM_PORT,classes=Application.class)
public class BaseApplicationTest {
	
	@Before
	public void init() {
		System.out.println("----------- 测试开始  ------------");
	}
	
	@After
	public void after() {
		System.out.println("----------- 测试结束  ------------");
	}
}	
