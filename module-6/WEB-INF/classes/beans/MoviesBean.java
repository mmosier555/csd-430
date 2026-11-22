package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * MoviesBean - JavaBean that handles all database access for the
 * meganmoviesdata table in the CSD430 database.
 * Author: Megan Mosier
 */
public class MoviesBean {


    private static final String URL = "jdbc:mysql://localhost:3306/CSD430";
    private static final String USER = "student1";
    private static final String PASS = "pass";
    private static final String TABLE = "meganmoviesdata";

    public static final String[] FIELD_TITLES =
        {"Movie ID", "Title", "Director", "Release Year", "Genre", "Rating"};

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL driver not found", e);
        }
        return DriverManager.getConnection(URL, USER, PASS);
    }

    // READ: returns every primary key value (for the dropdown menu)
    public List<Integer> getAllKeys() throws SQLException {
        List<Integer> keys = new ArrayList<>();
        String sql = "SELECT movie_id FROM " + TABLE + " ORDER BY movie_id";
        try (Connection con = getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                keys.add(rs.getInt("movie_id"));
            }
        }
        return keys;
    }

    // READ: returns one record as an array of 6 strings, or null if not found
    public String[] getMovieById(int id) throws SQLException {
        String sql = "SELECT * FROM " + TABLE + " WHERE movie_id = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new String[] {
                        String.valueOf(rs.getInt("movie_id")),
                        rs.getString("title"),
                        rs.getString("director"),
                        String.valueOf(rs.getInt("release_year")),
                        rs.getString("genre"),
                        rs.getString("rating")
                    };
                }
            }
        }
        return null;
    }

    
    public void createTable() throws SQLException {
        String sql = "CREATE TABLE " + TABLE + " ("
            + "movie_id INT NOT NULL AUTO_INCREMENT, "
            + "title VARCHAR(100) NOT NULL, "
            + "director VARCHAR(60), "
            + "release_year INT, "
            + "genre VARCHAR(30), "
            + "rating VARCHAR(5), "
            + "PRIMARY KEY (movie_id))";
        try (Connection con = getConnection(); Statement st = con.createStatement()) {
            st.executeUpdate(sql);
        }
    }

    public void populateTable() throws SQLException {
        String sql = "INSERT INTO " + TABLE
            + " (title, director, release_year, genre, rating) VALUES "
            + "('The Shawshank Redemption', 'Frank Darabont', 1994, 'Drama', 'R'), "
            + "('The Princess Bride', 'Rob Reiner', 1987, 'Fantasy', 'PG'), "
            + "('Jurassic Park', 'Steven Spielberg', 1993, 'Sci-Fi', 'PG-13'), "
            + "('Back to the Future', 'Robert Zemeckis', 1985, 'Sci-Fi', 'PG'), "
            + "('The Lion King', 'Roger Allers', 1994, 'Animation', 'G'), "
            + "('Forrest Gump', 'Robert Zemeckis', 1994, 'Drama', 'PG-13'), "
            + "('Finding Nemo', 'Andrew Stanton', 2003, 'Animation', 'G'), "
            + "('The Dark Knight', 'Christopher Nolan', 2008, 'Action', 'PG-13'), "
            + "('Toy Story', 'John Lasseter', 1995, 'Animation', 'G'), "
            + "('Gladiator', 'Ridley Scott', 2000, 'Action', 'R')";
        try (Connection con = getConnection(); Statement st = con.createStatement()) {
            st.executeUpdate(sql);
        }
    }

    public void dropTable() throws SQLException {
        try (Connection con = getConnection(); Statement st = con.createStatement()) {
            st.executeUpdate("DROP TABLE IF EXISTS " + TABLE);
        }
    }

    public static void main(String[] args) throws SQLException {
        MoviesBean bean = new MoviesBean();
        if (args.length == 0) {
            System.out.println("Usage: create | populate | drop");
        } else if (args[0].equals("create")) {
            bean.createTable();
            System.out.println("Table created.");
        } else if (args[0].equals("populate")) {
            bean.populateTable();
            System.out.println("Table populated.");
        } else if (args[0].equals("drop")) {
            bean.dropTable();
            System.out.println("Table dropped.");
        }
    }
}