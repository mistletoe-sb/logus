// dailystory view에 사용하는 js 파일
// 태그 입력 폼
function splitTag(event){
	// 스페이스 바 누를 시 동작
	if(event.keyCode == 32){
		var tagList = $('#tags').val().split(' ');	// 현재 입력한 태그 내용들을 ' ' 기준으로 split
		var tags = '';
		// split한 각 태그들을 검증해서 가공
		for(x of tagList){
			if((x.indexOf('#') != 0) && (x.length > 0)){		// 1글자 이상이고, 맨 첫글자가 #이 아니면,
				tags += ('#' + x + ' ');						// #을 붙여서 추가
			} else if(x.indexOf('#') == 0 && (x.length > 1)){	// 2글자 이상이고, 맨 첫글자가 #이면,
				tags += (x + ' ');								// 그대로 추가
			}
		}
		$('#tags').val(tags);	// 새로 가공된 내용을 출력
	}
}

// 댓글 작성 버튼 & 취소 function
function insertReply(btn){
	// 현재 요소가 '댓글 작성' 버튼인 경우
	if(btn.id == 'reply_ins_btn'){
		$('#form_reply_ins').attr("hidden", false);	// 폼 표시
		$(btn).attr("hidden", true);				// 버튼 숨기기
	} else if(btn.id == 'reply_ins_reset_btn'){		// 현재 요소가 '취소' 버튼인 경우
		$('#reply_ins_btn').attr("hidden", false);	// '댓글 작성' 버튼 표시
		$('#form_reply_ins').attr("hidden", true);	// 폼 숨기기
	}
}

// 댓글 수정 & 취소 function
function updateReply(btn){
	// 현재 요소가 '수정' 버튼인 경우
	if(btn.className == 'reply_p'){
		$(btn).parents('.reply_div').nextAll('.form_reply_upd').attr("hidden", false);	// 폼 표시
		$(btn).parents('.reply_upd').prevAll('.reply_before_upd').attr("hidden", true);	// 텍스트(기존 댓글) 숨기기
		$(btn).parents('.reply_div').attr("hidden", true);								// 버튼 숨기기
	} else if(btn.className == 'reply_upd_reset_btn'){	// 현재 요소가 '취소' 버튼인 경우
		$(btn).parents('.form_reply_upd').prevAll('.reply_div').attr("hidden", false);	// 버튼 표시
		$(btn).parents('.reply_upd').prevAll('.reply_before_upd').attr("hidden", false);// 텍스트(기존 댓글) 표시
		$(btn).parents('.form_reply_upd').attr("hidden", true);							// 폼 숨기기
	}
}

// 댓글 삭제 function
function deleteReply(url){
	var del_check = confirm('댓글을 삭제하시겠습니까?');	// 확인 창 팝업
	if(del_check){
		return location.href=url;	// 확인 버튼 누를 시 해당 url로 이동(댓글 삭제 진행)
	} else {}
}

// 일일 스토리 삭제(document가 준비된 상태이면 버튼 클릭 이벤트에 등록)
$(document).ready(function () {
  $('#ds_del_btn').click(function () {
    var del_check = confirm('스토리를 삭제하시겠습니까?');	// 확인 창 팝업
	if(del_check){
		// ajax로 댓글 수, 태그 수 넘김 + 스토리 삭제 진행
		$.post($('#dsCode_forD').val() + '/delete', 
			{tagCount: $('#tagCount').val(), replyCount: $('#replyCount').val()})
		.done(function(url){
			alert('스토리가 삭제되었습니다.');
			var hostIdx = location.href.indexOf(location.host) + location.host.length;
			var contextPath = location.href.substring(hostIdx, location.href.indexOf('/', hostIdx + 1));
			// https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=mk1126sj&logNo=221019411361 참조(contextPath)
			location.replace(contextPath + url);	// 확인 버튼 누를 시 서재 메인으로 이동
		}).fail(function(){
			alert('스토리 삭제가 실패하였습니다.');
		});
	} else {}
  });
});

/*
// 일일 스토리 삭제 function
function deleteStory(){
	var del_check = confirm('스토리를 삭제하시겠습니까?');	// 확인 창 팝업
	if(del_check){
		var url = '';
		// ajax로 댓글 수, 태그 수 넘김
		$.post($('#dsCode_forD').val() + '/delete', 
			{tagCount: $('#tagCount').val(), replyCount: $('#replyCount').val()}, function(data){
				url = data;
				alert(url);
		}).done(function() {
		}).fail(function() {
			url = '#';
		});
		alert(url);
		return location.href=url;	// 확인 버튼 누를 시 해당 url로 이동(댓글 삭제 진행)
	} else {}
}*/