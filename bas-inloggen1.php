<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Document</title>
</head>
<body>

<?php require_once "navbar.php" ?>

<div class="contact-form">
    <form class="form" action="bas-inloggen2.php" method="post">
        <input type="email" name="gebruikeremailvak" placeholder="email">
        <input type="password" name="gebruikerwachtwoordvak" placeholder="password">
        <input type="submit" name="inloggen">
    </form>
</div>
</body>
</html>