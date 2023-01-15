<%@ page import="course.SearchDTO" %>
<%@ page import="course.SearchDAO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="course.CRCLASSDTO" %><%--
  Created by IntelliJ IDEA.
  User: hwai5
  Date: 2022-11-07
  Time: 오후 3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <%!
        public String dateToISO(String day, String hourMinute){
            Map<String, String> changeDay = new HashMap<>();//맵을 통해서 숫자를 요일로 바꿈
            changeDay.put("Monday", "1");
            changeDay.put("Tuesday", "2");
            changeDay.put("Wednesday", "3");
            changeDay.put("Thursday", "4");
            changeDay.put("Friday", "5");
            changeDay.put("Saturday", "6");

            return "1900-01-0"+ changeDay.get(day) + "T" + hourMinute + ":00.000Z";
        }
    %>
</head>
<body>
    <%
        String classId = request.getParameter("class_id"); //강좌 개설을 위해 필요한 모든 변수들을 받아옴
        String classNo = request.getParameter("class_no");
        String courseId = request.getParameter("course_id");
        String name = request.getParameter("name");
        String majorId = request.getParameter("major_id");
        String year = request.getParameter("year");
        int credit = Integer.parseInt(request.getParameter("credit"));
        String lecturerId = request.getParameter("lecturer_id");
        String personMax = request.getParameter("person_max");
        String opened = request.getParameter("opened");
        String Elearning =request.getParameter("e_learning");

        String period1Day = request.getParameter("period1_day");
        String beginHourMinute1 = request.getParameter("begin_time1");
        String beginTime1 = dateToISO(period1Day, beginHourMinute1);

        String endHourMinute1 = request.getParameter("end_time1");
        String endTime1 = dateToISO(period1Day, endHourMinute1);


        String time2Check = request.getParameter("time2check"); //두번째 시간 존재 여부를 확인하기 위해

        String period2Day = request.getParameter("period2_day");
        String beginHourMinute2 = request.getParameter("begin_time2");
        String beginTime2 = dateToISO(period2Day, beginHourMinute2);

        String endHourMinute2 = request.getParameter("end_time2");
        String endTime2 = dateToISO(period2Day, endHourMinute2);

        String roomId = request.getParameter("room_id");

        SearchDAO dao = new SearchDAO();

        CRCLASSDTO cdto = dao.createClassCondition(roomId);

        if(Integer.parseInt(cdto.getOccupancy()) < Integer.parseInt(personMax)){ //수강 정원이 강의실 수용 인원보다 초과할 경우 과목 개설 불가능
            out.println("<script>");
            out.println("alert('수강정원이 강의실 수용인원보다 많습니다');");
            out.println("window.close();");
            out.println("</script>");
        }else{

            SearchDTO dto = new SearchDTO(); //dto에 담아서 dao의 함수로 보냄
            dto.setClassId(classId);
            dto.setClassNo(classNo);
            dto.setCourseId(courseId);
            dto.setCourseName(name);
            dto.setMajorId(majorId);
            dto.setYear(year);
            dto.setCredit(credit);
            dto.setLecturerId(lecturerId);
            dto.setPersonMax(personMax);
            dto.setOpened(opened);
            dto.setBeginTime1(beginTime1);
            dto.setEndTime1(endTime1);
            dto.setBeginTime2(beginTime2);
            dto.setEndTime2(endTime2);
            dto.setRoomId(roomId);



            dao.createClassClass(dto); //class 테이블에 튜플 추가

            if(Elearning != null){ //Elearning 여부 확인
                dao.createClassTimeE(dto);
                out.println("<script>");
                out.println("alert('개설되었습니다');");
                out.println("window.close();");
                out.println("</script>");
                dao.close();
            }else {
                dao.createClassTime1(dto); //time 테이블에 첫번째 period에 대한 튜플 추가

                if (time2Check != null) { //두번째 period가 존재한다면 두번째 period에 대한 튜플도 time테이블에 추가
                    dao.createClassTime2(dto);
                }

                dao.close();

                out.println("<script>");
                out.println("alert('개설되었습니다');");
                out.println("window.close();");
                out.println("</script>");
            }
        }
    %>
</body>
</html>
