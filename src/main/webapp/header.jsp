<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style>
/*헤더는 항상 있기 때문에 헤더에만 스타일을 적용해 주면됨*/
  *{
  	margin:0;
  	padding:0;
  }
  body{
  	width:100%;
  	height:100%;
  }
  header{
  	height:12%;
  	padding:2% 0 0 0;
  	background-color:rgb(52, 158, 235);
  	text-align:center;
  	font-size:2em;
  	color:white;
  	position:relative;
  }
  nav{
  	position:absolute;
  	height:76%;
  	width:15%;
  	background-color:black;
  	float:left;
  	text-align:center;
  }
  nav ul{
  	list-style-type:none;
  	padding: 0.5% 0 0.5% 0;
  }
  nav li{
  	display:block;
  	padding: 6%;
  }
  nav li a{
  	text-decoration-line:none;
  	color:white;
  }
  section{
  	width:85%;
  	height:76%;
  	background-color:white;
  	float:right;
  }
  footer{
  	height:5%;
  	padding:0.5% 0 2% 0;
  	background-color:grey;
  	text-align:center;
  	color:white;
  	text-transform: uppercase;
  }
  html,body{
  	margin:0;
  	padding:0;
  	width:100%;
  	height:100%;
  }
  section h2{
  	text-align:center;
  	padding:2% 0 2% 0;
  }
  section h3{
  	text-indent:2%;
  	margin-bottom:1%;
  }
  section ol{
  	padding: 0 2% 0 2%;
  }
  
  ol li{
  	margin:0 20px 0 20px;
  }
  form{
  	margin: 0 auto;
  }
  table{
  	width:80%;
  	margin-left: 10%;
  }
  th{
  	width: 30%;
	background-color:rgb(224, 221, 221);
	text-align:center;
	padding:1% 0;
	border-bottom:none;
}
input, select, button{
		height:100%;
		font-size:14px;
		border:0.5px solid rgb(224, 221, 221);
		padding:1%;
	}
button{
	width:20%;
	background-color:rgb(173, 170, 170);
	border:1px solid black;
	padding:0.5% 0;
	
}
.button{
 	text-align:center;
}
.table th,.table td{
	width:auto;
	text-align:center;
}
caption{
	text-align:left;
}
a{
	text-decoration-line:none;
	
}
#inOut a,.add a{
	color:white;
}
#inOut th{
	width:20%;
}
section .add{
	text-align:center;
}
.addDiv{
	margin-top:10px;
	text-align:center;
	}
.add{
	background-color:rgb(71, 70, 65);
	padding: 0.5%;
	width:auto;
	height:auto;
	text-align:center;
}

</style>
</head>
<body>
<header>
	매장 입출고 관리 시스템ver 1.0
</header>
</body>
</html>