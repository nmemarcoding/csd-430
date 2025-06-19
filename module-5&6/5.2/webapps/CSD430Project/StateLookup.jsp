<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, model.StateData" %>

<!DOCTYPE html>
<!--
    StateLookup.jsp — Look up individual state records by ID
    Author: Nima Memarzadeh
-->
<html>
<head>
    <meta charset="UTF-8">
    <title>State Record Lookup</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

<jsp:useBean id="myDB" class="database.DbBean" scope="request" />
<h1>State Record Lookup</h1>
<p style="text-align: center;">Select a state ID from the dropdown below to view its details.</p>
<!-- Navigation link back to index -->
<p><a href="index.jsp">← Back to Index</a></p>

<%
    // Get all state records for the dropdown selector
    List<StateData> records = myDB.readAll();
%>

<!-- Form to select state by ID -->
<form method="post" action="StateLookup.jsp">
    <label for="id">Select State ID:</label>
    <select name="id" id="id" required>
        <%
            // Create dropdown options from all available records
            for (StateData record : records) {
        %>
            <option value="<%= record.getId() %>"><%= record.getId() %></option>
        <%
            }
        %>
    </select>
    <input type="submit" value="Show Record">
</form>

<%
    // Process the form submission
    String selectedId = request.getParameter("id");
    StateData selectedState = null;
    boolean hasError = false;
    String errorMessage = "";

    if (selectedId != null && !selectedId.isEmpty()) {
        try {
            // Convert ID to integer and fetch the corresponding record
            int id = Integer.parseInt(selectedId);
            selectedState = myDB.read(id);
        } catch (NumberFormatException e) {
            // Handle invalid ID format
            hasError = true;
            errorMessage = "Invalid ID format.";
        }
    }
%>

<% if (hasError) { %>
    <!-- Display error message if ID is invalid -->
    <p style="color: red; text-align: center;"><%= errorMessage %></p>
<% } else if (selectedId != null && selectedState != null) { %>

<!-- Display the selected state record -->
<h3>State Details</h3>
<p style="text-align: center;">Below is the data record for the selected state ID.</p>
<table class="styled-table">
    <thead>
    <tr>
        <th>ID</th>
        <th>State Name</th>
        <th>Capital City</th>
        <th>Population</th>
        <th>Area (sq mi)</th>
        <th>Region</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><%= selectedState.getId() %></td>
        <td><%= selectedState.getStateName() %></td>
        <td><%= selectedState.getCapitalCity() %></td>
        <td><%= selectedState.getPopulation() %></td>
        <td><%= selectedState.getAreaSqMiles() %></td>
        <td><%= selectedState.getRegion() %></td>
    </tr>
    </tbody>
</table>

<% } else if (selectedId != null) { %>
    <!-- Message for when no record matches the selected ID -->
    <p style="color: red; text-align: center;">No record found for ID <%= selectedId %>.</p>
<% } %>

<%
    // Always close the database connection
    myDB.closeConnection();
%>

</body>
</html>
