<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row">
            <div class="aw-content-wrap clearfix">
                <div class="col-sm-12 col-md-9 aw-main-content">
                    <!-- 用户数据内容 -->
                    <div class="aw-mod aw-user-detail-box" style="padding: 50px;">
                        <div class="mod-body">
                            
                            <div style="margin-left: 50px" >
                            <form  action="${pageContext.request.contextPath}/addcar" method="post" >
										<div class="aw-mod">
											<div class="mod-body">
												<div class="aw-mod aw-user-setting-bind">
													<div class="">
													</div>
														<div class="mod-body">
															
															
															<div class="form-group">
																<label class="control-label" for="input-password-old">品牌</label>
																<div class="row">
																	<div class="col-lg-4">
																		<input type="text" value="" class="form-control" id="input-password-old" name="brand">
																	</div>
																</div>
															</div>
															
															
															<div class="form-group">
																<label class="control-label" for="input-password-old">型号</label>
																<div class="row">
																	<div class="col-lg-4">
																		<input type="text" value="" class="form-control" id="input-password-old" name="models">
																	</div>
																</div>
															</div>
															
															
															<div class="form-group">
																<label class="control-label" for="input-password-old">车牌号码</label>
																<div class="row">
																	<div class="col-lg-4">
																		<input type="text" value="" class="form-control" id="input-password-old" name="platenum">
																	</div>
																</div>
															</div>
															
															
															<div class="form-group">
																<label class="control-label" for="input-password-new">车主身份证</label>
																<div class="row">
																	<div class="col-lg-4">
																	    <input type="text" value="" class="form-control" id="idcard" name="idcard">
																	</div>
																</div>
															</div> 
															 <div class="form-group">
																<label class="control-label" for="input-password-new">发动机号码</label>
																<div class="row">
																	<div class="col-lg-4">
																	    <input type="text" value="" class="form-control" id="enginenum" name="enginenum">
																	</div>
																</div>
															</div>  
															<div class="form-group">
																<label class="control-label" for="input-password-new">购买日期</label>
																<div class="row">
																	<div class="col-lg-4">
																	    <input type="text" value="" class="form-control" id="buydate" name="buydate">
																	</div>
																</div>
															</div>  
														
															  
															 
														</div>
													
												</div>
											</div>
											<div class="mod-footer clearfix">
											<button type="submit" class="btn btn-large btn-success pull-left" >提交</button>
											</div>
										</div>
										</form>
</div>

                        </div>
                    </div>
                  
                </div>

                <!-- 侧边栏 -->
                <div class="col-sm-12 col-md-3 aw-side-bar">
                   
                </div>
                <!-- end 侧边栏 -->
            </div>
        </div>
</body>

