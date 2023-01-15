<%--
  Created by IntelliJ IDEA.
  User: hwai5
  Date: 2022-11-01
  Time: 오후 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>어드민 헤더</title>

  <!-- reset css -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">


  <!-- custom css -->
  <link rel="stylesheet" href="../css/header_footer_css.css">
</head>
<body>
<header>
  <div class = "inner-header1">
    <h1 class="logo">
      <a href="adminhome.jsp">
        <img src="../img/logo.png" alt="메인 로고이미지">
      </a>
    </h1>

    <h1 class="title">
      <a href="adminhome.jsp">
        한양대학교 수강신청
      </a>
    </h1>
  </div>


  <div class = "inner-header2">
    <nav id="search">
      <a href="admin_search.jsp">
        수강편람
      </a>
    </nav>
    <nav id="notice">
      <a href="admin_statistics.jsp">
        통계
      </a>
    </nav>
    <nav id="student_info">
      <a href="admin_student_info.jsp">
        학생 정보 조회/변경
      </a>
    </nav>
    <nav id="create_delete_course">
      <a href="admin_create_delete_course.jsp">
        강좌 개설/삭제
      </a>
    </nav>
  </div>

</header>
</body>
</html>
