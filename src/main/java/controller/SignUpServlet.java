package controller;

import domain.User;
import storage.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/singUp")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("singUp.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        String userName = req.getParameter("userName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User user = new User(fullName,userName,email,password);
        Users.addUser(user);

        HttpSession session = req.getSession();
        // in the project we should pass the whole user object
        // in order to use it in the checkout
        session.setAttribute("user", userName);
        session.setAttribute("me", user);
        //resp.sendRedirect("/shopping");
        resp.setContentType("text/html;charset=UTF-8");
        resp.getWriter().write("True");
    }
}
