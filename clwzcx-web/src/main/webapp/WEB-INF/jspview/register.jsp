<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="aw-container-wrap">
	<div class="container">
		<div class="row">
			<div class="aw-content-wrap clearfix">
				<div class="aw-user-setting">
					<div class="tabbable">
						<ul class="nav nav-tabs aw-nav-tabs active">
							<h2><i class="icon icon-setting"></i>注册用户</h2>
						</ul>
					</div>
					
					<div class="tab-content clearfix" style="margin-left: 200px">
					<form class="form-horizontal" action="${pageContext.request.contextPath}/doregister" method="post" >
<div class="aw-mod">
	<div class="mod-body">
		<div class="aw-mod aw-user-setting-bind">
			<div class="mod-head">
			</div>
				<div class="mod-body">
					<div class="form-group">
						<label class="control-label" for="input-password-old">用户名/身份证号码</label>
						<div class="row">
							<div class="col-lg-4">
								<input type="text" class="form-control" id="input-password-old" name="username">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label" for="input-password-old">姓名</label>
						<div class="row">
							<div class="col-lg-4">
								<input type="text" class="form-control" id="input-password-old" name="chinesename">
							</div>
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="control-label" for="input-password-old">手机号码</label>
						<div class="row">
							<div class="col-lg-4">
								<input type="text" class="form-control" id="input-password-old" name="tel">
							</div>
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="control-label" for="input-password-new">密码</label>
						<div class="row">
							<div class="col-lg-4">
							    <input type="password" class="form-control" id="input-password-new" name="password">
							</div>
						</div>
					</div> 
					  
					
					<div class="form-group">
						<label class="control-label" for="input-password-new">性别</label>
						<div class="row">
							<div class="col-lg-4">
							    <select name="level" class="form-control">
							    	<option value="男">男</option>
							    	<option value="女">女</option>
							    </select>
							</div>
						</div>
					</div> 
					
					  
					 
				</div>
			
		</div>
	</div>
	<div class="mod-footer clearfix">
	<button type="submit" class="btn btn-large btn-success pull-left" >保存</button>
	</div>
</div>

</form>


					</div>
				</div>
			</div>
		</div>
	</div>
</div>
