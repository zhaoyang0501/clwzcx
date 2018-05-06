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
						<h5>文件下载</h5>
						<div class="ibox-tools"></div>
					</div>

					<div class="ibox-content">
						<form role="form" class="form-inline">
							<div class="form-group">
								<label for="exampleInputEmail2" class="sr-only">文件名称</label> <input
									type="text" placeholder="名称" id="_name" class="form-control">
							</div>
							<button class="btn btn-primary" type="button" id='_search'>查询</button>
						</form>
					</div>

					<div class="ibox-content ">
						<table ID='dt_table_view'
							class="table table-striped table-bordered table-hover ">
							<thead>
								<tr>
									<th>上传人</th>
									<th>上传时间</th>
									<th>下载次数</th>
									<th>文件名</th>
								</tr>
							</thead>
							<tbody>
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
	<script>
    var table=null;
    
    function submit_form(){
    	$.ajax({
    		   type: "POST",
    		   url:  $.common.getContextPath() + "/sys/action/save",
    		   data: $("form").serialize(),
    		   success: function(msg){
    		     if(msg.code==1){
    		    	 toastr.success('操作成功');
    		    	 table.draw();
    		     }
    		     layer.closeAll() ;
    		   }
    		});
     }
    
    function fun_delete(id){
    	layer.confirm('确定删除当前文件？', {
    		  btn: ['确定','取消'] //按钮
    		}, function(){
    			$.ajax({
    		 		   url:  $.common.getContextPath() + "/sys/file/delete?id="+id,
    		 		   success: function(msg){
    		 		     if(msg.code==1){
    		 		    	 toastr.success('操作成功');
    		 		    	 table.draw();
    		 		     }
    		 		     layer.closeAll() ;
    		 		   }
    		 	});
    		}, function(){
    			 layer.closeAll() ;
    		});
     }
    
    function fun_update(id){
    	$.ajax({
 		   url:  $.common.getContextPath() + "/sys/food/get?id="+id,
 		   success: function(msg){
 		     if(msg.code==1){
 		    	$("input[name='id']").val(msg.datas.id);
 		    	$("input[name='name']").val(msg.datas.name);
 		    	$("input[name='code']").val(msg.datas.code);
 		    	$("input[name='standard']").val(msg.datas.standard);
 		    	$("input[name='batchNo']").val(msg.datas.batchNo);
 		    	$("input[name='num']").val(msg.datas.num);
 		    	$("input[name='seat']").val(msg.datas.seat);
 		    	$("input[name='useNum']").val(msg.datas.useNum);
 				$("textarea[name='remark']").val(msg.datas.remark);
 				  $("#thelist").empty();
        		layer.open({
        			  type: 1,
        			  skin: 'layui-layer-rim', //加上边框
        			  content: $("#_form"),
        			  area: "800px"
        			});
        		$("#_form").css("margin-top","0px");
 		     }
 		   }
 		});
     }
    $(document).ready(function(){
    	
    	////仓库编码	仓库名称	存货编码	规格型号	批号	现存数量	到货在检数量	调拨在途数量	预计入库数量合计	待发货数量	调拨待发数量	可用数量

        	$("#_new").click(function(){
        		$("input[name='id']").val("");
 		    	$("input[name='name']").val("");
 		    	$("radio[name='sex']").val("");
 		   		$("input[name='price']").val("");
 		   		$("input[name='seat']").val("");
 				$("textarea[name='remark']").val("");
        		layer.open({
        			  type: 1,
        			  skin: 'layui-layer-rim', //加上边框
        			  content: $("#_form"),
        			  area: "800px"
        			});
        		$("#_form").css("margin-top","0px");
        	});
        	table=$('#dt_table_view').DataTable( {
        		"dom": "rt<'row'<'col-sm-5'i><'col-sm-7'p>>",
        		"deferLoading": 57,
	            "ajax": {
	                "url":  $.common.getContextPath() + "/sys/file/list",
	                "type": "POST",
	                "async":false,
	                "dataSrc": "datas"
	              },
	          
				"columns" : [{
					"data" : "user.chinesename"
				}, {
					"data" : "createDate"
				}, {
					"data" : "num"
				}, {
					"data" : "name"
				}] ,
				 "columnDefs": [
								 {
					                    "render": function ( data, type, row ) {
					                        return "<a tager='_blank' href='/sys/file/download?path="+row.path+"&id="+row.id+"' >"+data+" </a>";
					                    },
					                    "targets":3
					                }
				               
				            ],
        		"initComplete": function () {
        			var api = this.api();
        			$("#_search").on("click", function(){
            		 	api.draw();
        			} );
        		} 
        	 } ).on('preXhr.dt', function ( e, settings, data ) {
		        	data.value = $("#_name").val();
		        	data.columnname = 'name';
		        	return true;
		     } ).on('xhr.dt', function ( e, settings, json, xhr ) {
		    		 $(".dataTables_processing").hide();
		     } )
        });
    
    </script>
<script src="${pageContext.request.contextPath}/js/JsBarcode.all.js "></script>
</body>
</html>
