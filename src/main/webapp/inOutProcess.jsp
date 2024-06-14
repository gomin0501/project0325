<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	//form데이터 가져오기
	try{
	String date=request.getParameter("inOutDate");
	String sCode=request.getParameter("storeCode");
	String pCode=request.getParameter("productCode");
	String gubun=request.getParameter("gubun");
	String sQty=request.getParameter("saleQty");
	
	//sql문(database table)에 값 넣기
	String sql="insert into inout0325 values(?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,date);//번호는 물음표 순서
	pstmt.setString(2,sCode);
	pstmt.setString(3,pCode);
	pstmt.setString(4,gubun);
	pstmt.setString(5,sQty);
	
	pstmt.executeUpdate();//실행
	
	
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
		
	}
	
%>
<script>
	alert("입출고 테이블 등록 성공");
	location.href="inOutList.jsp";
</script>
</body>
</html>