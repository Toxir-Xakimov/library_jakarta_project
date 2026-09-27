package org.example.lesson_3_jakartaee.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public abstract class BaseDao {


    private final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("library");
    private final EntityManager entityManager = entityManagerFactory.createEntityManager();


    public EntityManager em() {
        return entityManagerFactory.createEntityManager();
    }
}
