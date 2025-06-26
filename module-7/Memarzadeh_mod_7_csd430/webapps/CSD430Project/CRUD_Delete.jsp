<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, model.StateData" %>
<!DOCTYPE html>
<!--
  CRUD_Delete.jsp — Delete State Record for CSD430
  Author: Nima Memarzadeh
-->
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete State Record</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <h1>Delete a Record from <code>nima_states_data</code></h1>
    <p><a href="index.jsp">← Back to Index</a></p>

    <!-- JavaBean to interact with DB -->
    <jsp:useBean id="myDB" class="database.DbBean" />

    <%
        if (request.getMethod().equalsIgnoreCase("GET")) {
    %>

    <!-- Deletion form -->
    <form method="post" action="CRUD_Delete.jsp">
        <label for="id">Enter ID of Record to Delete:</label>
        <input type="number" name="id" required>
        <input type="submit" value="Delete Record">
    </form>

    <%
        } else if (request.getMethod().equalsIgnoreCase("POST")) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String deleteMsg = myDB.delete(id);
                List<StateData> records = myDB.readAll();
    %>

    <!-- Show delete result -->
    <h3><%= deleteMsg %></h3>

    <% if (!records.isEmpty()) { %>
        <h4>Remaining Records:</h4>
        <table class="styled-table">
            <tr>
                <th>ID</th>
                <th>State</th>
                <th>Capital</th>
                <th>Population</th>
                <th>Area</th>
                <th>Region</th>
            </tr>

            <%
                for (StateData state : records) {
            %>
            <tr>
                <td><%= state.getId() %></td>
                <td><%= state.getStateName() %></td>
                <td><%= state.getCapitalCity() %></td>
                <td><%= state.getPopulation() %></td>
                <td><%= state.getAreaSqMiles() %></td>
                <td><%= state.getRegion() %></td>
            </tr>
            <%
                }
            %>
        </table>
    <% } %>

    <%
            } catch (Exception e) {
    %>
        <p class="error">Error: <%= e.getMessage() %></p>
    <%
            } finally {
                myDB.closeConnection();
            }
        }
    %>

</body>
</html>
