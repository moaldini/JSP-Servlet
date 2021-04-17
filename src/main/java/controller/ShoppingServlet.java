package controller;

import domain.Cart;
import domain.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@WebServlet(urlPatterns = {"", "/shopping"})
public class ShoppingServlet extends HttpServlet {
    Cart cart = new Cart();
    List<Product> products = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("inside get");

        HttpSession session = req.getSession();
        req.setAttribute("products", products);
        if (req.getSession().getAttribute("cart")==null)
            req.setAttribute("cart", new Cart());
        else
            req.setAttribute("cart", cart);

        req.getRequestDispatcher("welcome.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("inside post");
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = req.getReader();
        try {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        } finally {
            reader.close();
        }
        String prodId = sb.toString();
        Optional optionalProduct = products.stream()
                .filter(x -> x.getId().equals(prodId))
                .findFirst();

        if (optionalProduct.isPresent()) {
            Product product = (Product) optionalProduct.get();
            cart.addProduct(product);


            Cookie c = new Cookie("products", product.getName());
            c.setMaxAge(30 * 24 * 60 * 60);
            resp.addCookie(c);

            HttpSession session = req.getSession();
            session.setAttribute("cart", cart);

            resp.setStatus(200);
            resp.setContentType("text/html;charset=UTF-8");
            resp.getWriter().write("Added to cart!");
            doGet(req, resp);
        }
    }

    @Override
    public void init() throws ServletException {
        products.add(new Product("Chocolate", "https://images2.minutemediacdn.com/image/upload/c_crop,h_842,w_1500,x_0,y_88/f_auto,q_auto,w_1100/v1555006794/shape/mentalfloss/istock-522735736.jpg", 4.0));
        products.add(new Product("Coat", "https://images.vans.com/is/image/Vans/56ZTT5-HERO?$583x583$", 60.0));
        products.add(new Product("Tomato", "https://upload.wikimedia.org/wikipedia/commons/8/89/Tomato_je.jpg", 8.0));
        products.add(new Product("Shoes", "https://images.vans.com/is/image/Vans/D3HY28-HERO?$583x583$", 55.0));
        products.add(new Product("Computer", "https://information-technology.web.cern.ch/sites/information-technology.web.cern.ch/files/840%20G6_0.png", 990.0));
        products.add(new Product("iPhone", "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-family-hero?wid=470&amp;hei=556&amp;fmt=jpeg&amp;qlt=95&amp;op_usm=0.5,0.5&amp;.v=1604021663000", 778.0));


    }
}
