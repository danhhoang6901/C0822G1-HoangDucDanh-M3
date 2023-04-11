import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/list-customer"})
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customers = new ArrayList<>();
    static {
        customers.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","https://studiochupanhdep.com/Upload/Images/anh-chan-dung-nam.jpeg"));
        customers.add(new Customer("Nguyễn Văn Nam","1983-08-21","Bắc Giang","https://photocross.net/wp-content/uploads/2020/03/bo-cuc-chup-anh-chan-dung.jpg"));
        customers.add(new Customer("Nguyễn Thái Hòa","1983-08-22","Nam Định","https://inanhtuankhanh.vn/wp-content/uploads/2020/11/ok-1--scaled.jpg"));
        customers.add(new Customer("Trần Đăng Khoa","1983-08-17","Hà Tây","https://phunugioi.com/wp-content/uploads/2022/02/Anh-chan-dung.jpg"));
        customers.add(new Customer("Nguyễn Đình Thi","1983-08-19","Hà Nội","https://photocross.net/wp-content/uploads/2020/03/anh-chan-dung.jpg"));
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("customer.jsp").forward(request, response);
    }
}
