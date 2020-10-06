<?php
  require_once 'Connection.php';
  session_start();
  $id = $_GET['id'];

  $Comando = "SELECT tbPokemon.CodPokemon, tbPokemon.NomePokemon, tbTipo.TipoPokemon, DescPoke, CASE (tbPokemon.CodTipo2)
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
  INNER JOIN tbTipo ON tbTipo.codTipo = tbPokemon.CodTipo and tbPokemon.CodPokemon = $id;";

  $Resultado = mysqli_query($connect, $Comando);
  $list = mysqli_fetch_assoc($Resultado)
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
    <div class="topnav">
        <a href="home.php">Home</a>
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
    
    <a href="home.php"> <img src="../Imagens/CentroTopNav.png" id="Pokebola" alt=""></a>

    <div class="Conteudo">
      <div class="divVoltar"><a class="Voltar" href="home.php#<?php echo $list['CodPokemon']; ?>"> Voltar </a></div>

      <br/> <br/> <br/>
      <div><h1 class="TituloPoke"> <?php echo $list['NomePokemon']; ?> </h1></div>

      <div class="ContPoke" style="margin-top: -30px;">
        <img class="FotoPoke" src="../Imagens/<?php echo $list['NomePokemon']; ?>.png" alt="<?php echo $list['NomePokemon']; ?>" title="<?php echo $list['NomePokemon']; ?>">
        <div class="NumTipos"><p class="idPokeTitulo">N° <?php echo $list['CodPokemon']; ?></p>
        <p class="Tipo"><?php echo $list['TipoPokemon']; if($list['CodTipo2'] != null) echo " e " . $list['CodTipo2']; ?></p></div>
        <div class=".DivDesc" ><p class="DescPoke"> <?php echo $list['DescPoke']; ?> </p></div>
      </div>
    </div>
  </body>
</html>