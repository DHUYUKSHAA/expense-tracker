@WebServlet("/ForgotServlet")
public class ForgotServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");

        try {
            Connection con = DBConnection.getConnection();

            String query = "UPDATE users SET password=? WHERE email=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, newPassword);
            ps.setString(2, email);

            int row = ps.executeUpdate();

            if(row > 0){
                response.sendRedirect("login.jsp");
            } else {
                response.getWriter().println("Email not found");
            }

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}