<%@ page import="course.SearchDAO" %><%--
  Created by IntelliJ IDEA.
  User: hwai5
  Date: 2022-11-07
  Time: 오전 10:23
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
    dao.registeredDelete(classId, studentId); //수강신청 내역에서 삭제해주는 함수
    dao.close();
    out.println("<script>");
    out.println("alert('삭제되었습니다')");
    out.println("window.location='student_registered_class.jsp'");
    out.println("</script>");
  %>
</body>
</html>
