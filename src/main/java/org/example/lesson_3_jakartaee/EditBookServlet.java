package org.example.lesson_3_jakartaee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.lesson_3_jakartaee.dao.BookDao;
import org.example.lesson_3_jakartaee.entity.Book;

import java.io.IOException;

@WebServlet(name = "EditBookServ", urlPatterns = "/edit_book/*")
public class EditBookServlet extends HttpServlet {


    BookDao bookDao = BookDao.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        int Bid = Integer.parseInt(pathInfo.substring(1));

        if (bookDao.getBookById(Bid).isPresent()) {
            Book book = bookDao.getBookById(Bid).get();
            req.setAttribute("book", book);
        }

        req.getRequestDispatcher("/html/edit_book.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int Bid = Integer.parseInt(req.getParameter("id"));

        String editTitle = req.getParameter("title");
            String editAuthor = req.getParameter("author");
            int editPages = Integer.parseInt(req.getParameter("pages"));

            bookDao.editBook(Bid, editTitle, editAuthor, editPages);


        resp.sendRedirect(req.getContextPath() + "/book_list");
    }
}
