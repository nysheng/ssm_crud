package com.nys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nys.bean.Department;
import com.nys.bean.DepartmentExample;
import com.nys.dao.DepartmentMapper;

@Service
public class DepartmentService {
	@Autowired
	DepartmentMapper departmentMapper;
	public List<Department> getAll(){
		DepartmentExample departmentExample=new DepartmentExample();
		departmentExample.setOrderByClause("dept_id");
		return departmentMapper.selectByExample(departmentExample);
	}
}
