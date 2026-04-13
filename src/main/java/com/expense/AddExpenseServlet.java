package com.expense;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddExpenseServlet")
public class AddExpenseServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        int amount = Integer.parseInt(request.getParameter("amount"));
        String category = request.getParameter("category");

        try {
            HttpSession session = request.getSession();
            int userId = (int) session.getAttribute("user_id");

            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO expenses(title, amount, category, user_id) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, title);
            ps.setInt(2, amount);
            ps.setString(3, category);
            ps.setInt(4, userId);

            int row = ps.executeUpdate();

            if (row > 0) {
                response.sendRedirect("dashboard.jsp");
            } else {
                response.getWriter().println("Insert failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}