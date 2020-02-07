<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/material-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/material.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/material.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
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
        .A1{
            float: left;
            background-color:#cbf5fb;
            height: 100px;
            width: 400px;
            padding:15px;
            margin: 10px 10px 10px 10px;
            border-radius:30px;
            font-size:25px;
            text-align:left;
        }
               .A2{
            float: left;
            background-color:lightseagreen;
            height: 100px;
            width: 80px;
            padding:15px;
            margin: 10px 10px 10px 10px;
            border-radius:30px;
            font-size:25px;
            text-align:left;
        }

    </style>
</head>
<body>
<!-- Uses a header that scrolls with the text, rather than staying
  locked at the top -->
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
									<a href="#">游戏专区</a>
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
			
			<div class="span3">
					<div class="H2" style="color:white;font-size:20px; ">
						<p>—欢迎您管理员—</p>
						<img   height="100px" width="100px" style="border-radius:40px" src="${pageContext.request.contextPath}/resources/img/t1.jpg" />
						<p>${username}</p>
						<p>——————————</p>
						 <a href="${pageContext.request.contextPath}/admin/manageBoard"><button class="btn btn-info btn-block btn-large" type="button">版块管理>>></button></a><br />
						 <a href="${pageContext.request.contextPath}/admin/manageUser"><button class="btn btn-info btn-block btn-large" type="button">用户管理>>></button></a><br />
						 <a  href="${pageContext.request.contextPath}/admin/managePost"><button class="btn btn-info btn-block btn-large" type="button">帖子管理>>></button></a><br />
						 
					</div>
					
				</div>
				<div class="span7">
					<div class="A1">
					<form class="form-search" action="${pageContext.request.contextPath}/admin/searchuser" method="post">
				<input class="input-medium search-query" type="text" name="name"/> <button type="submit" class="btn btn-primary">搜索用户</button>
			</form> 
					</div>
		<table style="width: 70%;" class="table table-hover">
				<thead>
					<tr>
						<th>
							ID
						</th>
						<th>
							用户名
						</th>
						<th>
							手机
						</th>
						<th>
							邮箱
						</th>
						<th>性别</th>
						<th>最后登录IP</th>
						<th>状态</th>
						<th>最后登录时间</th>
						<th></th>
					</tr>
				</thead>
				<c:forEach items="${users}" var="user" varStatus="status">
				<tbody>
					<tr>
						<td>
							${user.userId}
						</td>
						<td>
							${user.userName}
						</td>
						<td>
							${user.userPhone}			
						</td>
						<td>
							${user.userEmail}
						</td>
						<td>
							${user.userSex}
							
						</td>
						<td>
							${user.lastIp}
						</td>
						<c:choose>
							<c:when test="${user.userState==1}">
								<td style='color: red'>禁言中</td>
							</c:when>
							<c:when test="${user.userState==0}">
								<td style='color: blue;'>未禁言</td>
							</c:when>
						</c:choose>
						<td>
							${user.loginTime}
						</td>
						<td>
							<a href="#" class="delete" name="${user.userName}">删除<img src="${pageContext.request.contextPath}/resources/img/删除 小.png" /></a>&nbsp&nbsp
							<a href="#" class="jingyan" name="${user.userId}">禁言<img src="${pageContext.request.contextPath}/resources/img/game/禁用.png"/></a>
							<a href="#" class="nojingyan" name="${user.userId}">不禁言<img src="${pageContext.request.contextPath}/resources/img/game/禁用.png"/></a>
						</td>
						
					</tr>
					
				</tbody>
				 </c:forEach>
			</table>
				</div>
			  <div class="span2">
					

				</div>
				
			
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	$('.jingyan').each(
		function() {
			$(this).click(
				function() {
					var id = $(this).attr("name");
					console.log(id);
					$.get(
						"${pageContext.request.contextPath}/admin/prohibitUser?id=" +id,
						function(data) {
							if("success" == data) {
								alert("禁言成功");
								window.location.reload(); //刷新当前页面    
							} else {
								alert("禁言失败");
							}
						});
				});
		});
	$('.delete').each(
			function() {
				$(this).click(
					function() {
						var name = $(this).attr("name");
						console.log(name)
						$.get(
							"${pageContext.request.contextPath}/admin/deleteuser?name=" +name,
							function(data) {
								if("success" == data) {
									alert("删除成功");
									window.location.reload(); //刷新当前页面    
								} else {
									alert(data);
									console.log(data)
								}
							});
					});
			});
	$('.nojingyan').each(
			function() {
				$(this).click(
					function() {
						var id = $(this).attr("name");
						console.log(id)
						$.get(
							"${pageContext.request.contextPath}/admin/noprohibitUser?id=" +id,
							function(data) {
								if("success" == data) {
									alert("解封成功");
									window.location.reload(); //刷新当前页面    
								} else {
									alert("解封失败");
								}
							});
					});
			});
});
</script>
</body>
</html>
