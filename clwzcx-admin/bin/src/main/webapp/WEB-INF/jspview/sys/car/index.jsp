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
						<h5>车辆管理</h5>
						<div class="ibox-tools"></div>
					</div>

					<div class="ibox-content">
						<form role="form" class="form-inline">
							<div class="form-group">
								<label for="exampleInputEmail2" class="sr-only">车辆管理</label> <input
									type="text" placeholder="车牌号" id="_name" class="form-control">
							</div>
							<button class="btn btn-primary" type="button" id='_search'>查询</button>
							<button class="btn btn-primary" type="button" id='_new'>新建</button>
						</form>
					</div>

					<div class="ibox-content ">
						<table ID='dt_table_view'
							class="table table-striped table-bordered table-hover ">
							<thead>
								<tr>
									<th>品牌</th>
									<th>型号</th>
									<th>车牌号码</th>
									<th>车主身份证</th>
									<th>发动机号码</th>
									<th>购买日期</th>
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
									<td colspan="6"><h3>班级信息</h3></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>品牌</td>
									<td><input name='brand' type="text" class="form-control"></td>
								</tr>
								
								<tr>
									<td>型号</td>
									<td><input name='models' type="text" class="form-control"></td>
								</tr>
								
								<tr>
									<td>车牌号码</td>
									<td><input name='platenum' type="text" class="form-control"></td>
								</tr>
								
								<tr>
									<td>车主身份证</td>
									<td><input name='idcard' type="text" class="form-control"></td>
								</tr>
								
								
								<tr>
									<td>发动机号码</td>
									<td><input name='enginenum' type="text" class="form-control"></td>
								</tr>
								
									<tr>
									<td>购买日期</td>
									<td><input name='buydate' type="text" class="form-control"></td>
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
    		   url:  $.common.getContextPath() + "/sys/car/save",
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
    	layer.confirm('确定删除当前车辆？', {
    		  btn: ['确定','取消'] //按钮
    		}, function(){
    			$.ajax({
    		 		   url:  $.common.getContextPath() + "/sys/car/delete?id="+id,
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
 		   url:  $.common.getContextPath() + "/sys/car/get?id="+id,
 		   success: function(msg){
 		     if(msg.code==1){
 		    	$("input[name='id']").val(msg.datas.id);
 		    	$("input[name='brand']").val(msg.datas.brand);
 		    	$("input[name='buydate']").val(msg.datas.buydate);
 		    	$("input[name='enginenum']").val(msg.datas.enginenum);
 		    	$("input[name='idcard']").val(msg.datas.idcard);
 		    	$("input[name='models']").val(msg.datas.models);
 		    	$("input[name='platenum']").val(msg.datas.platenum);
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
	                "url":  $.common.getContextPath() + "/sys/car/list",
	                "type": "POST",
	                "async":false,
	                "dataSrc": "datas"
	              },
					
				"columns" : [{
					"data" : "brand"
				}, {
					"data" : "models"
				}, {
					"data" : "platenum"
				}, {
					"data" : "idcard"
				}, {
					"data" : "enginenum"
				}, {
					"data" : "buydate"
				},{
					"data" : "id",
				}] ,
				 "columnDefs": [
								 {
					                    "render": function ( data, type, row ) {
					                        return "<span class='label-primary'>"+data+"</span>";
					                    },
					                    "targets":2
					                },
				                {
				                    "render": function ( data, type, row ) {
				                        return "<a tager='_blank' href='javascript:void(0)' onclick='fun_delete("+data+")'>删除 </a>"+
				                        "<a tager='_blank' href='javascript:void(0)' onclick='fun_update("+data+")'>编辑 </a>";
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
		        	data.columnname = 'brand';
		        	return true;
		     } ).on('xhr.dt', function ( e, settings, json, xhr ) {
		    		 $(".dataTables_processing").hide();
		     } )
        });
    
    </script>
<script src="${pageContext.request.contextPath}/js/JsBarcode.all.js "></script>
</body>
</html>
