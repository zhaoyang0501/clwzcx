<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - 首页示例四</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.staticfile.org/font-awesome/4.4.0/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://www.zi-han.net/theme/hplus/css/style.min.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg top-navigation">
<div class="wrapper wrapper-content  animated fadeInRight article">
    <div class="row">
        <div class="col-lg-10 col-lg-offset-1">
            <div class="ibox">
                <div class="ibox-content">

                    <div class="row">
                        <div class="col-lg-12">

                            <h2>幼儿园论坛（欢迎发表意见）</h2>
                            
                            <c:forEach items="${msgs }"  var="bean">
                            
                            
                            <div class="social-feed-box">
                                <div class="social-avatar">
                                    <a href="" class="pull-left">
	                                        <img alt="image" src="http://ozwpnu2pa.bkt.clouddn.com/a1.jpg">
	                                    </a>
	                                    <div class="media-body">
	                                        <a href="#">
	                                           ${bean.user.chinesename }
	                                        </a>
	                                        <small class="text-muted">${bean.msgDate }</small>
	                                    </div>
	                                </div>
	                                <div class="social-body">
	                                    <p>${bean.msg }</p>
	                                </div>
	                            </div>
                            </c:forEach>
                        </div>
                        
                        <div class='col-lg-12' style="padding-top: 30px">
                        
			                        	
								<form class="form-horizontal" action="/sys/msg/savemsg" method="post">
										  <div class="form-group">
										    <label for="inputEmail3" class="col-sm-2 control-label">内容</label>
										    <div class="col-sm-10">
										      <textarea name='msg' class="form-control" rows="3"></textarea>
										    </div>
										  </div>
									  
									 
										  <div class="form-group">
										    <div class="col-sm-offset-2 col-sm-10">
										      <button type="submit" class="btn btn-default">提交</button>
										    </div>
										  </div>
								</form>
                        </div>
                    </div>
					
					
					
					
                </div>
            </div>
        </div>
    </div>

</div>
<script >
<c:if test="${tip!=null }">toastr.success('意见发表成功，我们将会认真处理！');</c:if>
</script>
<script src="https://cdn.staticfile.org/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</body>

</html>
