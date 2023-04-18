<?php include 'inc/header.php'; ?>

<?php
if (isset($_GET['stusubmit'])){
    header('Location: http://localhost/student-management/student.php');
    exit();
}
?>

<h2 class = "text-warning"> Hogwarts Student Management </h2>

<div class = "row">
    <div class = "col">
        <h5>Student Login</h5>
        <form>
            <div class = "mb-3">
                <label for = "stuuname">Username: </label><br>
                <input type = "text" id = "stuuname" name = "stuuname"><br>
                <label for = "password">Password: </label><br>
                <input type = "text" id = "stupassword" name = "stupassword"><br>
            </div>
        <div class = "mb-3">
        <div class="col-xs-1" align="center">
            <input type = "submit" name = "stusubmit" value = "Submit">
        </div>
        </div>
        </form>
    </div>
    <div class = "col">
        <h5>Administrator Login</h5>
        <form>
            <div class = "mb-3">
                <label for = "adminuname">Username: </label><br>
                <input type = "text" id = "adminuname" name = "adminuname"><br>
                <label for = "password">Password: </label><br>
                <input type = "text" id = "adminpassword" name = "adminpassword"><br>
            </div>
        <div class = "mb-3">
        <div class="col-xs-1" align="center">
            <input type = "submit" name = "adminsubmit" value = "Submit">
        </div>
        </div>
        </form>

    </div>
</div>

<?php include 'inc/footer.php'; ?>