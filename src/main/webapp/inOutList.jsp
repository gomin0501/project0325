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
<h2>입/출고 정보 목록</h2>
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
		<th>입.출고일자</th>
		<th>매장코드</th>
		<th>매 장 명</th>
		<th>상품코드</th>
		<th>상 품 명</th>
		<th>입.출고구분</th>
		<th>수량</th>
	</tr>
	<%
		sql="select to_char(inoutdate,'yyyy-mm-dd'),a.storecode,storename,a.productcode,productname,gubun,saleqty from inout0325 a,store0325 b,product0325 c where a.storecode=b.storecode and a.productcode=c.productcode order by inoutdate";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		int n=0;
		
		while(rs.next()){
			String date=rs.getString(1);
			String sCode=rs.getString(2);
			String sName=rs.getString(3);
			String pCode=rs.getString(4);
			String pName=rs.getString(5);
			String gubun=rs.getString(6);
			if(gubun.equals("1")){gubun="입고";}
			else if(gubun.equals("2")){gubun="출고";}
			String sQty=rs.getString(7);
			n++;
		%>
	<tr>
		<td><%=n %></td>
		<td><%=date %></td>
		<td><%=sCode %></td>
		<td><%=sName %></td>
		<td><%=pCode %></td>
		<td><%=pName %></td>
		<td><%=gubun %></td>
		<td><%=sQty %></td>
		
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
		<button class="add"><a href="addInOut.jsp">입출고 정보 추가</a></button>
	</div>
	
</section>
<%@ include file="footer.jsp" %>
</body>
</html>