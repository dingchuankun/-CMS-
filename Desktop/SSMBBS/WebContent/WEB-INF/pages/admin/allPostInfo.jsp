<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主题信息</title>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
    <style>
        table{
            min-width: 1024px;
        }
        td{
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }
        .center {
            margin-right: auto;
            margin-left: auto;
        }
                .A1{
            float: left;
            background-color:#FFFF6F;
            height: 60px;
            width: 1120px;
            padding:15px;
            margin: 10px 10px 10px 10px;
            border-radius:30px;
            font-size:25px;
            text-align:center;
        }
            .A2{
            float: right;
            background-color:#FFFF6F;
            height: 110px;
            width: 1120px;
            padding:15px;
            margin: 10px 100px 10px 10px;
            border-radius:30px;
            font-size:15px;
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
								<li class="active">
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
<div class="mdl-layout mdl-js-layout">
    		
			<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			
				<div class="span3" style="color:white;font-size:20px; ">
					<div class="H2">
						<p>—欢迎您管理员—</p>
						<img   height="100px" width="100px" style="border-radius:50px" src="${pageContext.request.contextPath}/resources/img/t1.jpg" />
						<p>${username}</p>
						<p>——————————</p>
						 <a href="${pageContext.request.contextPath}/admin/manageBoard"><button class="btn btn-info btn-block btn-large" type="button">版块管理>>></button></a><br />
						 <a href="${pageContext.request.contextPath}/admin/manageUser"><button class="btn btn-info btn-block btn-large" type="button">用户管理>>></button></a><br />
						 <a  href="${pageContext.request.contextPath}/admin/managePost"><button class="btn btn-info btn-block btn-large" type="button">帖子管理>>></button></a><br />
						 
					</div>
					
				</div>
				
				<div class="span7">
					<div class="A1">帖子管理</div>
					<c:forEach items="${posts}" varStatus="status" var="post">
					<div class="A2">
			<table style="width: 100%;" class="table table-hover">
				<thead>
					<tr>
						<th>
							帖子ID
						</th>
						<th>
							帖子名称
						</th>
						<th>
							回复数量
						</th>
						<th>
							点赞数
						</th>
						<th>发表时间</th>
						<th>用户名</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							${post.postId}
						</td>
						<td>
							${post.postTitle}
						</td>
						<td>
							${post.postReplyCount}			
						</td>
						<td>
							12
						</td>
						<td>
							${post.createTime}
							
						</td>
						<td>
							${post.postUserName}
						</td>
						<c:choose>
							<c:when test="${post.postStatus==1}">
								<td style='color: red'>屏蔽中</td>
							</c:when>
							<c:when test="${post.postStatus==0}">
								<td style='color: blue;'>未屏蔽</td>
							</c:when>
						</c:choose>
						<td>
					<div >
							<a href="${pageContext.request.contextPath}/admin/deletePostx?postId=${post.postId}" >删除<img src="${pageContext.request.contextPath}/resources/img/game/删除 小.png" /></a>&nbsp&nbsp
							<a href="#" class="pingbi" name="${post.postId}">屏蔽<img src="${pageContext.request.contextPath}/resources/img/game/禁用.png"/></a>&nbsp&nbsp
							<a href="#" class="nopingbi" name="${post.postId}">解除屏蔽<img src="${pageContext.request.contextPath}/resources/img/game/禁用.png"/></a>&nbsp&nbsp
					</div>
					</td>
						
					</tr>
					
				</tbody>
			</table>
			</div>
			</c:forEach>
				</div>
			  <div class="span2">
					

				</div>
				
			
		</div>
	</div>
</div>
</div>
<script type="text/javascript">
$(function() {
	$('.pingbi').each(
		function() {
			$(this).click(
				function() {
					var id = $(this).attr("name");
					console.log(id);
					$.get(
						"${pageContext.request.contextPath}/admin/pingbipost?id=" +id,
						function(data) {
							if("success" == data) {
								alert("屏蔽成功");
								window.location.reload(); //刷新当前页面    
							} else {
								alert("屏蔽失败");
							}
						});
				});
		});
	$('.nopingbi').each(
			function() {
				$(this).click(
					function() {
						var id = $(this).attr("name");
						console.log(id)
						$.get(
							"${pageContext.request.contextPath}/admin/nopingbipost?id=" +id,
							function(data) {
								if("success" == data) {
									alert("解除屏蔽成功");
									window.location.reload(); //刷新当前页面    
								} else {
									alert("解除屏蔽失败");
								}
							});
					});
			});
});
</script>
</body>
</html>
