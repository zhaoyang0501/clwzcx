<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<body class="home-template">
<div class="row">
			<div class="aw-content-wrap clearfix">
					<div class="col-sm-12 col-md-12 aw-main-content">
					<!-- tab 切换 -->
					<ul class="nav nav-tabs aw-nav-tabs active">
						<h2 class="hidden-xs"><i class="icon icon-ask"></i> 违章查询</h2>
					</ul>

					<div class="aw-mod aw-mod-publish">
						<div class="mod-body">
							<h3>输入发动机号码查询</h3>
							<div class="row">
								<form action="./wz" method="post">
									<div class='col-sm-8'>
										<input  required="required"  type="text" placeholder="发动机号码" name="num" id="question_contents" value="" class="form-control">
									</div>
									<div class='col-sm-4'>
										<input type="submit" class="form-control" value="立即查询" >
									</div>
								</form>
							</div>

							<h3>违章记录:</h3>
							<div>
								<table class="table">
										<thead>
											<tr>
												<th>发动机号码</th>
												<th>违章类型</th>
												<th>罚款</th>
												<th>详情</th>
												<th>处理状态</th>
												<th>处理日期</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach  items="${wzs}" var="bean">
											<tr>
												<TD>${bean.enginenum }</TD>
												<TD>${bean.type }</TD>
												<TD>${bean.cash }</TD>
												<TD>${bean.remark }</TD>
												<TD>${bean.state }</TD>
												<TD>${bean.dealdate }</TD>
											</tr>
											</c:forEach>
										</tbody>
								</table>
							</div>
						</div>
					</div>
				</form>
				</div>

			</div>
		</div>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.extend($.validator.messages, {
		required: "必须填写！"
	});
	 $("form").validate({
		 errorPlacement: function(error, element) {  
			    error.appendTo(element.parent());  
			}
	    });
	 
	 
	 	var editor=new Simditor({
			textarea:$("#body"),
			 upload : {
    	            url : '${pageContext.request.contextPath}/simditorupload', //文件上传的接口地址
    	            fileKey: 'file', //服务器端获取文件数据的参数名
    	            leaveConfirm: '正在上传文件'
    	        } 
		}
		);
	
});
</script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/simditor/module.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/simditor/uploader.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/simditor/hotkeys.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/simditor/simditor.js"></script>
</body>

