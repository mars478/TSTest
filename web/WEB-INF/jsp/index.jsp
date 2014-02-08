<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%=getServletContext().getContextPath()%>/style/general.css" rel="stylesheet" type="text/css"></link>
        <title>Employee list</title>
    </head>

    <body>

        <a href="addEmployee.htm">Добавить</a>
        <table border="1">
            <tr>
                <td>id</td>
                <td>First Name</td>
                <td>Second Name</td>
                <td>Last Name</td>
                <td>Age</td>
                <td>Experience</td>
                <td>Description</td>
                
                <td></td>
                <td></td>
            </tr>

            <c:forEach items="${empList}" var="emp"> 
            <tr>    
                <td>${emp.id}</td>
                <td>${emp.first_name}</td>
                <td>${emp.second_name}</td>
                <td>${emp.last_name}</td>
                <td>${emp.age}</td>
                <td>${emp.experience}</td>
                <td>${emp.description}</td>
                <td><a href="updateEmployee.htm?id=${emp.id}">update</a></td>
                <td><a href="deleteEmployee.htm?id=${emp.id}">delete</a></td>
            </tr>
            </c:forEach>
            
        </table>
    </body>
</html>
