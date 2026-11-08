<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%!
    private String esc(String s) {
        if (s == null || s.trim().isEmpty()) return "<em>Not provided</em>";
        return s.trim().replace("&", "&amp;").replace("<", "&lt;")
                .replace(">", "&gt;").replace("\"", "&quot;").replace("'", "&#39;");
    }
%>

<%
    request.setCharacterEncoding("UTF-8");

    String name      = request.getParameter("name");
    String email     = request.getParameter("email");
    String visitDate = request.getParameter("visitDate");
    String mealType  = request.getParameter("mealType");
    String visitType = request.getParameter("visitType");
    String rating    = request.getParameter("rating");
    String comments  = request.getParameter("comments");
    String[] liked   = request.getParameterValues("liked");

    String likedText = null;
    if (liked != null && liked.length > 0) {
        likedText = String.join(", ", liked);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Received</title>
</head>
<body>

    <h1>Thank You!</h1>
<p>We've received your feedback. Here is what you submitted:</p>

<table border="1" cellpadding="8">
    <tr><th>Name</th><td><%= esc(name) %></td></tr>
    <tr><th>Email</th><td><%= esc(email) %></td></tr>
    <tr><th>Date of Visit</th><td><%= esc(visitDate) %></td></tr>
    <tr><th>Meal Type</th><td><%= esc(mealType) %></td></tr>
    <tr><th>Visit Type</th><td><%= esc(visitType) %></td></tr>
    <tr><th>Overall Rating</th><td><%= esc(rating) %> / 5</td></tr>
    <tr><th>Enjoyed</th><td><%= esc(likedText) %></td></tr>
    <tr><th>Comments</th><td><%= esc(comments) %></td></tr>
</table>

<p><a href="restaurant-feedback.html">Submit another response</a></p>
</body>
</html>