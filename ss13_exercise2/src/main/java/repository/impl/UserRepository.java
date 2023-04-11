package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users\n" + "order by  `name`";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String SELECT_USER_BY_COUNTRY = "select * from users where country like ?;";
    private static final String SELECT_ALL_USERS_PROCEDURES = "call select_all_users ;";
    private static final String UPDATE_USERS_PROCEDURES = "call edit_user_by_id(?,?,?,?);";
    private static final String DELETE_USERS_PROCEDURES = "call delete_user_by_id(?);";


    public void insertUser(User user) throws SQLException {
        // try-with-resource statement will auto close the connection.
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public User selectUser(int id) {
        User user = null;
        // Step 1: Establishing a Connection
        try (Connection connection = BaseRepository.getConnectDB();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    public List<User> selectAllUsers() {



        //Gọi Stored Procedures từ JDBC sử dụng CallableStatement cho chức năng hiển thị danh sách users
        List<User> userList = new ArrayList<>();
        try {
            Connection connection = BaseRepository.getConnectDB();
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_USERS_PROCEDURES);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                userList.add(new User(id, name, email, country));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    public boolean deleteUser(int id) {
//        boolean rowDeleted;
//        try (Connection connection = BaseRepository.getConnectDB();
//             PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
//            statement.setInt(1, id);
//            rowDeleted = statement.executeUpdate() > 0;
//        }
//        return rowDeleted;
        // Gọi Stored Procedures từ JDBC sử dụng CallableStatement cho chức năng xoá user
        boolean rowDeleted = false;
        try {
            Connection connection = BaseRepository.getConnectDB();
            CallableStatement callableStatement = connection.prepareCall(DELETE_USERS_PROCEDURES);
            callableStatement.setInt(1, id);
            rowDeleted = callableStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowDeleted;
    }

    public boolean updateUser(User user) {
//        boolean rowUpdated;
//        try (Connection connection = BaseRepository.getConnectDB();
//             PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
//            statement.setString(1, user.getName());
//            statement.setString(2, user.getEmail());
//            statement.setString(3, user.getCountry());
//            statement.setInt(4, user.getId());
//            rowUpdated = statement.executeUpdate() > 0;
//        }
//        return rowUpdated;

//        Gọi Stored Procedures từ JDBC sử dụng CallableStatement cho chức năng sửa thông tin user
        boolean rowUpdated = false;
        try {
            Connection connection = BaseRepository.getConnectDB();
            CallableStatement callableStatement = connection.prepareCall(UPDATE_USERS_PROCEDURES);
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());
            callableStatement.setInt(1, user.getId());
            rowUpdated = callableStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowUpdated;
    }

    @Override
    public List<User> selectUser(String ctry) {
        List<User> userList = new ArrayList<>();
//        User user = null;
        // Step 1: Establishing a Connection
        try (Connection connection = BaseRepository.getConnectDB();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_COUNTRY);) {
            preparedStatement.setString(1, ctry);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                int id = rs.getInt("id");
                userList.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return userList;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

}
