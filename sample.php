<!DOCTYPE HTML>  
<html>
<head>
<style>
.error{
    color:red;
    }
    .container{
                padding: 16px;
                background-color: white;
                border-radius:3px;
                width:80%;
                margin:0 auto;
            }

input[type=text],[type=file]
                {
                    width: 100%;
                    padding: 15px;
                    margin: 5px 0 22px 0;
                    display: inline-block;
                    border: none;
                    background: #fddfdf;
                }
                h2{
                    text-align: center;
                }

                .submit{
                    background-color: #5ab3c7;
                    color: white;
                    padding: 16px 20px;
                    margin: 8px 0;
                    border: none;
                    cursor: pointer;
                    width: 20%;
                    }
</style>
</head>
<body>  

<?php
// define variables and set to empty values
$nameErr = $emailErr = $contactErr = "";
$name = $email = $contact = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") 
{
  if (empty($_POST["name"])) 
  {
    $nameErr = "Name is required";
  } else {
    $name = test_input($_POST["name"]);
    // check if name only contains letters and whitespace
    if (!preg_match("/^[a-zA-Z-' ]*$/",$name))
     {
      $nameErr = "Only letters and white space allowed";
    }
  }
  
  if (empty($_POST["email"]))
   {
    $emailErr = "Email is required";
    } 
  else {
    $email = test_input($_POST["email"]);
    // check if e-mail address is well-formed
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) 
    {
      $emailErr = "Invalid email format";
    }
  }
    
  if (empty($_POST["contact"])) {
    $contact = "";
  } else {
    $contact = test_input($_POST["contact"]);
    // check if URL address syntax is valid (this regular expression also allows dashes in the URL)
    if (!preg_match("/^[0-9]{0,10}$/",$contact)) {
      $contactErr = "Invalid Contact Number";
    }
  }

}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}

//FILE UPLOAD
if(isset($_FILES['image'])){
  $errors= array();
  $file_name = $_FILES['image']['name'];
  $file_size = $_FILES['image']['size'];
  $file_tmp = $_FILES['image']['tmp_name'];
  $file_type = $_FILES['image']['type'];
  $file_ext=strtolower(end(explode('.',$_FILES['image']['name'])));
  
  $extensions= array("jpeg","jpg","png");
  
  if(in_array($file_ext,$extensions)=== false){
     $errors[]="extension not allowed, please choose a JPEG or PNG file.";
  }
  
  if($file_size > 2097152) {
     $errors[]='File size must be excately 2 MB';
  }
  
  if(empty($errors)==true) {
     move_uploaded_file($file_tmp,"uploads/".$file_name);
     echo "Success";
  }else{
     print_r($errors);
  }
}
?>
<div class="container">
<h2>PHP Form Validation Example</h2>
<p><span class="error">* required field</span></p>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?> "enctype="multipart/form-data">  
  Name: <input type="text" name="name" value="<?php echo $name;?>">
  <span class="error">* <?php echo $nameErr;?></span>
  <br><br>
  E-mail: <input type="text" name="email" value="<?php echo $email;?>">
  <span class="error">* <?php echo $emailErr;?></span>
  <br><br>
  Contact: <input type="text" name="contact" value="<?php echo $contact;?>">
  <span class="error"><?php echo $contactErr;?></span>
  <br><br>
  File Upload: <input type = "file" name = "image" />
  <button type="submit" class="submit">SUBMIT</button>  
</form>
</div>

<?php
echo "<h2>Your Input:</h2>";
echo $name;
echo "<br>";
echo $email;
echo "<br>";
echo $contact;
echo "<br>";
echo "<h2>Uploaded Files Details:</h2>";
echo "FILE NAME";
echo$_FILES['image']['name'];
echo "FILE SIZE";$_FILES['image']['size'];
echo "FILE TYPE";$_FILES['image']['type'];
?>

</body>
</html>
