<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<title>회원 가입</title>

<body>
<form id="signUpForm" method="post">
    <table width="500px">
        <tr><td colspan="6"></td></tr>
        <tr>
            <th> 이름</th>
            <td><input type="text" name="inputId" class="form-control" placeholder="이름" required autofocus></td>
        </tr>
        <tr>
            <th>아이디</th>
            <td>
                <input type="text" name="inputName" class="form-control" placeholder="ID" required>

            </td>
            <td>
                <button class="btn btn-danger">중복확인</button>
            </td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="inputPwd" class="form-control" placeholder="Password" required></td>
        </tr>
        <tr>
            <th>비밀번호 확인</th>
            <td><input type="password" name="inputPwdCheck" class="form-control" placeholder="Password" required></td>
        </tr>
    </table>
    <table width="500px">
        <tr><td colspan="2"><br></td></tr>
        <tr>
            <td colspan="1">
                <button class="btn btn-lg btn-primary btn-block">회원가입</button>
            </td>
            <td colspan="1">
                <button type="reset" class="btn btn-lg btn-block">취소</button>
            </td>
        </tr>
    </table>
</form>
</body>