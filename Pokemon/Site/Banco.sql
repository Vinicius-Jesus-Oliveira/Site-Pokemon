Create database if not exists BdPoke;

use BdPoke;

create table if not exists tbTipo
(
	CodTipo int not null auto_increment primary key,
	TipoPokemon varchar(12)
);

create table if not exists tbPokemon
(
	CodPokemon int Not null auto_increment primary key,
	CodTipo int not null,
	CodTipo2 int,
	NomePokemon varchar (70),
    DescPoke text,
	foreign key (codTipo) references tbTipo(codTipo)
);

create table if not exists tbTreinador
(
	CodTreinador int Not null auto_increment primary key,
	NomeTreinador varchar (70),
	NickTreinador varchar (70) unique,
	SenhaTreinador varchar(256)
);

create table if not exists tbFraquezas
(
	Id_Fraqueza int not null auto_increment primary key,
	CodTipo int,
	Fraqueza varchar(12)
);

create table if not exists tbResistencias
(
	Id_Resistencia int not null auto_increment primary key,
	CodTipo int not null,
	Resistencia1x varchar(12),
    Resistencia2x varchar(12)
);

create table if not exists tbTreinadorPokes
(
	codTreinadorPokes int not null auto_increment primary key,
    CodTreinador int not null,
    CodPokemon int not null,
    foreign key (CodTreinador) references tbTreinador (CodTreinador),
    foreign key (CodPokemon) references tbPokemon (CodPokemon)
);

INSERT INTO tbResistencias (CodTipo, Resistencia1x) values
(1, "Lutador"),
(1, "Grama"),
(1, "Terrestre"),
(2, "Escuridão"),
(2, "Fantasma"),
(3, "Elétrico"),
(3, "Fogo"),
(3, "Grama"),
(3, "Água"),
(4, "Elétrico"),
(4, "Voador"),
(4, "Metal"),
(5, "Inseto"),
(5, "Escuridão"),
(5, "Lutador"),
(6, "Inseto"),
(6, "Escuridão"),
(6, "Pedra"),
(7, "Inseto"),
(7, "Fada"),
(7, "Fogo"),
(7, "Grama"),
(7, "Gelo"),
(7, "Metal"),
(8, "Inseto"),
(8, "Lutador"),
(8, "Grama"),
(9, "Inseto"),
(9, "Venenoso"),
(10, "Elétrico"),
(10, "Grama"),
(10, "Terrestre"),
(10, "Água"),
(11, "Venenoso"),
(11, "Pedra"),
(12, "Gelo"),
(14, "Inseto"),
(14, "Fada"),
(14, "Lutador"),
(14, "Grama"),
(14, "Venenoso"),
(15, "Lutador"),
(15, "Psíquico"),
(16, "Fogo"),
(16, "Voador"),
(16, "Normal"),
(16, "Venenoso"),
(17, "Inseto"),
(17, "Dragão"),
(17, "Fada"),
(17, "Voador"),
(17, "Grama"),
(17, "Gelo"),
(17, "Normal"),
(17, "Psíquico"),
(17, "Pedra"),
(17, "Metal"),
(18, "Fogo"),
(18, "Gelo"),
(18, "Metal"),
(18, "Água");

INSERT INTO tbResistencias (CodTipo, Resistencia2x) values
(2, "Psíquico"),
(5, "Dragão"),
(8, "Terrestre"),
(9, "Lutador"),
(9, "Normal"),
(11, "Elétrico"),
(13, "Fantasma"),
(17, "Venenoso");

INSERT INTO tbTipo (CodTipo, TipoPokemon)
VALUES
(1, "Inseto"),
(2, "Escuridão"),
(3, "Dragão"),
(4, "Elétrico"),
(5, "Fada"),
(6, "Lutador"),
(7, "Fogo"),
(8, "Voador"),
(9, "Fantasma"),
(10, "Grama"),
(11, "Terrestre"),
(12, "Gelo"),
(13, "Normal"),
(14, "Venenoso"),
(15, "Psíquico"),
(16, "Pedra"),
(17, "Metal"),
(18, "Água");

INSERT INTO tbFraquezas (CodTipo, Fraqueza) 
VALUES
(1, "Fogo"),
(1, "Voador"),
(1, "Pedra"),
(2, "Inseto"),
(2, "Fada"),
(2, "Lutador"),
(3, "Dragão"),
(3, "Fada"),
(3, "Gelo"),
(4, "Terrestre"),
(5, "Venenoso"),
(5, "Metal"),
(6, "Fada"),
(6, "Voador"),
(6, "Psíquico"),
(7, "Terrestre"),
(7, "Pedra"),
(7, "Água"),
(8, "Elétrico"),
(8, "Gelo"),
(8, "Pedra"),
(9, "Escuridão"),
(9, "Fantasma"),
(10, "Inseto"),
(10, "Fogo"),
(10, "Voador"),
(10, "Gelo"),
(10, "Venenoso"),
(11, "Grama"),
(11, "Gelo"),
(11, "Água"),
(12, "Lutador"),
(12, "Fogo"),
(12, "Pedra"),
(12, "Metal"),
(13, "Lutador"),
(14, "Terrestre"),
(14, "Psíquico"),
(15, "Inseto"),
(15, "Escuridão"),
(15, "Fantasma"),
(16, "Lutador"),
(16, "Grama"),
(16, "Terrestre"),
(16, "Metal"),
(16, "Água"),
(17, "Lutador"),
(17, "Fogo"),
(17, "Terrestre"),
(18, "Elétrico"),
(18, "Grama");

INSERT INTO tbTreinador (nomeTreinador, NickTreinador, SenhaTreinador) 
VALUES
('Vinicius Oliveira', 'Bombadão', 'e65cf99ae53e2c447ef50aba6fceb3d4d468bbfea19a4a43c2c3b1a4cb2af355c18b71c6b0a4aeef90609cee03b6a13baf562dfb56eeb25d26e5252377ab64ca'),
('Arthur Oliveira', 'CabeçaDeJaca143', 'e65cf99ae53e2c447ef50aba6fceb3d4d468bbfea19a4a43c2c3b1a4cb2af355c18b71c6b0a4aeef90609cee03b6a13baf562dfb56eeb25d26e5252377ab64ca'),
('Gustavo do Nascimento', 'CaféÉumaBosta', 'e65cf99ae53e2c447ef50aba6fceb3d4d468bbfea19a4a43c2c3b1a4cb2af355c18b71c6b0a4aeef90609cee03b6a13baf562dfb56eeb25d26e5252377ab64ca'),
('Igor Vinnycius', 'Gadão', 'e65cf99ae53e2c447ef50aba6fceb3d4d468bbfea19a4a43c2c3b1a4cb2af355c18b71c6b0a4aeef90609cee03b6a13baf562dfb56eeb25d26e5252377ab64ca'),
('João Bertelli', 'USB H. Bertelli', 'e65cf99ae53e2c447ef50aba6fceb3d4d468bbfea19a4a43c2c3b1a4cb2af355c18b71c6b0a4aeef90609cee03b6a13baf562dfb56eeb25d26e5252377ab64ca');

