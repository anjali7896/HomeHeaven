package com.example.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Assuming the user is already logged in and their session holds the user ID
        String userId = (String) request.getSession().getAttribute("userId");

        // Update logic (e.g., JDBC or ORM)
        boolean success = updateUserProfile(userId, email, phone);

        if (success) {
            // Set updated data in session to reflect the changes
            request.getSession().setAttribute("userEmail", email);
            request.getSession().setAttribute("userPhone", phone);

            // Set a success message in session
            //request.getSession().setAttribute("profileUpdateMessage", "Profile updated successfully!");

            // Redirect to the addhome1.jsp page
            response.sendRedirect("addhome1.jsp");
        } else {
            // Handle failure (could forward to an error page or show a message)
            response.sendRedirect("error.jsp");
        }
    }

    private boolean updateUserProfile(String userId, String email, String phone) {
        // Example: Perform the update operation using JDBC or ORM
        // Return true if successful, false if not
        return true; // Assume the update is successful
    }
}
