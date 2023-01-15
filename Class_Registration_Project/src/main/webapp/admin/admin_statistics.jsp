<%@ page import="course.SearchDAO" %>
<%@ page import="course.SearchDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="course.OLAPDTO" %><%--
  Created by IntelliJ IDEA.
  User: hwai5
  Date: 2022-11-02
  Time: 오전 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    SearchDAO dao = new SearchDAO();

    List<OLAPDTO> list = new ArrayList<>();
    list = dao.studentStatistic(); //버튼을 클릭하면 통계 출력
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
        <button type="submit">(평점평균 - 과목학점)가 가장 큰 TOP 10 과목</button>
    </form>
</section>

<section id="section2">
    <table>
        <thead>
        <th>수업명</th>
        <th>학수번호</th>

        </thead>
        <tbody>
        <%
            for (OLAPDTO olapdto : list) {
        %>
        <tr>
            <td>
                <%=olapdto.getName()%> <%--수업명--%>
            </td>
            <td>
                <%=olapdto.getCourse_id()%> <%--학수 번호--%>
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
