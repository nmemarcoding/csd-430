
// description: This JavaBean class represents a scene from the movie Inception, encapsulating
//  details such as scene number, location, plot highlight, dream level, and 
// emotional impact. It implements Serializable for use in JSP pages.
// File: webapps/JavaBeanJSPApp/WEB-INF/classes/scenes/SceneBean.java

package scenes;

import java.io.Serializable;

// JavaBean for storing individual scene information from the Inception movie
public class SceneBean implements Serializable {
    private static final long serialVersionUID = 1L; // Required for Serializable

    // Scene attributes
    private String sceneNumber;     // Identifier for the scene
    private String location;        // Where the scene takes place
    private String plotHighlight;   // Key moment in the scene
    private String dreamLevel;      // Dream depth level in the movie
    private String emotionalImpact; // Emotional effect of the scene

    // Default constructor required for JavaBeans
    public SceneBean() {}

    // Constructor with all fields
    public SceneBean(String sceneNumber, String location, String plotHighlight, String dreamLevel, String emotionalImpact) {
        this.sceneNumber = sceneNumber;
        this.location = location;
        this.plotHighlight = plotHighlight;
        this.dreamLevel = dreamLevel;
        this.emotionalImpact = emotionalImpact;
    }

    // Getter and setter methods for all properties
    public String getSceneNumber() { return sceneNumber; }
    public void setSceneNumber(String sceneNumber) { this.sceneNumber = sceneNumber; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getPlotHighlight() { return plotHighlight; }
    public void setPlotHighlight(String plotHighlight) { this.plotHighlight = plotHighlight; }

    public String getDreamLevel() { return dreamLevel; }
    public void setDreamLevel(String dreamLevel) { this.dreamLevel = dreamLevel; }

    public String getEmotionalImpact() { return emotionalImpact; }
    public void setEmotionalImpact(String emotionalImpact) { this.emotionalImpact = emotionalImpact; }
}
