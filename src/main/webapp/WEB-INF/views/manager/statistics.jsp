<%@ include file="../header.jsp" %>
<%@ include file="managerside.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>관리자 통계</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		
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
	
	        // Create the data table.
	        var data = new google.visualization.DataTable();
	        data.addColumn('string', 'Topping');
	        data.addColumn('number', 'Slices');
	        data.addRows([
	          ['Mushrooms', 3],
	          ['Onions', 1],
	          ['Olives', 1],
	          ['Zucchini', 1],
	          ['Pepperoni', 2]
	        ]);
	
	        // Set chart options
	        var options = {'title':'How Much Pizza I Ate Last Night',
	                       'width':400,
	                       'height':300};
	
	        // Instantiate and draw our chart, passing in some options.
	        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
	        chart.draw(data, options);
	      }
	    </script>
    </head>
    <body>
        <h1>관리자 통계</h1>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		<h2>로그인 관리자 별명 : ${sessionScope.sessionManagerNickname}</h2>
		
	    <!--Div that will hold the pie chart-->
	    <div id="chart_div"></div>
		
		<div class="d-grid gap-2 col-2 mx-auto">
            <button class="btn btn-primary" type="button" onclick="location.href='http://localhost:8080/logus/manager/managerlogout'">관리자 로그아웃 하기</button>
        </div>
	</body>
</html>