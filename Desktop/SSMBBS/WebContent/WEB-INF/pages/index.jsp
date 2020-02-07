<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Excited</title>
    
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
        .center {
            margin-left: auto;
            margin-right: auto;
        }
        .button {
            margin-top: 75px;
            margin-bottom: 75px;
        }
    </style>
</head>
<body>
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

<!-- Always shows a header, even in smaller screens. -->
<div class="mdl-layout mdl-js-layout">
   
   
    <!-- 页面主体 -->
    <main class="mdl-layout__content">
        <div class="page-content">
            <div class="mdl-grid">
                <div class="mdl-cell mdl-cell--4-col">
                    <div class="mdl-card mdl-shadow--2dp center">
                        <div class="mdl-card__title mdl-card--expand">
                            <img src="${pageContext.request.contextPath}/resources/img/dva2.jpg" width="333" height="268.73"/>
                        </div>
                        <div class="mdl-card__supporting-text mdl-typography--text-center">
                            <h5>最新攻略</h5>
                        </div>
                    </div>
                </div>
                      <div class="mdl-cell mdl-cell--4-col">
                    <div class="mdl-card mdl-shadow--2dp center">
                        <div class="mdl-card__title mdl-card--expand">
                            <img src="${pageContext.request.contextPath}/resources/img/dva1.jpg"  height="268"/>
                        </div>
                        <div class="mdl-card__supporting-text mdl-typography--text-center">
                            <h5>玩家吐槽</h5>
                        </div>
                    </div>
                </div>
                <div class="mdl-cell mdl-cell--4-col">
                    <div class="mdl-card mdl-shadow--2dp center">
                        <div class="mdl-card__title mdl-card--expand">
                            <img src="${pageContext.request.contextPath}/resources/img/dva3.jpg"  height="268"/>
                        </div>
                        <div class="mdl-card__supporting-text mdl-typography--text-center">
                            <h5>游戏测评</h5>
                        </div>
                    </div>
                </div>
 
            </div>
            <!-- 主体3 -->
            <div class="mdl-grid">
                <div class="mdl-cell--12-col center">
                    <div align="center">
                        <a href="${pageContext.request.contextPath}/main" class="mdl-button mdl-js-button mdl-button--raised mdl-color-text--white mdl-color--pink-400 button">
                            进入论坛！
                        </a>
                    </div>
                </div>
            </div>
            <!-- 主页底部信息 -->
            <footer class="mdl-mini-footer">
                <div class="mdl-mini-footer__left-section center" align="center">
                    <div class="mdl-logo">Excited</div>
                    <ul class="mdl-mini-footer__link-list">
                        <li><a href="#">GitHub</a></li>
                        <li><a href="#">Privacy & Terms</a></li>
                        <div align="right">
                            <li><a href="/">游戏论坛论坛，欢迎您</a></li>
                        </div>
                    </ul>
                </div>
            </footer>
        </div>
    </main>
</div>
</body>
</html>
