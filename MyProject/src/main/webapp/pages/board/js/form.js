/**
 * 
 */

var domain = document.getElementById("domain");
var category = document.getElementById("category");
var title = document.getElementById("title");
var description = document.getElementById("description");
	
function createCheck() {
	if(domain.value == "") {
		alert("게시판 주소를 입력하세요.");
		return;
	} else if(domain.value.length > 20) {
		alert("게시판 주소는 20자 이하로 입력해야 합니다.");
		return;
	} else if(!check(/^[0-9a-z]*$/, domain, "게시판 주소는 영문 소문자 및 숫자 조합이어야 합니다.")) {
		return;
	}
	
	if(category.value == "") {
		alert("카테고리를 선택해주세요.");
		return;
	}
	
	if(title.value == "") {
		alert("게시판 이름을 입력하세요.");
		return;
	} else if(title.value.length > 50) {
		alert("게시판 이름의 길이가 50Byte를 초과했습니다.");
		return;
	}
	
	if(description.value.length > 100) {
		alert("게시판 소개는 100자 이하로 입력해야 합니다.");
		return;
	}
	
	function check(regExp, e, msg) {
		if(regExp.test(e.value)) {
			return true;
		}
		
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	document.createForm.submit();
}

//var sum = 0;
//
//function inputChange() {
//	console.log("1");
//	var str = document.getElementById("title").value;
//	var strArr = [...str];
//	
//	for(var i=0; i<strArr.length; i++) {
//		if(strArr[i].charCodeAt(0) >= 44032 && strArr[i].charCodeAt(0) <= 55203) {
//			sum += 2;
//		} else {
//			sum += 1;
//		}
//	}
//	
//	document.getElementById("titleLength").InnerHTML = sum + "/50 byte";
//}