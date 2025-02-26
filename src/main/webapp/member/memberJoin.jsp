<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="<%=request.getContextPath() %>/<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
	<script type="text/javascript">
		let i=0;
		let u=0;
		$(function(){

			$('#del').click(function(){
				if(i==0)
				{
					$('#delTr').show("slow");
					$('#del').text("취소")
					i=1;
				}
				else
				{
					$('#delTr').hide();
					$('#del').text("삭제")
					i=0;
				}
			})

			$('#delBtn').on("click",function(){
				let pwd=$('#delPwd').val();
				let no=$(this).attr("data-no");
				if(pwd.trim()=="")
				{
					$("#delPwd").focus();
					return;
				}

				$.ajax({
					type:'post',
					url:'../noticeboard/delete.do',
					data:{"no":no,"pwd":pwd},
					success:function(result)
					{
						let res=result.trim();
						if(res=="yes")// 정상 수행 (비밀번호가 같다)
						{
							location.href="../noticeboard/list.do"; // sendRedirect()
						}
						else
						{
							alert("비밀번호가 틀립니다!")
							$('#delPwd').val("");
							$('#delPwd').focus();
						}
					},
					error:function(request, status, error)
					{
						alert(error);
					}

				})
			})

			// $('.details').click(function(){})
			const items = document.querySelectorAll('.question');

			function openCloseAnswer() {
				const answerId = this.id.replace('que', 'ans');

				if(document.getElementById(answerId).style.display === 'block') {
					document.getElementById(answerId).style.display = 'none';
					document.getElementById(this.id + '-toggle').textContent = '+';
				} else {
					document.getElementById(answerId).style.display = 'block';
					document.getElementById(this.id + '-toggle').textContent = '-';
				}
			}

			items.forEach(item => item.addEventListener('click', openCloseAnswer));



		})

	</script>
</head>
<body>

<%-- 요기는 헤더! --%>
<div class="hero page-inner overlay" style="background-image: url('../images/hero_bg_1.jpg'); height:40vh;">
	<!--
            <div class="container">
                <div class="row justify-content-center align-items-center">
                    <div class="col-lg-9 text-center mt-5">
                        <h1 class="heading_signup" data-aos="fade-up"></h1>
                    </div>
                </div>
            </div> -->
</div>

<%-- 요기부터 메인! --%>
<div class="section section-properties">
	<div class="container">
		<div class="two_third first" style="height:auto">
			<div class="col-lg-6">
				<h2 class="font-weight-bold text-primary heading">공지사항</h2>
				<hr/><br><br>

				<c:forEach var="vo" items="${list }">
					<div class="faq-content" style="width:1100px;">
						<button class="question" id="que-${vo.no }"><span id="que-${vo.no }-toggle">+</span>
							<tr>
								<td width="45%">${vo.subject }</td>
								<!-- <td width="50%" style="text-align: right;">${vo.dbday }</td>  -->

							</tr>
						</button>
						<div class="answer" id="ans-${vo.no }">
							<p style="white-space: pre-line;">${vo.content}</p>
							<c:if test="${sessionScope.admin == 'y' }">
								<br><br>

								<tr id="delTr" style="display:none">
									<td colspan="4" class="text-right">
										<span style="color: red;">  비밀번호를 입력하세요! :  </span><input type=password name=pwd size=10 class="input-sm" id="delPwd">
										<input type=button value="삭제" class="w-btn w-btn-red" id="delBtn"  data-no=${vo.no }>
									</td>
								</tr>
								<tr>
									<td colspan="4" class="text-center">
										<button class="w-btn w-btn-green" type="button" style=" display: inline-block;" >
											<a href="../noticeboard/update.do?no=${vo.no }">수정</a>
										</button>
									</td>
								</tr>
							</c:if>
						</div>

					</div>
				</c:forEach>

				<!-- board list area -->
				<div id="board-list">
					<div class="container">
						<table>
							<tr>
								<td>
									<c:if test="${sessionScope.admin == 'y' }">
										<div class="wrap">
											<a href="../noticeboard/insert.do" class="button">새글</a>
												<%--<a href="../main/main.do" class="button">홈</a> --%>
										</div>
									</c:if>
								</td>
								<!-- 페이지 나누는 기능 => 공지사항에서는 일단 비활성화 -->
								<!-- <td class="text-right inline">
       				    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	       					<a href="#" class="btn btn-sm btn-success">이전</a>
	       					${curpage } page / ${totalpage } pages
	       					<a href="#" class="btn btn-sm btn-success">다음</a>
       					</td>  -->
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="<%=request.getContextPath() %>/jquery.serializejson.min.js"></script>

<!-- 우편번호 검색 스크립트 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
h2 {
   margin-left : 20%;
}
#result{
  border : 1px dotted gray;
  padding : 10px;
  margin : 5px;
}
</style>


