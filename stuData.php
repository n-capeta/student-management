<?php include 'inc/header.php'; ?>

<h2 class = "text-warning">Student Data</h2>

<?php
        session_start();

        $query = mysqli_query($link, "select * from students where username='" . $_SESSION["username"] . "'"   );

        
            echo "<table border='1'>
            <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>House</th>
            <th>Username</th>
            <th>Password</th>
            </tr>"; 

            while($row = mysqli_fetch_array($query))
            {
            echo "<tr>";
            echo "<td>" . $row['student_id'] . "</td>";
            echo "<td>" . $row['first_name'] . "</td>";
            echo "<td>" . $row['last_name'] . "</td>";
            echo "<td>" . $row['house_id'] . "</td>";
            echo "<td>" . $row['username'] . "</td>";
            echo "<td>" . $row['password'] . "</td>";
            echo "</tr>";
            }
            echo "</table>";

?>


<?php include 'inc/footer.php'; ?>