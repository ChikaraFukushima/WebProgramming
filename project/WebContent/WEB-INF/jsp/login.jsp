<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ログイン画面</title>
			<!-- BootstrapのCSS読み込み -->
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
			<!-- オリジナルCSS読み込み -->
			<link rel="stylesheet" type="text/css" href="css/original/user.css">
	</head>
	<body>

<!-- よくわからないけどコピペ -->
<c:if test="${errMsg != null}" >
	    <div class="alert alert-danger" role="alert">
		  ${errMsg}
		</div>
	</c:if>

<p class = "user2"><small><span style = "color:#333333;">ようこそ</span></small></p>

	<form  action="LoginServlet2" method="post">

	<h1 class = "user"><strong>ログイン画面</strong></h1>
	<p class = "user">ログインID<input type = "text" name="loginId" id="inputLoginId"  required autofocus>
	<p class = "user">パスワード<input type = "password" name="password" id="inputPassword"  required>
	<p class = "user">
	<a href = >
	<button  type="SUBMIT" class="btn btn-primary">ログイン</button>
	</a>


	</form>



</body>
</html>