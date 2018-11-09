package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.User;





@WebServlet("/UserUpdateServlet2")
public class UserUpdateServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public UserUpdateServlet2() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//お決まり文字指定
		request.setCharacterEncoding("UTF-8");

		//リクエストパラめーた取得
		String id = request.getParameter("id");
		System.out.println(id);

		// リクエストパラメータの入力項目を引数に渡して、Daoのメソッドを実行
		UserDao userDao = new UserDao();
		User userList = userDao.info(id);

		// ユーザ更新画面へのフォワード
		request.setAttribute("user", userList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userUpdate.jsp");
		dispatcher.forward(request, response);
		return;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//お決まり文字指定
		request.setCharacterEncoding("UTF-8");
		//リクエストパラめーた取得
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirm");
		String name = request.getParameter("name");
		String birthDate = request.getParameter("birthDate");
		String id = request.getParameter("id");

		//分岐するよ
		if (!password.equals(confirm) || name.equals("") || birthDate.equals("")) {
			System.out.println("error");

			request.setAttribute("errMsg", "内容が正しくありません。");

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userUpdate.jsp");
			dispatcher.forward(request, response);
			return;
		}

		if(password.equals("") && confirm.equals("")) {
			UserDao userDao = new UserDao();
			User user = userDao.UpdateNoPassword(name, birthDate, id);
			response.sendRedirect("UserListServlet2");
			return;
		}

		UserDao userDao = new UserDao();
		User user = userDao.Update(password, name, birthDate, id);

		response.sendRedirect("UserListServlet2");
	}




	}


