package tag;

import domain.Product;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

public class ProductTag extends SimpleTagSupport {
    Product product;

    public void doTag() throws JspException, IOException {
        JspWriter out = getJspContext().getOut();
        if (product != null)
        out.write(String.format("<p class='detail'>%s</p>",product.getName()));
        out.write(String.format("<p class='price'>$%f</p>",product.getPrice()));
        out.write(String.format("<p class='detail'><img src='%s' width='100px' height='150px'/> </p>",product.getImageUrl()));

    }

    // Setters
    public void setProduct(Product product) {
        this.product = product;
    }

}
