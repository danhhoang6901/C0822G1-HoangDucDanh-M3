package service.impl;

import model.Customer;
import model.CustomerType;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> displayAll() {
        return customerRepository.displayAll();
    }

    @Override
    public boolean add(Customer customer) {
        return customerRepository.add(customer);
    }

    @Override
    public boolean update(Customer customer) {
        return customerRepository.update(customer);
    }

    @Override
    public boolean remove(int id) {
        return customerRepository.remove(id);
    }

    @Override
    public Customer findById(int id) {
        return customerRepository.findBbyId(id);
    }

    @Override
    public List<CustomerType> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public List<Customer> searchCustomer(String search) {
        return customerRepository.searchCustomer(search);
    }
}
