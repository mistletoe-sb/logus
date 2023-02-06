<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<form action="<c:url value='findId'/>" method="post" class="form-floating">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				Launch static backdrop modal
				</button>
					
				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
				    	<div class="modal-content">
					    	<div class="modal-header">
					        	<h1 class="modal-title fs-5" id="staticBackdropLabel">아이디 찾기</h1>
					        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      	</div>
					    <div class="modal-body">
					   		<div>
						    	<div class="input-group mb-3">
									<span class="input-group-text" id="inputGroup-sizing-default">이름</span>
									<input type="text" name="memberName" id="memberName" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" pattern="[A-Za-z0-9가-힣]+" required>
								</div>
								
								<div>
									<span id="nameConfirm"></span>
								</div>
							</div>
							
							<div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="inputGroup-sizing-default">생년월일</span>
									<input type="date" name="memberBirth" id="memberBirth" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
								</div>
								<div>
									<span id="birthConfirm"></span>
								</div>
							</div>
							<div>
								<div class="input-group mb-3">
									<input type="hidden" name = hiddenPhone id=hiddenPhone value="false">
									<span class="input-group-text" id="inputGroup-sizing-default">전화번호</span>
									<input type="text" name="memberPhone" id="memberPhone" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"  pattern="\d{3}-\d{3,4}-\d{4}" required>
							 	</div>
							 	<div>
									<span id="phoneConfirm"></span>	
								</div>
							</div>
						</div>
					      	<div class="modal-footer">
					      		<button type="submit" class="btn btn-primary">확인</button>
					        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					      	</div>
					  	</div>
					</div>
				</div>
			</form>
</html>