package controller;

import domain.User;
import storage.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@WebServlet({"/login"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember");

        HttpSession session = req.getSession();

        //instead of this we should ajax for the project to check the existence of user
        Optional<User> optionalUser = Users.getUsers().stream().filter(x -> x.getUserName().equals(userName)
                && x.getPassword().equals(password))
                .findAny();

        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            session.setAttribute("user", userName);
            session.setAttribute("me", user);

            Cookie c;
            if ("yes".equals(remember)) {
                c = new Cookie("user", userName);
                c.setMaxAge(30 * 24 * 60 * 60);
            } else {
                c = new Cookie("user", null);
                c.setMaxAge(0);
            }
            resp.addCookie(c);

            //resp.sendRedirect("/shopping");
            resp.setContentType("text/html;charset=UTF-8");
            resp.getWriter().write("True");
        } else {
            //session.setAttribute("errMsg", "Username or password is invalid!");
            //resp.sendRedirect("login");
            resp.setContentType("text/html;charset=UTF-8");
            resp.getWriter().write("Username or password is invalid!");
        }
    }

    @Override
    public void init() throws ServletException {
        Users.addUser(new User("Badis Saidani", "Badis", "saidanii.badis@gmail.com", "badis"));
        Users.addUser(new User("admin", "admin", "admin", "admin"));
    }
}
