<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<h1>JSON 기본 형태 다루기</h1>
<hr>
<h2>1. JSON 기본 형태 다루기</h2>
<p id ="p1" style="width:600px; height:200px; border:1px solid red;"></p>
<button type="button" onclick="jsonTest1();">출력하기</button>
<!-- button 태그에 type 속성에 사용하는 값 : button, submit, reset -->
<!-- 태그에 사용하는 이벤트속성은 자바스크립트가 제공함
	해당 이벤트가 태그에 발생했을 때 기능(함수) 작동 방법은
	첫번째 : on이벤트명="함수명();"
			실행시킬 함수쪽으로 전달한 값이 있는 경우는
			on이벤트명="함수명(전달값, 전달값);"
	두번째 : on이벤트명="javascript:객체명.메소드명(전달값);"
			on이벤트명 = "javascript:객체명.메소드명();"
	* 클릭 이벤트는 같은 태그 영역 안에 있는 다른 버튼에게 전달됨
	같이 클릭 동작이 발생함 -> 클릭 이벤트가 전달되지 않게 하려면
	on이벤트명="함수명() return false;"
-->

<script type="text/javascript">
//JSON : JavaScript ObjectNotation(자바스크립트 객체 표기법)
//{}로 묶음. "이름" : 값을 한쌍으로 표기함
//"이름"은 따옴표 묶어서 문자형으로 표기함,
//값은 자료형에 따라서 표기함 : "string", number, boolean, [array]
//여러 개의 항목일 때는 ,로 구분함
//var, let, const 키워드로 선언할 수 있음
//var 객체명 = {"이름" : 값, "이름" : "값", "이름" : [값들]};

var member = {
		"userid" : "test007",
		"username" : "홍길동",
		"age" : 30,
		"phone" : '010-1234-5678',
};


function jsonTest1(){
	console.log('member : ' + member); //[Iobject Object] 확인
	
	//JSON 객체를 문자열로 변환해서 출력하기 : stringify() 함수 사용\
	document.getElementById("p1").innerHTML = "<b>JSON 객체를 문자열로 변환해서 출력하기</b><br>";
	document.getElementById("p1").innerHTML += JSON.stringify(member);
	
	//JSON 객체가 가진 값들을 하나씩 꺼내서 출력 추가하기
	document.getElementById("p1").innerHTML += "<br><br><b>JSON 객체가 가진 값들을 하나씩 꺼내서 출력하기</b><br>";
	document.getElementById("p1").innerHTML += "아이디 : " + member.userid + "<br>";
	document.getElementById("p1").innerHTML += "이 름 : " + member.username + "<br>";
	document.getElementById("p1").innerHTML += "나 이 : " + member.age + "<br>";
	document.getElementById("p1").innerHTML += "연락처 : " + member.phone + "<br>";
}

</script>

<hr>
<h2>2. 배열 값을 가진 JSON 객체 다루기</h2>
<p id="p2" style="width:600px; height:400px; border:1px solid red;"></p>
<button type="button" onclick="jsonTest2();">출력하기</button>

<script type="text/javascript">

var employee = {
		"empid": "22031517",
		"username": "김유신",
		"salary": 380,
		"phone": '010-7777-8888',
		"email": 'kim77@test.org',
		"department": "개발부",
		"hobby": ["등산","축구","여행"]
};


