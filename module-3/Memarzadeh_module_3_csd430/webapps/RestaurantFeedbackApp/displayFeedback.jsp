<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Capture form data from request
    String fullName = request.getParameter("fullName");
    String email = request.getParameter("email");
    String visitDate = request.getParameter("visitDate");
    String rating = request.getParameter("rating");
    String comments = request.getParameter("comments");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Feedback Received</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styles.css">

</head>
<body>
    <h1>Thank You for Your Feedback!</h1>
    <p>Below is a summary of your submitted experience feedback.</p>

    <table border="1" cellpadding="5">
        <tr>
            <th>Field</th>
            <th>Your Input</th>
        </tr>
        <tr>
            <td>Full Name</td>
            <td><%= fullName %></td>
        </tr>
        <tr>
            <td>Email Address</td>
            <td><%= email %></td>
        </tr>
        <tr>
            <td>Date of Visit</td>
            <td><%= visitDate %></td>
        </tr>
        <tr>
            <td>Service Rating</td>
            <td><%= rating %></td>
        </tr>
        <tr>
            <td>Comments</td>
            <td><%= comments %></td>
        </tr>
    </table>
</body>
</html>
