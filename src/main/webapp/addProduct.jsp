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
	<form name="form" method="post" action="addProduct.jsp">
		<h2>상품 등록 화면</h2>
	<table border="1">
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	int next_code=0;
	
	String sCode=request.getParameter("storeCode");
	String sName=request.getParameter("storeName");
	
	String pName=request.getParameter("productName");
	String unitP=request.getParameter("unitPrice");
	String sQty=request.getParameter("stockQty");
	if(pName==null){
		pName="";
	}
	if(unitP==null){
		unitP="";
	}
	if(sQty==null){
		sQty="";
	}
	
	try{
		sql="select max(productcode) from product0325";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			next_code=rs.getInt(1)+1;
		}else{
			next_code=100001;
		}
		sql="select storecode,storename from store0325 where storecode=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,sCode);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			sCode=rs.getString(1);
			sName=rs.getString(2);
		}else if(sCode==null){
			sCode="";
			sName="";
		}else{ %>
		<script>
		alert("등록되어 있지 않은 매장코드 입니다.");
		history.back(-1);
		</script>
		
		<%}
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}
%>
	    <tr>
	      <th>상품코드(자동생성)</th>
	      <td ><input type="text" name="productCode" value="<%=next_code %>"></td>
	    </tr>
	    <tr>
	      <th>상품명</th>
	      <td ><input type="text" name="productName" value="<%=pName %>"></td>
	    </tr>
	    <tr>
	      <th>매장코드</th>
	      <td ><input type="text" name="storeCode" onchange="changesubmit();" value="<%=sCode %>"></td>
	    </tr>
	    <tr>
	      <th>매 장 명</th>
	      <td ><input type="text" name="storeName" value="<%=sName %>"></td>
	    </tr>
	    <tr>
	      <th>단가</th>
	      <td ><input type="text" name="unitPrice" value="<%=unitP %>"></td>
	    </tr>
	    
	    <tr>
	    <th>재고수</th>
	    <td ><input type="text" name="stockQty" value="<%=sQty %>"></td>
	    </tr>
	    
	    <tr id="button">
	    	<td colspan="2">
	    	<button class="check" onclick="check()">등록</button>
	    	<button type="reset">취소</button>
	    	</td>	    	
	    </tr>
	</table>
	</form>
<script src="productForm.js"> </script>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>