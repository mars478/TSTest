<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/resources/css/general.css" />" rel="stylesheet"></link>
        <title>Employee list</title>
    </head>

    <body>
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
                    <td><a href="addEmployee.htm">Add new</a></td>
                    <td><a href="searchEmployee.htm">Search</a></td>
                </tr>

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
                <tr><td colspan="2"><a href="getAll.htm">Show all employees</a></td></tr>
            </table>
        </div>
    </body>
</html>
