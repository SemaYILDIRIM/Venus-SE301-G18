<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
   <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 50%;
      margin: auto;
      
  }
  </style>
</head>
<body>

<div class="ss">
    <div class="project">
          <form id="" method = "post" action = "Home.jsp" >
              <br>    
  <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo">About Venus</button>
  <div id="demo" class="collapse in">
      <br>
   Venus is a project tracking tool that is used to track bugs and defects
   
   
 
    
   <div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        
   <img src="http://soshable.com/wp-content/uploads/2011/07/Business-Communication.jpg" alt="Mountain View" alt="Bug" width="460" height="345">
   
       <div class="carousel-caption">
          <h3>Venus</h3>
          
        </div>
      </div>
        <div class="item">
            <img src="http://www.ccu.edu/uploadedImages/Content/Programs/Adult_Undergraduate/CIT-(1)web.jpg?n=538" alt="graph" width="460" height="345">
            <div class="carousel-caption">
                <h3></h3>
           
        </div>
      </div>
    
        <div class="item">
            <img src="http://www.online-issues.com/files/2011/09/issueTracking.jpg" alt="bug" width="460" height="345">
            <div class="carousel-caption">
                <h3></h3>
           
        </div>
      </div>
        
        
  </div>

      
      
      
  </div>
</div>
         
</body>
</html>


