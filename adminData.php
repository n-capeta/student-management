<?php include 'inc/header.php'; ?>

<h2 class = "text-secondary">Admin Data</h2>

<style>
    table, th, td{
    border: 1px solid black;
    padding: 5px;
    }
        tr:nth-child(even) {
        background-color: #D3D3D3;
        }
</style>


<?php
    session_start();

    $teach_info_query = mysqli_query($link, "select * from teachers where username='" . $_SESSION["username"] . "'"   );

        
        echo "<table border='1'>
        <tr>
        <th>ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Subject</th>
        <th>Email</th>
        <th>Username</th>
        </tr>"; 

        while($teach_info_table = mysqli_fetch_array($teach_info_query))
        {
        echo "<tr>";
        echo "<td>" . $teach_info_table['teacher_id'] . "</td>";
        $teach_id = $teach_info_table['teacher_id']; // Saving the student's id for future query
        echo "<td>" . $teach_info_table['first_name'] . "</td>";
        echo "<td>" . $teach_info_table['last_name'] . "</td>";
        echo "<td>" . $teach_info_table['subject_area'] . "</td>";
        echo "<td>" . $teach_info_table['email'] . "</td>";
        echo "<td>" . $teach_info_table['username'] . "</td>";
        echo "</tr>";
        }
        echo "</table>";
        echo "<br>";
?>
    <h4 class = "text-secondary"> Courses Teaching</h4>

<?php
        // Gathering and displaying course info
        $course_info_text = "select name from courses where teacher_id ='" . $teach_id . "'";
        $course_info_query = mysqli_query($link, $course_info_text);

        
        echo "<table border='1'>
        <tr>
        <th>Courses</th>
        </tr>"; 

        while($course_info_table = mysqli_fetch_array($course_info_query))
        {
        echo "<tr>";
        echo "<td>" . $course_info_table['name'] . "</td>";
        echo "</tr>";
        }
        echo "</table>";
        echo "<br>";

?>

<h4 class = "text-secondary"> Students</h4>

<?php

    // Gathering student ids to use for another table
    $student_gather_text = "select student_id from student_enrollment where teacher_id='" . $teach_id . "'";
    $student_gather_query = mysqli_query($link,$student_gather_text);

    echo "<table border='1'>
        <tr>
        <th>ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>House</th>
        </tr>";

    while($student_gather_table = mysqli_fetch_array($student_gather_query))
    {
    $student_name_text = "select first_name, last_name, student_id, house from students where student_id='" . $student_gather_table['student_id'] . "'";
    $student_name_query = mysqli_query($link,$student_name_text);

    while($student_name_table = mysqli_fetch_array($student_name_query))
        {
        echo "<tr>";
        echo "<td>" . $student_name_table['student_id'] . "</td>";
        echo "<td>" . $student_name_table['first_name'] . "</td>";
        echo "<td>" . $student_name_table['last_name'] . "</td>";
        echo "<td>" . $student_name_table['house'] . "</td>";
        }
    }
    echo "</table>";
    echo "<br>";

?>


<?php include 'inc/footer.php'; ?>