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
	<div class="mdl-layout mdl-js-layout">

		<main class="mdl-layout__content">
		<div class="page-content">
			<!-- Your content goes here -->
			<div class="mdl-grid">
				<div class="mdl-cell mdl-cell--4-col"></div>
				<div class="mdl-cell mdl-cell--6-col">
					<div>
						<div class="mdl-card__title">
							<h4 class="mdl-color-text--pink-400">修改个人信息</h4>
						</div>
						<div class="mdl-card__subtitle-text">
							<form name="updateUserInfo"
								action="${pageContext.request.contextPath}/user/updateUserInfo"
								method="post" enctype="multipart/form-data">
								<table
									class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">
									<tr>
										<td class="mdl-data-table__cell--non-numeric">用户ID：</td>
										<td>
											<div class="mdl-textfield mdl-js-textfield">
												<input class="mdl-textfield__input" type="text"
													name="userId" value="${user.userId}" readonly>
											</div>
										</td>
									</tr>
									<tr>
										<td class="mdl-data-table__cell--non-numeric">用户名：</td>
										<td>
											<div class="mdl-textfield mdl-js-textfield">
												<input class="mdl-textfield__input" type="text"
													name="userName" value="${user.userName}" readonly> <label
													class="mdl-textfield__label" for="userName" ></label>
											</div>
										</td>
									</tr>
									<tr>
										<td class="mdl-data-table__cell--non-numeric">密码：</td>
										<td>
											<div class="mdl-textfield mdl-js-textfield">
												<input class="mdl-textfield__input" type="password"
													name="password" value="${user.password}"> <label
													class="mdl-textfield__label" for="userName"></label>
											</div>
										</td>
									</tr>
									<tr>
										<td class="mdl-data-table__cell--non-numeric">用户电话：</td>
										<td>
											<div class="mdl-textfield mdl-js-textfield">
												<input class="mdl-textfield__input" type="text"
													pattern="-?[0-9]*(\.[0-9]+)?" name="userPhone"
													value="${user.userPhone}"> <label
													class="mdl-textfield__label" for="userPhone"></label>
											</div>
										</td>
									</tr>
									<tr>
										<td class="mdl-data-table__cell--non-numeric">性别：</td>
										<td><c:choose>
												<c:when test="${user.userSex == '男'}">
													<div align="left">
														<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
															for="sex-1"> <input type="radio" id="sex-1"
															class="mdl-radio__button" name="userSex" value="男"
															checked> <span class="mdl-radio__label">男</span>
														</label> <label
															class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
															for="sex-2"> <input type="radio" id="sex-2"
															class="mdl-radio__button" name="userSex" value="女">
															<span class="mdl-radio__label">女</span>
														</label>
													</div>
												</c:when>
												<c:when test="${user.userSex == '女'}">
													<div align="left">
														<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
															for="sex-3"> <input type="radio" id="sex-3"
															class="mdl-radio__button" name="userSex" value="男">
															<span class="mdl-radio__label">男</span>
														</label> <label
															class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
															for="sex-4"> <input type="radio" id="sex-4"
															class="mdl-radio__button" name="userSex" value="女"
															checked> <span class="mdl-radio__label">女</span>
														</label>
													</div>
												</c:when>
											</c:choose>
									</tr>
									<tr>
										<td class="mdl-data-table__cell--non-numeric">邮箱：</td>
										<td>
											<div class="mdl-textfield mdl-js-textfield">
												<input class="mdl-textfield__input" type="text"
													name="userEmail" value="${user.userEmail}"> <label
													class="mdl-textfield__label" for="userEmail"></label>
											</div>
										</td>
									</tr>
									<tr>
										<td class="mdl-data-table__cell--non-numeric">注册时间：</td>
										<td>
											<div class="mdl-textfield mdl-js-textfield">
												<input class="mdl-textfield__input" type="text"
													name="createtime" value="${user.createtime}" readonly>
											</div>
										</td>
									</tr>




									<tr>
										<td>
											<button
												class="mdl-button mdl-js-button mdl-button--raised mdl-color--pink-400 mdl-color-text--white"
												type="submit" value="保存修改" name="submit">保存修改</button>
										</td>
										<td>
											<div align="left">
												<a href="${pageContext.request.contextPath}/"
													class="mdl-button mdl-js-button mdl-button--raised">返回首页</a>
											</div>
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
				<div class="mdl-cell mdl-cell--3-col"></div>
			</div>
		</div>
		</main>
	</div>
</body>