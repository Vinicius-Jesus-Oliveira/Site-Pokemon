<?php
	session_start();
	require_once "Connection.php";
  
	if (!$_SESSION['Logado'])
	{
	  header('Location: Entrar.php');
	}
	else if ( empty($_POST["Nickname"]) and empty($_POST["Senha"]) )
	{
		$_SESSION['Mensagem'] = "Os dois campos não podem estar vazios!";
		header('Location: Atualizar.php');
	}
	else
	{
		// Verifica se o campo Nickname está preenchido, se estiver preenche a variavel Nick, senão preenche ela como null
		// Depois ele preenche a mensagem que será retornada ao usuário como 'Nickname alterado com sucesso'
		if ( !empty($_POST["Nickname"]) )
		{
			$Nick = $_POST['Nickname'];
			$Nick =  "NickTreinador = '$Nick'";
			$_SESSION['Mensagem'] = "Nickname alterado com sucesso!";
		}
		else
			$Nick = null;

		// Verifica se o campo Senha está preenchido, se estiver preenche a variavel Senha, senão preenche ela como null
		if ( !empty($_POST["Senha"]) )
		{
			$Senha = hash("sha512",md5($_POST["Senha"]));
			$Senha = "SenhaTreinador = '$Senha'";

			// Verifica se a veriavel Nick foi preenchida, se foi, coloca uma virgula no final da variavel Senha pois
			// ela será escrita no comando mysql, depois preenche a váriavel que será retornada ao usuário como 'Nick
			// e senha alterados com sucesso' se o Nickname não estiver vazio, se estiver a mensagem retorna apenas Senha
			// alterada
			if ( $Nick )
			{
				$Senha = $Senha . ",";
				$_SESSION['Mensagem'] = "Nickname e Senha alterados com sucesso!";
			}
			else
				$_SESSION['Mensagem'] = "Senha alterada com sucesso!";
		}
		else
		{
			$Senha = null;
		}

		$id = $_SESSION["CodTreinador"];

		// Cria o comando mysql, ele escreve as duas variaveis criadas acima
		$Comando = mysqli_query($connect,"UPDATE tbTreinador SET $Senha $Nick WHERE CodTreinador = $id ");
		$NumResults = mysqli_affected_rows($connect);
		
		if($NumResults == 1)
		{
			if ( !empty($_POST["Nickname"]) )
				$_SESSION['NickTreinador'] = $_POST['Nickname'];
		}
		else
		{
			$_SESSION['Mensagem'] = "Nickname já existente!";
		}

		header('Location: Atualizar.php');
	}
?>
    
	