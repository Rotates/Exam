package org.liao.persistence;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.annotation.Resource;

public class BaseService {
    @Resource(name = "sessionFactory")
    public SessionFactory sessionFactory;

    public Session getCurrentSession() {

        return sessionFactory.getCurrentSession();
    }

    public void save(Object exam) {
        getCurrentSession().clear();
        getCurrentSession().save(exam);
        getCurrentSession().flush();
    }
}
