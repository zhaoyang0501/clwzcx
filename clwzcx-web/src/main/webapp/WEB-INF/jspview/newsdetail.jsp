<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body class="home-template">
		<div class="row">
			<div class="aw-content-wrap clearfix">
				<div class="col-sm-12 col-md-9 aw-main-content">
					
					<div class="aw-mod aw-topic-bar" id="question_topic_editor" data-type="question" data-id="208">
						<div class="tag-bar clearfix">
						</div>
					</div>
					<!-- end 话题bar -->
					<div class="aw-mod aw-question-detail aw-item">
						
						<div class="mod-head">
							<h1>${bbs.title }</h1>
						</div>
						
						<div class="mod-body">
							<div class="content markitup-box">
								${bbs.body }
							</div>
						</div>
						
						<div class="mod-footer">
							<div class="meta">
								<span class="text-color-999">
									<fmt:formatDate value="${bbs.createDate }" pattern="yyyy年MM月dd日"/>
								</span>
								<div class="pull-right more-operate">
									<a href="javascript:;" class="text-color-999" onclick="#"><i class="icon icon-report"></i></a>								</div>
								</div>
						</div>
					</div>

						
						<div class="aw-mod aw-question-comment">
						
							
							<div class="mod-footer">

								<div class="hide aw-feed-list" id="uninterested_answers_list"></div>
													</div>

											</div>
										<!-- end 问题详细模块 -->

										<!-- 回复编辑器 -->
										<div class="aw-mod aw-replay-box question">
										
										<c:if test="${sessionScope.user!=null }">	
												<form action="${pageContext.request.contextPath}/comment/${bbs.id}"  method="post" id="answer_form" class="question_answer_form">
													<div class="mod-body">
														<div class="aw-mod aw-editor-box">
															<div class="mod-head">
																<div class="wmd-panel">
														            <textarea class="wmd-input form-control autosize" id="wmd-input" rows="4" name="body" style="overflow: hidden; word-wrap: break-word; resize: none; "></textarea>
														        </div>
															</div>
															
															<div class="mod-body clearfix">
																<button type="submit" class="btn btn-normal btn-success pull-right btn-reply">回帖</button>
																<span class="pull-right text-color-999" id="answer_content_message">&nbsp;</span>
															</div>
															
															<div class="mod-footer">
																<div id="wmd-preview" class="wmd-panel wmd-preview" style="display: none;"></div>
															</div>
														</div>
													</div>
												</form>
												</c:if>
										</div>
					<!-- end 回复编辑器 -->
				</div>
				<!-- 侧边栏 -->
				<div class="col-md-3 aw-side-bar hidden-xs hidden-sm">
					<!-- 发起人 -->
						<div class="aw-mod">
							<div class="mod-head">
								<h3>发起人</h3>
							</div>
							
							<div class="mod-body">
							<dl>
								<dt class="pull-left aw-border-radius-5">
									<a href="#"><img alt="石古子" src="http://wenda.ghostchina.com/uploads/avatar/000/00/04/57_avatar_mid.jpg"></a>
								</dt>
								<dd class="pull-left">
									<a class="aw-user-name" href="#" data-id="1321">${bbs.user.chinesename }</a>
																		<p></p>
								</dd>
							</dl>
						</div>
					</div>
					
					<!-- 问题状态 -->
					<div class="aw-mod question-status">
						<div class="mod-head">
							<h3>帖子状态</h3>
						</div>
						<div class="mod-body">
							<ul>
								<li>最新活动: <span class="aw-text-color-blue"><fmt:formatDate value="${bbs.createDate }" pattern="yyyy年MM月dd日HH:mm"/></span></li>
								<li>浏览: <span class="aw-text-color-blue">${bbs.click }</span></li>
						</ul>
						</div>
					</div>
					<!-- end 问题状态 -->
				</div>
				<!-- end 侧边栏 -->
			</div>
		</div>
</body>

