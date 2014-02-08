package org.app.util;

/**
 *
 * @author mars
 */

import org.hibernate.Session;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.SessionFactory;
 
public class HibernateUtil {
    private static final SessionFactory sessionFactory;
    private static final Session session;
    static {
        try {
            sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
            session = sessionFactory.openSession();
        } catch (Throwable ex) { 
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
 
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
 
    public static Session getSession(){
        return session;
    }
}