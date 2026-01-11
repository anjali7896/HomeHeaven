package Servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // If user not logged in → redirect to login page
        if (session == null || session.getAttribute("ownerId") == null) {
            response.sendRedirect(request.getContextPath() + "/OwnerLogin.jsp");
            return;
        }

        // User is logged in → forward to dashboard JSP
        RequestDispatcher rd = request.getRequestDispatcher("OwnerDashboard.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
