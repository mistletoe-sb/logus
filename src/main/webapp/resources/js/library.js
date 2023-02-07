/**
 * library.jsp에서 사용하는 js파일
 */
/*const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', () => {
	myInput.focus()
})*/

function followBtn1() {
	const btn1 = document.getElementById('followbtn1');
	const btn2 = document.getElementById('followbtn2');
		  
	// btn 숨기기 (display: none)
	if(btn1.style.display !== 'none') {
		btn1.style.display = 'none';
		btn2.style.display = 'block';
	}
	// btn 보이기 (display: block)
	else {
		btn1.style.display = 'block';
		btn2.style.display = 'none';
	}
}
		
function followBtn2() {
	const btn1 = document.getElementById('followbtn1');
	const btn2 = document.getElementById('followbtn2');
	
	// btn 숨기기 (display: none)
	if(btn2.style.display !== 'none') {
		btn1.style.display = 'block';
		btn2.style.display = 'none';
	}
	// btn 보이기 (display: block)
	else {
		btn1.style.display = 'none';
		btn2.style.display = 'block';
	}
}