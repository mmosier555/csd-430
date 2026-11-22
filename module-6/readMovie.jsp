<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, beans.MoviesBean" %>
<%
    // Page: readMovie.jsp
    // Purpose: READ part of CRUD. Shows a dropdown of all movie IDs, then
    // displays the selected movie's record in a table. Uses MoviesBean.
    // Author: Megan Mosier

    MoviesBean bean = new MoviesBean();
    List<Integer> keys = null;          // all primary keys for the dropdown
    String[] movie = null;              // the selected record (if any)
    String errorMessage = null;         // holds an error to show the user
    String selected = request.getParameter("movieId");  // value from the form

    try {
        keys = bean.getAllKeys();       // fill the dropdown
        if (selected != null && !selected.isEmpty()) {
            movie = bean.getMovieById(Integer.parseInt(selected));
        }
    } catch (Exception e) {
        errorMessage = "Database error: " + e.getMessage();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie Lookup</title>
</head>
<body>
    <h1>Megan's Movies Database - Read</h1>
    <p>This page reads from the <b>meganmoviesdata</b> table in the CSD430
       database. Each record describes one movie: its ID, title, director,
       release year, genre, and rating. Pick a Movie ID to view that record.</p>

    <% if (errorMessage != null) { %>
        <p style="color:red;"><%= errorMessage %></p>
    <% } %>

    <form method="post" action="readMovie.jsp">
        <label for="movieId">Select a Movie ID:</label>
        <select name="movieId" id="movieId">
            <% if (keys != null) {
                   for (Integer k : keys) { %>
                <option value="<%= k %>" <%= String.valueOf(k).equals(selected) ? "selected" : "" %>><%= k %></option>
            <%     }
               } %>
        </select>
        <input type="submit" value="Show Movie">
    </form>

    <% if (movie != null) { %>
        <h2>Selected Movie Record</h2>
        <table border="1" cellpadding="6">
            <thead>
                <tr>
                    <% for (String title : MoviesBean.FIELD_TITLES) { %>
                        <th><%= title %></th>
                    <% } %>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <% for (String value : movie) { %>
                        <td><%= value %></td>
                    <% } %>
                </tr>
            </tbody>
        </table>
    <% } %>

    <p><a href="index.jsp">Back to index</a></p>
</body>
</html>
