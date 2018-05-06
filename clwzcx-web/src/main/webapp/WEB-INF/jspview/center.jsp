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
                        <div class="mod-head">
                            <img src="http://wenda.ghostchina.com/uploads/avatar/000/00/13/34_avatar_max.jpg" alt="朝阳">
                            <span class="pull-right operate">
                                                            </span>
                            <h1>${user.chinesename } </h1>
                            <p class="text-color-999"></p>
                            <p class="aw-user-flag">
                                                                                                                            </p>
                        </div>
                        <div class="mod-body">
                            
                            <div style="margin-left: 50px" >
                            <form  action="${pageContext.request.contextPath}/updateuser" method="post" >
										<div class="aw-mod">
											<div class="mod-body">
												<div class="aw-mod aw-user-setting-bind">
													<div class="">
													</div>
														<div class="mod-body">
															<div class="form-group">
																<label class="control-label" for="input-password-old">用户名/身份证号码</label>
																<div class="row">
																	<div class="col-lg-4">
																		<input type="text" value="${sessionScope.user.username }" class="form-control" id="input-password-old" name="username">
																	</div>
																</div>
															</div>
															<div class="form-group">
																<label class="control-label" for="input-password-old">姓名</label>
																<div class="row">
																	<div class="col-lg-4">
																		<input type="text" value="${sessionScope.user.chinesename }" class="form-control" id="input-password-old" name="chinesename">
																	</div>
																</div>
															</div>
															
															
															<div class="form-group">
																<label class="control-label" for="input-password-old">手机号码</label>
																<div class="row">
																	<div class="col-lg-4">
																		<input type="text" value="${sessionScope.user.tel }" class="form-control" id="input-password-old" name="tel">
																	</div>
																</div>
															</div>
															
															
															<div class="form-group">
																<label class="control-label" for="input-password-new">密码</label>
																<div class="row">
																	<div class="col-lg-4">
																	    <input type="password" value="${sessionScope.user.password }" class="form-control" id="input-password-new" name="password">
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
											<button type="submit" class="btn btn-large btn-success pull-left" >修改</button>
											</div>
										</div>
										</form>
</div>

                        </div>
                    </div>
                  
                </div>

                <!-- 侧边栏 -->
                <div class="col-sm-12 col-md-3 aw-side-bar">
                    <div class="aw-mod people-following">
                        <div class="mod-body">
                            <a onclick="$('#page_focus').click();$('#focus .aw-tabs ul li').eq(0).click();$.scrollTo($('#focus').offset()['top'], 600, {queue:true})" class="pull-right font-size-12">更多 »</a>
                            <span>
                                关注 <em class="aw-text-color-blue">0</em> 人                            </span>
                                                    </div>
                    </div>
                    <div class="aw-mod people-following">
                        <div class="mod-body">
                            <a onclick="$('#page_focus').click();$('#focus .aw-tabs ul li').eq(1).click();$.scrollTo($('#focus').offset()['top'], 600, {queue:true})" class="pull-right font-size-12">更多 »</a>
                            <span>
                                被 <em class="aw-text-color-blue">0</em> 人关注                            </span>

                                                    </div>
                        
                    </div>
                    <div class="aw-mod people-following">
                        <div class="mod-body">
                            关注 <em class="aw-text-color-blue">0</em> 话题                                                    </div>
                    </div>
                    <div class="aw-mod">
                        <div class="mod-body">
                            <span class="aw-text-color-666">
                                主页访问量 : 13 次访问                            </span>
                        </div>
                    </div>
                </div>
                <!-- end 侧边栏 -->
            </div>
        </div>
</body>

