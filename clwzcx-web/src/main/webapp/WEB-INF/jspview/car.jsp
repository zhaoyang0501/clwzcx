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
						<h2 class="hidden-xs"><i class="icon icon-ask"></i> 我的车辆</h2>
					</ul>

					<div class="aw-mod aw-mod-publish">
						<div class="mod-body">
						<a class="text-right" href="/addcar">新增车辆</a>
							<h3>我的车辆:</h3>
							<div>
								<table class="table">
										<thead>
											<tr>
												<th>品牌</th>
												<th>型号</th>
												<th>车牌号码</th>
												<th>车主身份证</th>
												<th>发动机号码</th>
												<th>购买日期</th>
												<th>状态</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach  items="${cars}" var="bean">
											<tr>
												<TD>${bean.brand }</TD>
												<TD>${bean.enginenum }</TD>
												<TD>${bean.platenum }</TD>
												<TD>${bean.idcard }</TD>
												<TD>${bean.enginenum }</TD>
												<TD>${bean.buydate }</TD>
												<TD>${bean.state }</TD>
												<TD> <a href="./dropcar?carid=${bean.id }">作废</a>  </TD>
											</tr>
											</c:forEach>
										</tbody>
										</table>
							</div>
						</div>
					</div>
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

