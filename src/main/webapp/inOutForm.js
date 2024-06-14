//addInOut스크립트
function check(){
		if(document.form.storeCode.value==""){
			alert("매장코드가 입력되지 않았습니다.");
			document.form.storeCode.focus();
			return false;
		}
		
		
		if(document.form.saleQty.value==""){
			alert("수량을 입력하세요");
			document.form.saleQty.focus();
			return false;
		}
		form.action="inOutProcess.jsp";
		}
	function changesubmit(){
		document.form.submit();
	}