<?php include 'inc/header.php'; ?>

<h2 class = "text-warning">Student Data</h2>

<?php
session_start();
echo $_SESSION["ID"];
?>

<?php include 'inc/footer.php'; ?>