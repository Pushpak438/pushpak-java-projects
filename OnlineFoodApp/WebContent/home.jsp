
<%@ page import="java.sql.*" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddb", "root", "your_password");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM menu");
%>
<html>
<head><title>Menu</title></head>
<body>
<h2>Welcome, <%= username %></h2>
<h3>Menu:</h3>
<form method="post" action="OrderServlet">
    <% while (rs.next()) { %>
        <%= rs.getString("item_name") %> - $<%= rs.getDouble("price") %>
        <input type="checkbox" name="items" value="<%= rs.getString("item_name") %>"><br/>
    <% } %>
    <button type="submit">Place Order</button>
</form>
</body>
</html>
