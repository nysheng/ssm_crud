<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>员工列表</title>
<% pageContext.setAttribute("APP_PATH",request.getContextPath()); %>
<link href="${APP_PATH}/statics/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/statics/js/jquery-1.12.4.min.js"></script>
<script src="${APP_PATH}/statics/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 数据显示-->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM_CRUD</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>#</th>
						<th>员工姓名</th>
						<th>员工性别</th>
						<th>员工邮箱</th>
						<th>员工部门</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list}" var="emp">
						<tr>
							<td>${emp.empId}</td>
							<td>${emp.empName}</td>
							<td>${emp.empGender}</td>
							<td>${emp.empEmail}</td>
							<td>${emp.department.deptName}</td>
							<td>
								<button class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									编辑
								</button>
								<button class="btn btn-danger btn-sm">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									删除
								</button>				
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<!-- 分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6" >
				当前${pageInfo.pageNum}页，共${pageInfo.pages}页，总${pageInfo.total}条记录
			</div>
			<!-- 分页条信息 -->
			<div class="col-md-6" >
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  	<c:if test="${pageInfo.pageNum==1}">
					  	<li class="disabled" ><a href="${APP_PATH}/emps?pn=1">首页</a></li>
				    </c:if>
				  	<c:if test="${pageInfo.pageNum!=1}">
					  	<li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
				    </c:if>
				  	<c:if test="${pageInfo.hasPreviousPage}">
					  	<li>
					      <a href="${APP_PATH}/emps?pn=${pageInfo.prePage}" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
				    </c:if>
				    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
				    	<c:if test="${page_Num==pageInfo.pageNum}">
				    		<li class="active" ><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a></li>
				    	</c:if>
				    	<c:if test="${page_Num!=pageInfo.pageNum}">
				    		<li><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a></li>
				    	</c:if>
				    </c:forEach>
				    <c:if test="${pageInfo.hasNextPage}">
					    <li>
					      <a href="${APP_PATH}/emps?pn=${pageInfo.nextPage}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				    </c:if>
				    <c:if test="${pageInfo.pageNum==pageInfo.pages}">
					    <li class="disabled"><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">末页</a></li>
				    </c:if>
				    <c:if test="${pageInfo.pageNum!=pageInfo.pages}">
					    <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">末页</a></li>
				    </c:if>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>