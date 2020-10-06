<?php
  require_once 'Connection.php';
  session_start();
  
  if (!$_SESSION['Logado'])
  {
    $_SESSION['MensagemPokedex'] = "Para acessar 'Seus Dados', é necessário estar logado";
    header('Location: home.php');
  }

  $Comando = "SELECT CodPokemon, NomePokemon FROM tbPokemon ORDER BY CodPokemon;";
  $TodosPokemons = mysqli_query($connect, $Comando);

  $CodTreinador = $_SESSION['CodTreinador'];
  $TreinadorPokes = mysqli_query($connect, "call TreinadorPokemons($CodTreinador)");

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

      function ExcluirPoke(NomePoke)
      {
        window.location.href = "ExcluirPoke.php?id=" + NomePoke;
      }

      function Excluir()
      {
        var Botoes = document.querySelectorAll(".Excluir");
        for (var i = 0; i < Botoes.length; i++)
        {
          Botoes[i].style.display = "block";
        }

        document.querySelector(".ExcluirBotao").style.display = "none";
        document.querySelector(".Desfazer").style.display = "block";
      }

      function Desfaz()
      {
        var Botoes = document.querySelectorAll(".Excluir");
        for (var i = 0; i < Botoes.length; i++)
        {
          Botoes[i].style.display = "none";
        }

        document.querySelector(".ExcluirBotao").style.display = "block";
        document.querySelector(".Desfazer").style.display = "none";
      }

      function AbreModal()
      {
        document.getElementById("myModal").style.display = "block";
      }

      function FechaModal()
      { 
        document.getElementById("myModal").style.display = "none";
      }
    </script>

    <div class="topnav">
        <a href="home.php">Home</a>
        <a href="Tipagem.php">Tipagem</a>
        <a class="active" href="Dados.php">Seus Dados</a>
        <a href="Sair.php" style="float: right; width: 75px;"> Sair </a>
    </div>
    
    <a href="home.php"> <img src="../Imagens/CentroTopNav.png" id="Pokebola" alt=""> </a>

    <div class="Conteudo">
      <br/> <br/>
      <h1 class="Titulo">Bem vindo(a) a sua Pokélista</h1>
      <h1 style="margin-top: -25px;" class="Titulo"> <?php echo $_SESSION['NickTreinador']; ?> </h1>

      <br/>

      <?php
        if (isset($_SESSION['MensagemDados']))
        {
      ?>
          <h1 class="Mensagem"> <?php echo $_SESSION['MensagemDados']; ?> </h1>
      <?php
          unset($_SESSION['MensagemDados']);
        }
      ?>

      <br/>
      
      <div class="SeusPokemons"> <p style="padding-top: 8px;"> Seus Pokemons </p> </div>
      <button class="Adicionar" onclick="AbreModal();"> Adicionar <br/> <img src="../Imagens/Adicionar.png" alt=""> </button>
      <button class="ExcluirBotao" onclick="Excluir();"> Excluir <br/> <img src="../Imagens/ExcluirBotao.png" alt=""> </button>
      <button class="Desfazer" onclick="Desfaz();"> Desfazer <br/> <img src="../Imagens/Desfazer.png" alt=""> </button>
      <button class="Atualizar" onclick="window.location.href = 'Atualizar.php'"> Atualizar cadastro <br/> <img src="../Imagens/Atualizar.png" alt=""> </button>

      <div class="Pokemons">

      <?php
            while ($list = mysqli_fetch_assoc($TreinadorPokes))
            {
          ?>
              <div class="PokeImg">
                <img style="height: 100%;" src="../Imagens/<?php echo $list['NomePokemon']; ?>.png" alt="">
                <img class="Excluir" onclick="ExcluirPoke('<?php echo $list['CodPokemon']; ?>');" src="../Imagens/Excluir.png" alt="">
                <p class="NomePoke"> <?php echo $list['NomePokemon']; ?> </p>
              </div>
          <?php
            }
          ?>
        
      <br/> <br/> <br/>
      </div>

      <br/> <br/> <br/> <br/>

    </div>

    <div id="myModal" class="modal">
      <span onclick="FechaModal();" class="close">&times;</span>

      <div id="FundoModal">
        <div class="PokesModal">
          <?php
            while ($list = mysqli_fetch_assoc($TodosPokemons))
            {
          ?>
              <div class="ListPokes">
                <img style="width: 15%;" src="../Imagens/<?php echo $list['NomePokemon']; ?>.png" alt="<?php echo $list['NomePokemon']; ?>" title="<?php echo $list['NomePokemon']; ?>">
                <h2><?php echo $list['NomePokemon']; ?></h2>
                <button onclick="window.location.href = 'AddPoke.php?id=<?php echo $list['CodPokemon']; ?>'" style="cursor: pointer;"> <img class="Add" src="../Imagens/Plus.png" alt=""> </button>
              </div>
          <?php
            }
          ?>
        </div>
      </div>

    </div>
  </body>
</html>