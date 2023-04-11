package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService {
    private static IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> displayAll() {
        return productRepository.displayAll();
    }

    @Override
    public void save(Product product) {
        productRepository.add(product);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public void update(int id, Product product) {
        productRepository.update(id, product);
    }

    @Override
    public boolean delete(int id) {
        return productRepository.delete(id);
    }


    @Override
    public List<Product> findByName(String name) {
        List<Product> productsFound = new ArrayList<>();

        for (Product product : productRepository.displayAll()) {
            if (product.getName().contains(name)) {
                productsFound.add(product);
            }
        }
        return productsFound;
    }

    @Override
    public List<Product> findByProducer(String producer) {
        List<Product> productsFound = new ArrayList<>();

        for (Product product : productRepository.displayAll()) {
            if (product.getProducer().contains(producer)) {
                productsFound.add(product);
            }
        }
        return productsFound;
    }

    @Override
    public List<Product> findByPrice(double min, double max) {
        List<Product> productsFound = new ArrayList<>();

        for (Product product : productRepository.displayAll()) {
            if (product.getPrice() > min && product.getPrice() < max) {
                productsFound.add(product);
            }
        }
        return productsFound;
    }
}
