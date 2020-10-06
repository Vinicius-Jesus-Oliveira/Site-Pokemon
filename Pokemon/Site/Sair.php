<?php
    session_start();
  
    if (!$_SESSION['Logado'])
    {
      header('Location: Entrar.php');
    }
    else
    {
      unset($_SESSION['Logado']);
      unset($_SESSION['NickTreinador']);
      unset($_SESSION['CodTreinador']);
  
      session_destroy();
  
      header('Location: Entrar.php');  
    }
?>