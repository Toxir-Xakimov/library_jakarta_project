package org.example.lesson_3_jakartaee.dao;

import jakarta.persistence.EntityManager;
import org.example.lesson_3_jakartaee.entity.Book;
import org.example.lesson_3_jakartaee.entity.User;
import org.postgresql.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class BookDao extends BaseDao {

    private static final String uri = "jdbc:postgresql://localhost:5432/postgres";
    private static final String user = "postgres";
    private final static String password = "qazwsx";

    static BookDao bookDao;

    private BookDao() {
    }

    ;

    public static BookDao getInstance() {
        if (bookDao == null) {
            bookDao = new BookDao();
        }

        return bookDao;
    }

    public void SaveBook(Book book) {
        EntityManager em = em();

        em.getTransaction().begin();
        try (em) {
            em.persist(book);
        }
        em.getTransaction().commit();
    }


    public List<Book> getAllBooks(int userId) {
        EntityManager em = em();
        try (em) {
            return em.createQuery("from Book b", Book.class).getResultList();
        }
    }


    public void RemoveBook(int id) {
        EntityManager em = em();
        em.getTransaction().begin();
        try (em){
            Book book = em.find(Book.class, id);
            em.remove(book);
        }
        em.getTransaction().commit();
    }


    public void editBook(int id, String title, String author, int pages) {
        EntityManager em = em();

        em.getTransaction().begin();
        try (em){
            Book book = em.find(Book.class, id);
            book.setTitle(title);
            book.setAuthor(author);
            book.setPages(pages);
        }
        em.getTransaction().commit();
    }


    public Optional<Book> getBookById(int id) {

        EntityManager em = em();

        em.getTransaction().begin();
        Optional<Book> book = Optional.empty();
        try (em){
            book = Optional.of(em.find(Book.class, id));
        }
        em.getTransaction().commit();

        return book;
    }


}
