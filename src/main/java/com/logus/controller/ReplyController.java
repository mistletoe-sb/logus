package com.logus.controller;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.logus.reply.model.ReplyVO;
import com.logus.reply.service.IReplyService;
import com.logus.util.redirectencoder.RedirEncoder;

@Controller
// 댓글 서비스 제어하는 컨트롤러 클래스
// 작성자 : 이수봉
public class ReplyController {

//	private static Logger logger = LoggerFactory.getLogger(ReplyService.class);	// 로깅을 위한 객체 참조
	
	@Autowired
	private IReplyService replyService;		// 댓글 서비스 객체
	
	@PostMapping(value="{memberNickname}/reply/insert")
	// 댓글 추가
	public String insertReply(ReplyVO vo, @PathVariable String memberNickname) {
		replyService.insertReply(vo);			// 댓글 작성
		return "redirect:/" + RedirEncoder.encode(memberNickname) + "/library/story/" + vo.getDailystoryCode();		// 해당 스토리 상세 보기로 redirect
	}

	@PostMapping(value="{memberNickname}/{dailystoryCode}/reply/update/{replyCode}")
	// 댓글 수정
	public String updateReply(ReplyVO vo, @PathVariable String memberNickname, @PathVariable int dailystoryCode) {
		replyService.updateReply(vo);			// 해당 댓글 수정
		return "redirect:/" + RedirEncoder.encode(memberNickname) + "/library/story/" + dailystoryCode;		// 해당 스토리 상세 보기로 redirect
	}

	@GetMapping(value="{memberNickname}/{dailystoryCode}/reply/delete/{replyCode}")
	// 댓글 삭제
	public String deleteReply(@PathVariable String memberNickname, @PathVariable int dailystoryCode, @PathVariable int replyCode) {
		replyService.deleteReply(replyCode);	// 해당 댓글 삭제
		return "redirect:/" + RedirEncoder.encode(memberNickname) + "/library/story/" + dailystoryCode;		// 해당 스토리 상세 보기로 redirect
	}

}
