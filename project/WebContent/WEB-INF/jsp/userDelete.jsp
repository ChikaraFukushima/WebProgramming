<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- オリジナルCSS読み込み -->
<link rel="stylesheet" type="text/css" href="css/original/user.css">
<!-- ブートストラップ CSS読み込み -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<title>ユーザ削除確認</title>
</head>
<body>

<!-- 追加 -->


<p class = "user2">${userInfo.name}さん
<a href = "LogoutServlet2" style = "text-decoration : none">
	<small><span style = "color:#ff0000;">ログアウト</span></small></a></p>

<div>
<h1><strong>ユーザー削除確認</strong></h1>
<p>ログインID：${user.loginId}</p>
<p>を本当に削除してもよろしいですか？ <p/>

<form class="" action="UserDeleteServlet2" method="post">
<input type="hidden" name = "id" value="${user.id}">
<button type="submit" name=delete class="btn btn-primary btn-lg">削除</button>
</form>
<form action="UserListServlet2" method="get">

<a href = "UserListServlet2">
<button type="submit" class="btn btn-secondary btn-lg">いいえ</button></a>

</form>
</div>




<a href = "UserListServlet2">
<p class = "user2"><small>戻る</small></p></a>


</body>
</html>