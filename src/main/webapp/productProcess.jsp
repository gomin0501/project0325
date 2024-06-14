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
	String pCode=request.getParameter("productCode");
	String pName=request.getParameter("productName");
	String sCode=request.getParameter("storeCode");
	String unitP=request.getParameter("unitPrice");
	String sQty=request.getParameter("stockQty");
	
	//sql문(database table)에 값 넣기
	String sql="insert into product0325 values(?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,pCode);//번호는 물음표 순서
	pstmt.setString(2,pName);
	pstmt.setString(3,sCode);
	pstmt.setString(4,unitP);
	pstmt.setString(5,sQty);
	
	pstmt.executeUpdate();//실행
	
	
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
		
	}
	
%>
<script>
	alert("상품 테이블 등록 성공");
	//orderList로 화면이 넘어가기
	location.href="productList.jsp";
</script>
</body>
</html>