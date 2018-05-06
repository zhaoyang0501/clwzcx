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
						<h5>违章管理</h5>
						<div class="ibox-tools"></div>
					</div>

					<div class="ibox-content">
						<form role="form" class="form-inline">
							<div class="form-group">
								<label for="exampleInputEmail2" class="sr-only">违章管理</label> <input
									type="text" placeholder="发动机号码" id="_name" class="form-control">
							</div>
							<button class="btn btn-primary" type="button" id='_search'>查询</button>
							<button class="btn btn-primary" type="button" id='_new'>违章录入</button>
						</form>
					</div>

					<div class="ibox-content ">
						<table ID='dt_table_view'
							class="table table-striped table-bordered table-hover ">
							<thead>
								<tr>
									<th>发动机号码</th>
									<th>违章类型</th>
									<th>罚款</th>
									<th>详情</th>
									<th>处理状态</th>
									<th>处理日期</th>
									<th>操作</th>
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
									<td colspan="6"><h3>违章单</h3></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>发动机号码</td>
									<td><input name='enginenum' type="text" class="form-control"></td>
								</tr>
								
								<tr>
									<td>违章类型</td>
									<td>
										<select class="form-control" name='type'>
											<option value="机动车不按规定停放">机动车不按规定停放</option>
											<option value="违反交通信号指示的">违反交通信号指示的</option>
											<option value="不按规定掉头的">不按规定掉头的</option>
											<option value="不按规定安装车辆号牌的">不按规定安装车辆号牌的</option>
												<option value="其他">其他</option>
										</select>
									</td>
								</tr>
								
								<tr>
									<td>罚款</td>
									<td><input name='cash' type="text" class="form-control"></td>
								</tr>
								
								<tr>
									<td>违法日期</td>
									<td><input name='pecdate' type="text" class="form-control"></td>
								</tr>
								
								<tr>
									<td>违法详情</td>
									<td><input name='remark' type="text" class="form-control"></td>
								</tr>
								
								<tr>
									<td>处理日期</td>
									<td><input name='dealdate' type="text" class="form-control"></td>
								</tr>
								
								
								<tr>
									<td>处理状态</td>
									<td>
									<select class="form-control" name='state'>
											<option value="未处理">未处理</option>
											<option value="已处理">已处理</option>
										</select>
									</td>
								</tr>
								
								
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
    		   url:  $.common.getContextPath() + "/sys/peccancy/save",
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
    	layer.confirm('确定删除当前违章？', {
    		  btn: ['确定','取消'] //按钮
    		}, function(){
    			$.ajax({
    		 		   url:  $.common.getContextPath() + "/sys/peccancy/delete?id="+id,
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
 		   url:  $.common.getContextPath() + "/sys/peccancy/get?id="+id,
 		   success: function(msg){
 		     if(msg.code==1){
 		    	$("input[name='cash']").val(msg.datas.cash);
 		    	$("input[name='id']").val(msg.datas.id);
 		    	$("input[name='dealdate']").val(msg.datas.dealdate);
 		    	$("input[name='enginenum']").val(msg.datas.enginenum);
 		    	$("input[name='pecdate']").val(msg.datas.pecdate);
 		    	$("select[name='state']").val(msg.datas.state);
 		    	$("select[name='type']").val(msg.datas.type);
 		    	$("select[name='remark']").val(msg.datas.remark);
        		layer.open({
        			  type: 1,
        			  skin: 'layui-layer-rim', //加上边框
        			  content: $("#_form"),
        			  area: "600px"
        			});
        		$("#_form").css("margin-top","0px");
 		     }
 		   }
 		});
     }
    $(document).ready(function(){
    	
    	////仓库编码	仓库名称	存货编码	规格型号	批号	现存数量	到货在检数量	调拨在途数量	预计入库数量合计	待发货数量	调拨待发数量	可用数量

        	$("#_new").click(function(){
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
	                "url":  $.common.getContextPath() + "/sys/peccancy/list",
	                "type": "POST",
	                "async":false,
	                "dataSrc": "datas"
	              },
	             
				"columns" : [{
					"data" : "enginenum"
				}, {
					"data" : "type"
				}, {
					"data" : "cash"
				}, {
					"data" : "remark"
				}, {
					"data" : "state"
				}, {
					"data" : "dealdate"
				},{
					"data" : "id",
				}] ,
				 "columnDefs": [
								 {
					                    "render": function ( data, type, row ) {
					                        return "<span class='label-primary'>"+data+"</span>";
					                    },
					                    "targets":4
					                },
				                {
				                    "render": function ( data, type, row ) {
				                        return "<a tager='_blank' href='javascript:void(0)' onclick='fun_delete("+data+")'>删除 </a>"+
				                        "<a tager='_blank' href='javascript:void(0)' onclick='fun_update("+data+")'>处理</a>";
				                    },
				                    "targets":6
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
		        	data.columnname = 'enginenum';
		        	return true;
		     } ).on('xhr.dt', function ( e, settings, json, xhr ) {
		    		 $(".dataTables_processing").hide();
		     } )
        });
    
    </script>
<script src="${pageContext.request.contextPath}/js/JsBarcode.all.js "></script>
</body>
</html>
