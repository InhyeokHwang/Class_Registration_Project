<%@ page import="course.SearchDAO" %><%--
  Created by IntelliJ IDEA.
  User: hwai5
  Date: 2022-11-06
  Time: 오후 1:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        SearchDAO dao = new SearchDAO();
        String classId = request.getParameter("class_id");
        String studentId = request.getParameter("student_id");
        dao.wishAdd(classId, studentId); //희망 목록에 추가해주는 함수
        dao.close();
        out.println("<script>");
        out.println("alert('희망 목록에 추가되었습니다.')");
        out.println("window.location='student_class_registration.jsp'");
        out.println("</script>");
    %>
</body>
</html>
