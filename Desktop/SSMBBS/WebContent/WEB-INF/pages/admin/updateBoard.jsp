<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改板块</title>
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
        .A1{
            float:left;
            background-color:#FFFF6F;
            height: 100%px;
            width: 100%px;
            padding:15px;
            margin: 10px 100px 10px 500px;
            border-radius:30px;
            font-size:15px;
            text-align:center;
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
    <main class="mdl-layout__content">
        <div class="page-content">
            <!-- Your content goes here -->
            <div class="mdl-grid">
                <div class="mdl-cell--4-col"></div>
                <div class="mdl-cell--4-col">
                    <form action="${pageContext.request.contextPath}/admin/updateBoard" method="post" enctype="multipart/form-data">
                        <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp center"
                               width="500">
                            <tr>
                                <td colspan="2">
                                    <h4 class="mdl-color-text--pink-400" align="center"><img width="120px" src="${pageContext.request.contextPath}/${board_img}">修改板块版块信息</h4>
                                </td>
                            </tr>
                            
                            <tr>
                                <td>板块图片:</td>
                                <td>
                                 
								<input type="file" name="file" id="file_more1" value="" accept="image/jpeg,image/png,image/jpg,image/gif">
					
                                </td>
                            </tr>
                            
                            <tr>
                                <td>板块ID:</td>
                                <td>
                                    <div class="mdl-textfield mdl-js-textfield">
                                        <input class="mdl-textfield__input" type="text" name="boardId"
                                               value="${boardId}"
                                               id="boardId" readonly="readonly" name="boardId">
                                        <label class="mdl-textfield__label" for="boardId"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>板块帖子数量:</td>
                                <td>
                                    <div class="mdl-textfield mdl-js-textfield">
                                        <input class="mdl-textfield__input" type="text" name="boardPostNum"
                                               value="${boardPostNum}" id="boardPostNum" readonly="readonly"
                                               name="boardPostNum">
                                        <label class="mdl-textfield__label" for="boardPostNum"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>版块名:</td>
                                <td>
                                    <div class="mdl-textfield mdl-js-textfield">
                                        <input class="mdl-textfield__input" type="text" name="boardName" id="boardName"
                                               value="${boardName}"/>
                                        <label class="mdl-textfield__label" for="boardName"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>版块描述:</td>
                                <td>
                                    <div class="mdl-textfield mdl-js-textfield">
                                        <textarea class="mdl-textfield__input" type="text" name="boardDesc"
                                                  id="boardDesc" rows="3" >
												${boardDesc}
                                         </textarea>
                                        <label class="mdl-textfield__label" for="boardDesc">${boardDesc}</label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input class="mdl-button mdl-js-button mdl-button--raised mdl-color--pink-400 mdl-color-text--white" type="submit" value="修改"/>
                                </td>
                                <td>
                                    <a class="mdl-button mdl-js-button mdl-button--raised"
                                       href="${pageContext.request.contextPath}/admin/manageBoard">返回</a>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div class="mdl-cell--4-col"></div>
            </div>
        </div>
    </main>
</div>
<script>

</script>
</body>
</html>
