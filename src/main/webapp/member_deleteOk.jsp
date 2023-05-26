<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String did = request.getParameter("userid");//탈퇴하려는 아이디
		
		String sql = "DELETE FROM members WHERE id=?";
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb";//기본 데이터베이스(mysql) 접속 주소
		String username = "root";//mysql 계정 아이디
		String password = "12345";//mysql 계정 비밀번호
		
		Connection conn = null; 
		//Statement stmt = null;
		PreparedStatement pstmt = null;
		int successFlag = 0;
		
		try {
			Class.forName(driverName);//jdbc 드라이버 불러오기
			
			conn = DriverManager.getConnection(url, username, password);//DB 연동
			
			//stmt = conn.createStatement();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, did);//첫번째 순서의 ?에 did 값을 대입
			
			//successFlag = stmt.executeUpdate(sql);//sql문 실행->성공 1을 반환
			successFlag = pstmt.executeUpdate();//sql문 실행->성공 1을 반환
			
			if(successFlag == 1) { //참이면 sql문 성공적으로 실행
				out.println("회원 탈퇴 성공!:"+successFlag);
			} else {
				out.println("회원 탈퇴 실패!:"+successFlag);
			}
		} catch(Exception e) {
			e.printStackTrace();//에러의 내용 출력
			out.println("회원 탈퇴 실패!:"+successFlag);
		} finally {
			pstmt.close();//PreparedStatment 닫아주기
			conn.close();//connection 닫아주기	
		}
	
	%>
</body>
</html>