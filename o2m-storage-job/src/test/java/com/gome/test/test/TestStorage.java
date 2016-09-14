package com.gome.test.test;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.gome.storage.service.PushStorageService;


public class TestStorage {

		@Test
		public void pushBranchEmployees() throws Exception{
			ApplicationContext ctx = new ClassPathXmlApplicationContext("/spring/spring-config.xml");  
			PushStorageService storageService = (PushStorageService)ctx.getBean("pushStorageService");
			storageService.pushStorage();
		}
}
