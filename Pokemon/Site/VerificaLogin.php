<?php
    require_once 'Connection.php';
    session_start();

    $Nick = $_POST['Nickname'];
    $Senha = hash("sha512",md5($_POST["Senha"]));

    $Comando = "SELECT * FROM tbTreinador where NickTreinador = '$Nick' and SenhaTreinador = '$Senha'";
    $Resultado = mysqli_query($connect, $Comando);
    $NumResults = mysqli_num_rows($Resultado);
    $Dados = mysqli_fetch_assoc($Resultado);

    if ($NumResults == 1)
    {
        $_SESSION['Logado'] = true;
        unset($_SESSION['Mensagem']);
        $_SESSION['NickTreinador'] = $Dados['NickTreinador'];
        $_SESSION['CodTreinador'] = $Dados['CodTreinador'];
        header('Location: home.php');
    }
    else
    {
        $_SESSION['Mensagem'] = "Nickname e/ou senha errado(s)";
        $_SESSION['Logado'] = false;
        header('Location: Entrar.php');
    }
?>