<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>housekeeping.com</title>
		<meta name="description" content="Blueprint: Vertical Timeline" />
		<meta name="keywords" content="timeline, vertical, layout, style, component, web development, template, responsive" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
	</head>
	
	<%@ page import="java.util.*" %>
<%@ page import="javax.sql.*;" %>
<% 

java.sql.Connection con;
java.sql.Statement s;
java.sql.ResultSet rs;
java.sql.PreparedStatement pst;

con=null;
s=null;
pst=null;
rs=null;

// Remember to change the next line with your own environment 
String url= 
"jdbc:mysql://localhost:3306/housekeep";
String id= "root";
String pass = "1234";
try{

Class.forName("com.mysql.jdbc.Driver");
con = java.sql.DriverManager.getConnection(url, id, pass);

}catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();
}
double lat1 = Double.parseDouble((String)request.getSession().getAttribute("lat"));

double lon1 = Double.parseDouble((String)request.getSession().getAttribute("lon"));
double lat2=lat1-0.1;
double lat3=lat1+0.1;
double lon2=lon1-0.1;
double lon3=lon1+0.1;
String sql = "SELECT maid_name,phone_no,address FROM maids WHERE lat>="+lat2+"and lat<="+lat3+"and lon>="+lon2+"and lon<="+lon3++;

try{
s = con.createStatement();
rs = s.executeQuery(sql);
%>
	
	
	
	<body>
		<div class="container">
			<header class="clearfix">
				<h1>HouseKeeping.com</h1>
				<nav>
					<a href="index.jsp" class="icon-drop" data-info="Logout">logout</a>
				</nav>
			</header>	
			<div class="main">
				<ul class="cbp_tmtimeline">
					<li>
						<time class="cbp_tmtime" datetime="2013-04-10 18:30"></time>
						<div class="cbp_tmicon cbp_tmicon-phone"></div>
						<div class="cbp_tmlabel">
						<%
while( rs.next() ){
%>
							<h2>Name: <%= rs.getString(1)%></h2>
							<p>His/Her No:<%= rs.getString(2) %> <br> Address: <%= rs.getString(3)%></p><%
}
%>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<%

}
catch(Exception e){e.printStackTrace();}
finally{
if(rs!=null) rs.close();
if(s!=null) s.close();
if(con!=null) con.close();
}

%>
	</body>
</html>
