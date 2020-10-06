<?php
  require_once 'Connection.php';
  session_start();

  $Comando = "SELECT tbPokemon.CodPokemon, tbPokemon.NomePokemon, tbTipo.TipoPokemon, CASE (tbPokemon.CodTipo2)
  WHEN 5 THEN 'Fada'
  WHEN 6 THEN 'Lutador'
  WHEN 8 THEN 'Voador'
  WHEN 10 THEN 'Grama'
  WHEN 11 THEN 'Terrestre'
  WHEN 12 THEN 'Gelo'
  WHEN 14 THEN 'Venenoso'
  WHEN 15 THEN 'Psíquico'
  WHEN 16 THEN 'Pedra'
  WHEN 17 THEN 'Metal'
  WHEN 18 THEN 'Água'
  END AS 'CodTipo2'
  FROM tbPokemon
  INNER JOIN tbTipo ON tbTipo.codTipo = tbPokemon.CodTipo ORDER BY tbPokemon.codPokemon;";

  $Resultado = mysqli_query($connect, $Comando);

  if ( isset( $_SESSION['MensagemPokedex'] ) )
  {
?>
    <script> alert("<?php echo $_SESSION['MensagemPokedex']; ?>"); </script>
<?php
    unset($_SESSION['MensagemPokedex']);
  }
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

    <div class="topnav">
        <a class="active" href="home.php">Home</a>
        <a href="Tipagem.php">Tipagem</a>
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
      <h1 class="Titulo">Bem vindo(a) a Pokélista</h1>
    
      <?php
        while ($list = mysqli_fetch_assoc($Resultado))
        {
      ?>
          <div class="column" id="<?php echo $list['CodPokemon']; ?>">
            <div class="card">

              <div style="text-align:center;">
                <img style="width: 60%;" src="../Imagens/<?php echo $list['NomePokemon']; ?>.png" alt="<?php echo $list['NomePokemon']; ?>" title="<?php echo $list['NomePokemon']; ?>">
              </div>

              <div class="container">
                <h2><?php echo $list['NomePokemon']; ?></h2>
                <p class="numero">N° <?php echo $list['CodPokemon']; ?></p>

                <img src="../Imagens/<?php echo $list['TipoPokemon']; ?>.png" alt="<?php echo $list['TipoPokemon']; ?>" title="<?php echo $list['TipoPokemon']; ?>">
                <?php if($list['CodTipo2'] != null) { ?> <img src="../Imagens/<?php echo $list['CodTipo2']; ?>.png" alt="<?php echo $list['CodTipo2']; ?>" title="<?php echo $list['CodTipo2']; ?>"> <?php } ?>

                <p><?php echo $list['TipoPokemon']; if($list['CodTipo2'] != null) echo " e " . $list['CodTipo2']; ?></p>
                <p><button class="botaoMais" onclick="window.location.href='PagDoPokemon.php?id=' + <?php echo $list['CodPokemon']; ?>">Mais</button></p>
              </div>

            </div>
          </div>
      <?php
        }
      ?>
      
      <br/>
    </div>

    <br/> <br/> <br/> <br/>
  </body>
</html>