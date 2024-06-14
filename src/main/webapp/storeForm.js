//addStore스크립트
function check(){
		if(document.form.storeName.value==""){
			alert("매장명이 입력되지 않았습니다.");
			document.form.storeName.focus();
			return false;
		}
		
		if(document.form.productCode.value==""){
			alert("상품코드가 입력되지 않았습니다.");
			document.form.productCode.focus();
			return false;
		}
		
		if(document.form.qty.value==""){
			alert("수량을 입력하세요");
			document.form.qty.focus();
			return false;
		}
		form.action="storeProcess.jsp";
		}
	function changesubmit(){
		document.form.submit();
	}