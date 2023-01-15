<%--
  Created by IntelliJ IDEA.
  User: hwai5
  Date: 2022-11-06
  Time: 오전 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <script>
        function close() { //창을 닫음
            window.close();
        }

        function disable(){ //체크박스 해제시 안보이게 함
            let checkBox = document.getElementById("check");
            let x = document.getElementById("times");
            if(checkBox.checked == true){
                x.style.display = "none";
            }else{
                x.style.display = "block";
            }
        }

        function disableTime2(){ //체크박스 해제시 안보이게 함
            let checkBox = document.getElementById("check2");
            let x = document.getElementById("times2");
            if(checkBox.checked == true){
                x.style.display = "block";
            }else{
                x.style.display = "none";
            }
        }

    </script>
</head>
<body>
    <form action="admin_create_delete_course_create_check.jsp"> <!--필요한 변수들을 다 넘김-->
        수업ID : <input type="text" name="class_id"> <br>
        수업번호 : <input type="text" name="class_no"> <br>
        학수번호 : <input type="text" name="course_id"> <br>
        수업명 : <input type="text" name="name"> <br>
        전공ID : <input type="text" name="major_id"> <br>
        학년 : <input type="text" name="year"> <br>
        학점수 : <input type="text" name="credit"> <br>
        교수ID : <input type="text" name="lecturer_id"> <br>
        최대인원 : <input type="text" name="person_max"> <br>
        년도 : <input type="text" name="opened"> <br>

        E-learning <input type="checkbox" id="check" onclick="disable()" name="e_learning">
        <div id="times">
            시간1 :
            <select name="period1_day">
                <option value="Monday">월</option>
                <option value="Tuesday">화</option>
                <option value="Wednesday">수</option>
                <option value="Thursday">목</option>
                <option value="Friday">금</option>
                <option value="Saturday">토</option>
            </select>
            <input type="time" min="9:00" max="18:00" name="begin_time1">

            ~ <input type="time" min="9:00" max="18:00" name="end_time1"> <br>

            시간2(선택) : <!--체크박스를 체크 해제하면 사라짐-->
            <input type="checkbox" id="check2" onclick="disableTime2()" name="time2check" checked>
            <div id="times2">
                <select name="period2_day">
                    <option value="Monday">월</option>
                    <option value="Tuesday">화</option>
                    <option value="Wednesday">수</option>
                    <option value="Thursday">목</option>
                    <option value="Friday">금</option>
                    <option value="Saturday">토</option>
                </select>
                <input type="time" min="9:00" max="18:00" name="begin_time2">

                ~ <input type="time" min="9:00" max="18:00" name="end_time2">
            </div>
        </div>
        <br>
        강의실ID : <input type="text" name="room_id"> <br>
        <button type="submit">개설</button>
        <button type="button" onclick="close()">취소</button> <!--취소하면 창 닫기-->
    </form>
</body>
</html>
