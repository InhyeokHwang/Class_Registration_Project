<%--
  Created by IntelliJ IDEA.
  User: hwai5
  Date: 2022-11-06
  Time: 오전 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- custom css -->
    <link rel="stylesheet" href="css/header_footer_css.css">
    <link rel="stylesheet" href="css/search.css">

</head>
<body>
<!-- header -->
<header>
    <div class = "inner-header1">
        <h1 class="logo">
            <a href="join.jsp"> <!--메인 로고를 클릭하면 처음 화면으로-->
                <img src="img/logo.png" alt="메인 로고이미지">
            </a>
        </h1>

        <h1 class="title">
            <a href="join.jsp"> <!--메인 글씨를 클릭하면 처음 화면으로-->
                한양대학교 수강신청
            </a>
        </h1>
    </div>


    <div class = "inner-header2">
        <nav id="search">
            <a href="logout_search.jsp"> <!--로그아웃 상태에서 수강편람-->
                수강편람
            </a>
        </nav>
    </div>
</header>

<!--section-->
  <%@include file="search.jsp"%>

  <!--footer-->
  <%@include file="footer.jsp"%>
</body>
</html>
