<?php
include "connect.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <link rel="stylesheet" href="style.css">
   <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
   <title>ADMIN</title>
</head>
<body>
   <header>
      <div class="navbar">
         <nav>
            <ul>
               <li id="title"><a href="Login.php">Logout</a></li>
               <li><a href="index.php"> Home </a></li>
               <li><a href="mreview.php"> Review </a></li>
               <li><a href="msg.php"> Messages </a></li>
               <li><a href="mroomview.php"> Rooms </a></li>
               <li><a href="managerview.php">Requested Rooms</a></li>
               <li><a href="assignroom.php"> Assign Room </a></li>
            </ul>
         </nav>
      </div>
   </header>

<div id="assignbox">
   <form id="assignpage" action="assignroom.php" method="post">
      <h1>Assign Room</h1>
      <input name="customerid" type="text" class="assigninput" autocomplete="off" placeholder="Customer ID" required/>
      <br>
      <input name="roomid" type="text" class="assigninput" placeholder="Room ID" required/>
      <br>
      <input name="assign" type="submit" class="assignbutton" value="Assign Room" />
   </form>

   <?php
   if(isset($_POST['assign'])) {
      $customer_id = $_POST['customerid'];
      $room_id = $_POST['roomid'];

      // Check if the room is available
      $check_query = "SELECT * FROM available_rooms WHERE room_id = '$room_id'";
      $check_result = mysqli_query($con, $check_query);

      if(mysqli_num_rows($check_result) > 0) {
         // Room is available, proceed with assigning
         $insert_query = "INSERT INTO assigned_rooms (customer_id, room_id) VALUES ('$customer_id', '$room_id')";
         $insert_result = mysqli_query($con, $insert_query);

         if($insert_result) {
            // Delete room from available_rooms table
            $delete_query = "DELETE FROM available_rooms WHERE room_id = '$room_id'";
            $delete_result = mysqli_query($con, $delete_query);

            if($delete_result) {
               echo '<script type="text/javascript"> alert("Room assigned successfully!")</script>';
            } else {
               echo '<script type="text/javascript"> alert("Error removing room from available rooms.")</script>';
            }
         } else {
            echo '<script type="text/javascript"> alert("Failed to assign room.")</script>';
         }
      } else {
         // Room is not available
         echo '<script type="text/javascript"> alert("Room is not available.")</script>';
      }
   }

   mysqli_close($con);
   ?>
</div>
</body>
</html>
