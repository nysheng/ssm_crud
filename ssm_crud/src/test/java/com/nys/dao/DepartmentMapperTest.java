package com.nys.dao;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.nys.bean.Department;
/**
 * com.nys.dao.DepartmentMapper的CRUD测试
 * @author nysheng
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class DepartmentMapperTest {
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	SqlSession sqlSession;
	@Test
	public void crudTest() {
		//增加部門
//		  Department department = new Department(); 
//		  department.setDeptName("后勤部");
//		  departmentMapper.insertSelective(department);
		 
		//查看部门
//		  List<Department> departments= departmentMapper.selectByExample(null);
//		  for(Department department:departments) {
//			  System.out.println(department.toString());
//		  }
		 
		//修改部门
//		  Department department = new Department(); 
//		  department.setDeptName("生产部");
//		  DepartmentExample departmentExample=new DepartmentExample();
//		  Criteria criteria=departmentExample.or();
//		  criteria.andDeptIdEqualTo(2);
//		  int i=departmentMapper.updateByExampleSelective(department, departmentExample); 
//		  System.out.println(i);
		
		//删除部门
//		  DepartmentExample departmentExample=new DepartmentExample();
//		  Criteria criteria=departmentExample.or();
//		  criteria.andDeptIdBetween(3, 6);
//		  departmentMapper.deleteByExample(departmentExample);
		 							 
	}
}
