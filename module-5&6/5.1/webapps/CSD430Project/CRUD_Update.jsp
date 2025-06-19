<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, model.StateData" %>
<!DOCTYPE html>
<!--
  CRUD_Update.jsp — Update Record in nima_states_data using StateData bean
  Author: Nima Memarzadeh
-->
<html>
<head>
    <meta charset="UTF-8">
    <title>Update State Record</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <h1>Update a Record in <code>nima_states_data</code></h1>
    <p><a href="index.jsp">← Back to Index</a></p>

    <jsp:useBean id="myDB" class="database.DbBean" />

    <%
        String message = "";
        StateData updatedState = null;
        List<StateData> allStates = new ArrayList<>();

        if (request.getMethod().equalsIgnoreCase("POST")) {
            try {
                // Create StateData object from form input
                StateData state = new StateData();
                state.setId(Integer.parseInt(request.getParameter("id")));
                state.setStateName(request.getParameter("state_name"));
                state.setCapitalCity(request.getParameter("capital_city"));
                state.setPopulation(Integer.parseInt(request.getParameter("population")));
                state.setAreaSqMiles(Float.parseFloat(request.getParameter("area")));
                state.setRegion(request.getParameter("region"));

                // Perform the update
                message = myDB.updateRecord(state);

                // Read updated record
                updatedState = myDB.read(state.getId());

                // Read all records
                allStates = myDB.readAll();

            } catch (Exception e) {
                message = "Error: " + e.getMessage();
            } finally {
                myDB.closeConnection();
            }
        }
    %>

    <!-- Update Form -->
    <form method="post" action="CRUD_Update.jsp">
        <label for="id">ID of Record to Update:</label>
        <input type="number" id="id" name="id" required>

        <label for="state_name">New State Name:</label>
        <input type="text" id="state_name" name="state_name" required>

        <label for="capital_city">New Capital City:</label>
        <input type="text" id="capital_city" name="capital_city" required>

        <label for="population">New Population:</label>
        <input type="number" id="population" name="population" required>

        <label for="area">New Area (sq miles):</label>
        <input type="number" step="0.1" id="area" name="area" required>

        <label for="region">New Region:</label>
        <input type="text" id="region" name="region" required>

        <input type="submit" value="Update Record">
    </form>

    <% if (!message.isEmpty()) { %>
        <h3><%= message %></h3>
    <% } %>

    <% if (updatedState != null) { %>
        <h4>Updated Record:</h4>
        <table class="styled-table">
            <tr>
                <th>ID</th>
                <th>State</th>
                <th>Capital</th>
                <th>Population</th>
                <th>Area</th>
                <th>Region</th>
            </tr>
            <tr>
                <td><%= updatedState.getId() %></td>
                <td><%= updatedState.getStateName() %></td>
                <td><%= updatedState.getCapitalCity() %></td>
                <td><%= updatedState.getPopulation() %></td>
                <td><%= updatedState.getAreaSqMiles() %></td>
                <td><%= updatedState.getRegion() %></td>
            </tr>
        </table>
    <% } %>

    <% if (!allStates.isEmpty()) { %>
        <h4>All Records:</h4>
        <table class="styled-table">
            <tr>
                <th>ID</th>
                <th>State</th>
                <th>Capital</th>
                <th>Population</th>
                <th>Area</th>
                <th>Region</th>
            </tr>
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
        </table>
    <% } %>

</body>
</html>
