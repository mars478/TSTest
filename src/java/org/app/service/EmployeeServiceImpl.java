package org.app.service;

//import java.lang.reflect.Field;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import org.app.entities.Employee;
import java.util.List;
import org.app.support.ValueChecker;
import org.app.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Query;
import org.springframework.stereotype.Service;

/**
 *
 * @author mars + http://habrahabr.ru/post/29694/ 
 *              + http://www.quizful.net/post/java-reflection-api
 *              + http://habrahabr.ru/post/102468/
 *              + http://www.tutorialspoint.com/hibernate/hibernate_query_language.htm
 */

@Service
public class EmployeeServiceImpl implements IEmployeeService {

    public List<Employee> empList  = new ArrayList<Employee>();
    
    //ok, verified
    @Override
    public List<Employee> getAll() throws SQLException {
        
        Session session = null;
        List employees = new ArrayList<Employee>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();               
            employees = session.createCriteria(Employee.class).list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        
        return (List<Employee>)employees;
    }

    //ok, partially verified
    @Override
    public List<Employee> searchEntity(String fName, String sName, String lName, Integer age, String exp, String desc, Integer id) throws SQLException {

        Session session = null;
        List employees = new ArrayList<Employee>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
       
            boolean mSrch = false;
            StringBuilder qrStr = new StringBuilder();
            qrStr.append("from Employee as E where");
            if ((fName != null) && (!fName.equals(""))){
                if (mSrch)
                    qrStr.append(" and");
                qrStr.append(" E.first_name = '" + fName + "'");
                mSrch = true;
            } 
            if ((sName != null) && (!sName.equals(""))){
                if (mSrch)
                    qrStr.append(" and");
                qrStr.append(" E.second_name = '" + sName + "'");
                mSrch = true;
            }
            if ((lName != null) && (!lName.equals(""))){
                if (mSrch)
                    qrStr.append(" and");
                qrStr.append(" E.last_name = '" + lName + "'");
                mSrch = true;
            } 
            if ((exp != null)&&(!exp.equals(""))){
                if (mSrch)
                    qrStr.append(" and");
                qrStr.append(" E.experience = '" + exp + "'");
                mSrch = true;
            } 
            if ((desc != null)&&(!desc.equals(""))){
                if (mSrch)
                    qrStr.append(" and");
                qrStr.append(" E.description = '" + desc + "'");
                mSrch = true;
            } 

            if ((age != null)&&(age != -1)) {
                if (mSrch)
                    qrStr.append(" and");
                qrStr.append(" E.age = " + age.intValue() + "");
                mSrch = true;
            }
            if ((id != -1)&&(!id.equals(""))) {
                if (mSrch)
                    qrStr.append(" and");
                qrStr.append(" E.id = " + id.intValue() + "");
                mSrch = true;
            }
            //=========================================================================
            Query query = session.createQuery(qrStr.toString());
            
            employees = (List<Employee>) query.list();
            session.getTransaction().commit();
                        
        } finally {
        if (session != null && session.isOpen()) {
            session.close();
            }
        }

        return (List<Employee>)employees;
    }

    //ok, verified
    @Override
    public void addEntity(String fName, String sName, String lName, Integer age, String exp, String desc) throws SQLException {
        
        Employee emp = new Employee();
        if (age!= -1) emp.setAge(age);
        emp.setDescription(desc);
        emp.setExperience(exp);
        emp.setFirst_name(fName);
        emp.setSecond_name(sName);
        emp.setLast_name(lName);
    
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.save(emp);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    
    }

    //holy shit
    @Override
    public void updateEntity(String id, HashMap<String,String> fMap) throws SQLException {
        Employee eTemp = null;
        Session session = null;
        
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            eTemp = (Employee) session.load(Employee.class, ValueChecker.checkInt(id).intValue());
            
            //Class cl = eTemp.getClass(); 
            //Field[] fields = cl.getDeclaredFields(); 
            
            String value = null;
            for (String key: fMap.keySet()){
                value = fMap.get(key);
                
                if (key.equals("first_name")) {
                    eTemp.setFirst_name(value);
                    continue;
                }
                if (key.equals("second_name")) {
                    eTemp.setSecond_name(value);
                    continue;
                }
                if (key.equals("last_name")) {
                    eTemp.setLast_name(value);
                    continue;
                }
                if (key.equals("experience")) {
                    eTemp.setExperience(value);
                    continue;
                }
                if (key.equals("description")) {
                    eTemp.setDescription(value);
                    continue;
                }
                if (key.equals("age")) {
                    eTemp.setAge(ValueChecker.checkInt(value));
                    continue;
                }
                
               /* //failed: spring has no access to private fields.
                value = fMap.get(key);
                for (Field field : fields) {                  
                    if (field.getName().equals("id")) continue; 
                    if (field.getName().equals(key)) {                     
                        if (key.equals("age")){

                            Integer tempAge = ValueChecker.checkInt(value);
                            if (tempAge!=null)
                                field.set(eTemp, tempAge.intValue());
                        }
                        else{
                            field.set(eTemp, value);
                        }
                        break;
                    }       
                }
             */
            }
            
            session.beginTransaction();
            session.update(eTemp);
            session.getTransaction().commit();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }
       
    //ok,verified
    @Override
    public void deleteEntity(Integer id) throws SQLException {
        Session session = null;
        Employee emp = null;
        try {
            
            session = HibernateUtil.getSessionFactory().openSession();
            emp = (Employee) session.load(Employee.class, id);
            if (emp != null) {
                session.beginTransaction();
                session.delete(emp);
                session.getTransaction().commit();
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }

}