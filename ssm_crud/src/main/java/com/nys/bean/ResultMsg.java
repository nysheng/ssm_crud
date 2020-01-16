package com.nys.bean;

import java.util.HashMap;
import java.util.Map;
/**
 * ResultMsg 处理数据库数据返回状态
 * @author nysheng
 *
 */
public class ResultMsg {
	private Integer status;//状态码
	private String msg;//提示信息
	private Map<String, Object> result=new HashMap<String, Object>();//返回结果
	
	public static ResultMsg success() {
		ResultMsg resultMsg=new ResultMsg();
		resultMsg.setStatus(200);
		resultMsg.setMsg("返回成功");
		return resultMsg;
	}
	public static ResultMsg fail() {
		ResultMsg resultMsg=new ResultMsg();
		resultMsg.setStatus(100);
		resultMsg.setMsg("返回失败");
		return resultMsg;
	}
	
	public ResultMsg add(String name,Object obj) {
		this.result.put(name, obj);
		return this;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getResult() {
		return result;
	}
	public void setResult(Map<String, Object> result) {
		this.result = result;
	}
	
}
