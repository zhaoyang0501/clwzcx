<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox ">
					<div class="ibox-title">
						<h5>我参与的活动</h5>
						<div class="ibox-tools"></div>
					</div>


					<div class="ibox-content ">
						<table ID='dt_table_view'
							class="table table-striped table-bordered table-hover ">
							<thead>
								<tr>
									<th>活动名称</th>
									<th>活动时间</th>
									<th>地点</th>
									<th>组织部门</th>
									<th>已报名人数</th>
									<th>需要人数</th>
									<th>状态</th>
									<th>报名日期</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${signs }" var="bean">
								<tr>
									<td>${bean.action.name }</td>
									<td>${bean.action.actionDate }</td>
									<td>${bean.action.addr }</td>
									<td>${bean.action.department.name }</td>
									<td>${bean.action.signnum }</td>
									<td>${bean.action.maxmnum }</td>
									<th><span class="label label-primary">${bean.action.state }</span></th>
									<td>${bean.signDate }</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div id='_form' style="margin-top: 30000px " >
		<div class="ibox-content" >
			<div class="row">
				<div class="col-sm-12 b-r">
					<form class="form-horizontal" action="" method="get">
						<input name='id' type="hidden" />
						<table class='table table-bordered'>
							<thead>
								<tr style="text-align: center;">
									<td colspan="6"><h3>发布活动</h3></td>
								</tr>
							</thead>
							<tbody>
							
								<tr>
									<td>活动名称</td>
									<td><input name='name' type="text" class="form-control"></td>
								</tr>
								
								<tr>
									<td>活动日期</td>
									<td><input name='actionDate' type="text" class="form-control"></td>
								</tr>
								
								
								<tr>
									<td>活动地点</td>
									<td><input name='addr' type="text" class="form-control"></td>
								</tr>
								
								
								<tr>
									<td>截止报名日期</td>
									<td><input name='endDate' type="text" class="form-control"></td>
								</tr>
								
								<tr>
									<td>活动内容</td>
									<td><textarea class="form-control" name='remark' rows="4" cols=""
											style="width: 80%"></textarea></td>
								</tr>
								
								<tr>
									<td>报名要求</td>
									<td><textarea class="form-control" name='need' rows="4" cols=""
											style="width: 80%"></textarea></td>
								</tr>
								
								
								<tr>
									<td>发起部门</td>
									<td>
										<select name='department.id' class='form-control'>
									 			<c:forEach var="bean" items="${depts}">
									 				<option value="${bean.id }">${bean.name }</option>
									 			</c:forEach>
									 	</select>
									 </td>
								<tr>
								
								
								<tr>
									<td>活动状态</td>
									<td>
										<select name='state' class='form-control'>
												   <option value="未开始">未开始</option>
									 				<option value="进行中">进行中</option>
									 				<option value="进行中">已结束</option>
									 	</select>
									 </td>
								<tr>
									<td colspan="6">
										<div class="col-sm-4 col-sm-offset-2">
											<button class="btn btn-primary" type="button"
												onclick="submit_form()">提交</button>
											<button class="btn btn-white" type="submit">取消</button>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	
<script src="${pageContext.request.contextPath}/js/JsBarcode.all.js "></script>
</body>
</html>
