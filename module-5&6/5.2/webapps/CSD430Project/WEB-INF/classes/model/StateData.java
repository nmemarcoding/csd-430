package model;

import java.io.Serializable;

/**
 * StateData — A model class representing a row in the database table.
 * Used to encapsulate state information in a structured, type-safe way.
 * 
 * Author: Nima Memarzadeh
 */
public class StateData implements Serializable {

    private static final long serialVersionUID = 123456789L;

    private int id;
    private String stateName;
    private String capitalCity;
    private int population;
    private float areaSqMiles;
    private String region;

    // No-arg constructor
    public StateData() {}

    // All-args constructor
    public StateData(int id, String stateName, String capitalCity, int population, float areaSqMiles, String region) {
        this.id = id;
        this.stateName = stateName;
        this.capitalCity = capitalCity;
        this.population = population;
        this.areaSqMiles = areaSqMiles;
        this.region = region;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }

    public String getCapitalCity() {
        return capitalCity;
    }

    public void setCapitalCity(String capitalCity) {
        this.capitalCity = capitalCity;
    }

    public int getPopulation() {
        return population;
    }

    public void setPopulation(int population) {
        this.population = population;
    }

    public float getAreaSqMiles() {
        return areaSqMiles;
    }

    public void setAreaSqMiles(float areaSqMiles) {
        this.areaSqMiles = areaSqMiles;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    // Optional: toString() for easy logging/debugging
    @Override
    public String toString() {
        return "StateData{" +
                "id=" + id +
                ", stateName='" + stateName + '\'' +
                ", capitalCity='" + capitalCity + '\'' +
                ", population=" + population +
                ", areaSqMiles=" + areaSqMiles +
                ", region='" + region + '\'' +
                '}';
    }
}
