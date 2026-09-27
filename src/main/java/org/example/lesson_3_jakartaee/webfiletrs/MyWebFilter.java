package org.example.lesson_3_jakartaee.webfiletrs;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.lesson_3_jakartaee.entity.User;

import java.io.IOException;


@WebFilter(urlPatterns = {"/add_book", "/book_list"})
public class MyWebFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;

        HttpSession session = httpServletRequest.getSession();
        User user = (User) session.getAttribute("user");

        String uri = httpServletRequest.getRequestURI();

        if ( user != null ) {
            chain.doFilter(httpServletRequest, httpServletResponse);
        }
        else {
            if ( uri.equals("/book_list") || uri.equals("/add_book") ) {
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/login");
            }
        }
    }
}
