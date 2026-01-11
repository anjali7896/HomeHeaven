package Servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class OwnerLogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        resp.sendRedirect(req.getContextPath() + "/OwnerLogin.jsp");
    }
}
