<%--
  Created by IntelliJ IDEA.
  User: hwai5
  Date: 2022-11-01
  Time: 오후 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>학생 헤더</title>

  <!-- reset css -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

  <!-- custom css -->
  <link rel="stylesheet" href="../css/header_footer_css.css">

</head>
<body>
<header>
  <div class = "inner-header1">
    <h1 class="logo">
      <a href="studenthome.jsp">
        <img src="../img/logo.png" alt="메인 로고이미지">
      </a>
    </h1>

    <h1 class="title">
      <a href="studenthome.jsp">
        한양대학교 수강신청
      </a>
    </h1>
  </div>


  <div class = "inner-header2">
    <nav id="search">
      <a href="student_search.jsp">
        수강편람
      </a>
    </nav>
    <nav id="class_registration">
      <a href="student_class_registration.jsp">
        수강신청
      </a>
    </nav>
    <nav id="wish">
      <a href="student_wish.jsp">
        희망수업
      </a>
    </nav>
    <nav id="registered_class">
      <a href="student_registered_class.jsp">
        신청내역
      </a>
    </nav>
    <nav id="time_table">
      <a href="student_time_table.jsp">
        시간표
      </a>
    </nav>
  </div>

</header>


</body>
</html>
