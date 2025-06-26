<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="configBean.ConfigProject" %>

<!DOCTYPE html>
<!-- 
  CreateTable.jsp — CSD430 States Project
  Author: Nima Memarzadeh
-->
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Table - nima_states_data</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <h1>Create Table: <code>nima_states_data</code></h1>
    <p><a href="index.jsp">← Back to Index</a></p>

    <jsp:useBean id="setupDB" class="configBean.ConfigProject" />

    <%
        String resultMessage;
        try {
            resultMessage = setupDB.createTable();
        } catch (Exception e) {
            resultMessage = "Error creating table: " + e.getMessage();
        } finally {
            setupDB.closeConnection();
        }
    %>

    <!-- Display result -->
    <div class="<%= resultMessage.startsWith("Error") ? "error" : "message" %>">
        <%= resultMessage %>
    </div>

</body>
</html>
