<%--
File: mosier_mod2.jsp
Author: Megan Mosier 
Course: CSD-430
Purpose: Displays data about Pride and Prejudice using JSP scriptlets.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    // Category names (one per table)
    String[] categories = {"Sisters", "Love Interests", "Other Austen Books"};

    //records[category][record][field]
    // Three fields per record: Name or Title, Key Fact, Description
    String[][][] records = {
        { // Sisters
            {"Jane", "Eldest sister", "amiable"},
            {"Elizabeth", "Second eldest sister", "sharp-witted"},
            {"Mary", "Middle sister", "socially awkward"},
            {"Kitty", "Fourth sister", "easily swayed"},
            {"Lydia", "Youngest sister", "brash"}
        },
        { // Love Interests
            {"Mr. Darcy", "Elizabeth's love interest", "loyal"},
            {"Mr. Bingley", "Jane's love interest", "good-natured"},
            {"George Wickham", "antagonist", "fortune hunter"},
            {"Mr. Collins", "Bennet cousin", "socially oblivious"},
            {"Colonel Fitzwilliam", "Darcy's first cousin", "gentlemanly"}
        },
        { // Other Austen Books
            {"Sense and Sensibility", "1811", "published anonymously"},
            {"Mansfield Park", "1814", "domestic realism"},
            {"Emma", "1815", "comedy"}
        }
    };
%>
<!DOCTYPE html>
<html>
<head>
    <title>Megan Mosier CSD-430 Module 2 Assignment</title>
    <link rel="stylesheet" type="text/css" href="mosier_mod2.css">
</head>
<body>
    <h1>Megan Mosier CSD-430 Module 2 Assignment</h1>
    <p>Jane Austen's Pride and Prejudice book information</p>

    <h2>Field Descriptions</h2>
    <ul>
        <li><strong>Name or Title:</strong> The character or book name</li>
<li><strong>Key Fact:</strong> A quick fact such as birth order, role, or publication year</li>
<li><strong>Description:</strong> A short description of the character or book</li>
    </ul>

    <% for (int c = 0; c < categories.length; c++) { %>
        <h2><%= categories[c] %></h2>
        <table>
            <tr><th>Name or Title</th><th>Key Fact</th><th>Description</th></tr>
            <% for (int r = 0; r < records[c].length; r++) { %>
            <tr>
                <td><%= records[c][r][0] %></td>
                <td><%= records[c][r][1] %></td>
                <td><%= records[c][r][2] %></td>
            </tr>
            <% } %>
        </table>
    <% } %>
</body>
</html>