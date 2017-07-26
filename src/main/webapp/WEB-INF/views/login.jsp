<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome to my web, Login please</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>

<style>
    #id_message{
        color: #ff0000;
        padding-top: 5px;
    }
    #pwd_message{
        color: #ff0000;
        padding-top: 5px;
    }
    .container{

    }
</style>

<div class="container" >

    <form id="signInForm" method="post">
        <div class="center-block col-lg-8">
            <h2 class="form-signin-heading">Login.</h2>
            <br>
            <input type="ID" name="inputId" class="form-control id" onchange="javascript:inputChange(1)" placeholder="ID" required autofocus>
            <p id="id_message">&nbsp;</p>
            <%--<label for="inputPassword" class="sr-only">Password</label>--%>
            <input type="password" name="inputPassword" class="form-control pwd" onchange="inputChange(2)" required placeholder="Password">
            <p id="pwd_message">&nbsp;</p>
            <button class="btn btn-lg btn-primary btn-block" onclick="javascript:signIn()">Sign In</button>
            <br>
            <button class="btn btn-lg btn-primary btn-block" onclick="javascript:signUp()">Sign Up</button>
        </div>
    </form>

</div>

<script>
    $(document).ready(function () {
        <%session.invalidate();%>
    });
    function signIn(){
        //id, pwd 검사
        var id = $('input[name=inputId]').val();
        var pwd = $('input[name=inputPassword]').val();
        if(id == ""){
            $('#pwd_message').text("");
            $('#pwd_message').append("&nbsp;");
            $('#id_message').text("");
            $('#id_message').append("&nbsp; &nbsp;" + "ID를 입력하세요.");
        }
        else if(pwd == ""){
            $('#pwd_message').text("");
            $('#pwd_message').append("&nbsp; &nbsp;" + "비밀번호를 입력하세요.");
        }
        //계정 정보확인
        else {
            $.ajax({
                url : '/userCheck',
                type : 'get',
                dataType : 'json',
                async : false,
                data : $('#signInForm').serializeArray(),
                success : success,
                error : error
            });
        }
    }

    function success(data) {
        if (data.result == 'success') {//로그인 성공
            var uri = '/loginProcessing';//controller 주소
            $('#signInForm').attr('action', uri);
            $('#signInForm')[0].submit();
        }
        else{//로그인 실패
            alert("사용자 정보가 없습니다.\n회원가입 해주세요~");
        }
    }

    function error(request,status,error) {
        alert("code:"+request.status+"\n"+"message:"+request.resoponseText+"\n"+"error:"+error);
    }

    function inputChange(flag) {
        if(flag == 1) {
            $('#id_message').text("");
            $('#id_message').append("&nbsp;");
        }
        else {
            $('#pwd_message').text("");
            $('#pwd_message').append("&nbsp;");
        }
    }
    
    function signUp() {
        var popUrl = "/signUp";

        var winHeight = document.body.clientHeight;	// 현재창의 높이
        var winWidth = document.body.clientWidth;	// 현재창의 너비
        var winX = window.screenX || window.screenLeft || 0;// 현재창의 x좌표
        var winY = window.screenY || window.screenTop || 0;	// 현재창의 y좌표

        var popX = winX + (winWidth - 370)*0.4;
        var popY = winY + (winHeight - 360)*0.4;

        var popOption = "width=500, height=360, menubar=no, scrollbars=no, status=no;, top=" + popY + ", left=" + popX;
        window.open(popUrl,"회원가입",popOption);
    }
    
</script>

<script language="javascript">
    //로그인을 해놓고 뒤로가기를 누르면 못오게 막음, 이것은 회원가입에도 적용되어야하며 로그아웃을 통해야만 갈 수 있다.
    history.go(1);
</script>
