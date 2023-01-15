<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <!-- reset css -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">


  <!-- custom css -->
  <link rel="stylesheet" href="css/join_section.css">
  <link rel="stylesheet" href="css/header_footer_css.css">

  <title>메인 화면</title>

  <script>
    function validation(){ //로그인 검사
      let loginForm = document.loginForm;
      let user_id = loginForm.user_id.value;
      let password = loginForm.password.value;

      if(!user_id || !password){ //아이디와 비밀번호 둘중 하나라도 비어있다면
        alert("아이디와 비밀번호를 모두 입력해주세요");
      }else{
        loginForm.submit();
      }
    }
  </script>
</head>

<body>
<!--header-->
<header>
  <div class = "inner-header1">
    <h1 class="logo">
      <a href="join.jsp">
        <img src="img/logo.png" alt="메인 로고이미지">
      </a>
    </h1>

    <h1 class="title">
      <a href="join.jsp">
        한양대학교 수강신청
      </a>
    </h1>
  </div>


  <div class = "inner-header2">
    <nav id="search">
      <a href="logout_search.jsp">
        수강편람
      </a>
    </nav>
  </div>

</header>


<section>
  <div id="section1">
    <div id="login">
      <div id="title">
        로그인 해주세요
      </div>
      <form name="loginForm" action="joincheck.jsp" method="post">
        <input type="text" name="user_id" placeholder="아이디를 입력하세요">
        <input type="password" name="password" placeholder="비밀번호를 입력하세요">
        <button type="button" onclick = "validation()">로그인</button>  <!--클릭하면 유효성 검사함-->
      </form>

      <div id="getinfo">
        <a href="#">아이디 찾기</a>
        /
        <a href="#">비밀번호 찾기</a>
      </div>


    </div>

    <div id="instruction">
      <a href="#">
        새내기/복학생을 위한 수강신청 안내문->
      </a>
    </div>
  </div>
</section>



<!--footer-->
<%@include file="footer.jsp"%>

</body>
</html>