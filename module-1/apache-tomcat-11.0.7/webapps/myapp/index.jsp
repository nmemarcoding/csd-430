<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My JSP Assignment Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        .info-box {
            background-color: #f9f9f9;
            padding: 20px;
            border-left: 4px solid #4CAF50;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

    <h1>Welcome to My JSP Assignment Page</h1>

    <div class="info-box">
        <%
            String studentName = "Nima Memarzadeh";
            java.util.Date now = new java.util.Date();
            int year = now.getYear() + 1900; // because getYear() returns years since 1900
        %>

        <p><strong>Student Name:</strong> <%= studentName %></p>
        <p><strong>Today's Date:</strong> <%= now %></p>
        <p><strong>Current Year:</strong> <%= year %></p>
        <p><strong>JSP is running successfully!</strong></p>
    </div>

</body>
</html>
