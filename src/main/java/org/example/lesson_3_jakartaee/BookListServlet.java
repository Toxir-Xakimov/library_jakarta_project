package org.example.lesson_3_jakartaee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.lesson_3_jakartaee.dao.BookDao;
import org.example.lesson_3_jakartaee.entity.Book;
import org.example.lesson_3_jakartaee.entity.User;

import java.io.IOException;

@WebServlet(name = "BookListServ", urlPatterns = "/book_list")
public class BookListServlet extends HttpServlet {


    BookDao bookDao = BookDao.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");

        req.setAttribute("books", bookDao.getAllBooks(user.getId()));
        req.getRequestDispatcher("/html/my_books.jsp").forward(req, resp);
    }
}
