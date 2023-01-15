<%@ page import="course.SearchDAO" %>
<%@ page import="course.SearchDTO" %><%--
  Created by IntelliJ IDEA.
  User: hwai5
  Date: 2022-11-06
  Time: 오전 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String classId = request.getParameter("class_id");
        SearchDAO dao = new SearchDAO();
        dao.deleteClass(classId); //수업 삭제하는 함수
        dao.close();
        out.println("<script>");
        out.println("alert('삭제되었습니다');");
        out.println("window.location='admin_create_delete_course.jsp'");
        out.println("</script>");
    %>
</body>
</html>
