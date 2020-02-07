<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>版块内容</title>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/material-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/material.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/material.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
<style>
.cc {
	background-color: #F5F5F5;
	width: 800px;
	height: 80px;
	border-top: 2px solid #9D9D9D;
	border-right: 0px solid #9D9D9D;
	border-left: 0px solid #9D9D9D;
	border-bottom: 2px solid #9D9D9D;
	padding: 10px;
	margin: 0px 0px 50px 0px;
}

.dd {
	float: left;
	width: 1300px;
	height: 420px;
	background-color: rgba(0, 0, 0, 0.87);
	margin-left: 150px;
	margin-top: 30px;
	border-radius: 5px 0 0;
	padding: 10px;
	font-size: 35px;
	color: white;
}

.bb {
	background-color: #F5F5F5;
	width: 1000px;
	height: 150px;
	border-top: 2px solid #9D9D9D;
	border-right: 0px solid #9D9D9D;
	border-left: 0px solid #9D9D9D;
	border-bottom: 2px solid #9D9D9D;
	padding: 10px;
	margin: 0px 0px 0px 0px;
}

.aa {
	background-color: #F5F5F5;
	width: 980px;
	height: 80px;
	border-top: 2px solid #9D9D9D;
	border-right: 0px solid #9D9D9D;
	border-left: 0px solid #9D9D9D;
	border-bottom: 0px solid #9D9D9D;
	padding: 10px;
	margin: 10px 0px 0px 0px;
}

.card-width {
	width: 600px;
}

.clear-height {
	min-height: auto;
}

.center {
	margin-left: auto;
	margin-right: auto;
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

							<button type="button" class="navbar-toggle"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1">
								<span class="sr-only">Toggle navigation</span><span
									class="icon-bar"></span><span class="icon-bar"></span><span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand"
								href="${pageContext.request.contextPath}/">首页</a>
						</div>

						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">


							<ul class="nav navbar-nav navbar-left">
								<li><a href="${pageContext.request.contextPath}/main">论坛专区</a>
								</li>

								<li><a href="https://www.taptap.com">游戏专区</a></li>

								<c:if test="${username == 'admin'}">
									<li class="dropdown"><a
										href="${pageContext.request.contextPath}/admin/manageCenter">后台管理</a>
									</li>
								</c:if>

							</ul>
							<form class="navbar-form navbar-left" role="search"
								action="${pageContext.request.contextPath}/post/search">
								<div class="form-group">
									<input type="text" class="form-control" name="name"
										placeholder="请输入帖子关键字">
								</div>
								<button type="submit" class="btn btn-default">搜索</button>
							</form>
							<ul class="nav navbar-nav navbar-right">
								<c:choose>
									<c:when test="${username !=null}">
										<li><a
											href="${pageContext.request.contextPath}/user/listUserInfo?username=${username}">个人中心</a>
										</li>
										<li class="dropdown"><a
											href="${pageContext.request.contextPath}/user/listUserInfo?username=${username}"
											class="dropdown-toggle" data-toggle="dropdown">
												你好，${username}</a></li>
										<li class="dropdown"><a
											href="${pageContext.request.contextPath}/user/loginOut"
											class="dropdown-toggle" data-toggle="dropdown">注销</a></li>
									</c:when>

									<c:when test="${username == null}">
										<li class="dropdown"><a
											href="${pageContext.request.contextPath}/userRegister"
											class="dropdown-toggle" data-toggle="dropdown">注册</a></li>

										<li class="dropdown"><a
											href="${pageContext.request.contextPath}/userLogin"
											class="dropdown-toggle" data-toggle="dropdown">登录</a></li>
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
					<div class="dd">
						<img height="350px"
							src="${pageContext.request.contextPath}/${board.board_img}" />
						<h5>${board.boardName}</h5>
					</div>
					<div class="box1">


						<div class="thumbnail">

							<div class="caption">
								<div class="box6">

									<c:choose>
										<c:when test="${username != null}">
											<a
												href="${pageContext.request.contextPath}/addPost?userName=${username}&boardId=${boardId}"><button
													class="box8">发布帖子</button></a>
										</c:when>
									</c:choose>
								</div>

								<c:forEach items="${posts}" var="post" varStatus="status">
									<h3>
										<img
											src="${pageContext.request.contextPath}/resources/img/tiezi.png" /><a
											href="${pageContext.request.contextPath}/post/postContent-${post.postId}">${post.postTitle}</a>
									</h3>
									<h4>
										<div class="bb">
											<a href="#">${post.postUserName}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<img src="${pageContext.request.contextPath}/resources/img/game/点赞.png" />
											<a href="#" >${post.postGoodCount}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											回复数：<a href="#">${post.postReplyCount}</a>
											<div class="aa">
												<li>${post.postContent}</li>
											</div>
										</div>
									</h4>

									<h4></h4>


									<p>
										<a class="btn btn-primary"
											href="${pageContext.request.contextPath}/post/postContent-${post.postId}">查看帖子</a>
										&nbsp;&nbsp;&nbsp; <img
											src="${pageContext.request.contextPath}/resources/img/game/浏览.png">${post.postViewCount}
										&nbsp;&nbsp;
										<c:choose>
											<c:when test="${username != null && username == 'admin'}">
												<a class="mdl-button mdl-js-button mdl-color-text--pink-400"
													href="${pageContext.request.contextPath}/admin/deletePost?postId=${post.postId}&postBoardId=${post.postBoardId}">删除</a>
											</c:when>
										</c:choose>

									</p>

								</c:forEach>
							</div>




						</div>





					</div>
				</div>
			</div>


		</div>
	</div>
</body>
<script type="text/javascript">
var flag=0;
$(function() {
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
</html>