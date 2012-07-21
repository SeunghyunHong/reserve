<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="/reserve/resources/_Shared/js/lib/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="/reserve/resources/_Shared/js/util/stringUtil.js"></script>
<link href="/reserve/resources/css/reserve/seat.css"user_id rel="stylesheet"
	type="text/css" />
<script type="text/javascript">
	
	var selectNum = 1;
	var returnVal=new Array();
	
	function selectedSeat(num){
		
		var personTotal = parseInt($("#adultNum").val())+parseInt($("#childNum").val());
		
		var seatId = $("#seatName"+num); 
		
		var selectSeatNum="";
		
		if(selectNum<=personTotal){
			if(seatId.hasClass("noReserveSeat")){
				seatId.removeClass("noReserveSeat");
				seatId.addClass("reserveSeat");
				selectNum++;
				selectSeatNum+=num+",";
				returnVal  = findRemoveSeat(selectSeatNum,"");
			}
			else{
				seatId.removeClass("reserveSeat");
				seatId.addClass("noReserveSeat");
				selectNum--;
				returnVal  = findRemoveSeat(selectSeatNum,num);
			}
		}
		else{
			alert('선택인원을 초과하였습니다');
		}
		
	}
	
	function reserveSubmit(){
		$.ajax({
			type:"POST",
			url: "/reserve/reserv/process",
			dataType: "txt",
			data:"seatNum="+returnVal,
			success: function(msg){
				alert('success');
			},
			fail: function(msg){
				alert('fail');
			}
		});		
	}
	
	function findRemoveSeat(s,seatNum){
		
		var seat = split(s,",");
		var temp=new Array();
		
		for(var i=0;i<seat.length;i++){
			if(parseInt(seat[i])==parseInt(seatNum)){
				
			}
			else{
				temp[i]=seat[i];
				
			}
		}
		
		return temp;
	}
	
</script>
</head>
<body>
	<div id="personNum">
		성인 : <input type="text" id="adultNum" /> 명 &nbsp; 어린이 : <input type="text" id="childNum" />
		&nbsp;  <input type="button" value="확인" onclick="reserveSubmit()" />
	</div>

	<div id="seat">

		<c:forEach var="num" items="${seatNum}" varStatus="status">

			<c:choose>
				<c:when test="${num=='0' }">
					<div class="blankSeat"></div>
				</c:when>
				<c:when test="${num=='1' }">
					<div id="seatName${status.count }" class="noReserveSeat"
						onclick="selectedSeat(${status.count})"></div>
				</c:when>
				<c:when test="${num=='2' }">
					<div class="reserveSeat"></div>
				</c:when>
				<c:when test="${num=='3' }">
					<br />
				</c:when>
			</c:choose>

		</c:forEach>

	</div>
</body>
</html>