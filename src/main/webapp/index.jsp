<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>员工列表</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link
	href="${APP_PATH}/statics/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${APP_PATH}/statics/js/jquery-1.12.4.min.js"></script>
<script
	src="${APP_PATH}/statics/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

	<!-- 修改页面模态框 -->
	<div class="modal fade" id="update_emp_modal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">员工修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="updata_empName_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" name="empEmail"
									id="update_empEmail_input" placeholder="micro@163.com">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="empGender" id="update_empgender_man" value="男" checked>
									男
								</label> <label class="radio-inline"> <input type="radio"
									name="empGender" id="update_empgender_woman" value="女">
									女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">部门</label>
							<div class="col-sm-3">
								<select class="form-control" name="deptId"
									id="emp_update_department_list"></select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="emp_update_save">更新</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 新增页面模态框 -->
	<div class="modal fade" id="add_emp_modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="empName"
									id="add_empname_input" placeholder="micro"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" name="empEmail"
									id="add_empemail_input" placeholder="micro@163.com"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="empGender" id="add_empgender_man" value="男" checked>
									男
								</label> <label class="radio-inline"> <input type="radio"
									name="empGender" id="add_empgender_woman" value="女"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">部门</label>
							<div class="col-sm-3">
								<select class="form-control" name="deptId"
									id="emp_add_department_list"></select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="emp_add_save">保存</button>
				</div>
			</div>
		</div>
	</div>

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
				<button class="btn btn-primary" id="add_emp_button">新增</button>
				<button class="btn btn-danger" id="delete_emp_button">删除</button>
			</div>
		</div>
		<!-- 表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>员工ID</th>
							<th>员工姓名</th>
							<th>员工性别</th>
							<th>员工邮箱</th>
							<th>员工部门</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6" id="pageinfo_msg"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="pageinfo_nav"></div>
		</div>
	</div>

	<script type="text/javascript">
		var total_records,current_page;
		//页面启动，访问首页
		$(function() {
			to_page(1);
		});
		//使用ajax跳转到指定页面
		function to_page(pn) {
			$("#check_all").prop("checked",false);
			$.ajax({
				url : "${APP_PATH}/emps",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//解析显示单元格数据
					build_emps_table(result);
					//解析显示分页数据信息
					build_page_info(result);
					//解析显示分页条信息
					build_page_nav(result);
				}
			});
		}
		//封装table显示单元格 
		function build_emps_table(result) {
			//首先清空table数据
			$("#emps_table tbody").empty();
			var emps = result.result.pageInfo.list;
			$.each(emps, function(index, item) {
				var empSelectTd=$("<td><input type='checkbox' class='check_item'/></td>");
				var empIdTd = $("<td></td>").append(item.empId);
				var empNameTd = $("<td></td>").append(item.empName);
				var empGenderTd = $("<td></td>").append(item.empGender);
				var empEmailTd = $("<td></td>").append(item.empEmail);
				var empDeptNameTd = $("<td></td>").append(
						item.department.deptName);
				var empButton_modify = $("<button></button>").addClass(
						"btn btn-primary btn-sm btn-modify").append(
						$("<span></span>").addClass(
								"glyphicon glyphicon-pencil")).append("修改");
				empButton_modify.attr("emp_id", item.empId);
				var empButton_delete = $("<button></button>").addClass(
						"btn btn-danger btn-sm btn-delete").append(
						$("<span></span>").addClass(
								"glyphicon glyphicon-remove")).append("删除");
				empButton_delete.attr("emp_id", item.empId);
				var empButton_modify_delete = $("<td></td>").append(
						empButton_modify).append(" ").append(empButton_delete);
				$("<tr></tr>").append(empSelectTd).append(empIdTd).append(empNameTd).append(
						empGenderTd).append(empEmailTd).append(empDeptNameTd)
						.append(empButton_modify_delete).appendTo(
								"#emps_table tbody");
			});
		}
		//解析显示分页数据信息
		function build_page_info(result) {
			//首先清空分页信息
			$("#pageinfo_msg").empty();
			var page_info = result.result.pageInfo;
			$("#pageinfo_msg").append(
					"当前" + page_info.pageNum + "页，总" + page_info.pages + "页，总"
							+ page_info.total + "行记录");
			total_records = page_info.total;
			current_page= page_info.pageNum;
		}
		//解析显示分页条信息,点击下一页功能实现
		function build_page_nav(result) {
			//首先清空分页条
			$("#pageinfo_nav").empty();
			var page_info = result.result.pageInfo;
			var nav = $("<nav></nav>");
			var ul = $("<ul></ul>").addClass("pagination");

			var first_li = $("<li></li>").append($("<a></a>").append("首页"));
			var pre_page_li = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
			if (!page_info.hasPreviousPage) {
				first_li.addClass("disabled");
				pre_page_li.addClass("disabled");
			} else {
				first_li.click(function() {
					to_page(1);
				});
				pre_page_li.click(function() {
					to_page(page_info.prePage);
				});
			}

			var nexe_page_li = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));
			var last_li = $("<li></li>").append($("<a></a>").append("末页"));
			if (!page_info.hasNextPage) {
				nexe_page_li.addClass("disabled");
				last_li.addClass("disabled");
			} else {
				nexe_page_li.click(function() {
					to_page(page_info.pageNum + 1);
				});
				last_li.click(function() {
					to_page(page_info.pages);
				});
			}

			ul.append(first_li).append(pre_page_li);
			$.each(page_info.navigatepageNums, function(index, item) {
				var li = $("<li></li>").append($("<a></a>").append(item));
				if (page_info.pageNum == item) {
					li.addClass("active");
				}
				li.click(function() {
					to_page(item);
				});
				ul.append(li);
			});
			ul.append(nexe_page_li).append(last_li).appendTo(nav);
			nav.appendTo("#pageinfo_nav");
		}
		//点击新增按钮弹出输入模态框 
		$("#add_emp_button").click(function() {
			//清空模态框中的表单内容以及所有样式
			clean_formAndStyle("#add_emp_modal form");
			//从服务器获取部门信息并显示 
			get_departments("#emp_add_department_list");
			//打开模态框 
			$("#add_emp_modal").modal({
				backdrop : "static"
			});

		});
		//清空模态框中的表单内容以及所有样式
		function clean_formAndStyle(elem) {
			$(elem)[0].reset();
			$(elem).find("*").removeClass("has-error has-success");
			$(elem).find(".help-block").text("");
		}
		//使用ajax获得部门信息
		function get_departments(elem) {
			$(elem).empty();
			$.ajax({
				url : "${APP_PATH}/depts",
				type : "GET",
				success : function(result) {
					//console.log(result);
					$.each(result.result.depts, function() {
						$("<option></option>").append(this.deptName).attr(
								"value", this.deptId).appendTo(elem);
					});
				}
			});
		}
		//点击保存
		$("#emp_add_save")
				.click(
						function() {
							//1、校验检测
							if (!volidate_input_info()) {
								return false;
							}
							//2、检测是否能提交
							if ($(this).attr("ajax-validate") == "error") {
								return false;
							}
							//3、提交保存
							$
									.ajax({
										url : "${APP_PATH}/emps",
										data : $("#add_emp_modal form")
												.serialize(),
										type : "POST",
										success : function(result) {
											if (result.status == 200) {
												//关闭模态框
												$("#add_emp_modal").modal(
														'hide');
												//定位到最后一页
												to_page(total_records);
											}
											//员工名出错信息
											if (undefined != result.result.fieldErrors.empName) {
												validate_show_msg(
														"#add_empname_input",
														"error",
														result.result.fieldErrors.empName);
											}
											//员工邮箱出错信息
											if (undefined != result.result.fieldErrors.empEmail) {
												validate_show_msg(
														"#add_empemail_input",
														"error",
														result.result.fieldErrors.empEmail);
											}
										}
									});
						});
		//校验检测
		function volidate_input_info() {
			var name = $("#add_empname_input").val();
			var nameReg = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if (!nameReg.test(name)) {
				//校验信息
				validate_show_msg("#add_empname_input", "error",
						"员工名应为6-16个字母与数字的组合或2-5个中文！");
				return false;
			} else {
				//校验信息
				validate_show_msg("#add_empname_input", "success", "");
			}
			var email = $("#add_empemail_input").val();
			var emailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!emailReg.test(email)) {
				//校验信息
				validate_show_msg("#add_empemail_input", "error", "邮箱格式不正确！");
				return false;
			} else {
				//校验信息
				validate_show_msg("#add_empemail_input", "success", "");
			}
			return true;
		}
		//校验信息
		function validate_show_msg(elem, status, msg) {
			//清空原有校验信息
			$(elem).parent().removeClass("has-success has-error");
			$(elem).next("span").text("");
			//输出校验信息
			if ("success" == status) {
				$(elem).parent().addClass("has-success");
				$(elem).next("span").text(msg);
			} else if ("error" == status) {
				$(elem).parent().addClass("has-error");
				$(elem).next("span").text(msg);
			}
		}
		//检测用户名是否已存在
		$("#add_empname_input").change(
				function() {
					var emp_name = this.value;
					$.ajax({
						url : "${APP_PATH}/checkemp",
						data : "emp_name=" + emp_name,
						type : "POST",
						success : function(result) {
							if (result.status == 200) {
								validate_show_msg("#add_empname_input",
										"success", result.result.va_msg);
								$("#emp_add_save").attr("ajax-validate",
										"success");
							} else {
								validate_show_msg("#add_empname_input",
										"error", result.result.va_msg);
								$("#emp_add_save").attr("ajax-validate",
										"error");
							}
						}
					});
				});
		//--------------------------修改——模态框事件-----------------------
		$(document).on("click", ".btn-modify", function() {
			//清空模态框中的表单内容以及所有样式
			clean_formAndStyle("#update_emp_modal form");
			//1、从服务器获取部门信息并显示
			get_departments("#emp_update_department_list");
			//2、从服务器获取员工信息并显示
			get_empInfo($(this).attr("emp_id"));
			//3、将id值传给提交按钮
			$("#emp_update_save").attr("emp_id",$(this).attr("emp_id"));
			//4、启动模态框
			$("#update_emp_modal").modal({
				backdrop : "static"
			});
			
			
		});
		//1、从服务器获取信息并显示
		function get_empInfo(empId) {
			$.ajax({
				url : "${APP_PATH}/emps/" + empId,
				type : "GET",
				success : function(result) {
					if (result.status == 200) {
						var emp = result.result.emp;
						$("#updata_empName_static").text(emp.empName);
						$("#update_empEmail_input").val(emp.empEmail);
						$("#update_emp_modal input[name=empGender]").val(
								[ emp.empGender ]);
						$("#update_emp_modal select").val([ emp.deptId ]);

					}
				}
			});
		}
		//2、提交更新事件处理
		$("#emp_update_save").click(function(){
			//检查邮箱输入是否合法
			var email = $("#update_empEmail_input").val();
			var emailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!emailReg.test(email)) {
				//校验信息
				validate_show_msg("#update_empEmail_input", "error", "邮箱格式不正确！");
				return false;
			} else {
				//校验信息
				validate_show_msg("#update_empEmail_input", "success", "");
			}
			//提交更新
			$.ajax({
				url:"${APP_PATH}/emps/"+$(this).attr("emp_id"),
				data:$("#update_emp_modal form").serialize(),
				type:"PUT",
				success:function(result){
					if(result.status==200){
						//更新成功
						//关闭模态框
						$("#update_emp_modal").modal("hide");
						//返回页面
						to_page(current_page);
					}
				}
			});
		});
		//--------------------------删除事件-----------------------
		$(document).on("click", ".btn-delete", function() {
			//1、弹出提示框
			var empName=$(this).parents("tr").find("td:eq(2)").text();
			if(confirm("确认删除【"+empName+"】吗？")){
				$.ajax({
					url:"${APP_PATH}/emps/"+$(this).attr("emp_id"),
					type:"DELETE",
					success:function(result){
						if(result.status==200){
							//删除成功
							//返回页面
							to_page(current_page);
						}
					}
				});
			}
		});
		//--------------------------全选/全不选事件-----------------------
		$("#check_all").click(function(){
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		//--------------------------选择框事件-----------------------
		$(document).on("click",".check_item",function(){
			var flag=$(".check_item:checked").length==$(".check_item").length;
			$("#check_all").prop("checked",flag);
		});
		//--------------------------批量删除事件-----------------------
		$("#delete_emp_button").click(function(){
			var empNames="";
			var empNames_str="";
			$.each($(".check_item:checked"),function(){
				empNames+=$(this).parents("tr").find("td:eq(2)").text()+"、";
				empNames_str+=$(this).parents("tr").find("td:eq(1)").text()+"-";
			})
			empNames=empNames.substring(0,empNames.length-1);
			empNames_str=empNames_str.substring(0,empNames_str.length-1);
			if(confirm("确认删除【"+empNames+"】吗？")){
				$.ajax({
					url:"${APP_PATH}/emps/"+empNames_str,
					type:"DELETE",
					success:function(result){
						//删除成功
						//返回页面
						to_page(current_page);
					}
				});
			}
		});
	</script>
</body>
</html>