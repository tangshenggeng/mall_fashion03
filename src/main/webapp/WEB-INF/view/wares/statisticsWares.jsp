<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>商品统计</title>
<link rel="stylesheet"
	href="${APP_PATH}/static/admin/vendor/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet"
	href="${APP_PATH}/static/admin/vendor/font-awesome/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/admin/css/styles.css">
	<script src="${APP_PATH}/static/vue/vue.min.js"></script>
	<script src="${APP_PATH}/static/vue/vue-resource.min.js"></script>
<%-- <link rel="stylesheet" href="${APP_PATH}/static/layui/css/layui.css"
	media="all"> --%>
<style type="text/css">
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
}

input[type="number"] {
	-moz-appearance: textfield;
}
</style>
</head>
<body class="sidebar-fixed header-fixed">
	<div class="page-wrapper">
		<!-- 头部 -->
		<%@ include file="/WEB-INF/view/common/header.jsp"%>
		<div class="main-container">
			<div class="sidebar">
				<!-- 左侧导航 -->
				<%@ include file="/WEB-INF/view/common/left.jsp"%>
			</div>

			<div class="content">
				<div class="container-fluid">
					<div class="row">
					<div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-light">
                            	季节商品统计
                        </div>

                        <div class="card-body"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
                            <canvas id="seaso-chart" width="698" height="348" class="chartjs-render-monitor" style="display: block; height: 279px; width: 559px;"></canvas>
                        </div>
                </div>
                </div>
                <div class="col-md-6">
	                    <div class="card">
	                        <div class="card-header bg-light">
	                            	价格统计
	                        </div>
	
	                        <div class="card-body"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
	                            <canvas id="price-chart" width="698" height="348" class="chartjs-render-monitor" style="display: block; height: 279px; width: 559px;"></canvas>
	                        </div>
	                    </div>
	                </div>
                        
                    </div>
				</div>
			</div>
		</div>
	</div>
	<script src="${APP_PATH}/static/admin/vendor/jquery/jquery.min.js"></script>
	<script src="${APP_PATH}/static/admin/vendor/popper.js/popper.min.js"></script>
	<script src="${APP_PATH}/static/admin/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/static/admin/vendor/chart.js/chart.min.js"></script>
	<script src="${APP_PATH}/static/admin/js/carbon.js"></script>
	<script src="${APP_PATH}/static/layer/layer.js"></script>

	<script>

	$(document).ready(function () {
		
		$.ajax({
			url:"${APP_PATH}/wares/staWares",
			method:"GET",
			success:function(data){
				var seasoCount = new Array();
				var priceCount = new Array();
				if(data.code == 100){
					seasoCount[0] = data.extend.springCount;
					seasoCount[1] = data.extend.summerCount;
					seasoCount[2] = data.extend.autumnCount;
					seasoCount[3] = data.extend.winterCount;
					
					priceCount[0] = data.extend.priceCount100;
					priceCount[1] = data.extend.priceCount300;
					priceCount[2] = data.extend.priceCount500;
					priceCount[3] = data.extend.priceCountOut500;
					//渲染图表
					var genderChart = $('#seaso-chart');
					 if (genderChart.length > 0) {
					        new Chart(genderChart, {
					            type: 'pie',
					            data: {
					                labels: ["春季", "夏季",'秋季','冬季'],
					                datasets: [{
					                    label: '季节统计',//鼠标指向某个柱时，柱上面显示的标签 比如：'出库'（指着电脑列时会显示这列表示 出库）
					                    data: seasoCount,//柱子表示的数据 
					                    backgroundColor: [
					                    	'rgba(42, 185, 127, 0.5)',
					                    	'rgba(244, 88, 70, 0.5)',
					                    	'rgba(253, 178, 68, 0.5)',
					                        'rgba(33, 150, 243, 0.5)',
					                    ],
					                    borderColor: [
					                    	'rgba(42, 185, 127, 0.5)',
					                    	'rgba(244, 88, 70, 0.5)',
					                    	'rgba(253, 178, 68, 0.5)',
					                        'rgba(33, 150, 243, 0.5)',
					                    ],
					                    borderWidth: 1
					                }]
					            }
					        });
					    }
					 var ageChart = $('#price-chart');
					    if (ageChart.length > 0) {
					        new Chart(ageChart, {
					            type: 'bar',
					            data: {
					                labels: ["0~100", "101~300", "301~500", "500+"],
					                datasets: [{
					                    label: '价格统计',
					                    data: priceCount,
					                    backgroundColor: [
					                        'rgba(244, 88, 70, 0.5)',
					                        'rgba(33, 150, 243, 0.5)',
					                        'rgba(0, 188, 212, 0.5)',
					                        'rgba(42, 185, 127, 0.5)',
					                    ],
					                    borderColor: [
					                        '#F45846',
					                        '#2196F3',
					                        '#00BCD4',
					                        '#2ab97f',
					                    ],
					                    borderWidth: 1
					                }]
					            },
					            options: {
					                legend: {
					                    display: false
					                },
					                scales: {
					                    yAxes: [{
					                        ticks: {
					                            beginAtZero: true
					                        }
					                    }]
					                }
					            }
					        });
					    }
					}else{
						alert("系统繁忙！");
					}
				}
				
		})
	})
	</script>
</body>
</html>
