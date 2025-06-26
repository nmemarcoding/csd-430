<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!--
  PopulateTable.jsp — Insert sample records into nima_states_data
  Author: Nima Memarzadeh
-->
<html>
<head>
    <meta charset="UTF-8">
    <title>Populate Table - nima_states_data</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <h1>Populate Table: <code>nima_states_data</code></h1>
    <p><a href="index.jsp">← Back to Main Index</a></p>

    <!-- Use JavaBean to populate sample records -->
    <jsp:useBean id="setupDB" class="configBean.ConfigProject" />

    <%
        String resultMessage;
        try {
            resultMessage = setupDB.populateTable();
        } catch (Exception e) {
            resultMessage = "Error populating table: " + e.getMessage();
        } finally {
            setupDB.closeConnection();
        }
    %>

    <!-- Output the result to the page -->
    <div class="<%= resultMessage.startsWith("Error") ? "error" : "message" %>">
        <%= resultMessage %>
    </div>

</body>
</html>
