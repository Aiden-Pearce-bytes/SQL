<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form</title>
        <style>
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: black;
}

        *{
            box-sizing: border-box;
        }
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
                input[type=text]
                {
                    width: 100%;
                    padding: 15px;
                    margin: 5px 0 22px 0;
                    display: inline-block;
                    border: none;
                    background: #fddfdf;
                }

                input[type=text]:focus{
                    background-color: #ddd;
                    outline: none;
                    }
                h1{
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
<div class="container">
<form method="post" action="final.php">
    <h1>Forms</h1>
    <?php
    $name = $email = $contact = "";
    $nameErr = $emailErr= $contactErr="";
    ?>
    <p><span class="error">* Required Fields</span></p>

    Name: <br><input type="text" name="name"><br><br>

    E-mail: <br><input type="text" name="email"><br><br>

    Contact Number: <br><input type="text" name="contact"><br><br>

    <button type="submit" class="submit">SUBMIT</button>
  </div>
</div>

</body>
</html>