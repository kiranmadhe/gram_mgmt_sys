<html>
<head>
	<style>
		body{
		margin:0;
		padding:0;
		background-image:url(images/sample4.jpg);
		background-repeat: no-repeat;
		background-size: cover;
		background-attachment: fixed;
		}
	</style>
	<link rel="stylesheet" href="history.css">
</head>
<body>
<div class="details">
	<h1 style="position:static;">ELECRICITY BILL HISTORY</h1>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<table align="center" cellpadding="8" cellspacing="2" border="1">

<tr align="center" bgcolor="#A52A2A" style="color:black;font-size:20px">
<td><b>CONSUMER NUMBER</b></td>
<td><b>PHONE NUMBER</b></td>
<td><b>AMMOUNT</b></td>
<td><b>BILL</b></td>
<td><b>ID</b></td>
<td><b>DATE AND TIME</b></td>

</tr>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","kiran");
Statement st=con.createStatement();

String user=session.getAttribute("id").toString();

String sql="select * from elc_bill order by currentDateTime desc";
ResultSet rs= st.executeQuery(sql);
String ifbill="El_Charge";

while(rs.next()) {
if( user.equals(rs.getString("id")) ){
if( ifbill.equals(rs.getString("bill")) ){
%>
<tr bgcolor="#DEB887" align="center" style="font-size:20px">

<td><%=rs.getString("consumerid") %></td>
<td><%=rs.getString("phone") %></td>
<td><%=rs.getString("amount") %></td>
<td><%=rs.getString("bill") %></td>
<td><%=rs.getString("id") %></td>
<td><%=rs.getString("currentDateTime") %></td>

</tr>
<% } } }%>
</table>
</div>
<ul>
	<li style="position:fixed"><a href="history.jsp">Back&nbsp</a></li>&nbsp&nbsp
	<li id="rightside" style="float:right"><a class="active"  href="login.jsp">logout</a></li>
</ul>

</body>
</html>