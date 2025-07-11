<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, model.StateData" %>
<jsp:useBean id="myDB" class="database.DbBean" />
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
    String message = "";
    List<StateData> records = new ArrayList<StateData>();

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            message = myDB.delete(id);
        } catch (Exception e) {
            message = "Delete error: " + e.getMessage();
        }
    }

    try {
        records = myDB.readAll();
    } catch (Exception e) {
        message += "<br>Load error: " + e.getMessage();
    }
%>

<% if (!message.isEmpty()) { %>
    <p style="color: green; text-align: center;"><%= message %></p>
<% } %>

<% if (!records.isEmpty()) { %>
<form method="post" action="CRUD_DeleteDropdown.jsp">
    <label for="id">Select Record ID to Delete:</label>
    <select name="id" id="id" required>
        <option value="">-- Select ID --</option>
        <% for (StateData s : records) { %>
            <option value="<%= s.getId() %>">ID <%= s.getId() %> - <%= s.getStateName() %></option>
        <% } %>
    </select>
    <input type="submit" value="Delete Record">
</form>
<% } else { %>
    <p style="color: red; text-align: center;">No records available to delete.</p>
<% } %>

<h2>Current Records in nima_states_data</h2>
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
        <tr>
            <td colspan="6" style="text-align:center;">No records found.</td>
        </tr>
    <% } %>
    </tbody>
</table>

<%
    myDB.closeConnection();
%>

</body>
</html>
