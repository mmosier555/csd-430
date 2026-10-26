<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CSD-430 Module 1 JSP</title>
</head>
<body>
    <h1>Hello from JSP!</h1>
    <%
        String student = "Megan Mosier";
        LocalDate today = LocalDate.now();
        int total = 0;
        for (int i = 1; i <= 5; i++) {
            total += i;
        }
    %>
    <p>Student: <%= student %></p>
    <p>Date: <%= today %></p>
    <p>Sum of 1 through 5: <%= total %></p>
</body>
</html>
