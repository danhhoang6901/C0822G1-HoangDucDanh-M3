package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> displayAll();

    void save(Product product);

    Product findById(int id);

    void update(int id, Product product);

    boolean delete(int id);

    List<Product> findByName(String name);

    List<Product> findByProducer(String producer);

    List<Product> findByPrice(double min, double max);
}
