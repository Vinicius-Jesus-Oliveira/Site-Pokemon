<?php
  session_start();

  if ( !isset($_SESSION['Logado']) )
    $_SESSION['Logado'] = false;
  else if ($_SESSION['Logado'])
    header('Location: home.php');
?>

<!DOCTYPE html>
<html lang="pt_br">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <link rel="stylesheet" href="Menu.css">
      <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet"> 
      <link rel="icon" href="../Imagens/pokemon.png">
      <title>Pokédex</title>
  </head>

  <body>
    <button onclick="topFunction()" id="meuBotao" title="Go to top">Top</button> 
    <script>
      //Get the button:
      mybutton = document.getElementById("meuBotao");
      
      // When the user scrolls down 20px from the top of the document, show the button
      window.onscroll = function() {scrollFunction()};
      
      function scrollFunction() {
        if (document.body.scrollTop > 30 || document.documentElement.scrollTop > 30) {
          mybutton.style.display = "block";
        } else {
          mybutton.style.display = "none";
        }
      }
      
      // When the user clicks on the button, scroll to the top of the document
      function topFunction() {
        document.body.scrollTop = 0; // For Safari
        document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
      }
 
      function Troca(x)
      {
        if (x == 'L')
        {
          document.getElementById("Login").style.display = 'block';
          document.getElementById("Cadastro").style.display = 'none';
          document.getElementById("Mensagem").style.display = 'none';
        }
        else 
        {
          document.getElementById("Login").style.display = 'none';
          document.getElementById("Cadastro").style.display = 'block';
          document.getElementById("Mensagem").style.display = 'none';
        }
      }
    </script>

    <div class="Geral">
      <img src="../Imagens/CentroTopNav.png" style="top: -25px; left: -25px;" id="PokebolaEntrar" alt="">
      <img src="../Imagens/CentroTopNav.png" style="top: -25px; right: -25px;" id="PokebolaEntrar" alt="">
      <img src="../Imagens/CentroTopNav.png" style="bottom: -25px; left: -25px;" id="PokebolaEntrar" alt="">
      <img src="../Imagens/CentroTopNav.png" style="bottom: -25px; right: -25px;" id="PokebolaEntrar" alt="">

      <div id="Login">
        <h1 class="Titulo">Login</h1>

        <?php
          if (isset($_SESSION['Mensagem']))
          {
            echo "<div class='Mensagem'> <p style='margin-bottom: -31px;'> " . $_SESSION['Mensagem'] . " </p> </div>";
            unset($_SESSION['Mensagem']);
          }
        ?>

        <div style="position: relative; top: 50px;" class="Funcoes">
          <form name = "frmLog" method = "post" action = "VerificaLogin.php">
            <input type="text" name="Nickname" id="Nickname" placeholder="Nickname"/><br>
            <input type="password" name="Senha" id="Senha" placeholder="Senha"/><br/><br/>
            <input type="submit" value="Entrar">
          </form>

          <br/> <br/>

          <hr style="left: 15%;" />
          <p id="ou"> OU </p>
          <hr style="left: 55%;" />

          <br/> <br/>

          <a class="Link" onclick="Troca('C');" style="font-size: 25px; position:absolute; left: 50%; transform: translateX(-50%)"> Cadastre-se </a>
          
          <br/>

          <a class="Link" href="home.php" style="font-size: 25px; position:absolute; left: 50%; transform: translateX(-50%)"> Continuar sem Login </a>
        
        </div>
      </div>

      <div id="Cadastro" style="display: none;">
        <h1 class="Titulo">Cadastre-se</h1>

        <?php
          if (isset($_SESSION['Mensagem']))
          {
            echo "<div class='Mensagem'> <p style='margin-bottom: -31px;'> " . $_SESSION['Mensagem'] . " </p> </div>";
            unset($_SESSION['Mensagem']);
          }
        ?>

        <div style="position: relative; top: 50px;" class="Funcoes">
          <form name = "frmCad" method = "post" action = "Cadastro.php">
            <input type="text" name="Nome" id="Nome" placeholder="Nome completo"/><br>
            <input type="text" name="Nickname" id="Nickname" placeholder="Nickname"/><br>
            <input type="password" name="Senha" id="Senha" placeholder="Senha"/><br/><br/>
            <input type="submit" value="Cadastrar">
          </form>

          <br/> <br/>

          <hr style="left: 15%;" />
          <p id="ou"> OU </p>
          <hr style="left: 55%;" />

          <br/> <br/>

          <a class="Link" onclick="Troca('L');" style="font-size: 25px; position:absolute; left: 50%; transform: translateX(-50%)"> Login </a>
          
          <br/>
          <a class="Link" href="home.php" style="font-size: 25px; position:absolute; left: 50%; transform: translateX(-50%)"> Continuar sem Cadastro </a>
        </div>
      </div>
    </div>
  </body>
</html>