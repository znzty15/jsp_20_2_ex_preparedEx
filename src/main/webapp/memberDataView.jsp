<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%!
	Connection con;
   	Statement stmt;
   	ResultSet rs;
	
   	String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String uid = "scott";
    String upw = "tiger";
    String query = "select * from members";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memberDataView.jsp</title>
</head>
<body>
	<%
		try{
			Class.forName(driver);
		    con = DriverManager.getConnection(url, uid, upw);
		    stmt = con.createStatement();
		    rs = stmt.executeQuery(query);
		    
		    while (rs.next()) {
			      String name = rs.getString("name");
			      String id = rs.getString("id");
			      String pw = rs.getString("pw");
			      String ph1 = rs.getString("ph1");
			      String ph2 = rs.getString("ph2");
			      String ph3 = rs.getString("ph3");
			      String gender = rs.getString("gender");
			      
			      out.println("�̸�  : " + name + "<br>");
				  out.println("���̵�  : " + id + "<br>");
				  out.println("��й�ȣ  : " + pw + "<br>");
				  out.println("��ȭ��ȣ  : " + ph1 + " - " + ph2 + " - " + ph3 + "<br>");
				  out.println("����  : " + gender + "<br>");
				  out.println("=============================" + "<br>");
		  	 }
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	
</body>
</html>