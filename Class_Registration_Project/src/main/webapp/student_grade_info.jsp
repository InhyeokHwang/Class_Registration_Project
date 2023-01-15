<%@ page import="course.SearchDAO" %>
<%@ page import="course.StudentGradeDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: hwai5
  Date: 2022-11-05
  Time: 오후 2:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>

    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!--custom css-->
    <link rel="stylesheet" href="./css/student_grade_info_css.css">
</head>
<body>
    <table>
        <thead>
            <th>수업명</th>
            <th>학수번호</th>
            <th>년도</th>
            <th>학점수</th>
            <th>성적</th>
        </thead>
        <tbody>
            <%
                String student_id = request.getParameter("student_id"); //studentid값을 받아옴

                SearchDAO dao = new SearchDAO();
                List<StudentGradeDTO> list = new ArrayList<>();
                list = dao.studentGrade(student_id); //해당하는 함수 실행



                dao.close();

                for(StudentGradeDTO studentGradeDTO: list){ //반복문 돌리면서 튜플 출력
            %>

            <tr>
                <td>
                    <%=studentGradeDTO.getClassName()%>
                </td>
                <td>
                    <%=studentGradeDTO.getCourseId()%>
                </td>
                <td>
                    <%=studentGradeDTO.getOpened()%>
                </td>
                <td>
                    <%=studentGradeDTO.getCredit()%>
                </td>
                <td>
                    <%=studentGradeDTO.getGrade()%>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
