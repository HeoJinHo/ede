<%@page import="com.ede.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% MemberDTO memberDTO=(MemberDTO)request.getSession().getAttribute("member");
			String id = memberDTO.getId();%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<link href="../css/header.css" rel="stylesheet">
<link href="../css/boardWrite.css" rel="stylesheet">
<script type="text/javascript" src="../SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		var i=2;
		$("#btn").click(function(){
			var f = '<input type="file" name="f'+i+'">';
			$("#files").append(f);
			i++;
		});
		
		//////////////////////////////////////
		//전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        //textarea ID
        elPlaceHolder: "contents",
        sSkinURI: "../SE2/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }
    });
     
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
    })
		
			
	});
</script>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
	<div class="center-contents">
		<form id="frm" action="./${board}Write.${board}" method="post" enctype="multipart/form-data">
			<p>Writer : <%=id%><input type="hidden" name="writer" value="<%=id%>"></p>
			<p>Title : <input type="text" name="title" id="w-title" placeholder="Enter Title"></p>
			<p><textarea rows="" cols="" name="contents" id="contents"></textarea></p>
			<div id="files">
				<input type="file" class="btn btn-default file" name="f1">
			</div>
			<input type="button" class="btn btn-default file" id="btn" value="Add File">
			<p><input type="button" class="btn btn-default write" value="Write" id="savebutton">
			</p>
		</form>
	</div>	
<%@ include file="../temp/footer.jsp" %>
</body>
</html>