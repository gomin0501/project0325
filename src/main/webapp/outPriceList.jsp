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
<h2>출고 정보(금액) 목록</h2>
<table border=1 class="table">
<%@ include file="dbconn.jsp" %>

	<tr>
		<th>no</th>
		<th>입.출고일자</th>
		<th>매장코드</th>
		<th>매 장 명</th>
		<th>상품코드</th>
		<th>상 품 명</th>
		<th>출고수량</th>
		<th>단가</th>
		<th>출고금액</th>
		<th>할인된금액(10%)</th>
	</tr>
	<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;	
	try{
		String sql="select to_char(inoutdate,'yyyy-mm-dd'),a.storecode,storename,a.productcode,productname,saleqty,to_char(unitprice,'999,999,999'),to_char((saleqty*unitprice),'999,999,999'),to_char((saleqty*unitprice*0.9),'999,999,999') from inout0325 a,store0325 b,product0325 c where a.gubun='2' and a.storecode=b.storecode and a.productcode=c.productcode order by inoutdate";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		int n=0,oQty=0;
		String dcp="";
		while(rs.next()){
			String date=rs.getString(1);
			String sCode=rs.getString(2);
			String sName=rs.getString(3);
			String pCode=rs.getString(4);
			String pName=rs.getString(5);
			String qty=rs.getString(6);
			String price=rs.getString(7);
			String total=rs.getString(8);
			String dc=rs.getString(9);
			oQty=Integer.parseInt(qty);
			if(oQty>=5){
				dcp=dc;
			}else{
				dcp=total;
			}
			n++;
		%>
	<tr>
		<td><%=n %></td>
		<td><%=date %></td>
		<td><%=sCode %></td>
		<td><%=sName %></td>
		<td><%=pCode %></td>
		<td><%=pName %></td>
		<td><%=qty %></td>
		<td><%=price %></td>
		<td><%=total %></td>
		<td><%=dcp %></td>
		
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