<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, model.StateData" %>
<!DOCTYPE html>
<!--
    CRUD_Read.jsp — Read All Records for nima_states_data
    Author: Nima Memarzadeh
-->
<html>
<head>
        <!-- Meta tags for proper rendering and character encoding -->
        <meta charset="UTF-8">
        <title>Read All State Records</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles.css">
</head>
<body>

        <!-- Page header and navigation -->
        <h1>All Records in <code>nima_states_data</code></h1>
        <p><a href="index.jsp">← Back to Index</a></p>

        <!-- Database connection via JavaBean -->
        <jsp:useBean id="myDB" class="database.DbBean" />

        <%
                // Initialize variables for data and error handling
                List<StateData> records = new ArrayList<>();
                String errorMessage = null;

                try {
                        // Fetch all state records from database
                        records = myDB.readAll();
                } catch (Exception e) {
                        // Capture any database errors
                        errorMessage = e.getMessage();
                } finally {
                        // Always close the database connection
                        myDB.closeConnection();
                }
        %>

        <% if (errorMessage != null) { %>
                <!-- Display error message if database operation failed -->
                <p class="error">Error: <%= errorMessage %></p>

        <% } else if (!records.isEmpty()) { %>
                <!-- Display results in a table if records exist -->
                <table class="styled-table">
                        <tr>
                                <th>ID</th>
                                <th>State</th>
                                <th>Capital</th>
                                <th>Population</th>
                                <th>Area</th>
                                <th>Region</th>
                        </tr>

                        <% for (StateData state : records) { %>
                                <!-- Iterate through each state record -->
                                <tr>
                                        <td><%= state.getId() %></td>
                                        <td><%= state.getStateName() %></td>
                                        <td><%= state.getCapitalCity() %></td>
                                        <td><%= state.getPopulation() %></td>
                                        <td><%= state.getAreaSqMiles() %></td>
                                        <td><%= state.getRegion() %></td>
                                </tr>
                        <% } %>
                </table>

        <% } else { %>
                <!-- Message displayed when no records are found -->
                <p>No records found.</p>
        <% } %>

</body>
</html>
