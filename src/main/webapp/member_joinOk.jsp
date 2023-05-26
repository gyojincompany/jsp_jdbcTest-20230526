<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");//파라미터 값 한글 처리
	
		String uid = request.getParameter("userid");//가입시 입력한 아이디
		String upw = request.getParameter("userpw");//가입시 입력한 비밀번호
		String uemail = request.getParameter("email");//가입시 입력한 이메일
		
		String sql = "INSERT INTO members (id, passwd, email) VALUES ('"+uid+"', '"+upw+"', '"+uemail+"')";
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb";//기본 데이터베이스(mysql) 접속 주소
		String username = "root";//mysql 계정 아이디
		String password = "12345";//mysql 계정 비밀번호
		
		Connection conn = null; 
		Statement stmt = null;
		int successFlag = 0;
		
		try {
			Class.forName(driverName);//jdbc 드라이버 불러오기
			
			conn = DriverManager.getConnection(url, username, password);//DB 연동
			
			stmt = conn.createStatement();
			
			successFlag = stmt.executeUpdate(sql);//sql문 실행->성공 1을 반환
			
			if(successFlag == 1) { //참이면 sql문 성공적으로 실행
				out.println("회원 가입 성공!:"+successFlag);
			} else {
				out.println("회원 가입 실패!:"+successFlag);
			}
		} catch(Exception e) {
			e.printStackTrace();//에러의 내용 출력
			out.println("회원 가입 실패!:"+successFlag);
		} finally {
			stmt.close();//statment 닫아주기
			conn.close();//connection 닫아주기	
		}
	%>
	
	
	
</body>
</html>