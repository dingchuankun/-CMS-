<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>版块管理</title>
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
            background-color:#FFFF6F;
            height: 80px;
            width: 200px;
            padding:15px;
            margin: 10px 10px 10px 10px;
            border-radius:30px;
            font-size:25px;
            text-align:center;
        }
        .center {
            margin-left: auto;
            margin-right: auto;
        }
        .card-width {
            width: 500px;
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
									<a href="https://www.taptap.com">游戏专区</a>
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
					<div class="A1">
						
				 添加板块 <a href="${pageContext.request.contextPath}/addBoard"><img src="${pageContext.request.contextPath}/resources/img/game/添加.png" /></a> 
					</div>
		<table style="width: 80%;" class="table table-hover">
				<thead>
					<tr>
						<th>
							板块图片
						</th>
						<th>
							板块ID
						</th>
						<th>
							板块名称
						</th>
						<th>
							板块描述
						</th>
						<th>
							板块帖子总数
						</th>
						<th>
							
						</th>
					</tr>
				</thead>
				<c:forEach items="${boards}" var="boards" varStatus="status">
				<tbody>
					<tr>
						<td>
							<img height="120px" width="200px" src="${pageContext.request.contextPath}/${boards.board_img}" />
						</td>
						<td>
							${boards.boardId}
						</td>
						<td>
							${boards.boardName}
						</td>
						<td>
							${boards.boardDesc}
						</td>
						<td>
							${boards.boardPostNum}
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/admin/deleteBoard?boardId=${boards.boardId}">删除<img src="${pageContext.request.contextPath}/resources/img/game/删除 小.png" /></a>&nbsp&nbsp
							<a href="${pageContext.request.contextPath}/updateBoardPage?boardId=${boards.boardId}">修改<img src="${pageContext.request.contextPath}/resources/img/game/修改 小.png"/></a>
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
</body>
</html>
