package Servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class AdminLogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.invalidate();
        resp.sendRedirect("AdminLogin.jsp");
    }
}
