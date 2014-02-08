package org.app.controller;

/**
 *
 * @author mars + http://docs.spring.io/spring/docs/3.0.0.M3/reference/html/ch04s11.html
 *              + http://www.postgresql.org/message-id/AANLkTinsk4rwT7v-751bwQkgTN1rkA=8uE-jk69nape-@mail.gmail.com
 *              + https://github.com/tada/pljava/wiki/Default-type-mapping
 */

import java.sql.SQLException;
import java.util.HashMap;
import org.app.entities.Employee;
import org.app.support.ValueChecker;
import org.app.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmployeeController {

    @Autowired
    private IEmployeeService empServImpl; 
    
    //Done 
    @RequestMapping("/")
    public String workspace(Model model) throws SQLException
    {
        model.addAttribute("empList", empServImpl.getAll());
	return "index"; 
    }
    
    //Done
    @RequestMapping("/getAll")
    public String show(Model model) throws SQLException {
        
	model.addAttribute("empList", empServImpl.getAll());
	return "index"; 
    }
    
    //Done
    @RequestMapping(value="/searchEmployee",method=RequestMethod.GET)
    public ModelAndView searchEmployee(){
        return new ModelAndView("empAction").addObject("action","srch");
        //return new ModelAndView("srchEmployee").addObject("action","srch");
    }
    
    //Done
    @RequestMapping(value="/search.form", method=RequestMethod.POST)
    public String search(Model model, String first_name, String second_name, String last_name, 
                         String age, String experience, String description) throws SQLException{
        
        model.addAttribute("empList", empServImpl.searchEntity(first_name, second_name, last_name, 
                            ValueChecker.checkInt(age) , experience, description, null));
        
        return "index";
    }
    //Done
    @RequestMapping(value="/addEmployee", method=RequestMethod.GET)
    public ModelAndView newEmployee(){
        return new ModelAndView("empAction").addObject("action","add");
        //return new ModelAndView("addEmployee").addObject("action","add");
    }
    
    //Done
    @RequestMapping(value="/add.form", method=RequestMethod.POST)
    public String add(String first_name, String second_name, String last_name, 
                            String age, String experience, String description, Model model) throws SQLException{

        empServImpl.addEntity(first_name, second_name, last_name, ValueChecker.checkInt(age), experience, description);

        return show(model);
    }
    
    //Done
    @RequestMapping(value="/updateEmployee", method=RequestMethod.GET)
    public ModelAndView updEmployee(String id) throws SQLException{
        
        Integer tempId = ValueChecker.checkInt(id);
        Employee emp = (Employee)empServImpl.searchEntity(null, null, null, null, null, null, tempId).get(0);
        
        ModelAndView model = new ModelAndView("empAction");
        //ModelAndView model = new ModelAndView("updEmployee");

        model.addObject("fName",emp.getFirst_name());
        model.addObject("sName",emp.getSecond_name());
        model.addObject("lName",emp.getLast_name());
        model.addObject("age",emp.getAge());
        model.addObject("exp",emp.getExperience());
        model.addObject("desc",emp.getDescription());
        model.addObject("id",id);
        model.addObject("action","upd");
       
        //return sb.toString();
        return model;
    }
    
    //Done
    @RequestMapping(value="/upd.form", method=RequestMethod.POST)
    public String update(String first_name, String second_name, String last_name, 
                            String age, String experience, String description, String id, Model model) throws SQLException{
        
        HashMap<String,String> update = new HashMap();
        update.put("first_name", first_name);
        update.put("second_name",second_name);
        update.put("last_name",last_name);
        update.put("age",age);
        update.put("experience",experience);
        update.put("description",description);

        empServImpl.updateEntity(id, update);
        
        return show(model);
    }
    
    //Done
    @RequestMapping(value="/deleteEmployee", method=RequestMethod.GET)
    public String delete(String id, Model model) throws SQLException{
        
        Integer tempId = ValueChecker.checkInt(id);
        if (tempId!=null)
            empServImpl.deleteEntity(tempId);
        
        return show(model);
    }

}