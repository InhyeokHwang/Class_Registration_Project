<%@ page import="course.SearchDAO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="course.SearchDTO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: hwai5
  Date: 2022-11-02
  Time: 오전 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    SearchDAO dao = new SearchDAO();
    Map<String, Object> map = new HashMap<>();
    String searchField = request.getParameter("searchField"); //검색 필드 조건
    String searchWord = request.getParameter("searchWord"); //검색어
    if(searchWord != null){
        map.put("searchField", searchField);
        map.put("searchWord", searchWord);
        map.put("student_id", session.getAttribute("user_id"));
    }
    List<SearchDTO> list = new ArrayList<>();
    list = dao.selectList(map); //수강편람 검색한 리스트 출력
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
<%@include file="student_header.jsp"%>

<!--section -->
<section id="section1">
    <form method="get">
        <select name="searchField">
            <option value="cname">교과목명</option>
            <option value="course_id">학수번호</option>
            <option value="class_no">수업번호</option>
        </select>
        <input type="text" name="searchWord">
        <input type="submit" value="검색">
    </form>
</section>
<section id="section2">
    <table>
        <thead>
        <th>수업번호</th>
        <th>학수번호</th>
        <th>교과목명</th>
        <th>교강사 이름</th>
        <th>수업시간</th>
        <th>신청인원/수강정원</th>
        <th>강의실(건물+호수)</th>
        <th>신청하기</th>
        <th>재수강대상과목</th>
        </thead>
        <tbody>
        <%
            for (SearchDTO searchDTO : list) {
        %>
        <tr>
            <td>
                <%=searchDTO.getClassNo()%> <%--수업 번호--%>
            </td>
            <td>
                <%=searchDTO.getCourseId()%> <%--학수 번호--%>
            </td>
            <td>
                <%=searchDTO.getCourseName()%> <%--교과목명--%>
            </td>
            <td>
                <%=searchDTO.getLecturerName()%> <%--교강사 이름--%>
            </td>
            <td>
                <%
                    Map<String, String> changeDay = new HashMap<>();//맵을 통해서 숫자를 요일로 바꿈
                    changeDay.put("1", "월");
                    changeDay.put("2", "화");
                    changeDay.put("3", "수");
                    changeDay.put("4", "목");
                    changeDay.put("5", "금");
                    changeDay.put("6", "토");
                    changeDay.put("7", "일");
                    String beginTime1 = searchDTO.getBeginTime1();
                    String endTime1 = searchDTO.getEndTime1();

                    if(beginTime1.equals("NO") && endTime1.equals("NO")){//만약 time 테이블에서 NO로 표시되어있다면 E-learning으로 표현
                        out.println("E-learning");
                    }else {//ISO8601시간을 변환하기 위해 부분적으로 문자열 꺼냄
                        String bday1 = beginTime1.substring(9, 10);
                        String bhour1 = beginTime1.substring(11, 13);
                        String bminute1 = beginTime1.substring(14, 16);

                        String ehour1 = endTime1.substring(11, 13);
                        String eminute1 = endTime1.substring(14, 16);

                        out.println(changeDay.get(bday1) + "(" + bhour1 + ":" + bminute1 + "-" + ehour1 + ":" + eminute1 + ")");
                    }

                    if(searchDTO.getPeriod2() != null){//period2는 있을 수도 있고 없을 수도 있기 때문에 null이 아닌경우에 대해서 변환
                        String beginTime2 = searchDTO.getBeginTime2();
                        String endTime2 = searchDTO.getEndTime2();

                        String bday2 = beginTime2.substring(9, 10);
                        String bhour2 = beginTime2.substring(11, 13);
                        String bminute2 = beginTime2.substring(14, 16);

                        String ehour2 = endTime2.substring(11, 13);
                        String eminute2 = endTime2.substring(14, 16);

                        out.println(changeDay.get(bday2) + "(" + bhour2 + ":" + bminute2 + "-" + ehour2 + ":" + eminute2 + ")");
                    }
                %>
            </td>
            <td>
                <%=searchDTO.getRegisteredStudents()%> / <%=searchDTO.getPersonMax()%>
            </td>
            <td>
                <%=searchDTO.getBuildingName()%>  <%=searchDTO.getRoomId()%>
            </td>
            <td>
                <form action="student_class_registration_check.jsp"> <%--수강신청 조건문들 처리를 위해 값들을 넘겨야함--%>
                    <input type="hidden" name="class_id" value="<%=searchDTO.getClassId()%>"><%--input type hidden은 get방식--%>
                    <input type="hidden" name="course_id" value="<%=searchDTO.getCourseId()%>">
                    <input type="hidden" name="registered_students" value="<%=searchDTO.getRegisteredStudents()%>">
                    <input type="hidden" name="begin_time1" value="<%=searchDTO.getBeginTime1()%>">
                    <input type="hidden" name="end_time1" value="<%=searchDTO.getBeginTime1()%>">
                    <input type="hidden" name="begin_time2" value="<%=searchDTO.getBeginTime2()%>">
                    <input type="hidden" name="end_time2" value="<%=searchDTO.getEndTime2()%>">
                    <input type="hidden" name="student_id" value="<%=session.getAttribute("user_id")%>">
                    <button type="submit">신청</button>
                </form>
            </td>
            <td> <!--재수강 대상 확인-->
                <%
                    if(searchDTO.getRepitition() != null){
                        out.println("O");
                    }else{
                        out.println("X");
                    }
                %>
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
