package org.example.lesson_3_jakartaee.dao;

import jakarta.persistence.EntityManager;
import org.example.lesson_3_jakartaee.entity.Book;
import org.example.lesson_3_jakartaee.entity.User;
import org.postgresql.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UserDao extends BaseDao {

    private static final String uri = "jdbc:postgresql://localhost:5432/postgres";
    private static final String user = "postgres";
    private final static String password = "qazwsx";

    private static UserDao userDao;

    private UserDao(){};


    public static UserDao getInstance(){
        if ( userDao == null ) {
            userDao = new UserDao();
        }

        return userDao;
    }


    public void SaveUser(String name, String username, String password) {

        EntityManager em = em();
        em.getTransaction().begin();
        try (em) {
            em.persist(User.builder().name(name).username(username).password(password).build());
        }
        em.getTransaction().commit();
    }

    public List<User> getAllUsers() {
        try (var em = em()){
            return em.createQuery("from User", User.class).getResultList();
        }
    }


    public Optional<User> loginCheck(String username, String password) {
        User user1 = findUserByUsername(username).get();
        if ( user1.getPassword().equals(password) ) {
            return Optional.of(user1);
        }

        return Optional.empty();
    }


    public Optional<User> findUserById(int id) {
        EntityManager em = em();
        em.getTransaction().begin();

        Optional<User> user = Optional.empty();
        try (em) {
            user = Optional.of(em.find(User.class, id));
        }

        em.getTransaction().commit();

        return user;
    }




    public Optional<User> findUserByUsername(String username) {
        EntityManager em = em();
        em.getTransaction().begin();

        Optional<User> foundUser = em().createQuery("select u from User u where u.username = :username").setParameter("username", username).getResultList().stream().findFirst();

        em.getTransaction().commit();

        return foundUser;
    }


    public void RemoveUser(int id) {

        EntityManager em = em();
        em.getTransaction().begin();

        try (em){
            Optional<User> userById = findUserById(id);
            em.remove(userById.get());
        }

        em.getTransaction().commit();

    }


    public void editUser(int id, String name, String username, String password) {
        EntityManager em = em();
        em.getTransaction().begin();
        try (em){
            User user1 = findUserById(id).get();
            user1.setName(name);
            user1.setUsername(username);
            user1.setPassword(password);
        }

        em.getTransaction().commit();
    }
}
