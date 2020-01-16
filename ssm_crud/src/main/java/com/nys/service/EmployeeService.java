package com.nys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nys.bean.Employee;
import com.nys.bean.EmployeeExample;
import com.nys.bean.EmployeeExample.Criteria;
import com.nys.dao.EmployeeMapper;
@Service
public class EmployeeService {
	@Autowired
	EmployeeMapper employeeMapper;
	
	public Employee getEmpById(Integer empId) {
		EmployeeExample employeeExample=new EmployeeExample();
		Criteria criteria=employeeExample.createCriteria();
		criteria.andEmpIdEqualTo(empId);
		List<Employee> list=employeeMapper.selectByExampleWithDept(employeeExample);
		return list.get(0);
	}
	
	/**
	 * 查询所有员工
	 * @return
	 */
	public List<Employee> getAll(){
		EmployeeExample employeeExample=new EmployeeExample();
		employeeExample.setOrderByClause("emp_id");
		return employeeMapper.selectByExampleWithDept(employeeExample);
	}
	/**
	 * 新增员工
	 * @param employee
	 * @return
	 */
	public void addEmp(Employee employee) {
		employeeMapper.insertSelective(employee);
	}
	/**
	 * 检查员工是否存在
	 * @param emp_name
	 * @return ture:用户已存在 false：用户不存在
	 */
	public boolean checkUser(String emp_name) {
		EmployeeExample example=new EmployeeExample();
		Criteria criteria= example.createCriteria();
		criteria.andEmpNameEqualTo(emp_name);
		long i=employeeMapper.countByExample(example);
		if(i!=0) {
			return true;
		}
		return false;
	}
	/**
	 * 更新员工信息
	 * @param employee
	 */
	public void updateEmp(Employee employee) {
		// TODO Auto-generated method stub
		EmployeeExample example=new EmployeeExample();
		Criteria criteria=example.createCriteria();
		criteria.andEmpIdEqualTo(employee.getEmpId());
		employeeMapper.updateByExampleSelective(employee, example);
	}

	/**
	 * 删除员工
	 * @param empIds
	 */
	public void deleteEmp(List<Integer> empIds) {
		// TODO Auto-generated method stub
		EmployeeExample example=new EmployeeExample();
		Criteria criteria=example.createCriteria();
		criteria.andEmpIdIn(empIds);
		employeeMapper.deleteByExample(example);
	}
}
