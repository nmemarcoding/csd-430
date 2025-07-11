<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, model.StateData" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>State Record Lookup</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

<h1>State Record Lookup</h1>
<p><a href="index.jsp">← Back to Index</a></p>

<jsp:useBean id="myDB" class="database.DbBean" scope="request" />
<p style="text-align: center;">Select a state ID from the dropdown below to view its details.</p>

<%
    List<StateData> records = myDB.readAll();
%>

<form method="post" action="StateLookup.jsp">
    <label for="id">Select State ID:</label>
    <select name="id" id="id" required>
        <%
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
    String selectedId = request.getParameter("id");
    StateData selectedState = null;
    boolean hasError = false;
    String errorMessage = "";

    if (selectedId != null && !selectedId.isEmpty()) {
        try {
            int id = Integer.parseInt(selectedId);
            selectedState = myDB.read(id);
        } catch (NumberFormatException e) {
            hasError = true;
            errorMessage = "Invalid ID format.";
        }
    }
%>

<% if (hasError) { %>
    <p style="color: red; text-align: center;"><%= errorMessage %></p>
<% } else if (selectedId != null && selectedState != null) { %>

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
    <p style="color: red; text-align: center;">No record found for ID <%= selectedId %>.</p>
<% } %>

<%
    myDB.closeConnection();
%>

</body>
</html>
