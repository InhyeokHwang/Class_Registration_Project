<%@ page import="course.SearchDTO" %>
<%@ page import="course.SearchDAO" %>
<%@ page import="course.TimeTableDTO" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.Instant" %>
<%@ page import="java.time.ZoneId" %><%--
  Created by IntelliJ IDEA.
  User: hwai5
  Date: 2022-11-08
  Time: 오후 6:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%--%>
<%--  SearchDAO dao = new SearchDAO();--%>
<%--  TimeTableDTO dto = dao.timeTable((String)session.getAttribute("user_id"));--%>
<%--  CharSequence p1b = dto.getPeriod1beginISO();--%>
<%--  CharSequence p1e = dto.getPeriod1endISO();--%>
<%--  CharSequence p2b = dto.getPeriod1beginISO();--%>
<%--  CharSequence p2e = dto.getPeriod2endISO();--%>

<%--  LocalDateTime period1b = LocalDateTime.from(--%>
<%--          Instant.from(--%>
<%--                  DateTimeFormatter.ISO_DATE_TIME.parse(p1b)--%>
<%--          ).atZone(ZoneId.of("Asia/Seoul"))--%>
<%--  );--%>
<%--  LocalDateTime period1e = LocalDateTime.from(--%>
<%--          Instant.from(--%>
<%--                  DateTimeFormatter.ISO_DATE_TIME.parse(p1e)--%>
<%--          ).atZone(ZoneId.of("Asia/Seoul"))--%>
<%--  );--%>
<%--  LocalDateTime period2b = LocalDateTime.from(--%>
<%--          Instant.from(--%>
<%--                  DateTimeFormatter.ISO_DATE_TIME.parse(p2b)--%>
<%--          ).atZone(ZoneId.of("Asia/Seoul"))--%>
<%--  );--%>
<%--  LocalDateTime period2e = LocalDateTime.from(--%>
<%--          Instant.from(--%>
<%--                  DateTimeFormatter.ISO_DATE_TIME.parse(p2e)--%>
<%--          ).atZone(ZoneId.of("Asia/Seoul"))--%>
<%--  );--%>
<%--  out.print("<script> insertIntoTimeTable(" + period1b.getDayOfWeek() + ", " + period1b.getHour() + ", " + period2b.getMinute()--%>
<%--   + ", " + period1e.getHour() + ", " + period2e.getMinute() + "</script>");--%>
<%--%>--%>
<html>
<head>
    <title>Title</title>
    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <!-- custom css -->
    <link rel="stylesheet" href="../css/search.css">

    <script>
        function insertIntoTimeTable(day, beginTime, beginMinute, endTime, endMinute){

          let columnNumber;
          let beginRowNumber;
          let endRowNumber;

          columnNumber = day + 1;

          if(beginTime >= 9 && beginTime <= 12){
            if(beginMinute != null){
              beginRowNumber = beginTime * 2 - 17 + 1;
            }else{
              beginRowNumber = beginTime * 2 - 17;
            }

          }else if(beginTime >= 1 && beginTime <= 6){
            if(beginMinute != null){
              beginRowNumber = beginTime * 2 + 7 + 1;
            }else{
              beginRowNumber = beginTime * 2 + 7;
            }
          }

          if(endTime >= 9 && endTime <= 12){
            if(endMinute != null){
              endRowNumber = endTime * 2 - 17 + 1;
            }else{
              endRowNumber = endTime * 2 - 17;
            }

          }else if(endTime >= 1 && endTime <= 6){
            if(endMinute != null){
              endRowNumber = endTime * 2 + 7 + 1;
            }else{
              endRowNumber = endTime * 2 + 7;
            }
          }

          for(let i = beginRowNumber; i <= endRowNumber; i++) {
            let Cell = document.getElementById("table").rows[i].cells;
            Cell[columnNumber].innerHTML = "subject";
          }
        }

    </script>

    <style>
      table{
        background: yellow;
        text-align: center;
        margin-top: 20px;
        margin-left: 20px;
      }

      table thead #firstth{
        width:10px;
      }
      table thead th{
        border: 1px solid #000;
        width:200px;

      }
      table tbody td{
        border: 1px solid #000;
        height:60px;
        width:200px;

      }
      table tbody .firstcol{
        width: 10px;
        text-align: right;
      }
    </style>

</head>
<body>
<!--header-->
<%@include file="student_header.jsp"%>

<table id="table">
  <thead>
    <th id="firstth"></th>
    <th>월</th>
    <th>화</th>
    <th>수</th>
    <th>목</th>
    <th>금</th>
    <th>토</th>
    <th>일</th>
  </thead>

  <tbody class="tbody">
    <tr>
      <td class="firstcol" rowspan="2">9</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>

    <tr>
      <td class="firstcol" rowspan="2">10</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td class="firstcol" rowspan="2">11</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td class="firstcol" rowspan="2">12</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td class="firstcol" rowspan="2">1</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td class="firstcol" rowspan="2">2</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td class="firstcol" rowspan="2">3</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td class="firstcol" rowspan="2">4</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td class="firstcol" rowspan="2">5</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td class="firstcol" rowspan="2">6</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>

<!--footer-->
<%@include file="../footer.jsp"%>
</body>
</html>
