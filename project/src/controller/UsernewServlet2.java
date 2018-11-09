package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
/**
 * Servlet implementation class UsernewServlet
 */
@WebServlet("/UsernewServlet2")
public class UsernewServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet2()
     */
    public UsernewServlet2() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {




			// userNew.jspへのフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userNew.jsp");
			dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//お決まりの文字のやつ
		request.setCharacterEncoding("UTF-8");

		String loginId = request.getParameter("loginId");
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirm");
		String name = request.getParameter("name");
		String birthDate = request.getParameter("birthDate");
		doGet(request, response);


		if (!password.equals(confirm)  || loginId.equals("") || password.equals("") || confirm.equals("") || name.equals("") || birthDate.equals("")) {
			System.out.println("error");

			request.setAttribute("errMsg", "入力された内容は正しくありません。");

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userNew.jsp");
			dispatcher.forward(request, response);
			return;
		}
		UserDao userDao = new UserDao();
		response.sendRedirect("UserListServlet2");
	}



}
