package service;

import model.Customer;
import model.CustomerType;

import java.util.List;

public interface ICustomerService {
    List<Customer> displayAll();

    boolean add(Customer customer);


    boolean update(Customer customer);

    boolean remove(int id);

    Customer findById(int id);

    List<CustomerType> findAll();

    List<Customer> searchCustomer(String search);

}
