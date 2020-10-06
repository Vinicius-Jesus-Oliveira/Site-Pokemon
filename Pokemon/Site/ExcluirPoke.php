<?php
    session_start();
    require_once "Connection.php";
  
    if (!$_SESSION['Logado'])
    {
      header('Location: Entrar.php');
    }
    else
    {
      $id = $_GET['id'];
      $idTreinador = $_SESSION['CodTreinador'];
  
      $Comando = mysqli_query($connect, "DELETE FROM TbTreinadorPokes where CodTreinador = $idTreinador and CodPokemon = $id;");
  
      $_SESSION['MensagemDados'] = "Excluído com sucesso!";
  
      header('Location: Dados.php');  
    }
?>