<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>修改个人信息</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/material-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/material.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
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
</head>
<style>
.dd {
	float: left;
	width: 220px;
	height: 220px;
	background-color: rgba(0, 0, 0, 0.87);
	margin-left: 10px;
	margin-right: 20px;
	border-radius: 5px 0 0;
	padding: 10px;
	font-size: 35px;
	color: white;
}

.bb {
	background-color: white;
	width: 1000px;
	height: 200px;
	border-top: 2px solid #9D9D9D;
	border-right: 0px solid #9D9D9D;
	border-left: 10px solid white;
	border-bottom: 2px solid #9D9D9D;
	padding: 10px;
	margin: 0px 0px 30px 0px;
}

.cc {
	float: left;
	background-color:;
	width: 400px;
	height: 280px;
	padding: 10px;
	margin-left: 10px;
	font-size: 20px;
}

.E {
	float: left;
	background-color:;
	width: 1250px;
	height: 250px;
	padding-left: 70px;
	margin-left: 10px;
	font-size: 20px;
}
</style>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-default navbar-inverse" role="navigation">
					<div class="navbar-header">

						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span><span
								class="icon-bar"></span><span class="icon-bar"></span><span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="${pageContext.request.contextPath}/">首页</a>
					</div>

					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">


						<ul class="nav navbar-nav navbar-left">
							<li class="active"><a
								href="${pageContext.request.contextPath}/main">论坛专区</a></li>

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
	<div class="background">
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">

					<div class="box1" style="">
						<div class="E">
							<div class="dd">
								<img height="200px" width="200px" src="${pageContext.request.contextPath}/${user.user_img}" />
							</div>
							<br />
							<h4>修改头像:</h4>
							<form action="${pageContext.request.contextPath}/user/updateUserInfo" method="post" enctype="multipart/form-data">
							<input type="file" name="file" id="file_more1" value=""
								accept="image/jpeg,image/png,image/jpg,image/gif"  class="btn btn-default">
							<input type="submit" class="btn btn-info" style="margin: 20 0"/>
							</form>
						</div>

						<div class="cc">
							<table
								class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp"
								align="center">
								<tr>
									<td>用户Id:</td>
									<td>${user.userId}</td>
								</tr>
								<tr>
									<td>用户名:</td>
									<td>${user.userName}</td>
								</tr>
								<tr>
									<td>注册时间:</td>
									<td>${user.createtime}</td>
								</tr>
								<tr>
									<td>用户类型:</td>
									<td><c:choose>
											<c:when test="${user.userType == 1}">
                                                普通用户
                                            </c:when>
											<c:when test="${user.userType == 0}">
                                                管理员
                                            </c:when>
										</c:choose></td>
								</tr>
								<tr>
									<td>用户状态:</td>
									<td><c:choose>
											<c:when test="${user.userState == 0}">
                                                正常
                                            </c:when>
											<c:when test="${user.userState == 1}">
												<p class="mdl-color-text--red-400">冻结</p>
											</c:when>
										</c:choose></td>
								</tr>

							</table>
						</div>

						<div class="cc">
							<table
								class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp"
								align="center">
								<tr>
									<td>用户电话:</td>
									<td>${user.userPhone}</td>
								</tr>
								<tr>
									<td>性别:</td>
									<td>${user.userSex}</td>
								</tr>
								<tr>
									<td>邮箱:</td>
									<td>${user.userEmail}</td>
								</tr>
								<tr>
									<td>最后登录时间:</td>
									<td>${user.loginTime}</td>
								</tr>
								<tr>
									<td align="center"><a
										class="mdl-button mdl-js-button mdl-button--raised mdl-color-text--white mdl-color--pink-400"
										href="${pageContext.request.contextPath}/user/userUpdateInfo?username=${user.userName}">
											修改个人信息 </a></td>
									<td align="center"><a
										href="${pageContext.request.contextPath}/main"
										class="mdl-button mdl-js-button mdl-button--raised"> 返回 </a></td>
								</tr>
							</table>
						</div>


						<div class="cc">

							<div class="mdl-card__subtitle-text">
								<table
									class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp"
									align="center">

									<tr>
										<td><h4 class="mdl-color-text--pink-400">我发表的帖子：</h4></td>

									</tr>
									<c:forEach items="${posts}" var="post" varStatus="status">
									<tr>
									
										<td>帖子名称：</td>
										<td><a href="${pageContext.request.contextPath}/post/postContent-${post.postId}">${post.postTitle}</a></td>
								
									</tr>
										</c:forEach>



								</table>
							</div>
						</div>




					</div>
				</div>


			</div>
		</div>
</body>