<?php include 'inc/header.php'; ?>

<?php
// Initialize the session
session_start();


// Include config file
require_once "config/database.php";
 
 
// Define variables and initialize with empty values
$id = $password = "";
$id_err = $password_err = $login_err = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Check if id is empty
    if(empty(trim($_POST["id"]))){
        $id_err = "Please enter ID.";
    } else{
        $id = trim($_POST["id"]);
    }
    
    // Check if password is empty
    if(empty(trim($_POST["password"]))){
        $password_err = "Please enter your password.";
    } else{
        $password = trim($_POST["password"]);
    }
    
    // Validate credentials
    if(empty($id_err) && empty($password_err)){
        // Prepare a select statement
        $sql = "SELECT id, password FROM users WHERE id = ?";
        
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "s", $param_id);
            // Set parameters
            $param_id = $id;
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                // Store result
                mysqli_stmt_store_result($stmt);

                // Check if id exists, if yes then verify password
                if(mysqli_stmt_num_rows($stmt) == 1){                    
                    // Bind result variables
                    mysqli_stmt_bind_result($stmt, $id, $hashed_password);
                    if(mysqli_stmt_fetch($stmt)){
                        if($password == $hashed_password){
                            // Password is correct, so start a new session
                            session_start();
                            
                            // Store data in session variables
                            $_SESSION["loggedin"] = true;
                            $_SESSION["ID"] = $id;                            
                            
                            // Redirect user to welcome page
                            header("location: adminData.php");
                        } else{
                            // Password is not valid, display a generic error message
                            $login_err = "Invalid ID or password." . $hashed_password . $password;
                        }
                    }
                } else{
                    // ID doesn't exist, display a generic error message
                    $login_err = "Invalid ID or password.";
                }
            } else{
                echo "Oops! Something went wrong. Please try again later.";
            }

            // Close statement
            mysqli_stmt_close($stmt);
        }
    }
    
    // Close connection
    mysqli_close($link);
}
?>
 
    <div class="wrapper">
        <h2 class = "text-warning">Student Login Portal</h2>
        <p>Please fill in your credentials to login.</p>

        <?php 
        if(!empty($login_err)){
            echo '<div class="alert alert-danger">' . $login_err . '</div>';
        }        
        ?>

        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="form-group">
                <label>ID</label>
                <input type="text" name="id" class="form-control <?php echo (!empty($id_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $id; ?>">
                <span class="invalid-feedback"><?php echo $id_err; ?></span>
            </div>    
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" class="form-control <?php echo (!empty($password_err)) ? 'is-invalid' : ''; ?>">
                <span class="invalid-feedback"><?php echo $password_err; ?></span>
            </div>
            <div class="form-group" align = "center">
                <input type="submit" class="btn btn-primary" value="Login">
            </div>
        </form>


<?php include 'inc/footer.php'; ?>