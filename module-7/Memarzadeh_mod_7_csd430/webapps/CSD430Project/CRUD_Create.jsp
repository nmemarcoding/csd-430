<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, model.StateData" %>
<!DOCTYPE html>
<!-- 
  CRUD_Create.jsp — Create Record for nima_states_data
  Author: Nima Memarzadeh
-->
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New State Record</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <h1>Create a New Record in <code>nima_states_data</code></h1>
    <p><a href="index.jsp">← Back to Index</a></p>

    <!-- Use the updated DbBean -->
    <jsp:useBean id="myDB" class="database.DbBean" />

    <!-- Always show the form -->
    <form method="post" action="CRUD_Create.jsp">
        <label for="state_name">State Name:</label>
        <input type="text" name="state_name" required>

        <label for="capital_city">Capital City:</label>
        <input type="text" name="capital_city" required>

        <label for="population">Population:</label>
        <input type="number" name="population" required>

        <label for="area">Area (sq miles):</label>
        <input type="number" step="0.1" name="area" required>

        <label for="region">Region:</label>
        <input type="text" name="region" required>

        <input type="submit" value="Create Record">
    </form>

    <%
        List<StateData> records = null;
        if (request.getMethod().equalsIgnoreCase("POST")) {
            try {
                String stateName = request.getParameter("state_name");
                String capitalCity = request.getParameter("capital_city");
                int population = Integer.parseInt(request.getParameter("population"));
                float area = Float.parseFloat(request.getParameter("area"));
                String region = request.getParameter("region");

                StateData newState = new StateData(0, stateName, capitalCity, population, area, region);
                myDB.createRecord(newState);

                out.println("<h3>New Record Added Successfully.</h3>");
            } catch (Exception e) {
    %>
                <p class="error">Error: <%= e.getMessage() %></p>
    <%
            }
        }

        // In both GET and POST, show the table of all records
        try {
            records = myDB.readAll();
    %>

    <h2>All Records in <code>nima_states_data</code></h2>
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
            <%
                for (StateData row : records) {
            %>
            <tr>
                <td><%= row.getId() %></td>
                <td><%= row.getStateName() %></td>
                <td><%= row.getCapitalCity() %></td>
                <td><%= row.getPopulation() %></td>
                <td><%= row.getAreaSqMiles() %></td>
                <td><%= row.getRegion() %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <%
        } catch (Exception e) {
    %>
        <p class="error">Error loading data: <%= e.getMessage() %></p>
    <%
        } finally {
            myDB.closeConnection();
        }
    %>

</body>
</html>
