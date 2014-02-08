<%@page contentType="text/html" pageEncoding="UTF-8" %>

<% String action = (String)request.getAttribute("action"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%=getServletContext().getContextPath()%>/style/general.css" rel="stylesheet" type="text/css"></link>
        <title>
            <% if (action.equals("add")) { %>  New employee form
            <% } else if (action.equals("srch")) { %> Search employee form
            <% } else if (action.equals("upd")) { %> Update employee form
            <% } else { %> Unknown action 
            <% } %>
        </title>
    </head>
    <body>
        <% if(action.equals("upd")) {%>
            <form action="upd.form" method="post">
                <table>
                    <tr><td>Имя</td><td><input type="text" name="first_name"    value="${fName}"></td></tr>
                    <tr><td>Отчество</td><td><input type="text" name="second_name"   value="${sName}"></td></tr>
                    <tr><td>Фамилия</td><td><input type="text" name="last_name"     value="${lName}"></td></tr>
                    <tr><td>Возраст</td><td><input type="number" name="age"         value="${age}"></td></tr>
                    <tr><td>Опыт</td><td><input type="text" name="experience"    value="${exp}"></td></tr>
                    <tr><td>Описание</td><td><input type="text" name="description"   value="${desc}"><input type="hidden" name="id" value="${id}"></td></tr>
                    <tr><td> <input type="submit" value="Обновить"> </td></tr>
                </table>
            </form>
        <%} else if (action.equals("add") || action.equals("srch")) { %>
            <% if (action.equals("srch")) {%>
            <form action="search.form" method="post">
            <% } else {%>
            <form action="add.form" method="post">
            <% } %>
                <table>
                <tr><td>Имя</td><td><input type="text" name="first_name"    value=""></td></tr>
                <tr><td>Отчество</td><td><input type="text" name="second_name"   value=""></td></tr>
                <tr><td>Фамилия</td><td><input type="text" name="last_name"     value=""></td></tr>
                <tr><td>Возраст</td><td><input type="number" name="age"         value=""></td></tr>
                <tr><td>Опыт</td><td><input type="text" name="experience"    value=""></td></tr>
                <tr><td>Описание</td><td><input type="text" name="description"   value=""></td></tr>
                <tr><td>
                <% if (action.equals("srch")) {%>
                <input type="submit" value="Поиск">
                <% } else {%>
                <input type="submit" value="Добавить">
                <% } %> 
                </td></tr>
                </table>
            </form>
        
        
        <% } else {%>
            Unknown action.
        <% } %>
    </body>
</html>
