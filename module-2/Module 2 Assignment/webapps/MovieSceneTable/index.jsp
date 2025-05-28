<!-- Name: Nima Memarzadeh -->
<!-- Date: 05/28/2025 -->
<!-- Module 2 Assignment - Java Scriptlet - Data Display -->

<!-- description: This JSP page dynamically generates a table displaying
key scenes from the movie "Inception" using a 2D array to hold scene data.
The page includes field descriptions and is styled with an external CSS file. -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // ------------------------------------------------------------
    // Define a 2D array to hold information about 5 movie scenes
    // Each row contains: Scene Number, Location, and Plot Highlight
    // ------------------------------------------------------------
    String[][] scenes = {
        {"1", "Paris", "Ariadne folds the city"},
        {"2", "Hotel Dream", "Gravity shifts in hallway fight"},
        {"3", "Mountain Fortress", "Final kick sequence"},
        {"4", "Limbo", "Dom reunites with Mal"},
        {"5", "Airport", "Dom returns to his children"}
    };
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inception Movie Scenes</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Link to external CSS file for styling -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Inception - Key Scenes Overview</h1>

    <!-- Overall data description -->
    <p>
        This page presents a selection of five impactful scenes from the movie <strong>Inception</strong>,
        directed by Christopher Nolan. Each scene is described by its location and the unique moment that
        makes it significant to the story's narrative or dream layering.
    </p>

    <!-- Field descriptions -->
    <h3>Field Descriptions:</h3>
    <ul>
        <li><strong>Scene #:</strong> Indicates the order of the scene in the story or dream hierarchy.</li>
        <li><strong>Location:</strong> Refers to the dream world or real-world setting where the scene occurs.</li>
        <li><strong>Plot Highlight:</strong> A key visual or emotional moment that defines the scene.</li>
    </ul>

    <!-- Table containing the dynamic data -->
    <h2>Scene Breakdown</h2>
<div class="table-wrapper">
    <table>
        <tr>
            <th>Scene #</th>
            <th>Location</th>
            <th>Plot Highlight</th>
        </tr>
        <%
            // Loop through each scene and create a table row dynamically
            for (int i = 0; i < scenes.length; i++) {
        %>
        <tr>
            <td><%= scenes[i][0] %></td>
            <td><%= scenes[i][1] %></td>
            <td><%= scenes[i][2] %></td>
        </tr>
        <%
            }
        %>
    </table>
</div>

</body>
</html>
