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
	<form name="form" method="post" action="addInOut.jsp">
		<h2>입출고 정보 등록</h2>
	<table border="1" id="inOut">
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sCode=request.getParameter("storeCode");
	String sName=request.getParameter("storeName");
	String pCode=request.getParameter("productCode");
	String pName=request.getParameter("productName");
	//글 삭제 방지
	String slQty=request.getParameter("saleQty");
	String date=request.getParameter("inOutDate");
	String gubun=request.getParameter("gubun");
	
	int unitP=0,total=0;
	int qty=0;
	
	if(date==null){
		date="";
	}
	
	if(slQty==null||slQty==""){
		qty=0;
	}else{
		qty=Integer.parseInt(slQty);
	}
	if(gubun==null){
		gubun="";
	}
	try{
		String sql="select a.storecode,storename,b.productcode,productname,b.unitprice from store0325 a,product0325 b where a.productcode=b.productcode and a.storecode=? and b.productcode=?";
		pstmt=conn.prepareStatement(sql);
		//맨 뒤 물음표에 대한걸 세팅
		pstmt.setString(1,sCode);
		pstmt.setString(2,pCode);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			sCode=rs.getString(1);
			sName=rs.getString(2);
			pCode=rs.getString(3);
			pName=rs.getString(4);
			unitP=rs.getInt(5);
			total=qty*unitP;
		}else if(sCode==null){
			sCode="";
			sName="";
			pCode="";
			pName="";
		}
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}
%>
	    <tr>
	      <th>입출고일자</th>
	      <td colspan="3"><input type="text" name="inOutDate" value="<%=date %>"></td>
	    </tr>
	    <tr>
	      <th>매장코드</th>
	      <td ><input type="text" name="storeCode" onchange="changesubmit();" value="<%=sCode %>"></td>
	      <th>매장명</th>
	      <td ><input type="text" name="storeName" value="<%=sName %>"></td>
	    </tr>
	    <tr>
	      <th>상품코드</th>
	      <td ><input type="text" name="productCode" onchange="changesubmit();" value="<%=pCode %>"></td>
	      <th>상품명</th>
	      <td ><input type="text" name="productName" value="<%=pName %>"></td>
	    </tr>
	    <tr>
	    	<th>입출고구분</th>
	    	<td colspan="3">
	    		<input type="radio" name="gubun" value="1" <%if(gubun.equals("1")){ %>checked<% } %>>입고
	    		<input type="radio" name="gubun" value="2" <%if(gubun.equals("2")){ %>checked<% } %>>출고
	    	</td>
	    </tr>
	    <tr>
	      <th>입출고 수량</th>
	      <td ><input type="text" name="saleQty" placeholder="0" onchange="changesubmit();" value="<%=qty %>"></td>
	      <th>입출고 금액</th>
	      <td ><input type="text" name="saleTotal" placeholder="0" value="<%=total %>"></td>
	    </tr>
	    
	    <tr class="button">
	    	<td colspan="4">
	    	<button><a href="inOutList.jsp">목록</a></button>
	    	<button class="check" onclick="check()">저장</button>
	    	</td>	    	
	    </tr>
	</table>
	</form>
<script src="inOutForm.js"> </script>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>