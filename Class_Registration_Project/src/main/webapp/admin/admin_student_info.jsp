
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="course.SearchDAO" %>
<%@ page import="course.StudentInfoDTO" %><%--
  Created by IntelliJ IDEA.
  User: hwai5
  Date: 2022-11-02
  Time: 오전 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    SearchDAO dao = new SearchDAO();
    Map<String, Object> map = new HashMap<>();
    String searchField = request.getParameter("searchField"); //검색 필드 조건
    String searchWord = request.getParameter("searchWord"); //검색어
    if(searchWord != null) {
        map.put("searchField", searchField);
        map.put("searchWord", searchWord);
    }
    StudentInfoDTO studentInfoDTO = dao.searchStudentInfo(map); //학생 정보를 얻는 함수
    dao.close();
%>
<html>
<head>
    <title>Title</title>
    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <!-- custom css -->
    <link rel="stylesheet" href="../css/search.css">

</head>
<body>
<!--header-->
<%@include file="admin_header.jsp"%>

<!--section-->
<section id="section1">
    <form method="get">
        <select name="searchField">
            <option value="student_id">학생ID</option>
            <option value="student_name">학생이름</option>
        </select>
        <input type="text" name="searchWord">
        <input type="submit" value="검색">
    </form>
</section>

<section id="section2">
    <table>
        <thead>
            <th>학생ID</th>
            <th>학생 이름</th>
            <th>금학기 시간표</th>
            <th>성적</th>
            <th>지도교수</th>
            <th>상태</th>
        </thead>

        <tbody>
            <%
                if(studentInfoDTO.getStudentId() != null){ //학생은 검색 후 하나의 튜플만 나오기 때문에 존재 여부만 확인
            %>
            <tr>
                <td>
                    <%=studentInfoDTO.getStudentId()%> <%--학생 ID --%>
                </td>
                <td>
                    <%=studentInfoDTO.getStudentName()%> <%--학생 이름 --%>
                </td>
                <td>
                    <form target="_blank" action="../timetable.jsp">
                        <button type="submit">조회</button>   <%--학생 시간표--%>
                    </form>
                </td>
                <td>
                    <%=studentInfoDTO.getGrade()%>
                    <form target="_blank" action="../student_grade_info.jsp">
                        <input type="hidden" name="student_id" value="<%=studentInfoDTO.getStudentId()%>">
                        <button type="submit">조회</button> <%--학생 성적--%>
                    </form>
                </td>
                <td>
                    <%=studentInfoDTO.getLecturerName()%>
                </td>
                <td>
                    <%=studentInfoDTO.getStatus()%>

                    <form action="admin_status_change_check.jsp" method="get">
                        <input type="hidden" name="student_id" value="<%=studentInfoDTO.getStudentId()%>">
                        <select name="statusChange"> <!--학생의 status선택 후 변경-->
                            <option value="재학">재학</option>
                            <option value="휴학">휴학</option>
                            <option value="자퇴">자퇴</option>
                        </select>
                        <button type="submit">변경</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>


</section>

<!--footer-->
<%@include file="../footer.jsp"%>
</body>
</html>
