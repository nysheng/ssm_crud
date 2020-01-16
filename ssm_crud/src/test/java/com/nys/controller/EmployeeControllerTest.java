package com.nys.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.nys.bean.Employee;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "classpath:applicationContext.xml",
		"file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml" })
public class EmployeeControllerTest {
	// 传入springmvc的ioc
	@Autowired
	WebApplicationContext context;
	// 虚拟的mvc，可以获取到处理结果
	MockMvc mockMvc;

	@Before
	public void initMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}

	@Test
	public void testPage() throws Exception {
		/*
		 * MvcResult mvcResult =
		 * mockMvc.perform(MockMvcRequestBuilders.get("/emps")).andReturn();
		 * MockHttpServletRequest request = mvcResult.getRequest(); PageInfo<Employee>
		 * pageInfo = (PageInfo<Employee>) request.getAttribute("pageInfo");
		 * System.out.println("当前页码：" + pageInfo.getPageNum()); for (Employee employee :
		 * pageInfo.getList()) { System.out.println(employee.toString()); }
		 */
	}

}
