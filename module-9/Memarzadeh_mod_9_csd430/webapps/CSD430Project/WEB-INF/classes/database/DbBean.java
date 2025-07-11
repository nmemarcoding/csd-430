package database;

import model.StateData;

import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * DbBean — A JavaBean used to interact with the database table
 * in the CSD430 MySQL database. Handles standard CRUD operations using StateData model.
 *
 * Author: Nima Memarzadeh
 */
public class DbBean implements Serializable {

    private static final long serialVersionUID = 111222333444L;

    private Connection connection;

    /**
     * Constructor initializes database connection.
     * Connects to MySQL database CSD430 using student1/pass.
     */
    public DbBean() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/CSD430";
            connection = DriverManager.getConnection(url, "student1", "pass");
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Database connection failed: " + e.getMessage());
        }
    }

    /**
     * Inserts a new record into the table.
     */
    public void createRecord(StateData state) {
        String sql = "INSERT INTO nima_states_data(state_name, capital_city, population, area_sq_miles, region) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, state.getStateName());
            ps.setString(2, state.getCapitalCity());
            ps.setInt(3, state.getPopulation());
            ps.setFloat(4, state.getAreaSqMiles());
            ps.setString(5, state.getRegion());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Insert Error: " + e.getMessage());
        }
    }

    /**
     * Reads a single record by ID.
     */
    public StateData read(int id) {
        StateData state = null;
        String sql = "SELECT * FROM nima_states_data WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                state = new StateData(
                    rs.getInt("id"),
                    rs.getString("state_name"),
                    rs.getString("capital_city"),
                    rs.getInt("population"),
                    rs.getFloat("area_sq_miles"),
                    rs.getString("region")
                );
            }

            rs.close();
        } catch (SQLException e) {
            System.err.println("Read error: " + e.getMessage());
        }
        return state;
    }

    /**
     * Reads all records from the table.
     */
    public List<StateData> readAll() {
        List<StateData> records = new ArrayList<>();
        String sql = "SELECT * FROM nima_states_data";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                StateData state = new StateData(
                    rs.getInt("id"),
                    rs.getString("state_name"),
                    rs.getString("capital_city"),
                    rs.getInt("population"),
                    rs.getFloat("area_sq_miles"),
                    rs.getString("region")
                );
                records.add(state);
            }

            rs.close();
        } catch (SQLException e) {
            System.err.println("ReadAll error: " + e.getMessage());
        }
        return records;
    }

    /**
     * Updates a record by ID.
     */
    public String updateRecord(StateData state) {
        String sql = "UPDATE nima_states_data SET state_name=?, capital_city=?, population=?, area_sq_miles=?, region=? WHERE id=?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, state.getStateName());
            ps.setString(2, state.getCapitalCity());
            ps.setInt(3, state.getPopulation());
            ps.setFloat(4, state.getAreaSqMiles());
            ps.setString(5, state.getRegion());
            ps.setInt(6, state.getId());
            ps.executeUpdate();
            return "Update complete.";
        } catch (SQLException e) {
            return "Update error: " + e.getMessage();
        }
    }

    /**
     * Deletes a record by ID.
     */
    public String delete(int id) {
        String sql = "DELETE FROM nima_states_data WHERE id=?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
            return "Record deleted.";
        } catch (SQLException e) {
            return "Delete error: " + e.getMessage();
        }
    }

    /**
     * Closes the database connection.
     */
    public void closeConnection() {
        try {
            if (connection != null) connection.close();
        } catch (SQLException e) {
            System.err.println("SQL Exception on close: " + e.getMessage());
        }
    }
}
