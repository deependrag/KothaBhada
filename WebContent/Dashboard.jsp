<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/dashboardstyles.css">
</head>

<body>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand navbar-link" href="#"> <img src="assets/img/logo.png" id="logo"></a>
                <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
            </div>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active" role="presentation"><a href="#">Home </a></li>
                    <li role="presentation"><a href="#">Facilities </a></li>
                    <li role="presentation"><a href="#">FAQ </a></li>
                    <li role="presentation"><a href="#">Contact us</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div id="list">
        <div class="container">
            <input type="search" placeholder="Search">
            <button class="btn btn-default" type="button">Search </button>
            <button class="btn btn-default" type="button" id="adduser">Add User</button>
        </div>
        <div class="container">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID </th>
                            <th>Name </th>
                            <th>Password </th>
                            <th>Created </th>
                            <th>Updated </th>
                            <th>Actions </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Deependra Dhakal</td>
                            <td>HelloWorld </td>
                            <td>2017-05-03 </td>
                            <td>2017-05-04 </td>
                            <td>Null </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Pradeep Shrestha</td>
                            <td>Hey </td>
                            <td>2015-03-05 </td>
                            <td>2068-02-54 </td>
                            <td>Null </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>