<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/resources/css/general.css" />" rel="stylesheet"></link>
        <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.0.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/generalJS.js"/>"></script>
        <title>Employee list</title>
    </head>

    <body>
        <div id="wrapper">
            <div id="header" class="block"> 
                Employee manager. </br>
                Powered by J2EE+Spring+Hibernate.
            </div>
            <div id="content">
                    <div id="leftBar" class="block">
                        <ul id="lMenu">
                            <li><a href="getAll.htm">Show all</a> 
                                <div class="message">
                                    Display all employee list. 
                                </div>  
                            </li>
                            <li><a href="addEmployee.htm">Add new</a>
                                <div class="message">
                                    Create new employee and save his data to database. 
                                </div>  
                            </li>
                            <li><a href="searchEmployee.htm">Search</a>
                                <div class="message">
                                    Display employee list founded according to the search query. 
                                </div>  
                            </li>
                        </ul>
                    </div>
                    <div id="centerPanel">
                        <div id="empTable" class="mainCss">
                            <table border="1">
                                <tr>
                                    <!-- <td>id</td> -->
                                    <td><b>First Name</b></td>
                                    <td><b>Second Name</b></td>
                                    <td><b>Last Name</b></td>
                                    <td><b>Age</b></td>
                                    <td><b>Experience</b></td>
                                    <td><b>Description</b></td> 
                                    <td colspan="2"></td>
                                    <!-- 
                                    <td><a href="addEmployee.htm">Add new</a></td>
                                    <td><a href="searchEmployee.htm">Search</a></td>
                                    -->
                                </tr>
                                <c:if test="${empList.size() > 0}">
                                    <c:forEach items="${empList}" var="emp"> 
                                    <tr>    
                                        <!--  <td>${emp.id}</td> -->
                                        <td>${emp.first_name}</td>
                                        <td>${emp.second_name}</td>
                                        <td>${emp.last_name}</td>
                                        <td>${emp.age}</td>
                                        <td>${emp.experience}</td>
                                        <td>${emp.description}</td>
                                        <td><a href="updateEmployee.htm?id=${emp.id}">Update</a></td>
                                        <td><a href="deleteEmployee.htm?id=${emp.id}">Delete</a></td>
                                    </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empList.size() == 0}">
                                    <td colspan="8">No employee found.</td>
                                </c:if>
                                <!-- 
                                <tr><td colspan="2"><a href="getAll.htm">Show all employees</a></td></tr>
                                -->
                            </table>
                        </div> 
                    </div>
            </div> 
            <div id="footer" class="block">
                Alexandrov V.S. (c) 2014
            </div> 
        </div>       
    </body> 
</html>
