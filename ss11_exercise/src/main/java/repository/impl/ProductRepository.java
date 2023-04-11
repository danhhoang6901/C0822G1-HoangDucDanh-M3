package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> products = new ArrayList<>();

    static {
        products.add(new Product(1, "Bàn phím", 10000, "mô tả", "A1"));
        products.add(new Product(2, "Camera", 50000, "mô tả", "B2"));
        products.add(new Product(3, "Lót chuột", 25000, "mô tả", "D6"));
        products.add(new Product(4, "Chuột", 9000, "mô tả", "C2"));
        products.add(new Product(5, "Màn hình", 110000, "mô tả", "A5"));
    }

    @Override
    public List<Product> displayAll() {
        return products;
    }

    @Override
    public void add(Product product) {
        products.add(product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id - 1);
    }

    @Override
    public void update(int id, Product product) {
        products.set(id, product);
    }

    @Override
    public boolean delete(int id) {
        return false;
    }


    @Override
    public List<Product> findByName(String name) {
        return null;
    }

    @Override
    public List<Product> findByProducer(String producer) {
        return null;
    }

    @Override
    public List<Product> findByPrice(double min, double max) {
        return null;
    }
}
