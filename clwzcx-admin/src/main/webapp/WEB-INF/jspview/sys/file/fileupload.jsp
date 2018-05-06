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
                            <form enctype="multipart/form-data" class="form-horizontal" action="/sys/file/doupload" method="post">
		                           <input name='id' type="hidden"/>
		                           	<table class='table table-bordered'>
		                           		<thead>
		                           		<tr style="text-align: center;" ><td colspan="6" ><h3>公文上传<h3></h3></td></tr>
		                           		</thead>
		                           		<tbody>
		                           			<tr>
		                           				<td>选择公文</td>
		                           				<td> <input name='file' value="${user.chinesename }" name='chinesename' type="file" class="form-control"> </td>
		                           			</tr>
		                           			
											<tr>
												<td>备注</td>
		                           				<td> <textarea name='remark' class="form-control"  rows="4" cols=""></textarea> </td>
		                           			</tr>
		                           			
		                           			
		                           			<tr>
		                           				<td>提示</td>
		                           				<td > 
		                           					 <h4>提示</h4>
		                               					 <ol>
									    					<li>只允许上传word，pdf文件</li>
									    				</ol>
		                           				</td>
		                           			</tr>
		                           			
		                           		</tbody>
		                           	</table>
		                           		<button class="btn btn-primary text-center " type="submit"><i class="fa fa-check"></i>&nbsp;立即上传</button>
		                           	</form>
                            </div>
                        </div>
                        </div>
                    
                </div>
            </div>
        </div>
   </div>
   <script >
<c:if test="${tip!=null }">toastr.success('文件上传成功！');</c:if>
</script>
 </body>
</html>