insert into tbPokemon (CodPokemon, CodTipo, CodTipo2, NomePokemon, DescPoke) values
(001, 10, 14, "Bulbasaur", "Bulbassauro é um Pokémon dos Tipos Grama e Venenoso e um dos Pokémon iniciais.
Ele pode ser visto cochilando sob luz solar intensa. Há uma semente na sua parte traseira. Por absorver os raios do sol, a semente cresce progressivamente maior."),
(002, 10, 14, "Ivysaur", "Ivyssauro é um Pokémon dos Tipos Grama e Venenoso,
Há um broto na parte de trás deste Pokémon. Para suportar o seu peso, pernas e tronco para Ivyssauro crescer grosso e forte. Se ele começa a passar mais tempo deitado ao sol, é um sinal de que o broto vai florescer em uma grande flor em breve.
Ivyssauro é a evolução de Bulbassauro."),
(003, 10, 14, "Venusaur", "Venussauro é um Pokémon dos Tipos Grama e Venenoso.
Há uma grande flor na parte traseira do Venussauro. A flor é dita para ter em cores vivas se ele fica cheia de nutrição e luz solar.
O aroma da flor acalma as emoções das pessoas.
Venussauro é a evolução de Ivyssauro."),
(004, 7, null, "Charmander", "Charmander é um Pokémon do Tipo Fogo e um dos Pokémon iniciais.
A chama que arde na ponta da cauda é uma indicação das suas emoções. A chama vacila quando Charmander está desfrutando de si mesmo.
Se o Pokémon fica furioso, a chama queima ferozmente."),
(005, 7, null, "Charmeleon", "Charmeleon é um Pokémon do Tipo Fogo.
Ele impiedosamente destrói seus inimigos usando suas garras afiadas. Se ele encontrar um adversário forte, verifica-se agressivo.
Neste estado animado, a chama na ponta da cauda se inflama com uma cor branca azulada.
Charmeleon é a evolução de Charmander."),
(006, 7, 8, "Charizard", "Charizard é um Pokémon dos Tipos Fogo e Voador.
Ele voa em torno do céu em busca de adversários poderosos. Ele respira fogo de tão grande calor que derrete qualquer coisa.
No entanto, nunca vira a sua respiração ardente em qualquer adversário mais fraco do que o próprio.
Charizard é a evolução de Charmeleon."),
(007, 18, null, "Squirtle", "Squirtle é um Pokémon do Tipo Água e um dos Pokémon iniciais.
O casco de Squirtle não é apenas usado para a proteção.
A forma arredondada do casco e as ranhuras em sua superfície ajudam a minimizar a resistência na água, permitindo que este Pokémon nade em altas velocidades."),
(008, 18, null, "Wartortle", "Wartortle é um Pokémon do Tipo Água.
Sua cauda é grande e coberta com uma pele rica, espessura. A cauda torna-se cada vez mais profunda em cor com a idade de Wartortle. Os arranhões no seu casco são provas de resistência deste Pokémon como um combatente.
Wartortle é a evolução de Squirtle."),
(009, 18, null, "Blastoise", "Blastoise é um Pokémon do Tipo Água.
Ele tem canhões de água que se projetam de seu casco. Os canhões de água são muito precisos. Eles podem disparar balas de água com uma precisão suficiente para atacar latas vazias de uma distância de mais de 160 pés.
Blastoise é a evolução de Wartortle."),
(010, 1, null, "Caterpie", "Caterpie é um Pokémon do Tipo Inseto.
Caterpie tem um apetite voraz. Ele pode devorar as folhas maiores do que o seu corpo bem diante dos seus olhos. A partir de sua antena, este Pokémon libera um odor terrivelmente forte."),
(011, 1, null, "Metapod", "Metapod é um Pokémon do Tipo Inseto.
O escudo que cobre o corpo deste Pokémon é tão duro como uma laje de ferro. Ele não se move muito. Ele ainda permanece assim porque está preparando suas entranhas macias para a evolução dentro da casca dura.
Metapod é a evolução de Caterpie."),
(012, 1, 8, "Butterfree", "Butterfree é um Pokémon dos Tipos Inseto e Voador.
Ele tem uma capacidade superior para procurar um delicioso mel de flores. Ele pode até mesmo buscar, extrair, transportar e mel de flores que estão florescendo mais de seis milhas do seu ninho.
Butterfree é a evolução de Metapod."),
(013, 1, 14, "Weedle", "Weedle é um Pokémon dos Tipos Inseto e Venenoso.
Ele tem um sentido extremamente agudo de cheiro. Ele é capaz de distinguir os seus tipos favoritos de folhas daqueles que não gosta apenas por cheirar com a sua grande tromba vermelha (nariz)."),
(014, 1, 14, "Kakuna", "Kakuna é um Pokémon dos Tipos Inseto e Venenoso.
Ele permanece praticamente imóvel quando ele se agarra a uma árvore. No entanto, no interior, é extremamente ocupado, que se prepara para a sua evolução que vem. Isto é evidente o quão quente a casca torna-se ao toque.
Kakuna é a evolução de Weedle."),
(015, 1, 14, "Beedrill", "Beedril é um Pokémon dos Tipos Inseto e Venenoso.
Ele é extremamente territorial. Ninguém deve se aproximar de seu ninho - isto é para sua própria segurança. Se ele se irritou, eles vão atacar em um enxame furioso.
Beedrill é a evolução de Kakuna"),
(016, 13, 8, "Pidgey", "Pidgey é um dos Pokémon dos Tipos Normal e Voador.
Ele tem um sentido extremamente afiado de direção. Ele é capaz de infalivelmente voltar para seu ninho, por mais longe que seja removido do seu ambiente familiar."),
(017, 13, 8, "Pidgeotto", "Pidgeotto é um Pokémon dos Tipos Normal e Voador.
Ele reivindica uma grande área como seu próprio território. Este Pokémon voa ao redor, patrulhando o seu espaço de vida. Se seu território for violado, ele não mostra misericórdia em punir completamente o inimigo com suas garras afiadas."),
(018, 13, 8, "Pidgeot", "Pidgeot é um Pokémon dos Tipos Normal e Voador.
Este Pokémon tem uma plumagem deslumbrante de penas brilhantes. Muitos treinadores são cativados pela beleza impressionante das penas em sua cabeça, obrigando-os a escolher Pidgeot como seu Pokémon.
Pidgeot é a evolução de Pidgeotto."),
(019, 13, null, "Rattata", "Rattata é um Pokémon do Tipo Normal.
Ele é cauteloso ao extremo. Mesmo enquanto ele está dormindo, ele escuta constantemente movendo suas orelhas ao redor. Não é exigente sobre onde ele vive - ele vai fazer seu ninho em qualquer lugar."),
(020, 13, null, "Raticate", "Raticate é um Pokémon do Tipo Normal.
As presas resistentes de Raticate crescem de forma constante. Para mantê-las para baixo, ele rói rochas e troncos. Pode até mastigar as paredes das casas.
Raticate é a evolução de Rattata."),
(021, 13, 8, "Spearow", "Spearow é um Pokémon dos Tipos Normal e Voador.
Ele tem um choro muito alto que pode ser escutado a mais de 800m de distância. Por algumas vezes, o choro pode ser ouvido ecoando por toda a volta da região, um sinal de que os Spearows estão avisando uns aos outros que há algum sinal de perigo."),
(022, 13, 8, "Fearow", "Fearow é um Pokémon dos Tipos Normal e Voador.
Ele é um Pokémon reconhecido pelo seu pescoço comprido e bico alongado. Seu corpo possui uma forma conveniente para capturar presas no solo ou na água. Este pokémon utiliza muito de seu bico longo e fino para para pegar seus alvos. Fearow é a evolução de Spearow."),
(023, 14, null, "Ekans", "Ekans é um Pokémon do tipo Venenoso.
Ele se encolhe numa forma espiral enquanto descansa. Assume-se que esta posição permite esse Pokémon a reagir rapidamente às ameaças que venham de qualquer direção com apenas um olhar de sua cabeça erguida."),
(024, 13, null, "Arbok", "Arbok é um Pokémon do tipo Venenoso.
Este Pokémon é incrivelmente forte a fim de contrair coisas com seu corpo. Ele pode até mesmo achatar tambores de óleo de aço. Uma vez que Arbok envolve seu corpo em torno de seu adversário, escapar de seu abraço esmagador é impossível.
Arbok é a evolução de Ekans."),
(025, 4, null, "Pikachu", "Pikachu é um Pokémon do tipo Elétrico.
Toda vez que Pikachu dá de cara com algo novo, ele o acerta com uma descarga elétrica. Se você se deparar com um fruto torrado, é uma evidência de que esse Pokémon errou na intensidade de energia de sua descarga elétrica."),
(026, 4, null, "Raichu", "Raichu é um Pokémon to tipo Elétrico.
Se as sacas elétricas forem carregadas excessivamente, Raichu planta seu rabo no solo e descarrega. Manchas queimados no solo são encontradas perto dos ninhos desse Pokémon.
Raichu é a evolução de Pikachu."),
(027, 11, null, "Sandshrew", "Sandshrew é um Pokémon do tipo Terra.
O corpo de Sandshrew é configurado para absorver água sem perdê-la, permitido-o sobreviver por longos períodos no deserto árido. Este Pokémon se enrola no formato de bola para se proteger dos inimigos."),
(028, 4, null, "Sandslash", "Sandslash é um Pokémon do tipo Terra.
O corpo de Sandslash é coberto por pontas duras, que são seções endurecidas de sua pele. Uma vez por ano, os espinhos antigos caem, para serem substituídos por novos espinhos que crescem sob os antigos. 
Sandslash é a evolução de Sandshrew."),
(029, 14, null, "Nidoran female", "Nidoran Fêmea é um Pokémon do tipo Venenoso.
O chifre da Nidoran Fêmea secreta um veneno poderoso. Acredita-se que esse Pokémon desenvolveu essa proteção devido ao tamanho pequeno de seu corpo. Quando se sente em perigo, ela exala uma toxina horrível direto de seu chifre."),
(030, 14, null, "Nidorina", "Nidorina é um Pokémon do tipo Venenoso.
Quando Nidorina se encontra enetre amigos ou família, ela mantém seus chifres escondidos para não correr o risco de machucar ninguém. Aparentemente, esse Pokémon fica nervoso ao se separar dos outros.
Nidorina é a evolução de Nidoran Fêmea."),
(031, 4, 11, "Nidoqueen", "Nidoqueen é um Pokémon dos tipos Venenoso e Terra.
O corpo de Nidoqueen é envolto em escalas extremamente duras. Ela é adepta de mandar inimigos ao céu com trombadas duras. Este Pokémon fica em sua forma mais forte quando está a defender os mais novos de sua cadeia evolutiva.
Nidoqueen é a evolução de Nidorina."),
(032, 14, null, "Nidoran male", "Nidoran Macho é um Pokémon do tipo Venenoso.
Ele desenvolveu músculos para mover suas orelhas. Graças a eles, suas orelhas podem se mover livremente em qualquer direção. Até mesmo o som mais suave não escapa da atenção deste Pokémon."),
(033, 14, null, "Nidorino", "Nidorino é um Pokémon do tipo Venenoso.
Ele tem um chifre que é mais duro que diamante. Se ele sentir uma presença hostil, todas as pontas nas suas costas se levantam de uma vez só, e ele desafiará seus adversários com toda sua força.
Nidorino é a evolução de Nidoran Macho."),
(034, 4, 11, "Nidoking", "Nidoking é um Pokémon dos tipos Venenoso e Terra.
O rabo grosso de Nidoking carrega um poder destrutivo enorme. Com uma chicotada, ele pode derrubar uma torre de transmissão de metal. Uma vez que este Pokémon se esbraveja e parte ao ataque, não há o que o pare.
Nidoking é a evolução de Nidorino."),
(035, 5, null, "Clefairy", "Clefairy é um Pokémon do tipo Fada.
Toda noite de lua cheia, grupos deste Pokémon se juntam para brincar. Quando chega o alvorecer, as Clefairy super cansadas retornam às montanhas onde aninham-se umas entre as outras para dormir."),
(036, 5, null, "Clefable", "Clefable é um Pokémon do tipo Fada.
Ela se move levemente como se tivesse voando usando suas asas. O seu toque leve lhe permite até andar sob a água. É conhecida por passear em lagos quietos em noites que a luz da lua os ilumina.
Clefable é a evolução de Clefairy."),
(037, 7, null, "Vulpix", "Vulpix é um Pokémon do Tipo Fogo.
Ao nascer, Vulpix tem apenas um rabo, que é branco. Esse rabo se separa em 6 se ele receber muito amor de seu treinador. Esses seis rabos ficam magnificamente curvados e da cor dos cabelos dele."),
(038, 7, null, "Ninetales", "Ninetales é um Pokémon do Tipo Fogo.
Ele lança uma luz sinistra de seus olhos vermelhos fulmejantes para ganhar o controle da mente de seus adversários. Dizem que este Pokémon vive por volta de 1000 anos.
Ninetales é a evolução de Vulpix."),
(039, 13, 5, "jigglypuff", "Jigglypuff é um Pokémon do tipo Fada.
As cordas vocais de Jigglypuff ajustam livremente a frequência de sua voz. Este Pokémon usa sua habilidade de cantar precisamente em determinadas frequências para deixar seus adversários tontos, as vezes até em sono profundo."),
(040, 13, 5, "Wigglytuff", "Wigglytuff é um Pokémon dos tipos Fada e Normal.
Ela tem grandes olhos arredondados. As superfícies de seus olhos estão sempre cobertas com uma camada fina de lágrimas. Se qualquer poeira encostar em seus olhos, é rapidamente removido pelo líquido.
Wigglytuff é a evolução de Jigglypuff."),
(041, 14, 8, "Zubat", "Zubat é um Pokémon dos Tipos Venenoso e Voador.
Ele remanesce quieto e sem se mover em locais escuros ao longo da luz do dia. Ele faz isso porque a exposição prologada à luz do sol causa queimaduras no seu corpo."),
(042, 14, 8, "Golbat", "Golbat é um Pokémon dos Tipos Venenoso e Voador.
Ele adora beber o sangue de seres vivos. Ele é muito ativo nas horas mais escuras da noite. Ele voa pelos céus noturnos, a procura de sangue fresco.
Golbat é a evolução de Zubat."),
(043, 10, 14, "Oddish", "Oddish é um Pokémon dos Tipos Venenoso e Planta.
Ao longo do dia, Oddish se enterra no solo para absorver nutrientes da terra usando seu corpo inteiro. Quanto mais fértil for a terra, mas reluzente suas folhas ficarão."),
(044, 10, 14, "Gloom", "Gloom é um Pokémon dos Tipos Venenoso e Planta.
Ele solta uma fragrância fedida do pistilo da sua flor. Quando em situações de perigo, o odor piora mais ainda. Se este Pokémon se sentir calmo e seguro, ele não solta nenhum aroma ruim.
Gloom é a evolução de Oddish."),
(045, 10, 14, "Vileplume", "Vileplume é um Pokémon dos Tipos Venenoso e Planta.
O pólem tóxico do Vileplume causa ataques de alergia horrososo. É por isso que a recomendação é de nunca se aproximar de flores atrativas no meio da selva, por mais bonitas que elas sejam.
Vileplume é a evolução de Gloom."),
(046, 1, 10, "Paras", "Paras é um Pokémon dos Tipos Inseto e Planta.
Paras tem cogumelos parasitas crescendo em suas costas, eles são chamados de tochukaso. Eles vão crescendo de acordo com a quantidade de nutrientes com conseguem drenar do Pokémon hospedeiro. Eles são muito valorizados como remédio para prolongar a vida."),
(047, 1, 10, "Parasect", "Parasect é um Pokémon dos Tipos Inseto e Planta.
Ele é conhecido por infestar em massa grandes árvores e absorver os nutrientes da base do tronco e da raiz. Quando a árvore morre, todos os Parasect mudam para a próxima de uma vez só.
Parasect é a evolução de Paras."),
(048, 1, 14, "Venonat", "Venonat é um Pokémon dos Tipos Inseto e Venenoso.
Dizem que Venonat evoluiu com uma capa de cabelos finos que cobre seu corpo inteiro para proteção. Ele tem olhos grandes que nunca falham em perceber até a menor das presas."),
(049, 1, 14, "Venomoth", "Venomoth é um Pokémon dos Tipos Inseto e Venenoso.
Ele é um Pokémon noturno, se está ativo durante a noite. Sua preza favorita são pequenos insetos que se juntam às luzes das ruas, atraídos por elas em meio a escuridão.
Venomoth é a evolução de Venonat."),
(050, 11, null, "Diglett", "Diglett é um Pokémon do Tipo Terra.
Ele é um Pokémon criado em várias fazendas. O motivo é simples - por onde esse Pokémon passa, o solo fica perfeito para ser semeado. Na maioria das vezes o solo arado por Diglett é usado para a colheita de deliciosos vegetais."),
(051, 11, null, "Dugtrio", "Dugtrio é um Pokémon do Tipo Solo. 
Dugtrio é na verdade um conjunto de trigêmeos que emergiram de um corpo só. Por isso, cada um deles pensa exatamente da mesma maneira que os outros dois. Eles trabalham cooperativamente para cavar sem parar."),
(052, 13, null, "Meowth", "Meowth é um Pokémon do Tipo Normal. 
Meowth esconde suas garras afiadas dentro de suas patas para entrar sorrateiramente e não dar nenhum passo que possa lhe incriminar. Por alguma razão, este Pokémon ama moedas reluzentes que brilham mais ainda com a luz."),
(053, 13, null, "Persian", "Persian é um Pokémon do Tipo Normal. 
Persian tem seis grossos bigodes que lhe dão um ar de durão. Esses bigodes podem sentir os movimentos no ar e determinar o que está ao redor do Pokémon. Ele fica mais dócil quando segurado pelos bidodes."),
(054, 18, null, "Psyduck", "Psyduck é um Pokémon do Tipo Água. 
Psyduck tem um poder misterioso. Quando ele usa, este Pokémon gera ondas cerebrais que supostamente só seriam vista em quem dorme. A descoberta gerou controvérsias entre estudiosos."),
(055, 18, null, "Golduck", "Golduck é um Pokémon do Tipo Água. 
As membranas nas pernas e patas e o corpo maleávek de Golduck lhe dão uma velocidade impressionante dentro da água. Este Pokémon é definitivamente mais rápido do que até mesmo o nadador mais atlético de todos."),
(056, 6, null, "Mankey", "Mankey é um Pokémon do Tipo Lutador. 
Quando Mankey começa a tremer e seu nariz fica vermelho, é um claro sinal de que ele está ficando nervoso. No entando, como ele atinge um nível altíssimo de raiva quase que instantaneamente, é impossível para qualquer um fugir de sua ira."),
(057, 6, null, "Primeape", "Primeape é um Pokémon do Tipo Lutador. 
Quando Primeape fica furioso, sua circulação sanguínea aumenta consideravelmente. Com isso, seus músculos ficam ainda mais fortes. Entretanto, ele fica muito menos inteligente."),
(058, 7, null, "Growlithe", "Growlithe é um Pokémon do Tipo Fogo. 
Growlithe tem senso de odor sensacional. Uma vez que ele sentir um cheiro, ele jamais esquecerá, não importa o que aconteça. Seu olfato é tão avançado que ele o usa até para determinar as emoções dos seres vivos ao seu redor."),
(059, 7, null, "Arcanine", "Arcanine é um Pokémon do Tipo Fogo. 
Arcanine é conhecido por sua incrível velocidade. Dizem que ele é capaz de correr 6,200 milhas em um dia e uma noite. O fogo que queima verozmente dentro do corpo desse Pokémon é a fonte de sua energia."),
(060, 18, null, "Poliwag", "Poliwag é um Pokémon do Tipo Água. 
Poliwag tem uma pele muito fina. É possível ver a coluna dele através de sua pele. Apesar da espessura, a pele dele é muito flexível. Até mesmo presas afiadas não conseguem penetrá-la."),
(061, 18, null, "Poliwhirl", "Poliwhirl é um Pokémon do Tipo Água. 
A pele do corpo de Poliwhirl está sempre úmida e com um fluído pegajoso. Por causa dessa cobertura escorregadia, ele consegue facilmente fugir e se desmprender de inimigos durante suas batalhas."),
(062, 18, 6, "Poliwrath", "Poliwrath é um Pokémon do Tipo Água. 
Os grandes e super desenvolvidos músculos de Poliwrath nunca ficam fatigados, não importa o quanto ele se exercite. Ele é tão forte e incansável que este Pokémon pode nada ida e volta em um oceano sem problemas."),
(063, 15, null, "Abra", "Abra é um Pokémon do Tipo Psíquico. 
Abra dorme por 18 horas por dia. Entretanto, ele pode sentir a presença de inimigos mesmo enquanto dormindo. Quando isso acontece, ele se teleporta imediatamente para um local seguro."),
(064, 15, null, "Kadabra", "Kadabra é um Pokémon do Tipo Psíquico. 
Kadabra emite uma onda alpha peculiar que causa dor de cabeça. Somente algumas pessoas particularmente de mente forte podem conseguir virar um treinador desse pokémon."),
(065, 15, null, "Alakazam", "Alakazam é um Pokémon do Tipo Psíquico. 
O cérebro de Alakazam continua a crescer, deixando sua cabeça pesada demais para o pescoço conseguir suportar. Ele deixa sua cabeça de pé através de seu poder psicosinético"),
(066, 6, null, "Machop", "Machop é um Pokémon do Tipo Lutador. 
Os músuculos de Machop são especiais—eles nunca se cansam, não importa quantoe ele use. Este Pokémon tem força suficiente para lançar 100 adultos humanos."),
(067, 6, null, "Machoke", "Machoke é um Pokémon do Tipo Lutador. 
Os músculos totalmente tonificados de Machoke são duros como aço. Este Pokémon é tão forte que consegue facilmente levantar um lutador de sumo com apenas um dedo."),
(068, 6, null, "Machamp", "Machamp é um Pokémon do Tipo Lutador. 
Machamp tem a força para lançar qualquer coisa bem longe. Entranto, qualquer trabalho que requer cuidado e destreza faz com que os seys braços se emaranharem. Este Pokémon tende a entrar em ação antes de pensar."),
(069, 10, 14, "Bellsprout", "Bellsprout é um Pokémon dos Tipos Planta e Venenoso. 
O corpo fino e flexível de Bellsprout a permite se dobrar e desviar de qualquer ataque, independentemente de quão forte ele for. Por sua boca, ela cosper um fluído corrosivo capaz de derreter até ferro."),
(070, 10, 14, "Weepinbell", "Weepinbell é um Pokémon dos Tipos Planta e Venenoso. 
Weepinbell tem um grande tronco na sua parte de traz. Durante a noite, ela se engancha em galhos de árvores e vai dormir. Se ela se mover enquanto dorme, ela povrevalmente estará no chão quando acordar."),
(071, 10, 14, "Victreebel", "Victreebel é um Pokémon dos Tipos Planta e Venenoso. 
Victreebel tem uma longa vinha que se extende da sua cabeça. Essa vinha é balançada por este Pokémon para parecer com um animal pequeno e atrair presas. Quando a presa se aproxima da vinha, Victreebel a engole de uma vez."),
(072, 18, 14, "tentacool", "Tentacool é um Pokémon dos Tipos Água e Venenoso. 
O corpo de Tentacool é composto em sua maior parte por água. Se for removido do mar, ele fica seco como um pergaminho. Se esse Pokémon ficar desidratado, coloque-o de volta no oceano."),
(073, 18, 14, "tentacruel", "Tentacruel é um Pokémon dos Tipos Água e Venenoso. 
Tentacruel tem uma grande esfera vermelha em sua cabeça. Essa esfera começa a brilhar antes de lançar a sua volta uma explosão supersônica violenta. Está técnica acaba desencadeando ondas vorazes a sua volta."),
(074, 16, 11, "Geodude", "Geodude é um Pokémon dos Tipos Pedra e Solo. 
Quanto mais o Geodude vive, mais erosado ficam suas extremidades, o deixado mais circular em aparência. Por outro laod, o coração dele sempre será duro, escarpado e áspero."),
(075, 16, 11, "Graveler", "Graveler é um Pokémon dos Tipos Pedra e Solo. 
Graveler cresce se alimentando de rochas. Aparentemente, ele prefere se alimentar de rochas que estão cobertas com musgo. Este Pokémon come uma tonelada de rochas por dia."),
(076, 16, 11, 'Golem', "Golem é um Pokémon dos Tipos Pedra e Solo. 
Golem vive no topo de montanhas. Quando ocorrem terremotos maiores, esses Pokémonvão descer em massa, rolando montanha abaixo."),
(077, 7, null, 'Ponyta', "Ponyta é um Pokémon do Tipo Fogo. 
Ponyta nasce bem fraquinha, mal consegue se levantar. Ela se fortalece ao tentar ficar de pé e manter o ritmo de seus pais."),
(078, 7, null, 'Rapidash', "Rapidash é um Pokémon do Tipo Fogo. 
Rapidash muitas vezes pode ser vista galopando por campos e planícies. Porém, quando fica séria, suas chamas começam a ficar maiores e mais violentas e ela começa a galopar em velocidades altíssimas, muito acima de 150 milhas por hora."),
(079, 18, 15, 'Slowpoke', "Slowpoke é um Pokémon dos tipos Água e Psíquico. 
Slowpoke usa sua calda para capturar presas em rios enfido-a na água e esperando que uma presa morda-a. Porém, tem vezes que ele se esquece do que está fazendo e fica dias parado no mesmo lugar."),
(080, 18, 15, 'Slowbro', "Slowbro é um Pokémon dos tipos Água e Psíquico. 
A calda de Slowbro tem um Shellder firmemente preso por uma mordida. Como resultado, o rabo não pode mais ser usado para pesca. Isso faz com que Slowbro nade atrás de suas prezas."),
(081, 4, 17, 'Magnemite', "Magnemite é um Pokémon dos tipos Elétrico e Aço. 
Magnemite se prende à linhas de energia para se alimentar de eletricidade. Se acabar a luz em sua casa, vá olhar a caixa dos circuitos. Você poderá encontrar vários desse Pokémon por lá."),
(082, 4, 17, 'Magneton', "Magneton é um Pokémon dos tipos Elétrico e Aço. 
Magneton emite ua poderosa força magnética que é fatal para dispositivos mecânicos. Como resultado, algumas cidades tem sirenes para alertar a população de invasões desse Pokémon."),
(083, 13, 8, 'Farfetch`d', "Farfetch'd é um Pokémon dos Tipos Normal e Voador. 
Farfetch'd sempre é visto segurando o galho de uma planta. Aparentemente, existem galhos bons e ruins. Dizem que esse Pokémon é conhecido por brigar com outros Pokémons por determinados galhos."),
(084, 13, 8, 'Doduo', "Doduo é um Pokémon dos Tipos Normal e Voador. 
As cabeças de Doduo nunca dormem ao mesmo tempo, elas revezam-se para dormir. Desse jeito, há sempre uma cabeça ligada na presença de inimigos enquanto a outra descansa."),
(085, 13, 8, 'Dodrio', "Dodrio é um Pokémon dos Tipos Normal e Voador. 
Fique ligado se as três cabeças de Dodrio estiverem cada uma olhando para uma direção diferente. É um claro sinal de que ele está com a guarda alta. Não cheque perto dele quando este Pokémon estiver assim, se não há grandes chances de você ser bicado."),
(086, 18, null, 'Seel', "Seel é um Pokémon do tipo Água. 
Seel caça suas prezas nas águas de mares frios, abaixo de camadas de gelo. Quando ele precisa respirar, ele abre .buracos no gelo com o chifre de sua cabeça."),
(087, 18, 12, 'Dewgong', "Dewgong é um Pokémon dos tipos Água e Gelo. 
Dewgong adora rodear águas bem geladas. Uma vez esse Pokémon estava descansando numa geleira e um marinheiro ao avistá-lo pensou que era uma sereia."),
(088, 14, null, 'Grimer', "Grimer é um Pokémon do tipo Venenoso. 
O corpo de lodo e borrachento de Grimer pode ser forçado pra dentro de qualquer abertura, não importando o quão pequena ela for. Este Pokémon entra em canos de esgoto para beber a àgua suja e fedorenta de lá."),
(089, 14, null, 'Muk', "Muk é um Pokémon do tipo Venenoso. 
Do corpo de Muk sai um fluído com um cheiro tão ruim que parece que o nariz vai cair. Apenas uma gota desse fluído é capaz de poluir uma piscina inteira."),
(090, 18, null, 'Shelder', "Shellder é um Pokémon do tipo Água. 
De noite, este Pokémon usa sua grande língua para cavar um buraco no chão do mar para poder lá dormir. Para dormir, Shellder fecha sua concha, mas deixa sua língua para fora."),
(091, 18, 12, 'Cloyster', "Cloyster é um Pokémon dos tipos Água e Gelo. 
Cloyster é capaz de nadar em mar aberto. Ele o faz engolindo água e depois cuspindo-a em jato pela traseira de seu corpo. Este Pokémon pode atirar espinhos de seu casco pelo mesmo sistema."),
(092, 9, 14, 'Gastly', "Gastly é um Pokémon dos tipos Fantasma e Venenoso. 
Gastly é composto em maior parte por gás. Se exposto a um vento bem forte, seu corpo gasoso se desforma. Grupos desse Pokémon geralmente se juntam nas calhas de casas para escapar de rajadas de vento."),
(093, 9, 14, 'Haunter', "Haunter é um Pokémon dos tipos Fantasma e Venenoso. 
Haunter é um Pokémon perigoso. Se um aparecer na sua frente enquanto estiver flutuando na escuridão, você jamais deve se aproximar. Ele vai tentar te lamber com sua língua e tirar sua vida de você."),
(094, 9, 14, 'Gengar', "Gengar é um Pokémon dos tipos Fantasma e Venenoso. 
De vez em quando, em noites bem escuras, a sua sombra vai crescer, ficar disforme e te passar. Isso na verdade é Gengar passando por você, fingindo ser sua sombra."),
(095, 16, 11, 'Onix', "Onix é um Pokémon dos Tipos Pedra e Solo. 
Onix tem um imã em seu cérebro. Ele funciona como uma bússola para o Pokémon não perder a direção quando estiver sob a terra. Conforme ele envelhece, seu corpo começa a ficar mais arredondado e fino."),
(096, 15, null, 'Drowzee', "Drowzee é um Pokémon do tipo Psíquico. 
Se seu nariz começar a coçar enquanto você dorme, é um sinal certo de que este Pokémon está sob seu travesseiro tentando comer seus sonhos através de suas narinas."),
(097, 15, null, 'Hypno', "Hypno é um Pokémon do tipo Psíquico. 
Hypno segura um pêndulo em sua mão. O brilho e movimentação do pêndulo leval o inimigo a um estado profundo de hipnose. Enquanto ele caça, ele sempre mantém seu pêndulo polido."),
(098, 18, null, 'Krabby', "Krabby é um Pokémon do tipo Água. 
Krabby vive em praias, enterrado dentro de buracos cavados na areia. Em praias cheias de areia, com pouca comida, é comum ver vários desses Pokémon disputando território."),
(099, 18, null, 'Kingler', "Kingler é um Pokémon do tipo Água. 
Kingler tem uma garra enorme, muito acima do tamanho do seu par. Ele balança essa garra imensa no ar para se comunicar. Por causa do peso da garra, ele fica cansado muito mais rápido."),
(100, 4, null, 'Voltorb', "Voltorb é um Pokémon do tipo Elétrico. 
Voltorb foi visto pela primeira vez em uma empresa que fabricava pokébolas. A ligação entre aquela primeira vista e o fato do Pokémon se parecer muito com uma Pokébola ainda continua um mistério."),
(101, 4, null, 'Electrode', "Electrode é um pokemon do Tipo Elétrico.
Uma das características do Electrode é sua atração pela eletricidade. 
É um Pokémon problemático que se reúne principalmente em usinas de energia elétrica
para se alimentar da eletricidade que acabou de ser gerada.
Electrode é a evolução de Voltorb."),

(102, 10, 15, 'Exeggcute', "Exeggcute é um pokemon dos Tipos Psíquico e Grama.
Este Pokémon consiste em seis ovos que formam um aglomerado intimamente ligado. 
Os seis ovos se atraem e giram. Quando cada vez mais rachaduras aparecem nos ovos. 
Exeggcute está perto da evolução."),

(103, 10, 15, 'Exeggcutor', "Exeggcutor é um pokemon dos Tipos Psíquico e Grama.
O exeggcutor veio originalmente dos trópicos. 
Suas cabeças ficam cada vez maiores com a exposição à forte luz do sol. 
Diz-se que quando as cabeças caem, eles se agrupam para formar o Exeggcute.
Exeggcutor é a evolução de Exeggcute."),

(104, 11, null, 'Cubone', "Cubone é um pokemon do Tipo Terrestre. 
Cubone anseia pela mãe que nunca mais verá. 
Vendo a semelhança de sua mãe na lua cheia, ela chora. 
As manchas no crânio que o Pokémon usa são causadas pelas lágrimas que ele derrama."),

(105, 11, null, 'Marowak', "Marowak é um pokemon do Tipo Terrestre. 
Marowak é a forma evoluída de um Cubone que superou sua tristeza 
pela perda de sua mãe e se tornou forte. 
O espírito temperado e endurecido deste Pokémon não é facilmente quebrado.
Marowak é a evolução de Cubone."),

(106, 11, null, 'Hitmonlee', "Hitmonlee é um pokemon do Tipo Lutador.
As pernas de Hitmonlee se contraem e se esticam livremente. 
Usando essas pernas elásticas, ele rola sobre os inimigos com chutes devastadores. 
Após a batalha, ele esfrega as pernas e relaxa os músculos para superar a fadiga."),

(107, 11, null, 'Hitmonchan', "Hitmonlee é um pokemon do Tipo Lutador. 
Diz-se que Hitmonchan possui o espírito de um boxeador 
que estava lutando para um campeonato mundial. 
Este Pokémon tem um espírito indomável e nunca desistirá diante das adversidades."),

(108, 13, null, 'Lickitung', "Lickitung é um pokemon do Tipo Normal.
Sempre que o Lickitung se depara com algo novo, ele infalivelmente o lambe. 
Faz isso porque memoriza as coisas pela textura e pelo sabor. É um pouco desconcertado por coisas azedas."),

(109, 14, null, 'Koffing', "Koffing é um pokemon do Tipo Venenoso.
Koffing incorpora substâncias tóxicas. 
Ele mistura as toxinas com o lixo bruto para desencadear uma reação química que resulta 
em um gás venenoso terrivelmente poderoso. 
Quanto mais alta a temperatura, mais gás é fabricado por este Pokémon."),

(110, 14, null, 'Weezing', "Weezing é um pokemon do Tipo Venenoso.
Weezing encolhe e infla alternadamente seus corpos gêmeos para misturar gases tóxicos em seu interior. 
Quanto mais os gases são misturados, mais poderosas as toxinas se tornam. 
O Pokémon também se torna mais pútrido.
Weezing é a evolução de Koffing. "),

(111, 11, 16, 'Rhyhorn', "Rhyhorn é um pokemon do Tipo Terrestre e Pedra.
O cérebro de Rhyhorn é muito pequeno. É tão denso que, ao correr, 
ele se esquece do motivo pelo qual começou a funcionar. 
Parece que às vezes se lembra se destrói algo."),

(112, 11, 16, 'Rhydon', "Rhydon é um pokemon do Tipo Terrestre e Pedra.
Rhydon tem um chifre que serve de broca. É usado para destruir rochas e pedregulhos. 
Este Pokémon ocasionalmente colide com fluxos de magma, 
mas a pele semelhante a uma armadura o impede de sentir o calor.
Rhydon é a evolução de Rhyhorn"),

(113, 13, null, 'Chansey', "Chansey é um pokemon do Tipo Normal.
Chansey põe ovos nutricionalmente excelentes todos os dias. 
Os ovos são tão deliciosos que são devorados fácil e avidamente, 
mesmo por aquelas pessoas que perderam o apetite."),

(114, 10, null, 'Tangela', "Tangela é um pokemon do Tipo Grama.
As vinhas de Tangela se quebram facilmente se forem agarradas. 
Isso acontece sem dor, permitindo uma fuga rápida. 
As vinhas perdidas são substituídas por vinhas recém-cultivadas no dia seguinte."),

(115, 13, null, 'Kangaskhan', "Kangaskhan é um pokemon do Tipo Normal.
Se você encontrar um jovem Kangaskhan brincando sozinho, 
nunca deve perturbá-lo ou tentar pegá-lo. 
O pai do bebê Pokémon com certeza está na área, 
e ele ficará violentamente furioso com você."),

(116, 18, null, 'Horsea', "Horsea é um pokemon do Tipo Água.
Se Horsea sentir perigo, ele irá borrifar reflexivamente uma densa tinta preta
de sua boca e tentar escapar. 
Este Pokémon nada batendo habilmente a barbatana nas costas."),

(117, 18, null, 'Seadra', "Seadra é um pokemon do Tipo Água.
Seadra gera redemoinhos girando seu corpo. 
Os redemoinhos são fortes o suficiente para engolir até barcos de pesca. 
Este Pokémon enfraquece a presa com essas correntes e a engole inteira.
Seadra é a evolução de Horsea."),

(118, 18, null, 'Goldeen', "Goldeen é um pokemon do Tipo Água.
Goldeen adora nadar livremente em rios e lagoas. 
Se um desses Pokémon for colocado em um aquário, 
ele irá quebrar até o vidro mais grosso com um aríete de seu chifre e escapar."),

(119, 18, null, 'Seaking', "Seaking é um pokemon do Tipo Água.
Seaking é muito protetor de seus ovos. 
O macho e a fêmea se revezarão para patrulhar o ninho e os ovos. 
A guarda de ovos por esses Pokémon dura mais de um mês.
Seaking é a evolução de Goldeen."),

(120, 18, null, 'Staryu', "Staryu é um pokemon do Tipo Água.
Staryu aparentemente se comunica com as estrelas no céu noturno piscando 
o núcleo vermelho no centro de seu corpo. 
Se partes de seu corpo forem rasgadas, 
esse Pokémon simplesmente regenera as peças e membros que faltam."),

(121, 18, 15, 'Starmie', "Starmie é um pokemon dos Tipos Água e Psíquico.
Starmie nada na água girando seu corpo em forma de estrela
como se fosse a hélice de um navio. 
O núcleo no centro do corpo deste Pokémon brilha em sete cores.
Starmie é a evolução de Staryu."),

(122, 15, 5, 'Mr. Mime', "Mr. Mime é um pokemon dos Tipos Psíquico e Fada.
O Mr. Mime é um mestre da pantomima. 
Seus gestos e movimentos convencem os observadores de que algo invisível 
realmente existe. Uma vez que os observadores estão convencidos,
a coisa invisível existe como se fosse real."),

(123, 1, 8, 'Scyther', "Scyther é um pokemon dos Tipos Inseto e Voador.
Scyther é incrivelmente rápido. Sua velocidade incrível aumenta a eficácia 
das foices gêmeas em seus antebraços. 
As foices deste Pokémon são tão eficazes que podem 
cortar troncos grossos com um único golpe."),

(124, 12, 15, 'Jynx', "Jynx é um pokemon dos Tipos Gelo e Psíquico.
Jynx caminha ritmicamente, balançando e balançando os quadris como se estivesse dançando. 
Seus movimentos são tão atraentes que as pessoas 
que o veem são compelidas a balançar os quadris 
sem se preocupar com o que estão fazendo"),

(125, 4, null, 'Electabuzz', "Electabuzz é um pokemon do Tipo Elétrico.
Quando uma tempestade chega, 
as gangues deste Pokémon competem entre si para escalar alturas 
que provavelmente serão atingidas por raios. 
Algumas cidades usam Electabuzz no lugar de pára-raios."),

(126, 7, null, 'Magmar', "Magmar é um pokemon do Tipo Fogo.
Na batalha, Magmar sopra chamas intensamente quentes 
por todo o corpo para intimidar seu oponente. 
As explosões de fogo deste Pokémon criam ondas de calor 
que incendiam a grama e as árvores ao redor."),

(127, 1, null, 'Pinsir', "Pinsir é um pokemon do Tipo Inseto.
Pinsir tem um par de chifres enormes. 
Projetando-se da superfície desses chifres, há espinhos. E
sses espinhos são cravados profundamente no corpo do inimigo quando a pinça se fecha, 
tornando difícil para o inimigo escapar."),

(128, 13, null, 'Tauros', "Tauros é um pokemon do Tipo Normal.
Este Pokémon não fica satisfeito a menos que esteja furioso o tempo todo. 
Se não houver oponente para Tauros lutar, 
ele irá atacar árvores grossas e derrubá-las para se acalmar."),

(129, 18, null, 'Magikarp', "Magikarp é um pokemon do Tipo Água.
Magikarp é virtualmente inútil em batalha, pois só pode espirrar. 
Como resultado, é considerado fraco. No entanto, é na verdade um Pokémon 
muito resistente que pode sobreviver em qualquer corpo de água, 
não importa o quão poluído esteja."),

(130, 18, 8, 'Gyarados', "Gyarados é um pokemon dos Tipos Água e Voador.
Depois que Gyarados começa a se alastrar, seu sangue ferozmente violento 
não se acalma até que tenha queimado tudo. 
Existem registros de fúria deste Pokémon que durou um mês inteiro.
Gyarados é a evolução de Magikarp"),

(131, 18, 12, 'Lapras', "Lapras é um pokemon dos Tipos Água e Gelo.
As pessoas levaram Lapras quase à extinção. 
À noite, diz-se que este Pokémon canta melancolicamente enquanto 
busca o que poucos outros de sua espécie ainda permanecem."),

(132, 13, null, 'Ditto', "Ditto é um pokemon do Tipo Normal.
Ditto reorganiza sua estrutura celular para se transformar em outras formas.
No entanto, se tentar se transformar em algo contando com sua memória,
esse Pokémon consegue errar os detalhes."),

(133, 13, null, 'Eevee', "Eevee é um pokemon do Tipo Normal.
Eevee tem uma composição genética instável que muda repentinamente
devido ao ambiente em que vive. 
A radiação de várias pedras faz com que este Pokémon evolua."),

(134, 18, null, 'Vaporeon', "Vaporeon é um pokemon do Tipo Água.
Vaporeon sofreu uma mutação espontânea e desenvolveu barbatanas e guelras
que o permitem viver debaixo d'água. 
Este Pokémon tem a capacidade de controlar a água livremente.
Vaporeon é a evolução de Eevee."),

(135, 4, null, 'Jolteon', "Jolteon é um pokemon do Tipo Elétrico.
As células de Jolteon geram um baixo nível de eletricidade. 
Esse poder é amplificado pela eletricidade estática de seu pelo, 
permitindo que o Pokémon lance raios. 
O pêlo eriçado é feito de agulhas eletricamente carregadas.
Jolteon é a evolução de Eevee"),

(136, 7, null, 'Flareon', "Flareon é um pokemon do Tipo Fogo.
O pelo fofo de Flareon tem um propósito funcional, 
ele libera calor no ar para que seu corpo não fique excessivamente quente. 
A temperatura corporal deste Pokémon pode aumentar até 1.650 graus Fahrenheit.
Flareon é a evolução de Eevee"),

(137, 13, null, 'Porygon', "Porygon é um pokemon do Tipo Normal.
O Porygon é capaz de voltar totalmente aos dados do programa e entrar no ciberespaço. 
Este Pokémon é protegido contra cópia, portanto, não pode ser duplicado por cópia."),

(138, 16, 18, 'Omanyte', "Omanyte é um pokemon dos Tipos Pedra e Água.
Omanyte é um dos Pokémon antigos e extintos que 
foram regenerados a partir de fósseis por pessoas. 
Se atacado por um inimigo, ele se retira para dentro de sua casca dura."),

(139, 16, 18, 'Omastar', "Omastar é um pokemon dos Tipos Pedra e Água.
Omastar usa seus tentáculos para capturar sua presa. 
Acredita-se que ele tenha se extinguido porque sua concha ficou muito grande e pesada, 
tornando seus movimentos muito lentos e pesados.
Omastar é a evolução de Omanyte."),

(140, 16, 18, 'Kabuto', "Kabuto é um pokemon dos Tipos Pedra e Água.
Kabuto é um Pokémon que foi regenerado a partir de um fóssil. 
No entanto, em casos extremamente raros, exemplos vivos foram descobertos. 
O Pokémon não mudou nada nos últimos 300 milhões de anos."),

(141, 16, 18, 'Kabutops', "Kabutops é um pokemon dos Tipos Pedra e Água.
Kabutops nadava debaixo d'água para caçar suas presas nos tempos antigos. 
O Pokémon estava aparentemente evoluindo de um habitante da água para viver na terra, 
como é evidente desde o início da mudança em suas guelras e pernas.
Kabutops é a evolução de Kabuto."),

(142, 16, 8, 'Aerodactyl', "Aerodactyl é um pokemon dos Tipos Pedra e Voador.
Aerodactyl é um Pokémon da era dos dinossauros. 
Foi regenerado a partir de material genético extraído do âmbar. 
É imaginado que ele foi o rei dos céus nos tempos antigos."),

(143, 13, null, 'Snorlax', "Snorlax é um pokemon do Tipo Normal.
O dia típico de Snorlax consiste em nada mais do que comer e dormir.
É um Pokémon tão dócil que há crianças
que usam sua barriga expansiva como um lugar para brincar."),

(144, 12, 8, 'Articuno', "Articuno é um pokemon dos Tipos Gelo e Voador.
Articuno é um lendário Pokémon pássaro que pode controlar o gelo. 
O bater de suas asas esfria o ar. 
Como resultado, dizem que quando esse Pokémon voa, a neve vai cair."),

(145, 4, 8, 'Zapdos', "Zapdos é um pokemon dos Tipos Elétrico e Voador.
Zapdos é um lendário Pokémon pássaro que tem a capacidade de controlar a eletricidade. 
Geralmente vive em nuvens de tempestade. O Pokémon ganha poder se for atingido por raios."),

(146, 7, 8, 'Moltres', "Moltres é um pokemon dos Tipos Fogo e Voador.
Moltres é um lendário Pokémon pássaro que tem a capacidade de controlar o fogo.
Se esse Pokémon for ferido, ele mergulhará seu corpo
no magma derretido de um vulcão para se queimar e se curar."),

(147, 3, null, 'Dratini', "Dratini é um pokemon do Tipo Dragão.
Dratini continuamente muda e descasca sua pele velha. 
Isso ocorre porque a energia vital dentro de seu corpo 
aumenta continuamente para atingir níveis incontroláveis."),

(148, 3, null, 'Dragonair', "Dragonair é um pokemon do Tipo Dragão.
Dragonair armazena uma enorme quantidade de energia dentro de seu corpo. 
Diz-se que altera as condições climáticas em sua vizinhança, 
descarregando energia dos cristais em seu pescoço e cauda.
Dragonair é a evolução de Dratini."),

(149, 3, 8, 'Dragonite', "Dragonite é um pokemon dos Tipos Dragão e Voador.
Dragonite é capaz de girar o globo em apenas 16 horas. 
É um Pokémon de bom coração que leva navios perdidos e naufragando
em uma tempestade para a segurança da terra.
Dragonite é a evolução de Dragonair."),

(150, 15, null, 'Mewtwo', "Mewtwo é um pokemon do Tipo Psíquico.
Mewtwo é um Pokémon criado por manipulação genética. 
No entanto, embora o poder científico dos humanos tenha criado o corpo deste Pokémon,
eles falharam em dotar Mewtwo de um coração compassivo."),

(151, 15, null, 'Mew', "Mew é um pokemon do Tipo Psíquico.
Diz-se que Mew possui a composição genética de todos os Pokémon. 
Ele é capaz de se tornar invisível à vontade, 
então evita totalmente notar, mesmo que se aproxime das pessoas.");


INSERT INTO tbTreinadorPokes (CodTreinador, CodPokemon) values
(1, 77),
(1, 145),
(1, 3),
(1, 8),
(1, 123),
(2, 6),
(2, 8),
(2, 98),
(2, 53),
(2, 90),
(3, 56),
(3, 45),
(3, 12),
(3, 20),
(3, 134),
(4, 123),
(4, 132),
(4, 151),
(4, 150),
(4, 137),
(5, 121),
(5, 15),
(5, 2),
(5, 1),
(5, 127);

CREATE PROCEDURE TreinadorPokemons(CodTreina int)
select tbPokemon.NomePokemon, tbPokemon.CodPokemon from tbTreinador
inner join tbTreinadorPokes on tbTreinadorPokes.CodTreinador = tbTreinador.CodTreinador
inner join tbPokemon on tbPokemon.CodPokemon = tbTreinadorPokes.CodPokemon
and tbTreinador.CodTreinador = CodTreina;

create procedure Resistencias1x(cod int)
select Resistencia1x as '1x' from tbResistencias where CodTipo = cod;

create procedure Resistencias2x(cod int)
select Resistencia2x as '2x' from tbResistencias where CodTipo = 2;

create procedure Fraquezas(cod int)
select Fraqueza as 'F' from tbFraquezas where CodTipo = cod;