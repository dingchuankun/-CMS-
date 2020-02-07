<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>论坛管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/material-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/material.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/material.min.js"></script>
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
        .center {
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
<!-- 导航栏 -->
<!-- Always shows a header, even in smaller screens. -->
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
								<li class="active">
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
    
    
    <!-- 页面主体 -->
    <main class="mdl-layout__content">
        <div class="page-content">
            <!-- Your content goes here -->
            <!-- 页面主体内容 -->
            <div class="mdl-grid">
                <div class="mdl-cell mdl-cell--4-col">
                    <div class="mdl-card mdl-shadow--2dp mdl-color--amber-400 center">
                        <div class="mdl-card__title mdl-card--expand">
                            <h4 class="mdl-color-text--white center">板块管理</h4>
                        </div>
                        <div class="mdl-card__actions mdl-card--border" align="center">
                            <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-color-text--white"
                               href="${pageContext.request.contextPath}/admin/manageBoard">查看</a>
                            <div class="mdl-layout-spacer"></div>
                        </div>
                    </div>
                </div>
                <div class="mdl-cell mdl-cell--4-col">
                    <!-- 板块管理卡片 -->
                    <div class="mdl-card mdl-shadow--2dp center mdl-color--blue-400">
                        <div class="mdl-card__title mdl-card--expand">
                            <h4 class="mdl-color-text--white center">用户管理</h4>
                        </div>
                        <div class="mdl-card__actions mdl-card--border" align="center">
                            <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-color-text--white"
                               href="${pageContext.request.contextPath}/admin/manageUser">查看</a>
                            <div class="mdl-layout-spacer"></div>
                        </div>
                    </div>
                </div>
                <div class="mdl-cell mdl-cell--4-col">
                    <div class="mdl-card mdl-shadow--2dp center mdl-color--cyan-400">
                        <div class="mdl-card__title mdl-card--expand">
                            <h4 class="mdl-color-text--white center">帖子管理</h4>
                        </div>
                        <div class="mdl-card__actions mdl-card--border" align="center">
                            <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-color-text--white"
                               href="${pageContext.request.contextPath}/admin/managePost">查看</a>
                            <div class="mdl-layout-spacer"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
</main>
</div>
</body>
</html>