<html>

	<%@ page import="java.sql.*" %>
	<%@ page import="javax.sql.*"%>
	<%@ page import="java.lang.*"%>
	<%@ page import="java.text.SimpleDateFormat" %>
	<%@ page import="java.util.Date" %>
	
	<%
		String consumerid=request.getParameter("consumerid");
		String phone=request.getParameter("phone");
		String amount=request.getParameter("usage");
		String id=session.getAttribute("id").toString();
	
		// Get current date and time
		Date currentDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDateTime = dateFormat.format(currentDate);
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","kiran");
	
		Statement st=conn.createStatement();
		int i=st.executeUpdate("insert into propbill values('"+consumerid+"','"+phone+"','"+amount+"','"+"Prop_Tax"+"','"+id+"','"+currentDateTime+"')");
	
		int perunit=1;
	%>
 <head>
 	<style>
	body{
		margin:0;
		padding:0;
		background-image:url(images/sample3.jpg);
		background-position:top;
		background-repeat:no-repeat;
		background-size:cover;
		}
 	 	.details{
		height: 500px;
		background:transparent;
		color:white;
		top: 35%;
		left: 50%;
		position: absolute;
		transform: translate(-50%,-50%);
		box-sizing: border-box;
		padding: 40px 30px;
		border-radius:20px;
 		}
 	</style>
 	<link rel="stylesheet" href="pay.css" >
 </head>
 <body>
 	<div class="details">
 		<center>
 		<h1 style="background-color:orange;color:black;border-radius:5px;width:400px">Property Tax</h1>
 		<h2 style="background-color:orange;color:black;border-radius:5px;width:400px">PAYMENT DETAILS</h2>
		<%      out.print("<h2>CONSUMER ID: "+consumerid+"</h2>");
		out.print("<h2>PHONE NUMBER: "+phone+"</h2>");
		out.print("<h2>CHARGE PER UNIT: "+perunit+".rs</h2>");
		out.print("<h2>AMOUNT PAID: "+amount+".rs</h2>");
		out.print("<h2>CURRENT DATE AND TIME: "+currentDateTime+"</h2>");
 		%>
 		<form action="menupage.jsp" method="post">
 			<br><input type="submit" value="Goto Menupage" name="submit"></a>
 		</form>
    </center>
 </body>
 </html>