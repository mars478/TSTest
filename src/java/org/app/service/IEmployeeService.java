package org.app.service;

import org.app.entities.Employee;
import java.util.List;
import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author mars
 */

public interface IEmployeeService {
    
    List<Employee> getAll() throws SQLException;
    
    List<Employee> searchEntity(String fName, String sName, String lName, Integer age, String exp, String desc, Integer id)  throws SQLException;
    void addEntity(String fName, String sName, String lName, Integer age, String exp, String desc) throws SQLException;
    void updateEntity(String id, HashMap<String,String> fMap) throws SQLException;
    void deleteEntity(Integer id) throws SQLException;
    
}
