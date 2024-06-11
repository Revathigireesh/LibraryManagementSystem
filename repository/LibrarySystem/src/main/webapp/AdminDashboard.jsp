<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');
        * {
            list-style: none;
            text-decoration: none;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Open Sans', sans-serif;
        }

        body {
            background: #f5f6fa;
        }

        .wrapper .sidebar {
            background: #24365d;
            position: fixed;
            top: 0;
            left: 0;
            width: 225px;
            height: 100%;
            padding: 20px 0;
            transition: all 0.5s ease;
        }

        .wrapper .sidebar .profile {
            margin-bottom: 30px;
            text-align: center;
        }

        .wrapper .sidebar .profile img {
            display: block;
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin: 0 auto;
        }

        .wrapper .sidebar .profile h3 {
            color: #ffffff;
            margin: 10px 0 5px;
        }

        .wrapper .sidebar .profile p {
            color: rgb(206, 240, 253);
            font-size: 14px;
        }

        .wrapper .sidebar ul li a {
            display: block;
            padding: 13px 30px;
            border-bottom: 1px solid #24365d;
            color: rgb(241, 237, 237);
            font-size: 16px;
            position: relative;
        }

        .wrapper .sidebar ul li a .icon {
            color: #dee4ec;
            width: 30px;
            display: inline-block;
        }

        .wrapper .sidebar ul li a:hover {
            color: #24365d;
            background: white;
            border-right: 2px solid #24365d;
        }

        .wrapper .sidebar ul li a:hover .icon,
        .wrapper .sidebar ul li a.active .icon {
            color: #24365d;
        }

        .wrapper .sidebar ul li a:hover:before,
        .wrapper .sidebar ul li a.active:before {
            display: block;
        }

        .wrapper .section {
            width: calc(100% - 225px);
            margin-left: 225px;
            transition: all 0.5s ease;
        }

        .wrapper .section .top_navbar {
            background: #24365d;
            height: 50px;
            display: flex;
            align-items: center;
            padding: 0 30px;
        }

        .wrapper .section .top_navbar .hamburger a {
            font-size: 28px;
            color: #f4fbff;
        }

        .wrapper .section .top_navbar .hamburger a:hover {
            color: #a2ecff;
        }

        body.active .wrapper .sidebar {
            left: -225px;
        }

        body.active .wrapper .section {
            margin-left: 0;
            width: 100%;
        }
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .card {
            margin: 30px;
            width: 300px;
            height: 250px;
            border-radius: 40px;
            box-shadow: 5px 5px 30px 7px rgba(0,0,0,0.25), -5px -5px 30px 7px rgba(0,0,0,0.22);
            cursor: pointer;
            transition: 0.4s;
            z-index: 0;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .card .card_title {
            text-align: center;
            border-radius: 0px 0px 40px 40px;
            font-family: sans-serif;
            font-weight: bold;
            font-size: 30px;
            margin-top: -80px;
            height: 40px;
        }

        .card:hover {
            transform: scale(0.9, 0.9);
            box-shadow: 5px 5px 30px 15px rgba(0,0,0,0.25), -5px -5px 30px 15px rgba(0,0,0,0.22);
        }

        .title-white {
            color: white;
        }

        .title-black {
            color: black;
        }

        @media all and (max-width: 500px) {
            .card-container {
                flex-direction: column;
            }
        }
        .btn{
            border-radius: 20px;
            justify-content: center;
            align-items: center;
            padding: 10px;
            
        }
        .info h1{
        margin-top:20px;
       text-align: center;
       font-size: 50px;
       font-weight: bold;
       color:#0a8e6f;
       margin-bottom: 10px;
        }
    </style>
</head>
<body>      
    <div class="wrapper">
        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Profile image & text -->
            <div class="profile">
                <img src="https://1.bp.blogspot.com/-vhmWFWO2r8U/YLjr2A57toI/AAAAAAAACO4/0GBonlEZPmAiQW4uvkCTm5LvlJVd_-l_wCNcBGAsYHQ/s16000/team-1-2.jpg" alt="profile_picture">
                <h3>Revathi H G</h3>
                <p>Student</p>
            </div>
            <!-- Menu items -->
            <ul>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">Home</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">My Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">View Profile</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
                        <span class="item">Performance</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-database"></i></span>
                        <span class="item">Development</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span class="item">Reports</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">Admin</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-cog"></i></span>
                        <span class="item">Settings</span>
                    </a>
                </li>
            </ul>
        </div>
        <!-- Section -->
        <div class="section">
            <div class="top_navbar">
                <div class="hamburger">
                    <a href="#">
                        <i class="fas fa-bars"></i>
                    </a>
                </div>
            </div>
            <div class="info">
            <h1>Welcome To Your Dashboard!!!</h1>
            </div>
          
            <div class="container">
                <div class="card-container">
                    <div class="card">
                        <div class="card-body">
                            <b><h3 class="card-title">Student Details</h3></b>
                            <p class="card-text">Explore our extensive collection of books across various genres and categories.</p>
                            <a href="registudet.jsp" class="btn btn-primary">View student</a>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <b><h3 class="card-title">Book List</h3></b>
                            <p class="card-text">View the list of books you have currently borrowed and their due dates.</p>
                            <a href="Displaybookadmin.jsp" class="btn btn-primary">View Book List</a>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <b><h3 class="card-title">Requested Books</h3></b>
                            <p class="card-text">Check the status of your book requests and manage your pending requests.</p>
                            <a href="viewreqbooksadmin.jsp" class="btn btn-primary">View Requests</a>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <b><h3 class="card-title">Accepted Books</h3></b>
                            <p class="card-text">Discover books that are accepted.</p>
                            <a href="acceptedbooklist.jsp" class="btn btn-primary">View books</a>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <b><h3 class="card-title">Card Title</h3></b>
                            <p class="card-text">Placeholder text for future content or features to be added.</p>
                            <a href="#" class="btn btn-primary">Learn More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        var hamburger = document.querySelector(".hamburger");
        hamburger.addEventListener("click", function(){
            document.querySelector("body").classList.toggle("active");
        })
    </script>
</body>
</html>
