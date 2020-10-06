<?php
	session_start();
	require_once "Connection.php";
	
	if ( $_POST["Nome"] == "" || empty($_POST["Nickname"]) || empty($_POST["Senha"]) )
	{
		$_SESSION['Mensagem'] = "Campos não podem estar vazios!";
		header('Location: Entrar.php');
	}
	else
	{
		$Nome = $_POST["Nome"];
		$Nick = $_POST["Nickname"];
		$Senha = hash("sha512",md5($_POST["Senha"]));

		$Comando = mysqli_query($connect,"INSERT INTO tbTreinador ( NomeTreinador, NickTreinador, SenhaTreinador ) VALUES ('$Nome','$Nick','$Senha')") or die( $_SESSION['Mensagem'] = "Nickname já existente!" and header('Location: Entrar.php') );
		$NumResults = mysqli_affected_rows($connect);
?>
		<!doctype html>
		<html lang="pt-br">
			<head>
				<title>Titulo</title>
				<meta charset="UTF-8">
			</head>

			<body>
				<?php
					if($NumResults == 1)
					{
						$_SESSION['Mensagem'] = "Cadastrado com sucesso!";
					}
					else
					{
						$_SESSION['Mensagem'] = "Nickname já existente!";
					}
					header('Location: Entrar.php');
				?>
			</body>
		</html>
<?php
	}
?>