<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %><%--
  Created by IntelliJ IDEA.
  User: hwai5
  Date: 2022-11-01
  Time: 오후 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
  <%
      UserDAO dao = new UserDAO();

    String user_id = request.getParameter("user_id");
    String password = request.getParameter("password");

    int check = dao.login(user_id, password);

    if(check == 1){ //아이디와 비밀번호가 일치한다면
        int type = dao.checkType(user_id); // 1이면 학생, 0이면 admin
        if(type == 1){ //학생인 경우
            response.sendRedirect("./student/studenthome.jsp");
        }else if(type == 0){ //admin인 경우
            response.sendRedirect("./admin/adminhome.jsp");
        }
        session.setAttribute("user_id", user_id); //세션에 올리기
    }else if(check == 0){ //비밀번호가 일치하지 않는다면
        out.println("<script>");
        out.println("alert('비밀번호가 일치하지 않습니다');");
        out.println("window.history.back()");
        out.println("</script>");
    }else if(check == -1) { //아이디가 없음
        out.println("<script>");
        out.println("alert('존재하지 않는 아이디입니다');");
        out.println("window.history.back()");
        out.println("</script>");
    }
  %>
</body>
</html>
