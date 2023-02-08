<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
    <head>
		<style type="text/css">
         .container{
            width : 1400px;
            background-color: #f7f7f7;
            float:none;
         }
         .title{
            margin : 40px auto;
            text-align : center;
         }
         .title2{
            margin : 40px auto;
            text-align : right;
         }
      	</style>
		<%@ include file="../header.jsp" %>
		<%@ include file="managerside.jsp" %>
		
			    <!--Load the AJAX API-->
	    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	    <script type="text/javascript">
	
	      // Load the Visualization API and the corechart package.
	      google.charts.load('current', {'packages':['corechart']});
	
	      // Set a callback to run when the Google Visualization API is loaded.
	      google.charts.setOnLoadCallback(drawChart);
	
	      // Callback that creates and populates a data table,
	      // instantiates the pie chart, passes in the data and
	      // draws it.
	      function drawChart() {
	
	    	  var jsonData = $.ajax({
	              url: "http://localhost:8080/logus/manager/statistics/json/memberjob",
	              dataType:"json",
	              data: {
// 	            	  "id1":aId, "id2":bId
	            		},
	              async: false
	              }).responseText;
	    	  
	    	  
//     	    //차트 그리기에 필요한 json 데이터 로딩
//     	    var jsonData = $.ajax({
//     	        url: "http://localhost:8080/logus/manager/statistics/json/memberjob",
//     	        type : "post",
//     	    	data : {
    	    	    
//     	    	}
//     	    });
    	    
    	    //json형식으로 데이터가 담김
    	    console.log(jsonData);

	        // Create the data table.
	        var data = new google.visualization.DataTable(jsonData);
	        
	        console.log("데이터 테이블 :" +data);
	        
// 	        data.addColumn('string', 'mJob');
// 	        data.addColumn('number', 'Pie');
// 	        data.addRows([
// 	            ['Mushrooms', 3],
// 	            ['Onions', 1],
// 	            ['Olives', 1],
// 	            ['Zucchini', 1],
// 	            ['Pepperoni', 2]
// 	        ]);
	
	        // Set chart options
	        var options = {'title':'직업별 가입자 통계',
	                       'width':400,
	                       'height':300};
	
	        // Instantiate and draw our chart, passing in some options.
	        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
	        chart.draw(data, options);
	      }
	      
	      google.charts.setOnLoadCallback(drawChart02);

	      function drawChart02() {
	    		
	    	  var jsonData02 = $.ajax({
	              url: "http://localhost:8080/logus/manager/statistics/json/membergeneration",
	              dataType:"json",
	              data: {
// 	            	  "id1":aId, "id2":bId
	            		},
	              async: false
	              }).responseText;
    	    
    	    //json형식으로 데이터가 담김
    	    console.log(jsonData02);

	        // Create the data table.
	        var data02 = new google.visualization.DataTable(jsonData02);
	        
	        console.log("데이터 테이블 :" +data02);
	        
	        // Set chart options
	        var options02 = {'title':'나이대별 가입자 통계',
	                       'width':400,
	                       'height':300};
	
	        // Instantiate and draw our chart, passing in some options.
	        var chart02 = new google.visualization.PieChart(document.getElementById('chart_div02'));
	        chart02.draw(data02, options02);
	      }
	      
	      google.charts.setOnLoadCallback(drawChart03);

	      function drawChart03() {
	    		
	    	  var jsonData = $.ajax({
	              url: "http://localhost:8080/logus/manager/statistics/json/tag",
	              dataType:"json",
	              data: {
// 	            	  "id1":aId, "id2":bId
	            		},
	              async: false
	              }).responseText;
    	    
    	    //json형식으로 데이터가 담김
    	    console.log(jsonData);

	        // Create the data table.
	        var data = new google.visualization.DataTable(jsonData);
	        
	        console.log("데이터 테이블 :" +data);
	        
	        // Set chart options
	        var options = {'title':'태그 순위 통계',
	                       'width':400,
	                       'height':300};
	
	        // Instantiate and draw our chart, passing in some options.
	        var chart = new google.visualization.PieChart(document.getElementById('chart_div03'));
	        chart.draw(data, options);
	      }
	      
	      google.charts.setOnLoadCallback(drawChart04);

	      function drawChart04() {
	    		
	    	  var jsonData = $.ajax({
	              url: "http://localhost:8080/logus/manager/statistics/json/follow",
	              dataType:"json",
	              data: {
// 	            	  "id1":aId, "id2":bId
	            		},
	              async: false
	              }).responseText;
    	    
    	    //json형식으로 데이터가 담김
    	    console.log(jsonData);

	        // Create the data table.
	        var data = new google.visualization.DataTable(jsonData);
	        
	        console.log("데이터 테이블 :" +data);
	        
	        // Set chart options
	        var options = {'title':'팔로우 순위 통계',
	                       'width':400,
	                       'height':300};
	
	        // Instantiate and draw our chart, passing in some options.
	        var chart = new google.visualization.PieChart(document.getElementById('chart_div04'));
	        chart.draw(data, options);
	      }
	      
	      google.charts.setOnLoadCallback(drawChart05);

	      function drawChart05() {
	    		
	    	  var jsonData = $.ajax({
	              url: "http://localhost:8080/logus/manager/statistics/json/routine",
	              dataType:"json",
	              data: {
// 	            	  "id1":aId, "id2":bId
	            		},
	              async: false
	              }).responseText;
    	    
    	    //json형식으로 데이터가 담김
    	    console.log(jsonData);

	        // Create the data table.
	        var data = new google.visualization.DataTable(jsonData);
	        
	        console.log("데이터 테이블 :" +data);
	        
	        // Set chart options
	        var options = {'title':'데일리루틴 공유 순위 통계',
	                       'width':400,
	                       'height':300};
	
	        // Instantiate and draw our chart, passing in some options.
	        var chart = new google.visualization.PieChart(document.getElementById('chart_div05'));
	        chart.draw(data, options);
	      }
	    </script>
	    
	    <style type="text/css">
	    	div {
 	    		clear: both !important;
 	    	}
	    </style>
    </head>
    <body class="container">
        <h1 class="title">관리자 통계</h1>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		<h5 class = "title2">${sessionScope.sessionManagerNickname}</h5><br>

		
		<fieldset>
	    <!--Div that will hold the pie chart-->
	    <ul><div id="chart_div"></div></ul>
	    <ul><div id="chart_div02"></div></ul>
	    <ul><div id="chart_div03"></div></ul>
	    <ul><div id="chart_div04"></div></ul>
	    <ul><div id="chart_div05"></div></ul>
	    </fieldset>
		
<!-- 		<div class="d-grid gap-2 col-2 mx-auto"> -->
<!--             <button class="btn btn-primary" type="button" onclick="location.href='http://localhost:8080/logus/manager/managerlogout'">관리자 로그아웃 하기</button> -->
<!--         </div> -->
	</body>
</html>