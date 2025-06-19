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

        <!-- Create instance of configuration bean -->
        <jsp:useBean id="setupDB" class="configBean.ConfigProject" />

        <%
                // Attempt to create table and store result message
                String resultMessage;
                try {
                        resultMessage = setupDB.createTable();
                } catch (Exception e) {
                        // Handle any errors that occur
                        resultMessage = "Error creating table: " + e.getMessage();
                } finally {
                        // Ensure connection is closed properly
                        setupDB.closeConnection();
                }
        %>

        <!-- Display result message with appropriate styling -->
        <div class="<%= resultMessage.startsWith("Error") ? "error" : "message" %>">
                <%= resultMessage %>
        </div>

</body>
</html>
