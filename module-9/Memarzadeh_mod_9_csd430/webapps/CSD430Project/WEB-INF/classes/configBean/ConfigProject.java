package configBean;

import model.StateData;

import java.io.Serializable;
import java.sql.*;
import java.util.List;

/**
 * ConfigProject class handles table setup and population
 * for the CSD430 project using the StateData model.
 *
 * Author: Nima Memarzadeh
 */
public class ConfigProject implements Serializable {

    private static final long serialVersionUID = 111222333444L;

    private Connection connection;

    /**
     * Constructor initializes JDBC connection for MySQL
     */
    public ConfigProject() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/CSD430";
            connection = DriverManager.getConnection(url, "student1", "pass");
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Connection Error: " + e.getMessage());
        }
    }

    /**
     * Drops and recreates the nima_states_data table
     */
    public String createTable() {
        StringBuilder response = new StringBuilder();
        String dropSQL = "DROP TABLE IF EXISTS nima_states_data";
        String createSQL = "CREATE TABLE nima_states_data (" +
                           "id INT AUTO_INCREMENT PRIMARY KEY, " +
                           "state_name VARCHAR(100), " +
                           "capital_city VARCHAR(100), " +
                           "population INT, " +
                           "area_sq_miles FLOAT, " +
                           "region VARCHAR(50))";

        try (Statement stmt = connection.createStatement()) {
            stmt.executeUpdate(dropSQL);
            response.append("Table nima_states_data dropped if existed.<br>");
            stmt.executeUpdate(createSQL);
            response.append("Table nima_states_data created.<br>");
        } catch (SQLException e) {
            response.append("Failed to create table: ").append(e.getMessage()).append("<br>");
        }

        return response.toString();
    }

    /**
     * Inserts 10 sample records into nima_states_data
     */
    public String populateTable() {
        StringBuilder response = new StringBuilder();
        String insertSQL = "INSERT INTO nima_states_data(state_name, capital_city, population, area_sq_miles, region) VALUES (?, ?, ?, ?, ?)";

        // Sample data
        List<StateData> sampleStates = List.of(
            new StateData(0, "California", "Sacramento", 39538223, 163696, "West"),
            new StateData(0, "Texas", "Austin", 29145505, 268596, "South"),
            new StateData(0, "Florida", "Tallahassee", 21538187, 65758, "South"),
            new StateData(0, "New York", "Albany", 20201249, 54555, "Northeast"),
            new StateData(0, "Illinois", "Springfield", 12812508, 57914, "Midwest"),
            new StateData(0, "Ohio", "Columbus", 11799448, 44825, "Midwest"),
            new StateData(0, "Georgia", "Atlanta", 10711908, 59425, "South"),
            new StateData(0, "North Carolina", "Raleigh", 10439388, 53819, "South"),
            new StateData(0, "Michigan", "Lansing", 10077331, 96714, "Midwest"),
            new StateData(0, "Pennsylvania", "Harrisburg", 13002700, 46055, "Northeast")
        );

        try (PreparedStatement ps = connection.prepareStatement(insertSQL)) {
            for (StateData state : sampleStates) {
                ps.setString(1, state.getStateName());
                ps.setString(2, state.getCapitalCity());
                ps.setInt(3, state.getPopulation());
                ps.setFloat(4, state.getAreaSqMiles());
                ps.setString(5, state.getRegion());
                ps.executeUpdate();
            }
            response.append("Table nima_states_data populated with sample data.<br>");
        } catch (SQLException e) {
            response.append("Error populating table: ").append(e.getMessage()).append("<br>");
        }

        return response.toString();
    }

    /**
     * Closes the database connection safely
     */
    public void closeConnection() {
        try {
            if (connection != null) connection.close();
        } catch (SQLException e) {
            System.err.println("SQL Exception on close: " + e.getMessage());
        }
    }
}
