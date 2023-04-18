<?php include 'inc/header.php'; ?>


<h2 class = "text-warning"> Hogwarts Student Management </h2>

<form>
    <div class = "mb-3">
        <label for = "uname">Username: </label><br>
        <input type = "text" id = "uname" name = "uname"><br>
        <label for = "password">Password: </label><br>
        <input type = "text" id = "password" name = "password"><br>
    </div>
     <div class = "mb-3">
    <div class="col-xs-1" align="center">
        <input type = "submit" name = "submit" value = "Submit">
    </div>
    </div>
</form>

<?php include 'inc/footer.php'; ?>