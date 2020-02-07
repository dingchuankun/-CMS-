<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>帖子内容</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/material-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/material.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/material.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" />
<style>
.card-width {
	width: 600px;
}

.center {
	margin-right: auto;
	margin-left: auto;
}

.bb {
	background-color: #F5F5F5;
	width: 800px;
	height: 50px;
	border-top: 2px solid #9D9D9D;
	border-right: 0px solid #9D9D9D;
	border-left: 0px solid #9D9D9D;
	border-bottom: 2px solid #9D9D9D;
	padding: 10px;
	margin: 0px 0px 30px 0px;
}
</style>
</head>
<body>
<div class="background">
 	<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<nav class="navbar navbar-default navbar-inverse" role="navigation">
						<div class="navbar-header">

							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						 <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
					</button>
							<a class="navbar-brand" href="${pageContext.request.contextPath}/">首页</a>
						</div>

						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						 
                         
							<ul class="nav navbar-nav navbar-left">
								<li >
									<a href="${pageContext.request.contextPath}/main">论坛专区</a>
								</li>
								
								<li>
									<a href="https://www.taptap.com/">游戏专区</a>
								</li>
								
						    <c:if test="${username == 'admin'}">
								<li class="dropdown">
									<a href="${pageContext.request.contextPath}/admin/manageCenter" >后台管理</a>	
								</li>
							 </c:if>
								
							</ul>
							<form class="navbar-form navbar-left" role="search" action="${pageContext.request.contextPath}/post/search">
								<div class="form-group">
									<input type="text" class="form-control" name="name" placeholder="请输入帖子关键字">
								</div>
								<button type="submit" class="btn btn-default" >搜索</button>
							</form>
							<ul class="nav navbar-nav navbar-right">
								<c:choose>
								<c:when test="${username !=null}">
								<li>
									<a href="${pageContext.request.contextPath}/user/listUserInfo?username=${username}">个人中心</a>
								</li>
								<li class="dropdown">
									<a href="${pageContext.request.contextPath}/user/listUserInfo?username=${username}" class="dropdown-toggle" data-toggle="dropdown">
										你好，${username}</a></li>
								<li class="dropdown">
									<a href="${pageContext.request.contextPath}/user/loginOut" class="dropdown-toggle" data-toggle="dropdown">注销</a>	
								</li>
								</c:when>
							
							<c:when test="${username == null}">
								<li class="dropdown">
									<a href="${pageContext.request.contextPath}/userRegister" class="dropdown-toggle" data-toggle="dropdown">注册</a>
								</li>
								
								<li class="dropdown">
									<a href="${pageContext.request.contextPath}/userLogin" class="dropdown-toggle" data-toggle="dropdown">登录</a>
								</li>
							</c:when>
							</c:choose>
								</ul>
							
					</div>
					
				</div>
				
			</div>
		</div>	

	
	
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="box3"></div>
					<div class="box1">

						<div class="T2">
							<img style="border-radius: 50%;" width="130px" height="130px"
								src="${pageContext.request.contextPath}/${post.user.user_img}">
							<a>
								<p>${post.postUserName}</p>
							</a>
						</div>
						<div class="T3">
							<div class="T4">
								<h2>${post.postTitle}</h2>
							</div>
							${post.postContent}

						</div>
						<div class="T5">
							<span id="dianzanshu">${post.postGoodCount}</span> <a id="dianzan2" name="${post.postId}" style="height: 50px"><img src="${pageContext.request.contextPath}/resources/img/game/点赞.png"></a>&nbsp;&nbsp;&nbsp; <a
								class="mdl-button mdl-js-button mdl-color--pink-400 mdl-color-text--white"
								href="${pageContext.request.contextPath}/addReply?replyPostId=${post.postId}&replyUserName=${username}">
								回复 </a>
						</div>



						<c:choose>
							<c:when test="${replies != null}">
								<c:forEach items="${replies}" var="reply">
									<div class="T6">
										<img style="border-radius: 50%;" width="130px" height="130px"
											src="${pageContext.request.contextPath}/${reply.user_img}">
										<a>
											<p>${reply.replyUserName}</p>
										</a>
									</div>
									<div class="T7">${reply.replyContent}</div>
									<div class="T5">
										<span class="">${reply.replyGoodCount}</span> <a class="dianzan" name="${reply.replyId}"><img src="${pageContext.request.contextPath}/resources/img/game/点赞.png"></a>&nbsp;&nbsp;&nbsp;
										<c:if test="${username == reply.replyUserName or username == 'admin'}">

											<a class="mdl-button mdl-js-button mdl-color-text--pink-400"
												href="${pageContext.request.contextPath}/admin/deleteReply?replyId=${reply.replyId}&replyPostId=${reply.replyPostId}">
												删除 </a>&nbsp;&nbsp;&nbsp;		
										</c:if>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>

					</div>



				</div>
			</div>
		</div>

	


	<%-- 	<a
											class="mdl-button mdl-js-button mdl-color--pink-400 mdl-color-text--white"
											href="${pageContext.request.contextPath}/addReply?replyPostId=${post.postId}&replyUserName=${username}">
											立即回复 </a> --%>
<script type="text/javascript">
$(function() {
	$('.dianzan').each(
		function() {
			$(this).click(
				function() {
					var id = $(this).attr("name");
					var dianzan=$(this).prev();
					var dianzanshu=dianzan.html();
					var username="<%=session.getAttribute("username")%>"; 
					console.log("点赞执行"+username)
					if(username=="null"||username==""){
						alert("请登录后，再点赞");
					}else{
						$.get("${pageContext.request.contextPath}/reply/replydianzan?replyid="+id,
								function(data) {
									console.log(data)
									dianzan.html(data.reply.replyGoodCount);
								});
					}
				});
		});
	$('#dianzan2').click(function() {
						var id = $(this).attr("name");
						var dianzan=$(this).prev();
						var username="<%=session.getAttribute("username")%>"; 
						console.log("点赞执行"+username);
						var dianzanshu=dianzan.html()
						if(username=="null"||username==""){
							alert("请登录后，再点赞");
						}else{
							$.get("${pageContext.request.contextPath}/post/dianzan?postid="+id,
									function(data) {
										console.log(data.post.postGoodCount)
										dianzan.html(data.post.postGoodCount);
									});
						}			
			});
});
</script>
</body>
</html>