package domain;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    private final List<Product> products = new ArrayList<Product>();

    public void addProduct(Product p) {
        products.add(p);
    }

    public void removeProduct(String id) {
        products.removeIf(p -> p.getId().equals(id));
    }

    public ArrayList<Product> getProducts() {
        return new ArrayList<>(products);
    }

    public int getProductsSize() {
        return products.size();
    }

    public Double getTotalCost() {
        return this.products.stream()
                .map(Product::getPrice)
                .reduce(0.0, Double::sum);
    }
}
