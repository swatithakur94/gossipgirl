<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<body style="background-color:#FFE4E1">

<nav class="navbar navbar-default navbar-static-top" role="navigation" >
	<div class="container" style="padding-top: 10px; padding-bottom: 10px;">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="userprofile" style="margin-top: -10px;"><img
				src="${pageContext.request.contextPath}/resources/images/4.jpg"
				alt="logo" width="50" height="50"></a><span
				style="font-size: xx-large; line-height: 60px;">GoSSipGIRl</span>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">


			<ul class="nav navbar-nav navbar-right">

				<li><img
					ng-src="
					${pageContext.request.contextPath}/resources/images/<security:authentication property='principal.username' />.jpg "
					class="img-circle" width="40" height="40" style="margin-top: 10px;"
					on-error-src='${pageContext.request.contextPath}/resources/images/iconn.png'
					onerror="this.src='${pageContext.request.contextPath}/resources/images/iconn.png'"
					width="30" height="30" id="sm_profilepic" /></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"><i
						class="fa fa-caret-down fa-2x" aria-hidden="true"></i></a>
					<ul class="dropdown-menu">
						<li><a href="viewblogs"> <img
								src="${pageContext.request.contextPath}/resources/images/blogg.png"
								alt="logo" width="20" height="20">&nbsp <b>Blog</b>
						</a></li>
						<li><a href="allusers"><img
								src="${pageContext.request.contextPath}/resources/images/frr.png"
								alt="logo" width="20" height="20">&nbsp <b>Peoples</b></a></li>
						<li><a href="friends"><img
								src="${pageContext.request.contextPath}/resources/images/fr.jpg"
								alt="logo" width="20" height="20">&nbsp <b>Friends</b></a></li>
						<li><a href="talk"><img
								src="${pageContext.request.contextPath}/resources/images/gc.png"
								alt="logo" width="20" height="20">&nbsp <b>Group Chat</b></a>
						</li>
					</ul></li>


				<li><a href="logoutuser" title="logout" class="pull-right"><i
						class="fa fa-power-off fa-2x" aria-hidden="true"></i></a></li>
			</ul>

		</div>
	</div>
</nav>
</body>