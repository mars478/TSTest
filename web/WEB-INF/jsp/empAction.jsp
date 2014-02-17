<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String action = (String)request.getAttribute("action"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/resources/css/general.css" />" rel="stylesheet"></link>
        <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.0.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/generalJS.js"/>"></script>
        <title>
            <% if (action.equals("add")) { %>  New employee form
            <% } else if (action.equals("srch")) { %> Search employee form
            <% } else if (action.equals("upd")) { %> Update employee form
            <% } else { %> Unknown action 
            <% } %>
        </title>
    </head>
    <body>
        <div id="wrapper">
            <div id="header" class="block"> 
                Employee manager. </br>
                Powered by J2EE+Spring+Hibernate+AJAX.
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
                        <div id="empForm" class="mainCss">
                        <% if(action.equals("upd")) {%>
                            <form action="upd.form" method="post">
                                <table>
                                    <tr><td>First Name</td><td><input type="text" name="first_name"    value="${fName}"></td></tr>
                                    <tr><td>Second Name</td><td><input type="text" name="second_name"   value="${sName}"></td></tr>
                                    <tr><td>Last Name</td><td><input type="text" name="last_name"     value="${lName}"></td></tr>
                                    <tr><td>Age</td><td><input type="number" name="age"         value="${age}"></td></tr>
                                    <tr><td>Experience</td><td><input type="text" name="experience"    value="${exp}"></td></tr>
                                    <tr><td>Description</td><td><input type="text" name="description"   value="${desc}"><input type="hidden" name="id" value="${id}"></td></tr>
                                    <tr><td colspan="2"> <input type="submit" value="Update"> </td></tr>
                                </table>
                            </form>
                        <%} else if (action.equals("add") || action.equals("srch")) { %>
                            <% if (action.equals("srch")) {%>
                            <form action="search.form" method="post">
                            <% } else {%>
                            <form action="add.form" method="post">
                            <% } %>
                                <table>
                                <tr><td>First Name</td><td><input type="text" name="first_name"    value=""></td></tr>
                                <tr><td>Second Name</td><td><input type="text" name="second_name"   value=""></td></tr>
                                <tr><td>Last Name</td><td><input type="text" name="last_name"     value=""></td></tr>
                                <tr><td>Age</td><td><input type="number" name="age"         value=""></td></tr>
                                <tr><td>Experience</td><td><input type="text" name="experience"    value=""></td></tr>
                                <tr><td>Description</td><td><input type="text" name="description"   value=""></td></tr>
                                <tr><td colspan="2">
                                <% if (action.equals("srch")) {%>
                                <input type="submit" value="Search">
                                <% } else {%>
                                <input type="submit" value="Add">
                                <% } %> 
                                </td></tr>
                                </table>
                            </form>


                        <% } else {%>
                            Unknown action.
                        <% } %>
                        </div>
                    </div>
                  </div>
 
            <div id="footer" class="block">
                Alexandrov V.S. (c) 2014
            </div> 
        </div>     
    </body>
</html>
