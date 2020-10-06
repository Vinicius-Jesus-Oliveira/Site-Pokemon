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
  
    $Comando = mysqli_query($connect, "INSERT INTO tbTreinadorPokes (CodTreinador, CodPokemon) VALUES ($idTreinador, $id)");
  
    $_SESSION['MensagemDados'] = 'Adicionado com sucesso!';
  
    header('Location: Dados.php');
  }
?>