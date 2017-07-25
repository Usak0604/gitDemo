<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome to my web, Login please</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>

<div class="container" >

    <form id="signInForm" class="form-signin" method="post">
        <div class="center-block col-lg-8">
            <h2 class="form-signin-heading">Login.</h2>
            <input type="ID" name="inputId" class="form-control id" placeholder="ID" required autofocus>
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" name="inputPassword" id="inputPassword" class="form-control pwd" placeholder="Password" required>

            <button class="btn btn-lg btn-primary btn-block" onclick="javascript:signIn()">Sign in</button>
        </div>
    </form>

</div>

<script>
    function signIn(){
        var uri = '/loginProcessing';//controller 주소
        $('#signInForm').attr('action', uri);
        $('#signInForm')[0].submit();

        //단순 넘기기
//        location.href="/main/page";
    }
</script>