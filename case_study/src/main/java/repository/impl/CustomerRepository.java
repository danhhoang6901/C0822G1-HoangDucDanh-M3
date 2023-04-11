package repository.impl;

import model.Customer;
import model.CustomerType;
import repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private final String SELECT_ALL = "select * from customer  where is_delete = 0;";
    private final String SELECT_CUSTOMER_TYPE = "select * from customer_type where is_delete = 0;";
    private final String INSERT_CUSTOMER = "insert into customer(`name`,date_of_birth,gender,id_card" +
            ",phone_number,email,address,customer_type_id)\n" +
            "values(?,?,?,?,?,?,?,?);";
    private final String DELETE = "update customer set is_delete = 1 where id = ?;";
    public static final String UPDATE_CUSTOMER = "update customer set name = ?,date_of_birth=?," +
            "gender = ?,id_card =?,phone_number=?, email= ?, address =?" +
            ", customer_type_id =? where id = ?;";

    public static final String SEARCH_NAME = "select * from customer where is_delete = 0 and name like ? ;";


    @Override
    public List<Customer> displayAll() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String dateOfBirth = resultSet.getString("date_of_birth");
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int customerTypeId = resultSet.getInt("customer_type_id");
                Customer customer = new Customer(id, name, dateOfBirth, gender, idCard,
                        phoneNumber, email, address, customerTypeId);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public boolean add(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getDateOfBirth());
            preparedStatement.setBoolean(3, customer.isGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhoneNumber());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setInt(8, customer.getCustomerType());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }


    @Override
    public boolean update(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getDateOfBirth());
            preparedStatement.setBoolean(3, customer.isGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhoneNumber());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setInt(8, customer.getCustomerType());
            preparedStatement.setInt(9, customer.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean remove(int id) {
        boolean delete = false;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            delete = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return delete;
    }

    @Override
    public Customer findBbyId(int id) {
        List<Customer> customer = displayAll();
        for (Customer customer1 : customer) {
            if (customer1.getId() == id) {
                return customer1;
            }
        }
        return null;
    }

    @Override
    public List<CustomerType> findAll() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_TYPE);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int customerTypeId = resultSet.getInt("id");
                String name = resultSet.getString("name");
                CustomerType customerType = new CustomerType(customerTypeId, name);
                customerTypeList.add(customerType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerTypeList;
    }

    @Override
    public List<Customer> searchCustomer(String search) {
        List<Customer> customerSearch = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SEARCH_NAME);
            ps.setString(1, "%" + search + "%");
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String dateOfBirth = resultSet.getString("date_of_birth");
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int customerTypeId = resultSet.getInt("customer_type_id");
                customerSearch.add(new Customer(id, name, dateOfBirth,gender, idCard, phoneNumber, email, address,customerTypeId));

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customerSearch;

    }
}
