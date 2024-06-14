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
<h2>매장 정보 목록</h2>
<table border=1 class="table">
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
try{
	String sql="select count(*) from store0325";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	int cnt=0;
	if(rs.next()){
		cnt=rs.getInt(1);
	}else{
		cnt=0;
	}
%>
<caption>총 <%=cnt %>개의 매장정보가 있습니다.</caption>	
	<tr>
		<th>no</th>
		<th>매장코드</th>
		<th>매 장 명</th>
		<th>상품코드</th>
		<th>상 품 명</th>
		<th>수량</th>
		<th>관리</th>
	</tr>
	<%
	
		sql="select a.storecode,a.storename,a.productcode,b.productname,qty from store0325 a,product0325 b where a.productcode=b.productcode order by a.storecode";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		int n=0;
		
		while(rs.next()){
			String sCode=rs.getString(1);
			String sName=rs.getString(2);
			String pCode=rs.getString(3);
			String pName=rs.getString(4);
			String qty=rs.getString(5);
			n++;
		%>
	<tr>
		<td><%=n %></td>
		<td ><a href="storeUpdate.jsp?storeCode=<%=sCode %>"><%=sCode %></a></td>
		<td><%=sName %></td>
		<td><%=pCode %></td>
		<td><%=pName %></td>
		<td><%=qty %></td>
		<td>
			<a href="storeDelete.jsp?storeCode=<%=sCode %>"
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
		<button class="add"><a href="addStore.jsp">매장 정보 추가</a></button>
	</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>