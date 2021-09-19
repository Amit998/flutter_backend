<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login News</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
    <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
    <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">
    <style>
        body {
            display: -ms-flexbox;
            display: -webkit-box;
            display: flex;
            -ms-flex-align: center;
            -ms-flex-pack: center;
            -webkit-box-align: center;
            align-items: center;
            -webkit-box-pack: center;
            justify-content: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }
        .text-center {
            text-align: center!important;
        }
        .form-signin {
            width: 100%;
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }

        input {
            margin-top: 15px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body class="text-center" cz-shortcut-listen="true">
    <div class="container">
        <form class="form-signin" method="post" action="action/login.php">
            <img class="mb-4" src="assets/img/edu_book.png" alt="" width="72" height="72">
            <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
            <input type="email" id="inputEmail" class="form-control" name="email"placeholder="Email address" required="" autofocus="">
            <input type="password" id="inputPassword" class="form-control" name="password" placeholder="Password" required="">
            <input class="btn btn-lg btn-primary btn-block" type="submit" value="Login">
        </form>
    </div>
</body>
</html>