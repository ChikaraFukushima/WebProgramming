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
<p class = "user2">${userInfo.name} さん
<a href = "LogoutServlet2">
<small><span style = "color:#ff0000;">ログアウト</span></small></a></p>

<h1><strong>ユーザー情報詳細</strong></h1>

				<p>ログインID ${user.loginId}</p>
				<p>ユーザ名 ${user.name}</p>
				<p>生年月日 ${user.birthDate}</p>
				<p>登録日時 ${user.createDate}</p>
				<p>更新日時 ${user.updateDate}</p>


<!-- 下部分 -->
<a href = "UserListServlet2">
<p class = "user2"><small>戻る</small></p></a>

</div>
</body>
</html>