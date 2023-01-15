<%@ page import="course.SearchDAO" %>
<%@ page import="course.StudentInfoDTO" %><%--
  Created by IntelliJ IDEA.
  User: hwai5
  Date: 2022-11-05
  Time: 오후 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <%
    String statusChange= request.getParameter("statusChange");
    String studentId = request.getParameter("student_id");
    SearchDAO dao = new SearchDAO();
    StudentInfoDTO dto = new StudentInfoDTO();
    dto.setStudentId(studentId);
    dto.setStatus(statusChange);
    dao.changeStatus(dto); //학생의 status를 변경해주는 함수
    dao.close();
    out.println("<script>");
    out.println("alert('변경되었습니다')");
    out.println("window.location='admin_student_info.jsp'");
    out.println("</script>");
  %>
</body>
</html>
