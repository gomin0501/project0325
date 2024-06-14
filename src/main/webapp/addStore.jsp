<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
	<!-- action:폼을 memberProcess.jsp로 넘겨준다 -->
	<form name="form" method="post" action="addStore.jsp">
		<h2>매장 등록 화면</h2>
	<table border="1">
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	int next_code=0;
	//데이터베이스 가져와서 세팅하기
	String pCode=request.getParameter("productCode");
	String pName=request.getParameter("productName");
	//글 사라짐 방지
	String sName=request.getParameter("storeName");
	String qty=request.getParameter("qty");
	if(sName==null){
		sName="";
	}
	if(qty==null){
		qty="";
	}
	
	try{
		sql="select max(storecode) from store0325";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			next_code=rs.getInt(1)+1;
		}else{
			next_code=101;
		}
		sql="select productcode,productname from product0325 where productcode=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,pCode);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			pCode=rs.getString(1);
			pName=rs.getString(2);
		}else if(pCode==null){
			pCode="";
			pName="";
		}else{ %>
		<script>
		alert("등록되어 있지 않은 상품코드 입니다.");
		history.back(-1);
		</script>
		
		<%}
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}
%>
	    <tr>
	      <th>매장 코드(자동생성)</th>
	      <td ><input type="text" name="storeCode" value="<%=next_code %>"></td>
	    </tr>
	    <tr>
	      <th>매 장 명</th>
	      <td ><input type="text" name="storeName" value="<%=sName %>"></td>
	    </tr>
	    <tr>
	      <th>상품코드</th>
	      <td ><input type="text" name="productCode" onchange="changesubmit();" value="<%=pCode %>"></td>
	    </tr>
	    <tr>
	      <th>상품명</th>
	      <td ><input type="text" name="productName" value="<%=pName %>"></td>
	    </tr>
	    <tr>
	      <th>수량</th>
	      <td ><input type="text" name="qty" value="<%=qty %>"></td>
	    </tr>
	    
	    <tr class="button">
	    	<td colspan="2">
	    	<button class="check" onclick="check()">등록</button>
	    	<button type="reset">취소</button>
	    	</td>	    	
	    </tr>
	</table>
	</form>
<script src="storeForm.js"> </script>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>