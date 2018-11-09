<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href = "user.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>ユーザ情報詳細参照</title>
</head>
<body>

<div>
<p class = "user2">ユーザ名さん
<a href = "LogoutServlet2">
	<small><span style = "color:#ff0000;">ログアウト</span></small></a></p>
</div>

<div>
<h1><strong>ユーザー情報更新</strong></h1>


<form>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">ログインID</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword" placeholder="id0001">
    </div>
  </div>

  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">パスワード</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword" placeholder="">
    </div>
  </div>

  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">パスワード(確認)</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword" placeholder="">
    </div>
  </div>
</form>

<div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">ユーザ名</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword" placeholder="田中太郎">
    </div>
  </div>

  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">生年月日</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword" placeholder="1989/04/26">
    </div>
  </div>


<button type="button" class="btn btn-info">更新</button>
</div>

<dr></dr>



<a href = "UserListServlet2">	<p class="user2">戻る</p></a>


</body>
</html>