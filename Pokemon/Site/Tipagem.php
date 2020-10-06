<?php
  require_once 'Connection.php';
  session_start();
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
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <title>Pokédex</title>
  </head>

  <body>
    <button onclick="topFunction();" id="meuBotao" title="Go to top">Top</button>

    <script>
      //Get the button:
      mybutton = document.getElementById("meuBotao");
      
      // When the user scrolls down 20px from the top of the document, show the button
      window.onscroll = function() { scrollFunction() };
      
      function scrollFunction()
      {
        if (document.body.scrollTop > 30 || document.documentElement.scrollTop > 30)
        {
          mybutton.style.display = "block";
        } else {
          mybutton.style.display = "none";
        }
      }
      
      // When the user clicks on the button, scroll to the top of the document
      function topFunction()
      {
        document.body.scrollTop = 0; // For Safari
        document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
      }

      function VerFeR(id)
      {
        for (var i = 1; i <= 18; i++)
        {
          var x = document.getElementsByClassName(i);

          for (var a = 0; a < x.length; a++)
          {
            x[a].style.display = 'none';
          }
        }

        var x = document.getElementsByClassName(id);

        for (var i = 0; i < x.length; i++)
        {
          x[i].style.display = 'block';
        }
      }
    </script>

    <div class="topnav">
        <a href="home.php">Home</a>
        <a class="active" href="Tipagem.php">Tipagem</a>
        <a href="Dados.php">Seus Dados</a>

        <?php
          if (!isset($_SESSION['Logado']))
            header('Location: Entrar.php');
          else if ( !$_SESSION['Logado'] )
          {
        ?>
            <a href="Entrar.php" style="float: right;"> Entrar </a>
        <?php
          }
          else
          {
        ?>
            <a href="Sair.php" style="float: right; width: 75px;"> Sair </a>
        <?php
          }
        ?>
    </div>
    
    <a href="home.php"> <img src="../Imagens/CentroTopNav.png" id="Pokebola" alt=""> </a>

    <div class="Conteudo">
        <br/> <br/>
        <h1 class="Titulo">Tipos dos Pokémons</h1>
        <h5 class="Titulo" style="font-size: 25px;">Escolha um tipo</h5>

          <br/>

        <div class="DivTipos">
          <?php
            $Tipos = array("Inseto", "Escuridão", "Dragão", "Elétrico", "Fada", "Lutador", "Fogo", "Voador", "Fantasma", "Grama", "Terrestre", "Gelo", "Normal", "Venenoso", "Psíquico", "Pedra", "Metal", "Água");

            for ($i = 0; $i < count($Tipos); $i++)
            {
          ?>
              <div class="Tipos" onclick="VerFeR(<?php echo $i + 1; ?>);">
                  <div onclick="VerFeR(<?php echo $i + 1; ?>);" class="NomeTipo" id="<?php echo $Tipos[$i] ?>">
                      <div onclick="VerFeR(<?php echo $i + 1; ?>);" class="imgTipo <?php echo $Tipos[$i] ?>"> <img src="../Imagens/<?php echo $Tipos[$i] ?>.png" alt="<?php echo $Tipos[$i] ?>" title="<?php echo $Tipos[$i] ?>"> </div>
                      <p onclick="VerFeR(<?php echo $i + 1; ?>);"> <?php echo $Tipos[$i] ?> </p>
                  </div>
              </div>
          <?php
            }
          ?>
        </div>

        <div class="Tabelas">
          <?php
            for ($i = 1; $i < 18; $i++)
            {
          ?>
              <table class="<?php echo $i; ?>">
                <tr>
                  <th>Fraquezas</th>
                  <th>Resistências 1x</th>
                  <th>Resistências 2x</th>
                </tr>

                <tr>
                  <?php
                    $Fraquezas = mysqli_query($connect, "call Fraquezas($i);");
                    while ($list = mysqli_fetch_assoc($Fraquezas))
                    {
                      echo '<td>' . $list['F'] . '</td>'; 
                    }
                    
                    $Fraquezas->close();
                    $connect->next_result();
                  ?>
                </tr>

                <tr>
                  <?php
                      $Resistencias = mysqli_query($connect, "call Resistencias1x($i);");
                      while ($list = mysqli_fetch_assoc($Resistencias))
                      {
                        echo '<td>' . $list['1x'] . '</td>'; 
                      }
                      
                      $Resistencias->close();
                      $connect->next_result();
                  ?>
                </tr>

                <tr>
                  <?php
                    $Resistencias2x = mysqli_query($connect, "call Resistencias2x($i);");
                    while ($list = mysqli_fetch_assoc($Resistencias2x))
                    {
                      if ( $list['2x'] != null ) echo '<td>' . $list['2x'] . '</td>'; 
                    }
                    
                    $Resistencias2x->close();
                    $connect->next_result();
                  ?>
                </tr>
              </table>
          <?php
            }
          ?>
        </div>

        <br/> <br/> <br/> <br/>

    </div>

    <br/> <br/> <br/> <br/>
  </body>
</html>