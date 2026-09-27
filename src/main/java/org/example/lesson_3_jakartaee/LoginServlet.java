package org.example.lesson_3_jakartaee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.lesson_3_jakartaee.dao.BookDao;
import org.example.lesson_3_jakartaee.dao.UserDao;
import org.example.lesson_3_jakartaee.entity.User;

import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

    UserDao userDao = UserDao.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/html/login.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Optional<User> user = userDao.loginCheck(username, password);

        if ( !user.isEmpty() ) {
            req.getSession().setAttribute("user",user.get());
            req.getSession().setMaxInactiveInterval(120);
            resp.sendRedirect(req.getContextPath()+"/book_list");
        }
        else {
            req.setAttribute("error", "Username or password is incorrect. Please try again!");
            req.getRequestDispatcher("/html/login.jsp").forward(req, resp);
        }
    }
}
