<%--
    File: mosier_mod4.jsp
    Author: Megan Mosier
    Course: CSD-430
    Assignment: Module 4
    Date: November 12, 2026
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, java.util.List, beans.CharacterBean" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pride and Prejudice Characters</title>
    <style>
        body { font-family: Georgia, serif; margin: 40px; background: #faf7f2; color: #333; }
        h1 { text-align: center; color: #5b3a29; }
        .intro { max-width: 800px; margin: 0 auto 20px; text-align: center; }
        table { border-collapse: collapse; width: 90%; margin: 20px auto; background: #fff; }
        caption { font-weight: bold; padding: 8px; font-size: 1.1em; }
        th, td { border: 1px solid #c9b8a6; padding: 10px; text-align: left; }
        th { background: #5b3a29; color: #fff; }
        tr:nth-child(even) { background: #f3ece3; }
        .fields { width: 90%; margin: 20px auto; }
        .footer { text-align: center; font-style: italic; }
    </style>
</head>
<body>

<%
    List<CharacterBean> characters = new ArrayList<>();
    characters.add(new CharacterBean(1, "Elizabeth Bennet", "Bennet Family", "Protagonist",
        "Witty and independent second daughter of the Bennet family."));
    characters.add(new CharacterBean(2, "Jane Bennet", "Bennet Family", "Eldest Sister",
        "Kind and gentle eldest Bennet daughter who falls for Mr. Bingley."));
    characters.add(new CharacterBean(3, "Lydia Bennet", "Bennet Family", "Youngest Sister",
        "Impulsive youngest sister who elopes with Mr. Wickham."));
    characters.add(new CharacterBean(4, "Fitzwilliam Darcy", "Suitors", "Love Interest",
        "Wealthy and proud owner of Pemberley who wins Elizabeth's heart."));
    characters.add(new CharacterBean(5, "Charles Bingley", "Suitors", "Friend of Darcy",
        "Cheerful bachelor who rents Netherfield Park."));
    characters.add(new CharacterBean(6, "William Collins", "Suitors", "Clergyman",
        "Pompous cousin of the Bennets who proposes to Elizabeth."));
    characters.add(new CharacterBean(7, "George Wickham", "Other Characters", "Militia Officer",
        "Charming officer with a deceitful past."));
%>

    <h1>Pride and Prejudice Character Directory</h1>
    <p class="intro">
        This page uses a JavaBean (<code>CharacterBean</code>) to store data about
        characters from Jane Austen's novel. Each row below is one record, and each
        column is one field of the bean.
    </p>

    <div class="fields">
        <h3>Field Descriptions</h3>
        <ul>
            <li><strong>ID:</strong> A unique number for each character.</li>
            <li><strong>Name:</strong> The character's full name.</li>
            <li><strong>Category:</strong> The group the character belongs to.</li>
            <li><strong>Role:</strong> The character's part in the story.</li>
            <li><strong>Description:</strong> A short summary of the character.</li>
        </ul>
    </div>

    <table>
        <caption>Characters from Pride and Prejudice</caption>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Role</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
<%
            for (CharacterBean c : characters) {
%>
            <tr>
                <td><%= c.getId() %></td>
                <td><%= c.getName() %></td>
                <td><%= c.getCategory() %></td>
                <td><%= c.getRole() %></td>
                <td><%= c.getDescription() %></td>
            </tr>
<%
    }
%>
        </tbody>
    </table>

    <p class="footer">Total records displayed: <%= characters.size() %></p>

</body>
</html>