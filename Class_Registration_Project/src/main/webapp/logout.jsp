<%--
  Created by IntelliJ IDEA.
  User: hwai5
  Date: 2022-11-06
  Time: 오전 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
</head>
<body>
    <%
        session.invalidate(); //모든 세션 해제하고 로그아웃
        response.sendRedirect("join.jsp"); //처음 화면
    %>
</body>
</html>
