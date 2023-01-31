package com.logus.qna.model;

import java.sql.Date;

// 이 VO는 롬복 사용시 수정되기 이전 변수명으로 인식되어 바뀐 내용으로 적용이 안 됨. getter 및 setter, toString 소스코드 유지 요망.
public class QnaVO {
	private int qnaCode;
	private String qTitle;
	private String qContent;
	private Date qDate;
	private String memberNickname;
	private String aContent;
	private Date aDate;
	private String managerNickname;
	
	public int getQnaCode() {
		return qnaCode;
	}
	public void setQnaCode(int qnaCode) {
		this.qnaCode = qnaCode;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public Date getqDate() {
		return qDate;
	}
	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public Date getaDate() {
		return aDate;
	}
	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}
	public String getManagerNickname() {
		return managerNickname;
	}
	public void setManagerNickname(String managerNickname) {
		this.managerNickname = managerNickname;
	}
	
	@Override
	public String toString() {
		return "QnaVO [qnaCode=" + qnaCode + ", qTitle=" + qTitle + ", qContent=" + qContent + ", qDate=" + qDate
				+ ", memberNickname=" + memberNickname + ", aContent=" + aContent + ", aDate=" + aDate
				+ ", managerNickname=" + managerNickname + "]";
	}
	
}
