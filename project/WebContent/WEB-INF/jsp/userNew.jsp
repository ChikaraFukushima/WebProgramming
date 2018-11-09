<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- オリジナルCSS読み込み -->
<link rel="stylesheet" type="text/css" href="css/original/user.css">
<!-- ブートストラップ CSS読み込み -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<title>ユーザ新規登録</title>
</head>
<body>


<div>
<!-- ↓ログイン名の表示されるシステム。自分で入ると「管理者」さん -->
<p class = "user2">${userInfo.name} さん
<a href = "LogoutServlet2">
	<small><span style="color:#ff0000;">ログアウト</span></small></a></p>
</div>
<div>
<h1><strong>ユーザー新規登録</strong></h1>


	<form class="form-signin" action="UsernewServlet2" method="post">
		<p>ログインID　<input type = "text" name = "loginId">
		<p>パスワード　<input type = "password" name ="password"></p>
		<p>パスワード（確認）　<input type = "password" name = "confirm"></p>
		<p>ユーザ名　<input type = "text" name = "name"></p>
		<p>生年月日　<input type = "date" name ="birthDate"></p>
		<p><a href = "">
			<input type = "submit" value = "登録"></a></p>
			</form>
<p></p>
</div>
<a href ="UserListServlet2">
<p class="user2">戻る</p></a>

</body>
</html>