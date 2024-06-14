//addProduct스크립트
function check(){
		
		if(document.form.productName.value==""){
			alert("상품명을 입력하세요");
			document.form.productName.focus();
			return false;
		}
		
		if(document.form.unitPrice.value==""){
			alert("가격을 입력하세요");
			document.form.unitPrice.focus();
			return false;
		}
		
		
		if(document.form.stockQty.value==""){
			alert("재고수를 입력하세요");
			document.form.stockQty.focus();
			return false;
		}
		
		
		form.action="productProcess.jsp";
		}
	function changesubmit(){
		document.form.submit();
	}