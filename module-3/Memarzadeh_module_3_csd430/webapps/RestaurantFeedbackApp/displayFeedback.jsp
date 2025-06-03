<!-- Name: Nima Memarzadeh -->
<!-- Date: 06/04/2025 -->
<!-- Module 3 Assignment - Working with JSP Forms -->

<!-- This JSP page displays the feedback submitted by the user -->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Capture form data from request
    String fullName = request.getParameter("fullName");     // Gets the customer's full name from the form
    String email = request.getParameter("email");           // Gets the customer's email address
    String visitDate = request.getParameter("visitDate");   // Gets the date when customer visited
    String rating = request.getParameter("rating");         // Gets the service rating provided by customer
    String comments = request.getParameter("comments");     // Gets additional feedback comments
%>
<!DOCTYPE html>
<html>
<head>
    <title>Feedback Received</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">  <!-- Ensures responsive design -->
    <link rel="stylesheet" type="text/css" href="styles.css">  <!-- Links to external CSS file -->

</head>
<body>
    <h1>Thank You for Your Feedback!</h1>  <!-- Page heading -->
    <p>Below is a summary of your submitted experience feedback.</p>  <!-- Introductory text -->

    <!-- Table to display feedback summary -->
    <table border="1" cellpadding="5">
        <tr>
            <th>Field</th>  <!-- Header column for field names -->
            <th>Your Input</th>  <!-- Header column for user input -->
        </tr>
        <tr>
            <td>Full Name</td>
            <td><%= fullName %></td>  <!-- Displays submitted name -->
        </tr>
        <tr>
            <td>Email Address</td>
            <td><%= email %></td>  <!-- Displays submitted email -->
        </tr>
        <tr>
            <td>Date of Visit</td>
            <td><%= visitDate %></td>  <!-- Displays submitted visit date -->
        </tr>
        <tr>
            <td>Service Rating</td>
            <td><%= rating %></td>  <!-- Displays submitted rating -->
        </tr>
        <tr>
            <td>Comments</td>
            <td><%= comments %></td>  <!-- Displays submitted comments -->
        </tr>
    </table>
</body>
</html>
