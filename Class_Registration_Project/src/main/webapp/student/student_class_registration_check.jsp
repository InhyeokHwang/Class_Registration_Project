<%@ page import="course.SearchDAO" %>
<%@ page import="course.TakesDTO" %><%--
  Created by IntelliJ IDEA.
  User: hwai5
  Date: 2022-11-06
  Time: 오후 1:46
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
        String courseId = request.getParameter("course_id");
        String studentId = request.getParameter("student_id");
        String beginTime1 = request.getParameter("begin_time1");
        String endTime1 = request.getParameter("end_time1");
        String beginTime2 = request.getParameter("begin_time2");
        String endTime2 = request.getParameter("end_time2");
        String registeredStudents = request.getParameter("registered_students");

        SearchDAO dao = new SearchDAO();

        //수강신청 조건문 처리
        if(dao.registrationCheck1(courseId, studentId) != 1){ //조건1 : 이전 성적이 B0이상일 경우 수강신청 불가능
            dao.close();
            out.println("<script>");
            out.println("alert('이전 성적이 B0 이상입니다.')");
            out.println("window.location='student_class_registration.jsp'");
            out.println("</script>");
        }else if(dao.registrationCheck2(classId, registeredStudents) != 1){ //조건2 : 정원이 다 찼을 경우 해당 과목 수강 불가능
            dao.close();
            out.println("<script>");
            out.println("alert('정원이 다 찼습니다.')");
            out.println("window.location='student_class_registration.jsp'");
            out.println("</script>");
        }

//        if(dao.registrationCheck3(studentId, classId, beginTime1, endTime1, beginTime2, endTime2) != 1){ //조건3 : 동일 시간대에 2개 이상의 과목 수강 신청은 불가능
//            dao.close();
//            out.println("<script>");
//            out.println("alert('해당 시간에 이미 과목이 존재합니다.')");
//            out.println("window.location='student_class_registration.jsp'");
//            out.println("</script>");
//        }

        else if(dao.registrationCheck4(classId, studentId) != 1){ //조건4 : 최대 학점은 18학점으로 제한하여 초과 신청은 불가능
            dao.close();
            out.println("<script>");
            out.println("alert('최대 학점은 18학점입니다.')");
            out.println("window.location='student_class_registration.jsp'");
            out.println("</script>");
        }

        else {
            TakesDTO dto = new TakesDTO(); //신청 됨
            dto.setStudentId(studentId);
            dto.setClassId(classId);

            dao.registerClass(dto);
            dao.close();

            out.println("<script>");
            out.println("alert('신청되었습니다')");
            out.println("window.location='student_class_registration.jsp'");
            out.println("</script>");
        }
    %>
</body>
</html>
