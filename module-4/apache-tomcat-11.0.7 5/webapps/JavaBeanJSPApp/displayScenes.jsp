<%@ page import="scenes.SceneBean" %>
<%@ page import="java.util.*" %>
<%
    // Prepare a list of scene data using SceneBean
    ArrayList<SceneBean> scenes = new ArrayList<SceneBean>();
    scenes.add(new SceneBean("1", "Paris", "Ariadne folds the city", "Level 1", "Mind-bending"));
    scenes.add(new SceneBean("2", "Hotel Dream", "Gravity shifts", "Level 2", "Tense"));
    scenes.add(new SceneBean("3", "Mountain Fortress", "Final kick", "Level 3", "Action-packed"));
    scenes.add(new SceneBean("4", "Limbo", "Dom reunites with Mal", "Limbo", "Emotional"));
    scenes.add(new SceneBean("5", "Airport", "Dom sees his children", "Reality?", "Closure"));
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inception Scene Overview</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="container">
    <h1>Inception - Key Scenes</h1>

    <p>This table displays significant scenes from the movie <strong>Inception</strong>. Each scene is described with its location, narrative moment, dream depth, and emotional resonance.</p>

    <h3>Field Descriptions:</h3>
    <ul>
        <li><strong>Scene #:</strong> Sequence order of the scene</li>
        <li><strong>Location:</strong> Place of the scene (real or dream)</li>
        <li><strong>Plot Highlight:</strong> Key moment or action</li>
        <li><strong>Dream Level:</strong> Layer of dream or reality</li>
        <li><strong>Emotional Impact:</strong> Intended emotional takeaway</li>
    </ul>

    <h2>Scene Breakdown</h2>
    <div class="table-wrapper">
        <table>
            <tr>
                <th>Scene #</th>
                <th>Location</th>
                <th>Plot Highlight</th>
                <th>Dream Level</th>
                <th>Emotional Impact</th>
            </tr>
            <%
                for (SceneBean scene : scenes) {
            %>
            <tr>
                <td><%= scene.getSceneNumber() %></td>
                <td><%= scene.getLocation() %></td>
                <td><%= scene.getPlotHighlight() %></td>
                <td><%= scene.getDreamLevel() %></td>
                <td><%= scene.getEmotionalImpact() %></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</div>
</body>
</html>
