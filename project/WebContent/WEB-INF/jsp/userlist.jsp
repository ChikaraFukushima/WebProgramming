<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>ユーザ一覧画面</title>
<!-- オリジナルCSS読み込み -->
<link rel = "stylesheet" href = "user.css">
<!-- BootstrapのCSS読み込み -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>

<div>
<!-- ↓ログイン名の表示されるシステム。自分で入ると「管理者」さん -->
<p class = "user2">${userInfo.name} さん
<a href = "LogoutServlet2">
	<small><span style="color:#ff0000;">ログアウト</span></small></a></p>
</div>
<div>
<h1><strong>ユーザー覧</strong></h1>

<!-- 無理やり空間 -->
<br><br>

<!-- 新規登録リンクのサーブレットを作る↓ -->
<a href="UsernewServlet2" target="_blank">新規登録する</a>


<!-- 無理やり空間 -->
<br><br><br>

<!-- 検索フォーム部分 -->
<form method="post" action="UserListServlet2" class="">

  <div class="form-group row">
    <label for="code" class="col-sm-2 col-form-label">ログインID</label>
    <div class="col-sm-10">
      <input type="text"  name="login-id" id="login-id" class="form-control">
    </div>
  </div>

  <div class="form-group row">
    <label for="name" class="col-sm-2 col-form-label">ユーザ名</label>
    <div class="col-sm-10">
      <input type="text" name="user-name" id="user-name" class="form-control"/>
    </div>
  </div>

  <div class="form-group row">
    <label for="continent" class="control-label col-sm-2">生年月日</label>
    <div class="col-sm-10">
     <input type="date" name="date-start" id="date-start" class="form-control" size="30"/>
      <div class="col-xs-1 text-center">
                      ~
                    </div>
                    <div class="col-sm-2">
                      <input type="date" name="date-end" id="date-end" class="form-control"/>
                    </div>
     <!--初期状態→ <input type="password" class="form-control" id="inputPassword" placeholder="年/月/日"><p>〜</p> <input type="password" class="form-control" id="inputPassword" placeholder="年/月/日"> -->

    </div>
  </div>

  <!-- 検索ボタン -->
<!--  <button type="button" class="btn btn-info">検索</button>  初期状態-->
<button type="submit" value="検索" class="btn btn-info">検索</button>

<!-- 無理やり空間 -->
<br><br><br>

              </form>
        <div class="table-responsive">
             <table class="table table-striped">
               <thead>
                 <tr>
                   <th>ログインID</th>
                   <th>ユーザ名</th>
                   <th>生年月日</th>
                   <th></th>
                 </tr>
               </thead>
               <tbody>
                 <c:forEach var="user" items="${userList}" >
                   <tr>
                     <td>${user.loginId}</td>
                     <td>${user.name}</td>
                     <td>${user.birthDate}</td>
                     <!-- TODO 未実装；ログインボタンの表示制御を行う -->
                     <td>
                       <a class="btn btn-primary" href="UserInfoServlet2?id=${user.id}">詳細</a>
                       <a class="btn btn-success" href="UserUpdateServlet2?id=${user.id}">更新</a>
                       <a class="btn btn-danger" href ="UserDeleteServlet2?id=${user.id}">削除</a>
                     </td>
                   </tr>
                 </c:forEach>
               </tbody>
             </table>
           </div>




<!-- 無理やり空間 -->
<br><br><br>

<a href ="LoginServlet2">
	<p class = "user2"><small>戻る</small></p></a>

</body>
</html>