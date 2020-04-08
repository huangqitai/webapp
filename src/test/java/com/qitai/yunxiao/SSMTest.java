package com.qitai.yunxiao;

import com.qitai.yunxiao.entity.Bread;
import com.qitai.yunxiao.service.BreadService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:spring/applicationContext*.xml"})
public class SSMTest {

	
	@Resource
	private BreadService breadService;

	@Test
	public void test1() {
		List<Bread> bread = breadService.getBreadAll();
		System.out.println(bread.get(0).toString());
		//System.out.println("88888888888");
	}
}
