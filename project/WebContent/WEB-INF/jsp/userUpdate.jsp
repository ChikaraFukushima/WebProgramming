<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- オリジナルCSS読み込み -->
<link rel="stylesheet" type="text/css" href="css/original/user.css">
<!-- ブートストラップ CSS読み込み -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<title>ユーザ情報詳細参照</title>
</head>
<body>

<div>
<p class = "user2">${userInfo.name}さんユーザ名さん
<a href = "LogoutServlet2">
	<small><span style = "color:#ff0000;">ログアウト</span></small></a></p>
</div>

<div>
<h1><strong>ユーザー情報更新</strong></h1>

<!--以下フォーム  -->
<form class="user" action="UserUpdateServlet2" method="post">


  <p>ログインID　${user.loginId}</p>
		<p>パスワード<input type = password name = "password"></p>
		<p>Pass（確認）<input type = password name = "confirm"></p>
		<p>ユーザ名<input type = "text" name ="name" value = "${user.name}"></p>
		<p>生年月日<input type = "date" name ="birthDate" value = "${user.birthDate}"></p>
		<input type="hidden" value="${user.id}" name = "id">


<a href ="/WEB-INF/jsp/UserList2.jsp"><button type="submit" class="btn btn-info">更新</button></a>
</div>

<dr></dr>



<a href = "UserListServlet2">	<p class="user2">戻る</p></a>


</body>
</html>