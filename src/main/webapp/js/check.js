function voteCheck(){
	
	if(frm.v_jumin.value.length==0){
		alert("주민번호가 입력되지 않았습니다!");
		frm.v_jumin.focus()
		return false
	}
	else if(frm.v_name.value.length==0){
		alert("성명이 입력되지 않았습니다!");
		frm.v_name.focus()
		return false
	}
	else if(frm.m_no.value==0){
		alert("후보번호가 선택되지 않았습니다!");
		frm.m_no.focus()
		return false
	}
	else if(frm.v_time.value.length==0){
		alert("투표시간이 입력되지 않았습니다!");
		frm.v_time.focus()
		return false
	}
	else if(frm.v_area.value.length==0){
		alert("투표장소가 입력되지 않았습니다!");
		frm.v_area.focus()
		return false
	}
	else if(frm.v_confirm[0].checked==false && frm.v_confirm[1].checked==false){
		alert("유권자확인이 선택되지 않았습니다!");
		frm.v_confirm.focus()
		return false
	}
	else{
		alert("투표하기 정보가 정상적으로 등록되었습니다!");
		document.frm.submit()
	}
	return true

	
}

function res(){
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.frm.reset()
	frm.v_jumin.focus()
}
