package com.tinydeal.utils;
 
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
 
public class SessionUtil {
  public static Session getSession()
  {
    SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
        Session session = sf.openSession();
        return session;
  }
 
}