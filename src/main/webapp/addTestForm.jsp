<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 19.03.18
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="css/addTestForm.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
    <header>
        <div class="bg-dark" id="navbarHeader">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 col-md-7 py-2">
                        <h4 class="text-white">TUTOR TEST EDITOR</h4>
                        <p class="text-muted">Add test</p>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <main role="main" class="container">
    <form action="addTestForm" method="post" name="loginForm">
    <div class="jumbotron">
        <h2>Add test form</h2>
        <form>
            <div class="form-group">
                <label for="testNameInput">Test title:</label>
                <input type="testName" class="form-control" id="testNameInput" placeholder="Enter text">
            </div>
        </form>
        <form>
             <label for="theme">Choose theme:</label>
             <select class="form-control" id="theme">
                <option>Math</option>
                <option>Physics</option>
                <option>English</option>
             </select>
        </form>

        <button type="submit" class="btn btn-primary" href="/addQuestionForm">Add question</button>
        <button type="submit" class="btn btn-primary">Save</button>
        <button type="button" class="btn btn-danger">Cancel</button>
    </div>
    </main>

    <footer class="footer">
        <div class="container">
            <p>Test tutor system 2018</p>
        </div>
    </footer>

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>
