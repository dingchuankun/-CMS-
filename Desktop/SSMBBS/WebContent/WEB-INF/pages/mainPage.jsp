<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>板块</title>
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
	margin-left: auto;
	margin-right: auto;
}

.mdl-card {
	min-height: auto;
}

			.bb{
	background-color:white;
	 width: 1000px;
    height: 200px;
    border-top:2px solid #9D9D9D;
    border-right:0px solid #9D9D9D;
    border-left:10px solid white;
    border-bottom:2px solid #9D9D9D;
    padding: 10px;
    margin: 0px 0px 30px 0px;}
</style>
</head>
<body>
	<!-- Uses a header that scrolls with the text, rather than staying
  locked at the top -->
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
								<li class="active">
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
			<div class="box3" ></div>
			<div class="box1">
				
				<c:forEach items="${board}" var="board" varStatus="status">
				<li class="span4">
					
					<div class="thumbnail">
						<img  hight="350px"  src="${pageContext.request.contextPath}/${board.board_img}" />
						<div class="caption"><div class="box6"><a href="${pageContext.request.contextPath}/board/listPosts-${board.boardId}" style="float: right;">更多>....</a></div>
							<a href="${pageContext.request.contextPath}/board/listPosts-${board.boardId}"><h3>
								${board.boardName}
							</h3></a>
							
							<h4>
								<div class="bb">${board.boardDesc}</div>
							</h4>
							<p>
								<a class="btn btn-primary" href="${pageContext.request.contextPath}/board/listPosts-${board.boardId}">进入板块</a> &nbsp;
								<img src="${pageContext.request.contextPath}/resources/img/game/帖子2.png">${board.boardPostNum}
							</p>
						</div>
					</div>	
				</li>
		</c:forEach>
				
				
				
			</div>		
		</div>
	</div>
	
	
	</div>
</div>
</body>
</html>