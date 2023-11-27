<html>
<head> <title> LOGIN FORM </title> </head>
  <body>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>

<%
  String id=request.getParameter("Adhaar");
  String password=request.getParameter("password");
  Class.forName("com.mysql.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","kiran");

  Statement st=con.createStatement();
  
  String sql="select * from registration where id=? and password=?";
  PreparedStatement ps;
  ps = con.prepareStatement(sql);
  ps.setString(1,id);
  ps.setString(2,password);

  ResultSet rs= ps.executeQuery();
  
  if(rs.next()){
	  String user=rs.getString("id");
	  String pass=rs.getString("password");
	  if(id.equals(user) && password.equals(pass)){
      
      session.setAttribute("id",user);
		  
      response.sendRedirect("menupage.jsp");
	  }
	}
	else{
%>
    <script>
      alert("Invalid Credentials Please Re-Enter");
      window.location.href="login.jsp";
    </script>
<%
    /*response.sendRedirect("homelogin.html");*/
  }
%>
</body>
</html>