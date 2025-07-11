<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, model.StateData" %>
<!DOCTYPE html>
<!--
  CRUD_Read.jsp — Read All Records for nima_states_data
  Author: Nima Memarzadeh
-->
<html>
<head>
    <meta charset="UTF-8">
    <title>Read All State Records</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <h1>All Records in <code>nima_states_data</code></h1>
    <p><a href="index.jsp">← Back to Index</a></p>

    <!-- Use JavaBean to get all records -->
    <jsp:useBean id="myDB" class="database.DbBean" />

    <%
        List<StateData> records = new ArrayList<>();
        String errorMessage = null;

        try {
            records = myDB.readAll();
        } catch (Exception e) {
            errorMessage = e.getMessage();
        } finally {
            myDB.closeConnection();
        }
    %>

    <% if (errorMessage != null) { %>
        <p class="error">Error: <%= errorMessage %></p>

    <% } else if (!records.isEmpty()) { %>
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
        <p>No records found.</p>
    <% } %>

</body>
</html>
