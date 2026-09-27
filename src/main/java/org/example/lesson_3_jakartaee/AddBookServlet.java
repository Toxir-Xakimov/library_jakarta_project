package org.example.lesson_3_jakartaee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.lesson_3_jakartaee.dao.UserDao;
import org.example.lesson_3_jakartaee.entity.Book;

import java.io.IOException;
import org.example.lesson_3_jakartaee.dao.BookDao;
import org.example.lesson_3_jakartaee.entity.User;

@WebServlet(name = "AddBookServ", urlPatterns = "/add_book")
public class AddBookServlet extends HttpServlet {


    BookDao bookDao = BookDao.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/html/add_book.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String author = req.getParameter("author");
        int pages = Integer.parseInt(req.getParameter("pages"));
        User user = (User) req.getSession().getAttribute("user");

        Book book = Book.builder().title(title).author(author).pages(pages).UserId(user.getId()).build();
        bookDao.SaveBook(book);

        resp.sendRedirect(req.getContextPath()+"/book_list");
    }
}
