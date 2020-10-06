<?php
  session_start();
  require_once 'Connection.php';
  
  if (!$_SESSION['Logado'])
  {
    header('Location: Entrar.php');
  }
  else
  {
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

        </script>

        <div class="Geral">
          <img src="../Imagens/CentroTopNav.png" style="top: -25px; left: -25px;" id="PokebolaEntrar" alt="">
          <img src="../Imagens/CentroTopNav.png" style="top: -25px; right: -25px;" id="PokebolaEntrar" alt="">
          <img src="../Imagens/CentroTopNav.png" style="bottom: -25px; left: -25px;" id="PokebolaEntrar" alt="">
          <img src="../Imagens/CentroTopNav.png" style="bottom: -25px; right: -25px;" id="PokebolaEntrar" alt="">

          <div id="Login">
            <h1 class="Titulo">Atualizar cadastro</h1>

            <?php
              if (isset($_SESSION['Mensagem']))
              {
                echo "<div class='Mensagem'> <p style='margin-bottom: -31px;'> " . $_SESSION['Mensagem'] . " </p> </div>";
                unset($_SESSION['Mensagem']);
              }
            ?>

            <form style="position: relative; top: 40px;">
              <input type="text" name="NicknameAtual" id="NicknameAtual" readonly value = "Nickname Atual: ''<?php echo $_SESSION['NickTreinador']; ?>''" /><br><br/>
            </form>

            <p style="font-size: 25px; position: relative; top: 30px; left: 50%; transform: translateX(-50%); width: fit-content;"> Altere um ou os dois campos abaixo </p>
          
            <form style="position: relative; top: 15px;" name="frmAtualiza" method="post" action="AtualizarTreinador.php">
              <input type="text" name="Nickname" id="Nickname" placeholder="Digite seu novo Nickname"/><br>
              <input type="password" name="Senha" id="Senha" placeholder="Digite sua nova senha"/><br><br/>
              <input type="submit" value="Atualizar">
              <br /> <br />
            </form>
              
            <a style="left: 50%; transform: translateX(-50%); margin-left: -65px;" class="Voltar" href="Dados.php">Retornar</a>
          </div>

          <?php
              if (isset($_SESSION['Mensagem']))
              {
                echo "<div class='Mensagem'> <p style='margin-bottom: -31px;'> " . $_SESSION['Mensagem'] . " </p> </div>";
                unset($_SESSION['Mensagem']);
              }
            ?>

        </div>
          
        <p style="color: rgb(121, 0, 0);"> Arthur é um otario </p>
      </body>
    </html>
<?php
  }
?>