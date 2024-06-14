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
<h2>상품 정보 목록</h2>
<table border=1 class="table">
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
try{
	String sql="select count(*) from product0325";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	int cnt=0;
	if(rs.next()){
		cnt=rs.getInt(1);
	}else{
		cnt=0;
	}
%>
<caption>총 <%=cnt %>개의 상품정보가 있습니다.</caption>	
	<tr>
		<th>no</th>
		<th>상품코드</th>
		<th>상 품 명</th>
		<th>매장코드</th>
		<th>매 장 명</th>
		<th>단 가</th>
		<th>재고수량</th>
		<th>관리</th>
	</tr>
	<%
		sql="select a.productcode,a.productname,a.storecode,b.storename,to_char(unitprice,'999,999,999'),stockqty from product0325 a,store0325 b where a.storecode=b.storecode";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		int n=0;
		
		while(rs.next()){
			String pCode=rs.getString(1);
			String pName=rs.getString(2);
			String sCode=rs.getString(3);
			String sName=rs.getString(4);
			String unitP=rs.getString(5);
			String sQty=rs.getString(6);
			n++;
		%>
	<tr>
		<td><%=n %></td>
		<td ><a href="productUpdate.jsp?productCode=<%=pCode %>"><%=pCode %></a></td>
		<td><%=pName %></td>
		<td><%=sCode %></td>
		<td><%=sName %></td>
		<td><%=unitP %></td>
		<td><%=sQty %></td>
		<td>
			<a href="productDelete.jsp?productCode=<%=pCode %>"
			onclick="if(!confirm('삭제할까요?')) return false;">삭제</a>
		</td>
	</tr>	
	<%
		}
		
	}catch(Exception e){
		System.out.println("데이터베이스 읽기 오류");
		e.printStackTrace();
	}
%>
</table>
	<div class="addDiv">
		<button class="add"><a href="addProduct.jsp">상품 정보 추가</a></button>
	</div>
	
</section>
<%@ include file="footer.jsp" %>
</body>
</html>