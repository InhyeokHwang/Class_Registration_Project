<%@ page import="course.SearchDAO" %>
<%@ page import="course.SearchDTO" %><%--
  Created by IntelliJ IDEA.
  User: hwai5
  Date: 2022-11-06
  Time: 오후 1:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String classId= request.getParameter("class_id");
        String studentId= request.getParameter("student_id");
        SearchDAO dao = new SearchDAO();
        dao.wishDelete(classId, studentId); //희망 목록에서 제거하는 함수
        dao.close();
        out.println("<script>");
        out.println("alert('삭제되었습니다')");
        out.println("window.location='student_wish.jsp'");
        out.println("</script>");
    %>
</body>
</html>
