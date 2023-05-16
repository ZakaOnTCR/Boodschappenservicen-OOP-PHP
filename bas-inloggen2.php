<?php require_once "navbar.php"?>

<div class="container">

<?php

require_once "gar-connect.php";
global $conn;

session_start();


if(isset($_POST['inloggen'])){

    $login = $conn->prepare("SELECT * FROM gebruikers WHERE gebruikeremail = :gebruikeremailvak AND gebruikerwachtwoord = :gebruikerwachtwoordvak");
    $login->bindParam("gebruikeremailvak",$_POST['gebruikeremailvak'] );
    $login->bindParam("gebruikerwachtwoordvak", $_POST['gebruikerwachtwoordvak'] );
    $login->execute();

    if ($login->rowCount()===1){
    $geruikers = $login->fetchObject();
    $_SESSION['gebruiker'] = $geruikers;

    if($geruikers->gebruikerrol == true){
        echo "welkome " . $_POST['gebruikeremailvak'];

    if ($geruikers->gebruikerrol === "Magazijnmeester"){

        header("Location: Magazijnmeester/navbar.php");

    }
    elseif ($geruikers->gebruikerrol === "Verkoper"){
        header("Location: Verkoper/index.php");

    }
    elseif ($geruikers->gebruikerrol === "Magazijnmedewerker"){
        header("Location: Magazijnmedewerker/navbar.php");
    }
    elseif ($geruikers->gebruikerrol === "Bezorger"){
        header("Location: Bezorger/navbar.php");

    }
    elseif ($geruikers->gebruikerrol === "Inkoper"){
        header("Location: Inkoper/navbar.php");

    }
    elseif ($geruikers->gebruikerrol === "Ceo"){
        header("Location: Ceo/navbar.php");

    }
    }
    }
    else {
        echo "maak eerst een aacount aan via ceo";
    }

}
?>
</div>

