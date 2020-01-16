package com.nys.dao;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.nys.bean.Employee;
import com.nys.bean.EmployeeExample;
import com.nys.bean.EmployeeExample.Criteria;
/**
 * com.nys.dao.EmployeeMapper的CRUD测试
 * @author nysheng
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class EmployeeMapperTest {
	@Autowired
	EmployeeMapper employeeMapper;
	@Autowired
	SqlSession sqlSession;
	@Test
	public void crudTest() {
		//增加员工
//		  Employee employee = new Employee();
//		  employeeMapper.insertSelective(new Employee(null, "test", "9", "test@test.test", 1));
		 
		//批量增加员工，使用批量操作的sqlsession
//		  for(int i=0;i<1000;i++) { String
//		  name=UUID.randomUUID().toString().substring(0,5); 
//		  EmployeeMapper employeeMapper=sqlSession.getMapper(EmployeeMapper.class);
//		  employeeMapper.insertSelective(new Employee(null, name, i%2==0?"男":"女",name+"@"+name+"."+name, (int)(4*Math.random())+1)); } 
//		  System.out.println("批量插入完成");
		 
		//查看员工
//		  List<Employee> employees= employeeMapper.selectByExampleWithDept(null);
//		  for(Employee employee:employees) {
//			  System.out.println(employee.toString());
//		  }
		 
		//修改员工
//		  Employee employee = new Employee(null, "rename", null, "rename@rename.rename", 1);
//		  EmployeeExample employeeExample=new EmployeeExample();
//		  Criteria criteria=employeeExample.or();
//		  criteria.andEmpIdEqualTo(212);
//		  int i=employeeMapper.updateByExampleSelective(employee, employeeExample); 
//		  System.out.println(i);
		
		//删除员工
//		  EmployeeExample employeeExample=new EmployeeExample();
//		  Criteria criteria=employeeExample.or();
//		  criteria.andEmpIdBetween(1, 2000);
//		  employeeMapper.deleteByExample(employeeExample);
		
	}
}
