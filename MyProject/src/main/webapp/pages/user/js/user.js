/**
 * 
 */

var state = 0;

// 회원가입 유효성 검사
function signupCheck() {
	var id = document.getElementById("id");
	var pw = document.getElementById("pw");
	var check_pw = document.getElementById("check_pw");
	var nickname = document.getElementById("nickname");
	
	if(id.value == "") {
		alert("아이디를 입력하세요.");
		return;
	}
	
	if(pw.value == "") {
		alert("비밀번호를 입력하세요.");
		return;
	} else if(!check(/^([0-9a-zA-Z])[0-9a-zA-Z]{7,}$/, pw, "비밀번호는 영문 대/소문자 및 숫자 조합 8자 이상 입력해야 합니다.")) {
		return;
	} else if(pw.value != check_pw.value) {
		alert("비밀번호가 일치하지 않습니다.");
		return;
	}
	
	if(nickname.value == "") {
		alert("닉네임을 입력하세요.");
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
	
	document.signupForm.submit();
}

// 로그인 공백 검사
function loginCheck() {
	var id = document.getElementById("id");
	var pw = document.getElementById("pw");
	
	if(id.value == "") {
		alert("아이디를 입력하세요.");
		return;
	}
	
	if(pw.value == "") {
		alert("비밀번호를 입력하세요.");
		return;
	}
	
	document.loginForm.submit();
}

// 정보수정 유효성 검사
function editCheck() {
	var pw = document.getElementById("pw");
	var nickname = document.getElementById("nickname");
	
	if(pw.value == "") {
		alert("비밀번호를 입력하세요.");
		return;
	} else if(!check(/^([0-9a-zA-Z])[0-9a-zA-Z]{7,}$/, pw, "비밀번호는 영문 대/소문자 및 숫자 조합 8자 이상 입력해야 합니다.")) {
		return;
	}
	
	if(nickname.value == "") {
		alert("닉네임을 입력하세요.");
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
	
	document.editForm.submit();
}

// 정보수정 버튼 클릭 감지
function btnChangeState(elem) {
	var input = elem.parentElement.previousElementSibling.firstElementChild;
	
	if(state == 0) {
		state = 1;
		input.removeAttribute("readonly");
		elem.innerHTML = "확인";
	} else if(state == 1) {
		state = 0;
		input.setAttribute("readonly", true);
		elem.innerHTML = "변경";
	}
}