<?php include 'inc/header.php'; ?>

<h2 class = "text-warning">Student Data</h2>

<?php
    session_start();

    $stu_info_query = mysqli_query($link, "select * from students where username='" . $_SESSION["username"] . "'"   );
        
        
        // Setting up table with all student info
        echo "<table border='1'>
        <tr>
        <th>ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>House</th>
        <th>Username</th>
        <th>Password</th>
        </tr>"; 
        // Filling table with student info
        while($studentinfo_table = mysqli_fetch_array($stu_info_query))
         {
        echo "<tr>";
        echo "<td>" . $studentinfo_table['student_id'] . "</td>";
        $id = $studentinfo_table['student_id']; // Saving the student's id for future query
        echo "<td>" . $studentinfo_table['first_name'] . "</td>";
        echo "<td>" . $studentinfo_table['last_name'] . "</td>";
        echo "<td>" . $studentinfo_table['house'] . "</td>";
        echo "<td>" . $studentinfo_table['username'] . "</td>";
        echo "<td>" . $studentinfo_table['password'] . "</td>";
        echo "</tr>";
        }
        echo "</table>";
        echo "<br>";

        // Making a table with all enrollment data
        // Mostly for error checking
        $enrollment_text = "select course_id, assignment_id, grade from student_enrollment where student_id=" . $id;
        $enrollment_query = mysqli_query($link, $enrollment_text);

        echo "<table border='1'>
        <tr>
        <th>ID</th>
        <th>Assignment ID</th>
        <th>Grade</th>
        </tr>"; 

        while($enrollment_table = mysqli_fetch_array($enrollment_query))
        {
            echo "<tr>";
            echo "<td>" . $enrollment_table['course_id'] . "</td>" ;
            echo "<td>" . $enrollment_table['assignment_id'] . "</td>" ;
            echo "<td>" . $enrollment_table['grade'] . "</td>" ;
            echo "</tr>";
        }
        echo "</table>";

        echo "<br>";

        // Gathering course ids to use for another table
        $courseid_text = "select course_id from student_enrollment where student_id=" . $id;
        $courseid_query = mysqli_query($link,$courseid_text);

        

        echo "<table border='1'>
            <tr>
            <th>Courses</th>
            </tr>";

        while($courseid_table = mysqli_fetch_array($courseid_query))
        {
        $coursename_text = "select name from courses where course_id='" . $courseid_table['course_id'] . "'";
        $coursename_query = mysqli_query($link,$coursename_text);
        $coursename_table = mysqli_fetch_array($coursename_query);

        echo "<tr>";
        echo "<td>" . $coursename_table['name'] . "</td>";
        echo "</tr>";

        }
        echo "</table>";
        echo "<br>";


        // Gathering assignment ids to use for another table
        $assignid_text = "select assignment_id from student_enrollment where student_id=" . $id;
        $assignid_query = mysqli_query($link,$assignid_text);

        echo "<table border='1'>
            <tr>
            <th> Point Value </th>
            <th>Assignments</th>
            <th> Due Date </th>
            </tr>";

        while($assignid_table = mysqli_fetch_array($assignid_query))
        {
        $assignname_text = "select name, due_date, point_value from assignments where assignment_id='" . $assignid_table['assignment_id'] . "'";
        $assignname_query = mysqli_query($link,$assignname_text);

        while($assignname_table = mysqli_fetch_array($assignname_query))
            {
            echo "<tr>";
            echo "<td>" . $assignname_table['point_value'] . "</td>";
            echo "<td>" . $assignname_table['name'] . "</td>";
            echo "<td>" . $assignname_table['due_date'] . "</td>";
            echo "</tr>";
            }
        }
        echo "</table>";
        echo "<br>";

?>


<?php include 'inc/footer.php'; ?>