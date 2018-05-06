<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div class="wrapper wrapper-content animated fadeInRight">
       <div class="row">
            <div class="col-sm-12">
                <div class="ibox ">
                 
      		 	<div class="ibox-content">
 		 			<div class="row">
                            <div class="col-sm-12 b-r">
                            <form class="form-horizontal" action="" method="get">
		                           <input name='id' type="hidden"/>
		                           	<table class='table table-bordered'>
		                           		<thead>
		                           		<tr style="text-align: center;" ><td colspan="6" ><h3>个人信息<h3></h3></td></tr>
		                           		</thead>
		                           		<tbody>
		                           			<tr>
		                           				<td>姓名</td>
		                           				<td> <input value="${user.chinesename }" name='chinesename' type="text" class="form-control"> </td>
		                           			</tr>
		                           			
		                           			<tr>
		                           			<td>性别</td>
		                           				<td>
												  <input value="${user.sex }" name='chinesename' type="text" class="form-control">
		                           				</td>
		                           			</tr>
		                           			
		                           				
		                           			<tr>
		                           				<td>手机号码</td>
		                           				<td>  <input value="${user.username }" name='chinesename' type="text" class="form-control"> </td>
		                           			</tr>
		                           			
		                           			<tr>
		                           				<td>学号</td>
		                           				<td> <input value="${user.tel }" name='chinesename' type="text" class="form-control"> </td>
		                           			</tr>
		                           			
		                           			
		                           			<tr>
		                           				<td>email</td>
		                           				<td>  <input value="${user.email }" name='chinesename' type="text" class="form-control"> </td>
		                           			</tr>
		                           			
											<tr>
												<td>备注</td>
		                           				<td> <input value="${user.remark }" name='chinesename' type="text" class="form-control"> </td>
		                           			</tr>
		                           			
		                           			
		                           			<tr>
												<td>密码</td>
		                           				<td> <input value="${user.password }" name='password' type="password" class="form-control"> </td>
		                           			</tr>
		                           			
		                           		
		                           			
		                           		</tbody>
		                           	</table>
		                           	<button class="btn btn-primary text-center " onclick="fun_submit()" type="button"><i class="fa fa-check"></i>&nbsp;提交修改</button>
		                           	</form>
                            </div>
                        </div>
                        </div>
                    
                </div>
            </div>
        </div>
   </div>
   <script>
   	function fun_submit(){
   		toastr.success('修改成功！');
   	}
   </script>
 </body>
</html>
