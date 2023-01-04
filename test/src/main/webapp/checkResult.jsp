<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Admin!</title>
<link rel="stylesheet" type="text/css" href="style.css"> 
 <%
   
    String a[] = new String[100];
 	for(int i=0;i<100;i++){
 		a[i]="0";
 	}
 
    Class.forName("com.mysql.cj.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevotingdb2","root","PFH#23kgrw9");
	
	PreparedStatement preparedStatement = con.prepareStatement("select party,count(party) as votecount from vote group by party");
	ResultSet rs=((java.sql.Statement) preparedStatement).executeQuery("select party,count(party) as votecount from vote group by party");
	
    int i=0;
    while(rs.next()){
    	if(rs.getString("party").equals("Aam Aadmi Party"))
        a[0] = rs.getString("votecount");
    	if(rs.getString("party").equals("BJP"))
        a[1] = rs.getString("votecount");
    	if(rs.getString("party").equals("BSP"))
        a[2] = rs.getString("votecount");
    	if(rs.getString("party").equals("Congress"))
        a[3] = rs.getString("votecount");
    	if(rs.getString("party").equals("CPI"))
        a[4] = rs.getString("votecount");
    }
    %>
</head>
<%@ include file="adminNavbar.jsp"%> 
<body>
<div class="form-container">
<div class="checkTable">
<table >
<tr>
<th>
Parties
</th>
<th>
Names
</th>
<th>
Votes
</th>
</tr>

<tr>
<td>
<img src="https://upload.wikimedia.org/wikipedia/en/4/41/Flag_of_India.svg" alt="AAP">
</td>
<td>Aam Aadmi Party</td>
<td><%=a[0]%></td>
</tr>

<tr>
<td>
<img src="https://upload.wikimedia.org/wikipedia/commons/0/0a/Flag_of_Jamaica.svg" alt="BJP">
</td>
<td>BJP</td>
<td><%=a[1]%></td>
</tr>

<tr>
<td>
<img src="https://upload.wikimedia.org/wikipedia/en/b/be/Flag_of_England.svg" alt="BSP">
</td>
<td>BSP</td>
<td><%=a[2]%></td>
</tr>

<tr>
<td>
<img src="https://upload.wikimedia.org/wikipedia/commons/1/15/Flag_of_Argentina_%281818%29.svg" alt="Congress">
</td>
<td>Congress</td>
<td><%=a[3]%></td>
</tr>

<tr>
<td>
<img src="https://upload.wikimedia.org/wikipedia/commons/2/24/Flag_of_Brazil_%281870%E2%80%931889%29.svg" alt="CPI">
</td>
<td>CPI</td>
<td><%=a[4]%></td>
</tr>

</table>
</div>
</div>
</body>
</html>