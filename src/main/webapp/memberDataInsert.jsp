<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%!
	Connection con;
   	PreparedStatement preStmt;
   	ResultSet rs;
	
   	String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String uid = "scott";
    String upw = "tiger";
    //String query = "select * from members";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memberDataInsert.jsp</title>
</head>
<body>
	<%
		Class.forName(driver);
	    con = DriverManager.getConnection(url, uid, upw);
	    
	    int flag;
	    
	    String query = "insert into members(name, id, pw, ph1, ph2, ph3, gender) values(?, ?, ?, ?, ?, ?, ?)";
	    preStmt = con.prepareStatement(query);
	    
	    preStmt.setString(1, "권율");
	    preStmt.setString(2, "kwonyul");
	    preStmt.setString(3, "123456");
	    preStmt.setString(4, "010");
	    preStmt.setString(5, "8888");
	    preStmt.setString(6, "9999");
	    preStmt.setString(7, "man");
		//쿼리를 넣을떄마다 업데이트를 한번씩 해줘야함
	    flag = preStmt.executeUpdate();//query실행이 성공하면 1을 반환
	    
	    preStmt.setString(1, "이몽룡");
	    preStmt.setString(2, "leemong");
	    preStmt.setString(3, "789456");
	    preStmt.setString(4, "010");
	    preStmt.setString(5, "1234");
	    preStmt.setString(6, "5678");
	    preStmt.setString(7, "man");
	    //쿼리를 넣을떄마다 업데이트를 한번씩 해줘야함
	    flag = preStmt.executeUpdate();//query실행이 성공하면 1을 반환
	    
	    preStmt.setString(1, "성춘향");
	    preStmt.setString(2, "choonhang");
	    preStmt.setString(3, "321654");
	    preStmt.setString(4, "010");
	    preStmt.setString(5, "5555");
	    preStmt.setString(6, "6666");
	    preStmt.setString(7, "woman");
	    //쿼리를 넣을떄마다 업데이트를 한번씩 해줘야함
	    flag = preStmt.executeUpdate();//query실행이 성공하면 1을 반환
	    
	    if(flag == 1){
	    	out.println("입력하신 정보가 정상적으로 처리되었습니다.");
	    }else {
	    	out.println("입력하신 정보를 입력하는데 실패하였습니다.");
	    }
	%>

</body>
</html>