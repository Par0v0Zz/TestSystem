package controllers;

import entity.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import services.api.UserService;
import services.impl.UserServiceImpl;

//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final String USER = "user";
    private static final String PASSWORD = "password";
    public static final String TUTOR_EMAIL = "tutor@tutor";
    public static final String CATALOG = "/catalog";
    public static final String LOGIN_JSP = "login.jsp";


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String credentialsUser = req.getParameter(USER);
        String credentialsPassword = req.getParameter(PASSWORD);

        authorizeUser(req,
                resp,
                credentialsUser,
                new UserServiceImpl(),
                new User(credentialsUser, credentialsPassword, false));


    }

    private void authorizeUser(HttpServletRequest req, HttpServletResponse resp, String credentialsUser, UserService validator, User user)
            throws ServletException, IOException {

        if (validator.authorizeUser(user)) {

            if (TUTOR_EMAIL.equals(user.getName())) {
                user.setTutor(true);
            }
            HttpSession session = req.getSession();
            session.setAttribute(USER, user);

            resp.sendRedirect(CATALOG);

        } else {
            req.getRequestDispatcher(LOGIN_JSP).forward(req, resp);
        }

    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
