<%--
  Created by IntelliJ IDEA.
  User: hwai5
  Date: 2022-11-01
  Time: 오후 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>

    <!-- custom css -->
    <link rel="stylesheet" href="../css/home_section_css.css">
</head>
<body>
<!--header-->
<%@include file="admin_header.jsp"%>

<section>
    <div id="section1">
        <div id="login">
            <div id="title">
                시스템 관리자
            </div>
            <a href="../logout.jsp">
                로그아웃
            </a>
        </div>


        <div id="instruction">
            <a href="#">
                새내기/복학생을 위한 수강신청 안내문->
            </a>
        </div>
    </div>
</section>
<!--footer-->
<%@include file="../footer.jsp"%>
</body>
</html>
