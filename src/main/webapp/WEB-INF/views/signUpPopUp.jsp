<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<title>회원 가입</title>

<style>
    .diplay-none{
        display: block;
    }
</style>

<div class="container">
    <div class="row">
        <div class="col-lg-12 text-center">
            <h2>회원가입</h2>
            <hr class="star-primary">
        </div>
    </div>
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <form id="signUpForm" method="post">
                <div id="idDiv" class="form-group has-warning has-feedback">
                    <label for="inputId">ID</label>
                    <input name="inputId" class="form-control" placeholder="ID를 입력해주세요." onkeyup="idCheck()" id="inputId" autofocus>
                    <small id="idLabel" class="pull-right text-warning">ID를 입력해주세요.</small>
                    <span id="idSpan" class="glyphicon glyphicon-warning-sign form-control-feedback"></span>
                </div>
                <div class="form-group">
                    <label for="inputPwd">비밀번호</label>
                    <input type="password" name="inputPassword" class="form-control" placeholder="안전한 비밀번호를 입력해주세요." onkeyup="pwdCheck()" id="inputPwd">
                </div>
                <div id="pwdDiv" class="form-group has-warning has-feedback">
                    <label for="inputPwdCheck">비밀번호 확인</label>
                    <input type="password" name="inputPasswordCheck" class="form-control" placeholder="Passsword" onkeyup="pwdCheck()" id="inputPwdCheck">
                    <small id="pwdLabel" class="pull-right text-warning">비밀번호를 다시 입력해주세요.</small>
                    <span id="pwdSpan" class="glyphicon glyphicon-warning-sign form-control-feedback"></span>
                </div>
                <div class="form-group">
                    <label for="inputName">이름</label>
                    <input name="inputName" class="form-control" placeholder="Name(필수)"  id="inputName">
                </div>
                <div class="form-group">
                    <label for="inputName">닉네임</label>
                    <input name="inputNickName" class="form-control" placeholder="Nick name(선택)"  id="inputNickName">
                </div>
                <div class="form-group">
                    <label for="inputPhoneNum">전화번호</label>
                    <input name="inputPhoneNum" class="form-control" placeholder="Phone Number(선택)"  id="inputPhoneNum">
                </div>
                <div id="emailDiv" class="form-group has-feedback">
                    <label for="inputEmail">E-mail</label>
                    <input name="inputEmail" class="form-control" placeholder="E-mail(필수)"  id="inputEmail">
                    <span id="emailSpan" class="glyphicon form-control-feedback"></span>
                </div>
                <div class="form-group" style="text-align: right">
                    <label for="certification">E-mail 인증코드 :&nbsp;</label>
                    <input name="inputEmailCheck" class="col-md-8" placeholder="인증코드" id="certification" onkeyup="emailCheck()" readonly>
                    <button type="button" id="certification_submit" class="btn btn-primary" onclick="emailSend()">인증코드 발송</button>
                </div>

                <br>
                <div id="success"></div>
                <div class="row" style="text-align: center">
                    <div class="form-group col-md-12" style="align-content: center">
                        <button type="button" id="signIn" class="btn btn-primary btn-lg" onclick="signInFunc()">회원가입</button>
                        <button id="cancel" class="btn btn-default btn-lg" onclick="signUpCancel()">취소</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    <%--id 종류 inputId,inputPwd,inputPwdCheck,inputName,inputPhoneNum,inputEmail,certification--%>
    <%--버튼 id 종류 certification_submit,signIn,cancel --%>
    var isIdCheck = false;
    var isPwdCheck = false;
    var isEmailCheck = false;
    var code = "";
    //중복확인
    function idCheck() {
        var id = $('#inputId').val();
        if( id == "" ){
            $('#idDiv').removeClass('has-success');
            $('#idDiv').removeClass('has-error');
            $('#idDiv').addClass('has-warning');

            $('#idSpan').removeClass('glyphicon-ok');
            $('#idSpan').removeClass('glyphicon-remove');
            $('#idSpan').addClass('glyphicon-warning-sign');

            $('#idLabel').text("ID를 입력해주세요.");
            $('#idLabel').removeClass('text-success');
            $('#idLabel').removeClass('text-danger');
            $('#idLabel').addClass('text-warning');
            isIdCheck = false;
            return;
        }//입력된 아이디가 없을 경우 아무일도 하지 않는다.
        $.ajax({
            url : '/idCheck',
            type : 'post',
            dataType : 'json',
            async : false,
            data : $('#signUpForm').serializeArray(),
            success : function (data) {
                if(data.result == 'success'){
                    $('#idDiv').removeClass('has-warning');
                    $('#idDiv').removeClass('has-error');
                    $('#idDiv').addClass('has-success');

                    $('#idSpan').removeClass('glyphicon-warning-sign');
                    $('#idSpan').removeClass('glyphicon-remove');
                    $('#idSpan').addClass('glyphicon-ok');

                    $('#idLabel').text("사용가능한 ID입니다.");
                    $('#idLabel').removeClass('text-warning');
                    $('#idLabel').removeClass('text-danger');
                    $('#idLabel').addClass('text-success');
                    isIdCheck = true;
                }
                else{
                    $('#idDiv').removeClass('has-success');
                    $('#idDiv').removeClass('has-warning');
                    $('#idDiv').addClass('has-error');

                    $('#idSpan').removeClass('glyphicon-ok');
                    $('#idSpan').removeClass('glyphicon-warning-sign');
                    $('#idSpan').addClass('glyphicon-remove');

                    $('#idLabel').text("이미 ID가 존재합니다.");
                    $('#idLabel').removeClass('text-warning');
                    $('#idLabel').removeClass('text-success');
                    $('#idLabel').addClass('text-danger');
                    isIdCheck = false;
                }
            },
            error : function (error) {
                alert("Error!");
            }
        });
    }

    //비밀번호 확인
    function pwdCheck() {
        var pwd = $('#inputPwd').val();
        var pwdCheck = $('#inputPwdCheck').val();

        if(pwdCheck == ""){
            $('#pwdDiv').removeClass('has-success');
            $('#pwdDiv').removeClass('has-error');
            $('#pwdDiv').addClass('has-warning');

            $('#pwdSpan').removeClass('glyphicon-ok');
            $('#pwdSpan').removeClass('glyphicon-remove');
            $('#pwdSpan').addClass('glyphicon-warning-sign');

            $('#pwdLabel').text("비밀번호를 다시 입력해주세요.");
            $('#pwdLabel').removeClass('text-success');
            $('#pwdLabel').removeClass('text-danger');
            $('#pwdLabel').addClass('text-warning');
            isPwdCheck = false;
        }
        else{
            if(pwd == pwdCheck){
                $('#pwdDiv').removeClass('has-warning');
                $('#pwdDiv').removeClass('has-error');
                $('#pwdDiv').addClass('has-success');

                $('#pwdSpan').removeClass('glyphicon-warning-sign');
                $('#pwdSpan').removeClass('glyphicon-remove');
                $('#pwdSpan').addClass('glyphicon-ok');

                $('#pwdLabel').text("비밀번호가 일치합니다.");
                $('#pwdLabel').removeClass('text-warning');
                $('#pwdLabel').removeClass('text-danger');
                $('#pwdLabel').addClass('text-success');

                isPwdCheck = true;
            }
            else{
                $('#pwdDiv').removeClass('has-warning');
                $('#pwdDiv').removeClass('has-success');
                $('#pwdDiv').addClass('has-error');

                $('#pwdSpan').removeClass('glyphicon-warning-sign');
                $('#pwdSpan').removeClass('glyphicon-ok');
                $('#pwdSpan').addClass('glyphicon-remove');

                $('#pwdLabel').text("비밀번호가 일치하지 않습니다.");
                $('#pwdLabel').removeClass('text-success');
                $('#pwdLabel').removeClass('text-warning');
                $('#pwdLabel').addClass('text-danger');
                isPwdCheck = false;
            }
        }
    }

    //인증 코드 확인
    function emailCheck() {
        var inputCode = $('#certification').val();
        if(inputCode == code){
            isEmailCheck = true;
        }
        else{
            isEmailCheck = false;
        }
    }

    //취소
    function signUpCancel(){
        window.close();
    }
    
    //인증메일 발송
    function emailSend() {
        if($('#inputEmail').val() == ""){
            alert('이메일을 입력해주세요');
            return;
        }
        $.ajax({
            url : '/sendEmail',
            type : 'post',
            dataType : 'json',
            async : false,
            data : $('#signUpForm').serializeArray(),
            success : function (data) {
                alert("입력하신 메일로 인증 코드를 발송하였습니다.\n인증코드를 입력하고 회원가입 버튼을 눌러주세요.");
                code = data.result;
                $('#inputEmail').attr("readonly", true);
                $('#certification').attr("readonly", false);

                $('#emailDiv').addClass('has-success');
                $('#emailSpan').addClass('glyphicon-ok');
            },
            error : function (error) {
                alert("Error!");
            }
        });
    }

    //최종 회원가입
    function signInFunc() {
        //디비에 insert
        alert("최종단계");
    }

</script>