package com.nys.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nys.bean.Employee;
import com.nys.bean.ResultMsg;
import com.nys.service.EmployeeService;
/**
 * EmployeeController处理和员工有关的请求
 * @author nysheng
 *
 */
@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;
	
	/**
	 * 删除用户
	 * @param empId
	 * @return
	 */
	@RequestMapping(value="/emps/{empId}",method = RequestMethod.DELETE)
	@ResponseBody
	public ResultMsg deleteEmp(@PathVariable("empId")String empId_str) {
		List<Integer> empIds=null;
		if(empId_str.contains("-")) {
			String[] empId_arr=empId_str.split("-");
			empIds=new ArrayList<Integer>(empId_arr.length);
			for(String str:empId_arr) {
				empIds.add(Integer.parseInt(str));
			}
		}else {
			empIds=new ArrayList<Integer>(1);
			empIds.add(Integer.parseInt(empId_str));
		}
		employeeService.deleteEmp(empIds);
		return ResultMsg.success();
	}
	/**
	 * 更新员工信息 PUT请求
	 * @return
	 */
	@RequestMapping(value = "/emps/{empId}",method = RequestMethod.PUT)
	@ResponseBody
	public ResultMsg updateEmp(Employee employee) {
		employeeService.updateEmp(employee);
		return ResultMsg.success();
	}
	
	/**
	 * 查询员工信息
	 * @return
	 */
	@RequestMapping(value="/emps/{empId}",method = RequestMethod.GET)
	@ResponseBody
	public ResultMsg getEmp(@PathVariable("empId")Integer empId) {
		Employee emp=employeeService.getEmpById(empId);
		if(emp!=null) {
			return ResultMsg.success().add("emp", emp);
		}else {
			return ResultMsg.fail();
		}
	}
	
	/**
	 * 新增员工
	 * 采用jsr303验证，后端检查用户输入是否符合要求
	 * @return
	 */
	@RequestMapping(value="/emps",method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg saveEmp(@Valid Employee employee,BindingResult result) {
		if(result.hasErrors()) {
			Map<String, String> map=new HashMap<String, String>();
			List<FieldError> errors= result.getFieldErrors();
			for (FieldError fieldError : errors) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return ResultMsg.fail().add("fieldErrors", map);
		}else {
			employeeService.addEmp(employee);
			return ResultMsg.success();
		}
	}
	/**
	 * 分页查询员工
	 */
	@RequestMapping(value="/emps",method = RequestMethod.GET)
	@ResponseBody
	public  ResultMsg getEmpsWithJson(@RequestParam(value="pn",defaultValue = "1")Integer pn){
		//使用插件pagehelper实现分页查询
		//startPage设置当前页以及每页要查询的行数，后面紧跟查询语句
		PageHelper.startPage(pn, 7);
		List<Employee> emps=employeeService.getAll();
		//pageInfo中封装了详细的分页信息，PageInfo<Employee>(emps,5);表示要连续显示多少页
		PageInfo<Employee> pageInfo=new PageInfo<Employee>(emps, 7);
		return ResultMsg.success().add("pageInfo", pageInfo);
	}
	/**
	 * 检查员工是否已经存在
	 * @return
	 */
	@RequestMapping(value="/checkemp",method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg checkUser(String emp_name) {
		//后端校验前端数据
		String nameRex="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		if(!emp_name.matches(nameRex)) {
			return ResultMsg.fail().add("va_msg", "用户名必须为6-16位数字和字母的组合或2-5位中文");
		}
		//数据库校验
		boolean b=employeeService.checkUser(emp_name);
		if(b) {
			return ResultMsg.fail().add("va_msg", "用户名不可用");
		}else {
			return ResultMsg.success().add("va_msg", "用户名可用");
		}
	}
	//@RequestMapping("/emps")
//	public String getEmps( @RequestParam(value="pn",defaultValue ="1")Integer pn,Model model) {
//		//使用插件pagehelper实现分页查询
//		//startPage设置当前页以及每页要查询的行数，后面紧跟查询语句
//		PageHelper.startPage(pn, 5);
//		List<Employee> emps=employeeService.getAll();
//		//pageInfo中封装了详细的分页信息，PageInfo<Employee>(emps,5);表示要连续显示多少页
//		PageInfo<Employee> info=new PageInfo<Employee>(emps,5);
//		model.addAttribute("pageInfo", info);
//		return "list";
//	}
}
