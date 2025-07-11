<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, model.StateData" %>
<!DOCTYPE html>
<!--
  CRUD_UpdateDropdown.jsp — Single-page update with dropdown and full JSP scriptlet/HTML separation
  Author: Nima Memarzadeh
-->
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Record (Dropdown)</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<h1>Update Record Using Dropdown</h1>
<p><a href="index.jsp">← Back to Index</a></p>

<jsp:useBean id="myDB" class="database.DbBean" />

<%
    List<StateData> allStates = new ArrayList<>();
    StateData selectedState = null;
    String message = "";
    boolean dbAvailable = true;

    try {
        // First try to connect and get all states
        allStates = myDB.readAll();
    } catch (Exception e) {
        dbAvailable = false;
        message = "Unable to connect to the database. Please try again later.<br>Error: " + e.getMessage();
    }

    if (dbAvailable) {
        if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("submitted") != null) {
            try {
                StateData state = new StateData();
                state.setId(Integer.parseInt(request.getParameter("id")));
                state.setStateName(request.getParameter("state_name"));
                state.setCapitalCity(request.getParameter("capital_city"));
                state.setPopulation(Integer.parseInt(request.getParameter("population")));
                state.setAreaSqMiles(Float.parseFloat(request.getParameter("area")));
                state.setRegion(request.getParameter("region"));

                message = myDB.updateRecord(state);
                selectedState = myDB.read(state.getId());
                
                // Refresh the allStates list after update
                allStates = myDB.readAll();

            } catch (Exception e) {
                message = "Error: " + e.getMessage();
            }
        } else if (request.getParameter("id") != null && request.getParameter("submitted") == null) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                selectedState = myDB.read(id);
            } catch (Exception e) {
                message = "Error loading record: " + e.getMessage();
            }
        }
    }

    // Close connection at the end
    myDB.closeConnection();
%>

<% if (!dbAvailable) { %>
    <p style="color:red; text-align:center;"><%= message %></p>
<% } else { %>

<!-- Dropdown to select ID (auto-submit with native HTML) -->
<form method="get" action="CRUD_UpdateDropdown.jsp">
    <label for="id">Select Record ID to Edit:</label>
    <select name="id" id="id" required onchange="this.form.submit()">
        <option value="">-- Select ID --</option>
        <%
            for (StateData state : allStates) {
                int sid = state.getId();
                String sname = state.getStateName();
                boolean isSelected = (selectedState != null && selectedState.getId() == sid);
        %>
            <option value="<%= sid %>" <%= isSelected ? "selected" : "" %>>ID <%= sid %> - <%= sname %></option>
        <%
            }
        %>
    </select>
</form>

<% if (selectedState != null && request.getParameter("submitted") == null) { %>
<!-- Update form with pre-filled values -->
<form method="post" action="CRUD_UpdateDropdown.jsp">
    <input type="hidden" name="submitted" value="true">

    <label>ID (Read-only):</label>
    <input type="text" value="<%= selectedState.getId() %>" readonly>
    <input type="hidden" name="id" value="<%= selectedState.getId() %>">

    <label>State Name:</label>
    <input type="text" name="state_name" value="<%= selectedState.getStateName() %>" required>

    <label>Capital City:</label>
    <input type="text" name="capital_city" value="<%= selectedState.getCapitalCity() %>" required>

    <label>Population:</label>
    <input type="number" name="population" value="<%= selectedState.getPopulation() %>" required>

    <label>Area (sq miles):</label>
    <input type="number" step="0.1" name="area" value="<%= selectedState.getAreaSqMiles() %>" required>

    <label>Region:</label>
    <input type="text" name="region" value="<%= selectedState.getRegion() %>" required>

    <input type="submit" value="Update Record">
</form>
<% } %>

<% if (!message.isEmpty()) { %>
    <h3><%= message %></h3>
<% } %>

<% if (selectedState != null && request.getParameter("submitted") != null) { %>
    <h2>Updated Record</h2>
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
<% } %>

<!-- Show all records table (always visible) -->
<h2>All State Records</h2>
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
        <% for (StateData state : allStates) { %>
            <tr>
                <td><%= state.getId() %></td>
                <td><%= state.getStateName() %></td>
                <td><%= state.getCapitalCity() %></td>
                <td><%= state.getPopulation() %></td>
                <td><%= state.getAreaSqMiles() %></td>
                <td><%= state.getRegion() %></td>
            </tr>
        <% } %>
    </tbody>
</table>

<% } %> <!-- End if DB is available -->

</body>
</html>