function jsonTest2(){
	console.log('employee : ' + employee); //[Iobject Object] 확인
	
	//JSON 객체를 문자열로 변환해서 출력하기 : stringify() 함수 사용\
	document.getElementById("p2").innerHTML = "<b>JSON 객체를 문자열로 변환해서 출력하기</b><br>";
	document.getElementById("p2").innerHTML += JSON.stringify(employee);
	
	//JSON 객체가 가진 값들을 하나씩 꺼내서 출력 추가하기
	document.getElementById("p2").innerHTML += "<br><br><b>JSON 객체가 가진 값들을 하나씩 꺼내서 출력하기</b><br>";
	document.getElementById("p2").innerHTML += "사 번 : " + employee.empid + "<br>";
	document.getElementById("p2").innerHTML += "직원명: " + employee.username + "<br>";
	document.getElementById("p2").innerHTML += "급 여 : " + employee.salary + "<br>";
	document.getElementById("p2").innerHTML += "전화번호 : " + employee.phone + "<br>";
	document.getElementById("p2").innerHTML += "이메일 : " + employee.email + "<br>";
	document.getElementById("p2").innerHTML += "소속부서 : " + employee.department + "<br>";
	document.getElementById("p2").innerHTML += "취미활동 : " + employee.hobby + "<br>";
	
	//항목의 배열값들을 별도로 하나씩 다루기
	document.getElementById("p2").innerHTML += "<br><br><b>JSON 객체가 가진 배열값들을 하나씩 꺼내서 출력</b><br>";
	//for(var i=0; i < employee.hobby.length; i++){}
	for(var i in employee.hobby){
		document.getElementById("p2").innerHTML += "["+ i +"]:" + employee.hobby[i] + "<br>";
	}
}

</script>

<hr>
<h2>3. JSON 객체 안에 JSON 객체 다루기</h2>
<p id="p3" style="width:600px; height:600px; border:1px solid red;"></p>
<button type="button" onclick="jsonTest3();">출력하기</button>

<script type="text/javascript">

var emplist = {
		"D1" :{
				"empid": "22031521",
				"username": "이순신",
				"salary": 480,
				"hobby": ["등산","독서","운동"]
		},
		
		"D2" :{
			"empid": "22031522",
			"username": "황지니",
			"salary": 400,
			"hobby": ["요리","영화","여행"]
		}
};


function jsonTest3(){
	console.log('employee : ' + emplist); //[Iobject Object] 확인
	console.log('employee.D1 : ' + emplist.D1);
	console.log('employee.D2 : ' + emplist.D2);
	
	//JSON 객체를 문자열로 변환해서 출력하기 : stringify() 함수 사용\
	document.getElementById("p3").innerHTML = "<b>JSON 객체를 문자열로 변환해서 출력하기</b><br>";
	document.getElementById("p3").innerHTML += JSON.stringify(emplist);
	document.getElementById("p3").innerHTML += JSON.stringify(emplist.D1);
	document.getElementById("p3").innerHTML += JSON.stringify(emplist.D2);
	
	//JSON 객체가 가진 값들을 하나씩 꺼내서 출력 추가하기
	document.getElementById("p3").innerHTML += "<br><br><b>JSON 객체가 가진 값들을 하나씩 꺼내서 출력하기</b><br>";
	document.getElementById("p3").innerHTML += "<b>[D1 부서 직원 정보]</b><br>";
	document.getElementById("p3").innerHTML += "사 번 : " + emplist.D1.empid + "<br>";
	document.getElementById("p3").innerHTML += "직원명: " + emplist.D1.username + "<br>";
	document.getElementById("p3").innerHTML += "급 여 : " + emplist.D1.salary + "<br>";
	document.getElementById("p3").innerHTML += "취미활동 : " + emplist.D1.hobby + "<br>";
	
	document.getElementById("p3").innerHTML += "<b>[D2 부서 직원 정보]</b><br>";
	document.getElementById("p3").innerHTML += "사 번 : " + emplist.D2.empid + "<br>";
	document.getElementById("p3").innerHTML += "직원명: " + emplist.D2.username + "<br>";
	document.getElementById("p3").innerHTML += "급 여 : " + emplist.D2.salary + "<br>";
	document.getElementById("p3").innerHTML += "취미활동 : " + emplist.D2.hobby + "<br>";
	
	//항목의 배열값들을 별도로 하나씩 다루기
	document.getElementById("p3").innerHTML += "<br><br><b>JSON 객체가 가진 배열값들을 하나씩 꺼내서 출력</b><br>";
	//for(var i=0; i < employee.hobby.length; i++){}
	for(var i in emplist.D1.hobby){
		document.getElementById("p3").innerHTML += "["+ i +"]:" + emplist.D1.hobby[i] + "<br>";
	}
	
	for(var i in emplist.D2.hobby){
		document.getElementById("p3").innerHTML += "["+ i +"]:" + emplist.D2.hobby[i] + "<br>";
	}
}

