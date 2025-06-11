<%-- 
    Description:
    This JSP file creates and displays a list of key scenes from the movie Inception using JavaBeans.
    It defines a 2D array of scene data, converts each row into a SceneBean, and stores them in a list.
    During rendering, each SceneBean is placed into request scope and displayed in an HTML table 
    using <jsp:useBean> and <jsp:getProperty> tags.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.*, scenes.SceneBean" %>

<%
    // Step 1: Create and populate the list of SceneBean objects
    List<SceneBean> scenes = new ArrayList<>();
    // Define scene data as a 2D array
    String[][] data = {
        {"1", "Paris", "Ariadne folds the city", "Level 1", "Mind-bending"},
        {"2", "Hotel Dream", "Gravity shifts in hallway fight", "Level 2", "Tense"},
        {"3", "Mountain Fortress", "Final kick sequence", "Level 3", "Adrenaline-filled"},
        {"4", "Limbo", "Dom reunites with Mal", "Limbo", "Emotional"},
        {"5", "Airport", "Dom returns to his children", "Reality?", "Closure"}
    };

    // Convert each data row into a SceneBean object
    for (int i = 0; i < data.length; i++) {
        SceneBean s = new SceneBean();
        s.setSceneNumber(data[i][0]);
        s.setLocation(data[i][1]);
        s.setPlotHighlight(data[i][2]);
        s.setDreamLevel(data[i][3]);
        s.setEmotionalImpact(data[i][4]);
        scenes.add(s);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inception Scene Overview</title>
    <link rel="stylesheet" href="styles.css"> <!-- External stylesheet for page formatting -->
</head>
<body>

<h1>Inception - Key Scenes</h1>
<p>This table shows several major scenes from the movie <strong>Inception</strong>, including location, dream level, and emotional impact.</p>

<!-- Explanatory section for table fields -->
<h3>Field Descriptions:</h3>
<ul>
    <li><strong>Scene #:</strong> Order of the scene</li>
    <li><strong>Location:</strong> Where the scene occurs</li>
    <li><strong>Plot Highlight:</strong> Key moment in the scene</li>
    <li><strong>Dream Level:</strong> Depth of dream</li>
    <li><strong>Emotional Impact:</strong> Viewer/character feeling</li>
</ul>

<!-- Table to display the scene data -->
<table>
    <tr>
        <th>Scene #</th>
        <th>Location</th>
        <th>Plot Highlight</th>
        <th>Dream Level</th>
        <th>Emotional Impact</th>
    </tr>

<%
    // Loop through each scene and display its properties
    for (SceneBean s : scenes) {
        // Set the current bean into request scope so we can use jsp:getProperty
        request.setAttribute("bean", s);
%>
    <jsp:useBean id="bean" class="scenes.SceneBean" scope="request" />
    <tr>
        <td><jsp:getProperty name="bean" property="sceneNumber" /></td>
        <td><jsp:getProperty name="bean" property="location" /></td>
        <td><jsp:getProperty name="bean" property="plotHighlight" /></td>
        <td><jsp:getProperty name="bean" property="dreamLevel" /></td>
        <td><jsp:getProperty name="bean" property="emotionalImpact" /></td>
    </tr>
<%
    }
%>
</table>

</body>
</html>
