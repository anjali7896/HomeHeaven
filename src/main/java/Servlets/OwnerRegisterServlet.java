package Servlets;

import HomeHeavenmodel.Owner;
import HomeHeavenDao.OwnerDao;
import HomeHeaven.util.Validator;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;


public class OwnerRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String dob = req.getParameter("dob");
        String idType = req.getParameter("idType");
        String idNumber = req.getParameter("idNumber");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        // Validation
        if (!Validator.validatePassword(password)) {
            req.setAttribute("error", "Password must contain 1 uppercase, 1 lowercase, 1 digit, 1 symbol, min 6 chars.");
            req.getRequestDispatcher("OwnerRegister.jsp").forward(req, resp);
            return;
        }

        if (!password.equals(confirmPassword)) {
            req.setAttribute("error", "Passwords do not match.");
            req.getRequestDispatcher("OwnerRegister.jsp").forward(req, resp);
            return;
        }

        if (!Validator.validateEmail(email)) {
            req.setAttribute("error", "Invalid email format.");
            req.getRequestDispatcher("OwnerRegister.jsp").forward(req, resp);
            return;
        }

        if (!Validator.validatePhone(phone)) {
            req.setAttribute("error", "Phone must be 10 digits.");
            req.getRequestDispatcher("OwnerRegister.jsp").forward(req, resp);
            return;
        }

        // Create Owner object
        Owner owner = new Owner(name, email, phone, dob, idType, idNumber, password);

        // Use DAO to insert into DB
        OwnerDao dao = new OwnerDao();
        boolean success = dao.registerOwner(owner);

        if(success){
            resp.sendRedirect("OwnerLogin.jsp?success=Registered Successfully");
        } else {
            req.setAttribute("error", "Registration failed! Email may already exist.");
            req.getRequestDispatcher("OwnerRegister.jsp").forward(req, resp);
        }
    }
        
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp)
                throws ServletException, IOException {
            // Redirect to the registration page
            resp.sendRedirect(req.getContextPath() + "/OwnerRegister.jsp");
        }

    }