</script>

<hr>
<h2>4. JSON 객체 안에 계층형 다단계 하위 JSON 객체 다루기</h2>
<p id="p4" style="width:600px; height:750px; border:1px solid red;"></p>
<button type="button" onclick="jsonTest4();">출력하기</button>

<script type="text/javascript">

var emphier = {
		"D1" :{
			"J1" :{
				"empid": "22031521",
				"username": "이순신",
				"salary": 480,
				"hobby": ["등산","독서","운동"]
			},
			"J2" :{
				"empid": "22031522",
				"username": "황지니",
				"salary": 400,
				"hobby": ["요리","영화","여행"]
			}		
		}		
};


function jsonTest4(){
	console.log('emphier : ' + emphier); //[Iobject Object] 확인
	console.log('emphier.D1.J1 : ' + emphier.D1.J1);
	console.log('emphier.D2.J2 : ' + emphier.D1.J2);
	
	//JSON 객체를 문자열로 변환해서 출력하기 : stringify() 함수 사용\
	document.getElementById("p4").innerHTML = "<b>JSON 객체를 문자열로 변환해서 출력하기</b><br>";
	document.getElementById("p4").innerHTML += JSON.stringify(emphier);
	document.getElementById("p4").innerHTML += JSON.stringify(emphier.D1);
	document.getElementById("p4").innerHTML += JSON.stringify(emphier.D1.J1);
	document.getElementById("p4").innerHTML += JSON.stringify(emphier.D1.J2);
	
	//JSON 객체가 가진 값들을 하나씩 꺼내서 출력 추가하기
	document.getElementById("p4").innerHTML += "<br><br><b>JSON 객체가 가진 값들을 하나씩 꺼내서 출력하기</b><br>";
	document.getElementById("p4").innerHTML += "<b>[D1 부서 J1 직급 직원 정보]</b><br>";
	document.getElementById("p4").innerHTML += "사 번 : " + emphier.D1.J1.empid + "<br>";
	document.getElementById("p4").innerHTML += "직원명: " + emphier.D1.J1.username + "<br>";
	document.getElementById("p4").innerHTML += "급 여 : " + emphier.D1.J1.salary + "<br>";
	document.getElementById("p4").innerHTML += "취미활동 : " + emphier.D1.J1.hobby + "<br>";
	
	document.getElementById("p4").innerHTML += "<b>[D2 부서 J2 직급 직원 정보]</b><br>";
	document.getElementById("p4").innerHTML += "사 번 : " + emphier.D1.J2.empid + "<br>";
	document.getElementById("p4").innerHTML += "직원명: " + emphier.D1.J2.username + "<br>";
	document.getElementById("p4").innerHTML += "급 여 : " + emphier.D1.J2.salary + "<br>";
	document.getElementById("p4").innerHTML += "취미활동 : " + emphier.D1.J2.hobby + "<br>";
	
	//항목의 배열값들을 별도로 하나씩 다루기
	document.getElementById("p4").innerHTML += "<br><br><b>JSON 객체가 가진 배열값들을 하나씩 꺼내서 출력</b><br>";
	//for(var i=0; i < employee.hobby.length; i++){}
	for(var i in emphier.D1.J1.hobby){
		document.getElementById("p4").innerHTML += "["+ i +"]:" + emphier.D1.J1.hobby[i] + "<br>";
	}
	
	for(var i in emphier.D1.J2.hobby){
		document.getElementById("p4").innerHTML += "["+ i +"]:" + emphier.D1.J2.hobby[i] + "<br>";
	}
}

</script>
</body>
</html>