package org.example.lesson_3_jakartaee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.lesson_3_jakartaee.dao.BookDao;
import org.example.lesson_3_jakartaee.entity.Book;

import java.io.IOException;

@WebServlet(name = "RemoveBookServ", urlPatterns = "/remove_book/*")
public class RemoveBookServlet extends HttpServlet {


    BookDao bookDao = BookDao.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        int Bid = Integer.parseInt(pathInfo.substring(1));

        bookDao.RemoveBook(Bid);
        System.out.println("remove id=" + Bid);

        resp.sendRedirect(req.getContextPath() + "/book_list");
    }
}
