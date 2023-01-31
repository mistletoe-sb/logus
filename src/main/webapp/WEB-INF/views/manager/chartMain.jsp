<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<title>구글차트</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://www.gstatic.com/charts/loader.js"></script>

<script>
 google.charts.load('current', {'packages':['bar']});
 google.charts.setOnLoadCallback(drawChart);

 function drawChart() {
     var data = google.visualization.arrayToDataTable([
       ['Year', 'Sales', 'Expenses', 'Profit'],
       ['2014', 1000, 400, 200],
       ['2015', 1170, 460, 250],
       ['2016', 660, 1120, 300],
       ['2017', 1030, 540, 350]
     ]);

     var options = {
       chart: {
         title: 'Company Performance',
         subtitle: 'Sales, Expenses, and Profit: 2014-2017',
       },
       bars: 'horizontal' // Required for Material Bar Charts.
     };

     var chart = new google.charts.Bar(document.getElementById('barchart_material'));

     chart.draw(data, google.charts.Bar.convertOptions(options));
   }

$(document).ready(function(){

$('button').on('click', function(){

	drawChart();

});

});

</script>

</head>

<body>

<button type="button" id="btn">버튼</button>

<div id="barchart_material" style="width: 900px; height: 500px;"></div>

</body>

</html>