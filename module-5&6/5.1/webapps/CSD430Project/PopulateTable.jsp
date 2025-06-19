<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!--
    PopulateTable.jsp — Insert sample records into nima_states_data
    Author: Nima Memarzadeh
-->
<html>
<head>
        <!-- Meta tags for proper rendering and character encoding -->
        <meta charset="UTF-8">
        <title>Populate Table - nima_states_data</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Link to external stylesheet -->
        <link rel="stylesheet" href="styles.css">
</head>
<body>

        <!-- Page header -->
        <h1>Populate Table: <code>nima_states_data</code></h1>
        <!-- Navigation link back to index -->
        <p><a href="index.jsp">← Back to Main Index</a></p>

        <!-- Use JavaBean to populate sample records -->
        <jsp:useBean id="setupDB" class="configBean.ConfigProject" />

        <%
                // Variable to store operation result message
                String resultMessage;
                try {
                        // Attempt to populate the table with sample data
                        resultMessage = setupDB.populateTable();
                } catch (Exception e) {
                        // Handle and display any errors that occur
                        resultMessage = "Error populating table: " + e.getMessage();
                } finally {
                        // Always close the database connection
                        setupDB.closeConnection();
                }
        %>

        <!-- Display result message with appropriate styling based on success/error -->
        <div class="<%= resultMessage.startsWith("Error") ? "error" : "message" %>">
                <%= resultMessage %>
        </div>

</body>
</html>
