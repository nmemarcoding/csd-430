<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, model.StateData" %>
<jsp:useBean id="myDB" class="database.DbBean" /> <!-- Initialize database connection bean -->
<!DOCTYPE html>
<!--
    CRUD_DeleteDropdown.jsp — Project Part 4
    Author: Nima Memarzadeh
-->
<html>
<head>
        <meta charset="UTF-8">
        <title>Delete Record with Dropdown</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles.css">
</head>
<body>

<h1>Delete State Record (Dropdown)</h1>
<p><a href="index.jsp">← Back to Index</a></p>
<p>This form shows all state records and lets you delete one by selecting its ID from the dropdown.</p>

<%
        // Initialize variables
        String message = "";
        List<StateData> records = new ArrayList<StateData>();

        // Check if form was submitted (POST request)
        if ("POST".equalsIgnoreCase(request.getMethod())) {
                try {
                        // Get the ID from the form and delete the record
                        int id = Integer.parseInt(request.getParameter("id"));
                        message = myDB.delete(id);
                } catch (Exception e) {
                        // Handle delete errors
                        message = "Delete error: " + e.getMessage();
                }
        }

        try {
                // Load all records from database
                records = myDB.readAll();
        } catch (Exception e) {
                // Handle database read errors
                message += "<br>Load error: " + e.getMessage();
        }
%>

<% if (!message.isEmpty()) { %>
        <!-- Display success/error message if any -->
        <p style="color: green; text-align: center;"><%= message %></p>
<% } %>

<% if (!records.isEmpty()) { %>
<!-- Display dropdown form if records exist -->
<form method="post" action="CRUD_DeleteDropdown.jsp">
        <label for="id">Select Record ID to Delete:</label>
        <select name="id" id="id" required>
                <option value="">-- Select ID --</option>
                <% for (StateData s : records) { %>
                        <!-- Create an option for each record -->
                        <option value="<%= s.getId() %>">ID <%= s.getId() %> - <%= s.getStateName() %></option>
                <% } %>
        </select>
        <input type="submit" value="Delete Record">
</form>
<% } else { %>
        <!-- Display message if no records exist -->
        <p style="color: red; text-align: center;">No records available to delete.</p>
<% } %>

<h2>Current Records in nima_states_data</h2>
<!-- Table to display all current records -->
<table class="styled-table">
        <thead>
                <tr>
                        <th>ID</th>
                        <th>State</th>
                        <th>Capital</th>
                        <th>Population</th>
                        <th>Area</th>
                        <th>Region</th>
                </tr>
        </thead>
        <tbody>
        <% if (!records.isEmpty()) {
                     for (StateData s : records) { %>
                <!-- Display each record as a table row -->
                <tr>
                        <td><%= s.getId() %></td>
                        <td><%= s.getStateName() %></td>
                        <td><%= s.getCapitalCity() %></td>
                        <td><%= s.getPopulation() %></td>
                        <td><%= s.getAreaSqMiles() %></td>
                        <td><%= s.getRegion() %></td>
                </tr>
        <%     }
             } else { %>
                <!-- Display message if no records found -->
                <tr>
                        <td colspan="6" style="text-align:center;">No records found.</td>
                </tr>
        <% } %>
        </tbody>
</table>

<%
        // Close the database connection
        myDB.closeConnection();
%>

</body>
</html>
