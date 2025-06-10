// SceneBean.java
package scenes;

import java.io.Serializable;

public class SceneBean implements Serializable {
    private static final long serialVersionUID = 1L;

    private String sceneNumber;
    private String location;
    private String plotHighlight;
    private String dreamLevel;
    private String emotionalImpact;

    public SceneBean() {}

    public SceneBean(String sceneNumber, String location, String plotHighlight, String dreamLevel, String emotionalImpact) {
        this.sceneNumber = sceneNumber;
        this.location = location;
        this.plotHighlight = plotHighlight;
        this.dreamLevel = dreamLevel;
        this.emotionalImpact = emotionalImpact;
    }

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