<script>
$(function(){
	
	//번호검색 이벤트 - 
	$('#zipbtn').on('click', function(){
		// Daum 카카오의 우편번호 검색
		new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    $("#extraAddress").val(extraAddr);
                } else {
                	$("#extraAddress").val('');
                }
				
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $("#zipcode").val(data.zonecode);
                $("#addr1").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                $("#addr2").focus();
            }
        }).open();
	});
	//============================
	//id 중복검사
	 $("#idcheck").on("click",function(){
	
	// $("#id").on("keyup",function(){

		// 입력한 id값 가져오기
		const userId = $("#id").val()
		if(userId.length == 0){
			alert("아이디 체크 하시오")
			$("#id").focus();
			return
		}

		$.ajax({
			url : "<%=request.getContextPath()%>/member/idCheck.do",
			method : "get",
			data :"mem_id=" + userId,

			success : function(data){
				console.log(data);
				$("#idspan").html(data.result).css("color","red");
				
			},
			error : function(xhr){
					alert("오류 상태값 : " + xhr.status)
			},
			
			dataType : "json"
		
		})
	})
	//=============================================
	$("#send").on("click",()=>{
		// 입력한 모든 값 가져오기
		const vid = $("#id").val();
		
		const vname = $("#name").val();
		const vbir = $("#bir").val();
		const vpass = $("#pwd").val();
		const vhp = $("#hp").val();
		const vemail = $("#email").val();
		const vzip = $("#zipcode").val();
		const vaddr1 = $("#addr1").val();
		const vaddr2 = $("#addr2").val();

		//전송할 데이터 구성하기 (json형식 또는 파라미터형식 둘중하나)
		const dataObj ={
			"mem_id" : vid,
			"mem_name" : vname,
			"mem_bir" : vbir,
			"mem_pass" : vpass,
			"mem_hp" : vhp,
			"mem_mail" : vemail,
			"mem_zip" : vzip,
			"mem_add1" : vaddr1,
			"mem_add2" : vaddr2
		}
		// 서버전송
		fetch("<%=request.getContextPath()%>/member/memberInsert.do",
				{
					method : "post",
					headers : {
								"Content_Type" : "application/json; charset=utf-8"
					          },
					body : JSON.stringify(dataObj)		  
				})
				.then(res =>{
					if(res.ok) return res.json();
					else throw new Error(res.responseText)
				})
				.then(data => {
						$("#joinspan").html(data.result).css("color","red");
				})
				.catch(err => {
					console.log(err)}
				
				)
	})
	
})

</script>

</head>

<body>
  <br>
  <br>
  <h2>회원가입</h2>
  <br><br>
 
	<form class="form-horizontal"   onsubmit="return false;"> 
	  
	   <div class="form-group">
	    <label class="control-label col-sm-2" for="id">아이디</label>
	    <div class="col-sm-2">
	      <input type="text" name="mem_id"  class="form-control" id="id" placeholder="id 입력">
	    </div>
	     <input id="idcheck" type="button" class="btn btn-success btn-sm" value="중복검사">
	     <span id="idspan"></span>
	   </div>
	  
	  <div class="form-group">
	    <label class="control-label col-sm-2" for="name">이름</label>
	    <div class="col-sm-2">
	      <input type="text" name="mem_name" class="form-control" id="name" placeholder="이름 입력">
	    </div>
	   </div>
	   
	   <div class="form-group">
	    <label class="control-label col-sm-2" for="bir">생년월일</label>
	    <div class="col-sm-2">
	      <input type="date" name="mem_bir" class="form-control" id="bir">
	    </div>
	   </div>
	 	  
	   <div class="form-group">
	    <label class="control-label col-sm-2" for="pwd">비밀번호</label>
	    <div class="col-sm-2">
	      <input type="password" name="mem_pass" class="form-control" id="pwd" placeholder="비밀번호 입력">
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label class="control-label col-sm-2" for="hp">전화번호</label>
	    <div class="col-sm-2">
	      <input type="text" name="mem_hp" class="form-control" id="hp" placeholder="전화번호 입력">
	    </div>
	  </div>
	  
	  
	  <div class="form-group">
	    <label class="control-label col-sm-2" for="email">이메일</label>
	    <div class="col-sm-3">
	      <input type="text" name="mem_mail" class="form-control" id="email" placeholder="email 입력">
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label class="control-label col-sm-2" for="zip">우편번호</label>
	    <div class="col-sm-2">
	      <input type="text" name="mem_zip" class="form-control" id="zipcode" readonly placeholder="우편번호">
	    </div>
	      <input type="button" class="btn btn-success btn-sm" id="zipbtn" value="우편번호 찾기">
	      
	  </div>
	  
	  <div class="form-group">
	    <label class="control-label col-sm-2" for="addr1">주소</label>
	    <div class="col-sm-3">
	      <input type="text" name="mem_add1" class="form-control" id="addr1" readonly placeholder="주소">
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label class="control-label col-sm-2" for="add2">상세주소</label>
	    <div class="col-sm-3">
	      <input type="text" name="mem_add2" class="form-control" id="addr2" placeholder="상세주소"><br>
	      <input type="text" class="form-control" id="extraAddress" readonly placeholder="참고항목">
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button id="send" type="button" class="btn btn-primary btn-lg">가입하기</button>
	      <span id="joinspan"></span>
	    </div>
	  </div>
	</form>

</body>
</html>
