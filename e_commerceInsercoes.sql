-- ENDERECO: 'idEndereco', 'rua,numero,complemento,CEP'
INSERT into ENDERECO values('ed01', 'Cristovao Colombo,508,203,90560000');
INSERT into ENDERECO values('ed02', 'Cristovao Colombo,508,204,90560000');
INSERT into ENDERECO values('ed03', 'Cristovao Colombo,510,102,90560000');
INSERT into ENDERECO values('ed04', 'Golcalves de Carvalho,76,,96658454');
INSERT into ENDERECO values('ed05', 'Ludovico Merlin,340,,95170730');
INSERT into ENDERECO values('ed06', 'Protasio Alves,5008,102,98552514');
INSERT into ENDERECO values('ed07', 'Vasco da Gama,508,203,95636254');
INSERT into ENDERECO values('ed08', 'Casto Alves,508,203,91254788');
INSERT into ENDERECO values('ed09', 'Botafogo,200,,95652435');
INSERT into ENDERECO values('ed10', 'Doze,19,101,98876532');

-- CLIENTE: 'cpf','nome','email','senha','carrinho'
INSERT into CLIENTE values ('01517112056', 'Pablo Dias',    'diaspablo@gmail.com',      'pablitoo',     'cr01');
INSERT into CLIENTE values ('01251112021', 'Luana Brisola', 'brisolaluana@gmail.com',   'luadodia',     'cr02');
INSERT into CLIENTE values ('06555328996', 'Nicole Silva',  'silvanicole@gmail.com',    'nicole2512',   'cr03');
INSERT into CLIENTE values ('02565890014', 'Vitor Silva',   'silvavitor@hotmail.com',   'vivalavida',   'cr04');
INSERT into CLIENTE values ('14525668485', 'Jeniffer Roffman','roffmanj@gmail.com',     'jenffman',     'cr05');
INSERT into CLIENTE values ('61524522317', 'Matheus Simoes','simoesmatheus@yahoo.com',  '12345678',     'cr06');
INSERT into CLIENTE values ('01262510965', 'Ana Maria',     'mariaana@gmail.com',       'lourojose',    'cr07');
INSERT into CLIENTE values ('14452318654', 'Elliot',        'mrrobot@gmail.com',        'hackerman',    'cr08');
INSERT into CLIENTE values ('32250156034', 'Luiza Soares',  'soaresluiza@hotmail.com',  'lulusoares',   'cr09');
INSERT into CLIENTE values ('01565652046', 'Eliza Souza',   'souzaeliza@gmail.com',     'rainhaEliza',  'cr10');

-- FORMAS_DE_PAGAMENTO: 'idPagamento','tipo',desconto,parcelaMinima
INSERT into FORMAS_DE_PAGAMENTO values ('fp01', 'Boleto Bancario', 10, 500);
INSERT into FORMAS_DE_PAGAMENTO values ('fp02', 'Cartao de Credito', 0, 200);
INSERT into FORMAS_DE_PAGAMENTO values ('fp03', 'Cartao de Debito', 0, 700);
INSERT into FORMAS_DE_PAGAMENTO values ('fp04', 'PayPal', 5, 300);
INSERT into FORMAS_DE_PAGAMENTO values ('fp05', 'E-cartao', 15, 150);

-- LOCAIS: 'cpf','idEndereco'
INSERT into LOCAIS values ('01517112056', 'ed01');
INSERT into LOCAIS values ('01251112021', 'ed02');
INSERT into LOCAIS values ('06555328996', 'ed03');
INSERT into LOCAIS values ('02565890014', 'ed03');
INSERT into LOCAIS values ('14525668485', 'ed04');
INSERT into LOCAIS values ('61524522317', 'ed05');
INSERT into LOCAIS values ('01262510965', 'ed06');
INSERT into LOCAIS values ('14452318654', 'ed07');
INSERT into LOCAIS values ('32250156034', 'ed08');
INSERT into LOCAIS values ('01565652046', 'ed09');
INSERT into LOCAIS values ('01565652046', 'ed10');

-- CATEGORIA: 'idCategoria','nomeCategoria'
INSERT into CATEGORIA values ('ct00', 'Outros');
INSERT into CATEGORIA values ('ct01', 'Celulares');
INSERT into CATEGORIA values ('ct02', 'Computadores');
INSERT into CATEGORIA values ('ct03', 'Fones de Ouvido');
INSERT into CATEGORIA values ('ct04', 'Maquinas de lavar');
INSERT into CATEGORIA values ('ct05', 'Geladeiras');
INSERT into CATEGORIA values ('ct06', 'Fogoes');
INSERT into CATEGORIA values ('ct07', 'Microondas');
INSERT into CATEGORIA values ('ct08', 'Cooktops');
INSERT into CATEGORIA values ('ct09', 'Lava Louças');
INSERT into CATEGORIA values ('ct10', 'Livros');
INSERT into CATEGORIA values ('ct11', 'Tablets');
INSERT into CATEGORIA values ('ct12', 'Monitores');
INSERT into CATEGORIA values ('ct13', 'Jogos');
INSERT into CATEGORIA values ('ct14', 'Video Games');
INSERT into CATEGORIA values ('ct15', 'Decoracao');
INSERT into CATEGORIA values ('ct16', 'Roupas');
INSERT into CATEGORIA values ('ct17', 'Joias');
INSERT into CATEGORIA values ('ct18', 'Ferramentas de Construcao');
INSERT into CATEGORIA values ('ct19', 'Ferramentas de Jardinagem');
INSERT into CATEGORIA values ('ct20', 'Papelaria');
INSERT into CATEGORIA values ('ct21', 'Liquidificadores');
INSERT into CATEGORIA values ('ct22', 'Panelas');
INSERT into CATEGORIA values ('ct23', 'Utensilios de Cozinha');
INSERT into CATEGORIA values ('ct24', 'Fritadeiras');
INSERT into CATEGORIA values ('ct25', 'Torradeiras');
INSERT into CATEGORIA values ('ct26', 'Bolsas');
INSERT into CATEGORIA values ('ct27', 'Mochilas');
INSERT into CATEGORIA values ('ct28', 'Malas');
INSERT into CATEGORIA values ('ct29', 'Carteiras');

-- PROPRIEDADES: 'idPropriedade','nomePropriedade'
INSERT into PROPRIEDADES value ('pr01', 'Wifi');
INSERT into PROPRIEDADES value ('pr02', 'Bateria Inclusa');
INSERT into PROPRIEDADES value ('pr03', 'Tamanho Memoria');
INSERT into PROPRIEDADES value ('pr04', 'Tamanho HD');
INSERT into PROPRIEDADES value ('pr05', 'Sistema Operacional');
INSERT into PROPRIEDADES value ('pr06', 'Tamanho da Tela');
INSERT into PROPRIEDADES value ('pr07', 'Cor');
INSERT into PROPRIEDADES value ('pr08', 'Ano');
INSERT into PROPRIEDADES value ('pr09', 'Processador');
INSERT into PROPRIEDADES value ('pr10', 'DUAl SIM');
INSERT into PROPRIEDADES value ('pr11', 'Voltagem');
INSERT into PROPRIEDADES value ('pr12', 'Capacidade');
INSERT into PROPRIEDADES value ('pr13', 'Bocas');
INSERT into PROPRIEDADES value ('pr14', 'Idioma');

-- VALOR: 'idValor','valor'
INSERT into VALOR value ('v001', 'SIM');
INSERT into VALOR value ('v002', 'NAO');
INSERT into VALOR value ('v003', '8 GB');
INSERT into VALOR value ('v004', '16 GB');
INSERT into VALOR value ('v005', '32 GB');
INSERT into VALOR value ('v006', '64 GB');
INSERT into VALOR value ('v007', '128 GB');
INSERT into VALOR value ('v008', '256 GB');
INSERT into VALOR value ('v009', '1 TB');
INSERT into VALOR value ('v010', '2 TB');
INSERT into VALOR value ('v011', 'Windows 10');
INSERT into VALOR value ('v012', 'Android 7.0');
INSERT into VALOR value ('v013', 'Android 8.0');
INSERT into VALOR value ('v014', 'IOS');
INSERT into VALOR value ('v015', '21.5 polegadas');
INSERT into VALOR value ('v016', '23 polegadas');
INSERT into VALOR value ('v017', '25 polegadas');
INSERT into VALOR value ('v018', '27 polegadas');
INSERT into VALOR value ('v019', 'Preto');
INSERT into VALOR value ('v020', 'Cinza Marine');
INSERT into VALOR value ('v021', 'Cinza Espacial');
INSERT into VALOR value ('v022', 'Vermelho');
INSERT into VALOR value ('v023', '2015');
INSERT into VALOR value ('v024', '2016');
INSERT into VALOR value ('v025', '2017');
INSERT into VALOR value ('v026', '2018');
INSERT into VALOR value ('v027', 'Intel');
INSERT into VALOR value ('v028', '110 v');
INSERT into VALOR value ('v029', '220 v');
INSERT into VALOR value ('v030', '5 Kg');
INSERT into VALOR value ('v031', '10 Kg');
INSERT into VALOR value ('v032', '12 Kg');
INSERT into VALOR value ('v033', '15 Kg');
INSERT into VALOR value ('v034', '4 Bocas');
INSERT into VALOR value ('v035', '5 Bocas');
INSERT into VALOR value ('v036', 'Portugues');
INSERT into VALOR value ('v037', 'Ingles');

-- VALORACAO: 'idPropriedade','idValor'
INSERT into VALORACAO value('pr01', 'v001');
INSERT into VALORACAO value('pr01', 'v002');
INSERT into VALORACAO value('pr02', 'v001');
INSERT into VALORACAO value('pr02', 'v002');
INSERT into VALORACAO value('pr03', 'v003');
INSERT into VALORACAO value('pr03', 'v004');
INSERT into VALORACAO value('pr03', 'v005');
INSERT into VALORACAO value('pr03', 'v006');
INSERT into VALORACAO value('pr03', 'v007');
INSERT into VALORACAO value('pr03', 'v008');
INSERT into VALORACAO value('pr04', 'v009');
INSERT into VALORACAO value('pr04', 'v010');
INSERT into VALORACAO value('pr05', 'v011');
INSERT into VALORACAO value('pr05', 'v012');
INSERT into VALORACAO value('pr05', 'v013');
INSERT into VALORACAO value('pr05', 'v014');
INSERT into VALORACAO value('pr06', 'v015');
INSERT into VALORACAO value('pr06', 'v016');
INSERT into VALORACAO value('pr06', 'v017');
INSERT into VALORACAO value('pr06', 'v018');
INSERT into VALORACAO value('pr07', 'v019');
INSERT into VALORACAO value('pr07', 'v020');
INSERT into VALORACAO value('pr07', 'v021');
INSERT into VALORACAO value('pr07', 'v022');
INSERT into VALORACAO value('pr08', 'v023');
INSERT into VALORACAO value('pr08', 'v024');
INSERT into VALORACAO value('pr08', 'v025');
INSERT into VALORACAO value('pr08', 'v026');
INSERT into VALORACAO value('pr09', 'v027');
INSERT into VALORACAO value('pr10', 'v001');
INSERT into VALORACAO value('pr10', 'v002');
INSERT into VALORACAO value('pr11', 'v028');
INSERT into VALORACAO value('pr11', 'v029');
INSERT into VALORACAO value('pr12', 'v030');
INSERT into VALORACAO value('pr12', 'v031');
INSERT into VALORACAO value('pr12', 'v032');
INSERT into VALORACAO value('pr12', 'v033');
INSERT into VALORACAO value('pr13', 'v034');
INSERT into VALORACAO value('pr13', 'v035');
INSERT into VALORACAO value('pr14', 'v036');
INSERT into VALORACAO value('pr14', 'v037');

-- CARACTERIZACAO: 'idCategoria','idPropriedade'
INSERT into CARACTERIZACAO value('ct01', 'pr01');
INSERT into CARACTERIZACAO value('ct01', 'pr03');
INSERT into CARACTERIZACAO value('ct01', 'pr05');
INSERT into CARACTERIZACAO value('ct01', 'pr10');
INSERT into CARACTERIZACAO value('ct02', 'pr01');
INSERT into CARACTERIZACAO value('ct02', 'pr02');
INSERT into CARACTERIZACAO value('ct02', 'pr04');
INSERT into CARACTERIZACAO value('ct02', 'pr05');
INSERT into CARACTERIZACAO value('ct02', 'pr06');
INSERT into CARACTERIZACAO value('ct02', 'pr06');
INSERT into CARACTERIZACAO value('ct02', 'pr07');
INSERT into CARACTERIZACAO value('ct02', 'pr08');
INSERT into CARACTERIZACAO value('ct02', 'pr09');
INSERT into CARACTERIZACAO value('ct03', 'pr01');
INSERT into CARACTERIZACAO value('ct03', 'pr02');
INSERT into CARACTERIZACAO value('ct03', 'pr08');
INSERT into CARACTERIZACAO value('ct04', 'pr11');
INSERT into CARACTERIZACAO value('ct04', 'pr12');
INSERT into CARACTERIZACAO value('ct05', 'pr11');
INSERT into CARACTERIZACAO value('ct06', 'pr13');
INSERT into CARACTERIZACAO value('ct07', 'pr11');
INSERT into CARACTERIZACAO value('ct08', 'pr13');
INSERT into CARACTERIZACAO value('ct09', 'pr11');
INSERT into CARACTERIZACAO value('ct10', 'pr14');
INSERT into CARACTERIZACAO value('ct11', 'pr01');
INSERT into CARACTERIZACAO value('ct11', 'pr03');
INSERT into CARACTERIZACAO value('ct11', 'pr05');
INSERT into CARACTERIZACAO value('ct12', 'pr06');

-- OFERTA: 'idOferta',desconto,freteGratis
INSERT into OFERTA values('of01', 15, TRUE);
INSERT into OFERTA values('of02', 5, TRUE);
INSERT into OFERTA values('of03', 25, FALSE);
INSERT into OFERTA values('of04', 15, TRUE);
INSERT into OFERTA values('of05', 20, FALSE);
INSERT into OFERTA values('of06', 10, TRUE);
INSERT into OFERTA values('of07', 10, FALSE);
INSERT into OFERTA values('of08', 15, FALSE);
INSERT into OFERTA values('of09', 10, TRUE);
INSERT into OFERTA values('of10', 30, FALSE);

-- CUPOM_DE_DESCONTO: 'codigo','validade',desconto,'idCategoria'
INSERT into CUPOM_DE_DESCONTO values('cd01', '2019-01-10', 15, 'ct01'); -- desconto de 15% em celulares
INSERT into CUPOM_DE_DESCONTO values('cd02', '2018-12-31', 30, 'ct13'); -- desconto de 30% em jogos
INSERT into CUPOM_DE_DESCONTO values('cd03', '2019-01-31', 10, 'ct11'); -- desconto de 10% em tables
INSERT into CUPOM_DE_DESCONTO values('cd04', '2019-02-28', 10, 'ct03'); -- desconto de 10% em fones de ouvido
INSERT into CUPOM_DE_DESCONTO values('cd05', '2019-01-10', 5,  'ct08'); -- desconto de 5%  em cooktops
INSERT into CUPOM_DE_DESCONTO values('cd06', '2019-01-10', 5,  'ct04'); -- desconto de 5%  em maquina de lavar
INSERT into CUPOM_DE_DESCONTO values('cd07', '2019-12-31', 5,  'ct07'); -- desconto de 5%  em microoondas
INSERT into CUPOM_DE_DESCONTO values('cd08', '2020-06-15', 5,  'ct16'); -- desconto de 5%  em roupas
INSERT into CUPOM_DE_DESCONTO values('cd09', '2019-03-30', 10, 'ct12'); -- desconto de 10% em monitores
INSERT into CUPOM_DE_DESCONTO values('cd10', '2019-11-06', 50, 'ct20'); -- desconto de 50% em papelaria

-- PARCEIRO: 'cnpj','nomeParceiro','papel','endereco','telefone','politica'
INSERT into PARCEIRO value('72667288000163', 'DELL',            'VENDEDOR E ENTREGADOR','Fernando João Bartelle,35,,95178030',  '5132681445', 'Produtos podem ser devolvido em um prazo de até 15 dias após a entrega.');
INSERT into PARCEIRO value('90798145000172', 'AKG',             'VENDEDOR',             'Industrial Belgraf,400,,92990000',     '5432619586', 'Produtos podem ser devolvido em um prazo de até 7 dias após a entrega.');
INSERT into PARCEIRO value('67457503000161', 'BRASTEMP',        'VENDEDOR E ENTREGADOR','Antonio Jose,520,,55486255',           '1132689998', 'Produtos podem ser devolvido em um prazo de até 15 dias após a entrega. As entregas são realizadas de segunda-feira a sexta-feira, das 8h às 21h. A entrega só pode ser realizada a uma pessoa maior de 18 anos que apresente documento de identificação.');
INSERT into PARCEIRO value('63557512000135', 'SUBMARINO',       'VENDEDOR E ENTREGADOR','Juscelino Kubitschek,1890,,55241789',  '1132257489', 'Não é aceita a devolução de qualquer pedido. Entregas realizadas de seguda-feira a sexta-feira, das 8h às 18h. A entrega só poode ser realizada a uma pessoa maior de 18 anos que apresente documento de identificação.');
INSERT into PARCEIRO value('30261178000157', 'ENTREGAS EXPRESS','ENTREGADOR',           'Lindoia,445,,95887666',                '1332612707', 'As entregas são realizadas de segunda-feira a sexta-feira, das 8h às 21h. Excepcionalmente entregas podem ocorrer aos sábados, domingos e feriados.');
INSERT into PARCEIRO value('26267787000146', 'CELULARES E CIA', 'VENDEDOR',             'Flor alta,25,,95586623',               '1132611488', 'Produtos podem ser devolvido em um prazo de até 15 dias após a entrega. As entregas são realizadas de segunda-feira a sexta-feira, das 8h às 21h. Excepcionalmente entregas podem ocorrer aos sábados, domingos e feriados.');
INSERT into PARCEIRO value('26584520000182', 'ELECTROLUX',      'VENDEDOR',             'Pinheiro Machado,775,,95180000',       '5432265547', 'Produtos podem ser devolvido em um prazo de até 30 dias após a entrega. As entregas são realizadas de segunda-feira a quinta-feira, das 8h às 21h.');
INSERT into PARCEIRO value('46515936000156', 'ENTREGAS NA HORA','ENTREGADOR',           'Independencia,747,,95889400',          '5132289566', 'As entregas são realizadas de segunda-feira a sexta-feira, das 8h às 21h. Excepcionalmente entregas podem ocorrer aos sábados, domingos e feriados. A entrega só pode ser realizada a uma pessoa maior de 18 anos que apresente documento de identificação.');
INSERT into PARCEIRO value('61822472000114', 'TOTAL ENTREGAS',  'ENTREGADOR',           'Luis Medel,517,,90566320',             '5132215521', 'As entregas são realizadas de segunda-feira a sexta-feira, das 9h às 22h. Excepcionalmente entregas podem ocorrer aos sábados e feriados. A entrega só pode ser realizada a uma pessoa maior de 18 anos que apresente documento de identificação.');
INSERT into PARCEIRO value('46515978000156', 'SUA CASA ELETRO', 'VENDEDOR E ENTREGADOR','Ana lucia,1450,,93560223',             '4932615859', 'Produtos podem ser devolvido em um prazo de até 15 dias após a entrega. As entregas são realizadas de segunda-feira a sexta-feira, das 8h às 21h. A entrega só pode ser realizada a uma pessoa maior de 18 anos que apresente documento de identificação.');

-- PEDIDO: 'numeroPedido',total,'data','cpf','idPagamento'
INSERT into PEDIDO value ('pd00000001', 261.00,  '2018-11-23', '01517112056', 'fp01'); -- pr00000001 10% pelo boleto
INSERT into PEDIDO value ('pd00000002', 5076.90, '2018-11-23', '01517112056', 'fp01'); -- pr00000003 + pr00000024 10% pelo boleto
INSERT into PEDIDO value ('pd00000003', 2564.15, '2018-11-23', '01517112056', 'fp04'); -- pr00000005 (10% cupom - tablet) 5% PayPal
INSERT into PEDIDO value ('pd00000004', 3875.55, '2018-11-23', '01517112056', 'fp02'); -- pr00000015 + pr00000022 (5% oferta) Cartao Credito
INSERT into PEDIDO value ('pd00000005', 1509.36, '2018-11-23', '01517112056', 'fp04'); -- pr00000006 (10% oferta) (10% cupom) 5% Paypal
INSERT into PEDIDO value ('pd00000006', 2203.67, '2018-11-23', '01517112056', 'fp04'); -- pr00000011 (15% oferta) 5% Paypal
INSERT into PEDIDO value ('pd00000007', 2719.15, '2018-11-23', '01517112056', 'fp05'); -- pr00000021 15% no cartão E-cartao
INSERT into PEDIDO value ('pd00000008', 5641.00, '2018-11-23', '01517112056', 'fp03'); -- pr00000023 (15% oferta) Cartao de Debito
INSERT into PEDIDO value ('pd00000009', 2549.00, '2018-11-23', '01517112056', 'fp02'); -- pr00000013 Cartao de Cretido
INSERT into PEDIDO value ('pd00000010', 5641.00, '2018-11-23', '01517112056', 'fp05');

-- PRODUTO: 'idProduto','nomeProduto','marca',preco,estoque,'idCategoria','cnpjVendedor','cnpjEntregador','fichaTecnica','idOferta'
INSERT into PRODUTO values('pr00000001', 'Fone de ouvido AKG K92',          'AKG',          290.00,     20, 'ct03', '90798145000172', '30261178000157', 'Nome da marca: AKG, Modelo: K92, Ano do modelo: 2016, Número da peça: K92, Baterias inclusas: Não, Funciona com baterias: Não, Inclui adaptador Ac:Não');
INSERT into PRODUTO values('pr00000002', 'Fone de ouvido AKG K72',          'AKG',          280.00,     15, 'ct03', '90798145000172', '30261178000157', 'Nome da marca: AKG, Modelo: K72, Ano do modelo: 2016, Número da peça: FBA_K72, Baterias inclusas: Não, Funciona com baterias: Não, Inclui bateria recarregável: Não, Inclui adaptador Ac: Não, Inclui controle remoto: Não');
INSERT into PRODUTO values('pr00000003', 'Notebook Dell Inspiron Ultrafino','DELL',         5609.00,    30, 'ct02', '72667288000163', '72667288000163', 'Nome da marca: DELL, Cor: Cinza Marine, Marca do processador: Intel, Tipo de processador: Intel Core i7, Velocidade do processador: 4 GHz, Tamanho da memória: 16 GB, Tipo de Memória: DDR DRAM, Tamanho do HD: 1 TB, Interface do HD: Solid State, Plataforma de hardware: PC, Sistema operacional: Windows 10', 'of10'); -- Produto com 30% de desconto (Oferta)
INSERT into PRODUTO values('pr00000004', 'Notebook Gamer ACER',             'ACER',         6999.00,    40, 'ct02', '63557512000135', '63557512000135', 'Nome da marca: ACER, Série: Predator Helios 300, Cor: Preto/Vermelho,  ltura do produto: 32 centímetros, Largura do produto: 7 centímetros, Marca do processador: Intel, Velocidade do processador: 2.8, Número de processadores: 4, Tecnologia da memória: DDR4, Máximo de memória compatível: 2000, Tecnologia do HD: SATA, Número de portas USB 2.0: 2, Número de portas USB 3.0: 1, Dispositivo de armazenamento óptico: Não possui, Sistema operacional: Windows 10');
INSERT into PRODUTO values('pr00000005', 'iPad Mini 4',                     'APPLE',        2999.00,    35, 'ct11', '26267787000146', '63557512000135', 'Sistema operacional: IOS,Peso do produto: 331 g, Dimensões do produto: 13,5 x 0,6 x 20,3 cm, Modelo: iPad mini 4, Cor: Cinza espacial');
INSERT into PRODUTO values('pr00000006', 'Monitor Philips 27" Widescreen',  'PHILLIPS',     1986.00,    15, 'ct12', '63557512000135', '63557512000135', 'Nome da marca: Philips, Modelo: 278E8QJAW/00, Registro no Inmetro: RoHS, CE Mark, FCC Class B, CUEAC, TUV/ISO9241-307, VCCI, RCM, BSMI,\ncETLus, CEL, WEEE, CECP, TUV Ergo, TUV/GS, Ano do modelo: 2016, Número da peça: 278E8QJAW/00, Tempo de resposta: 4 Milisegundos, Número de unidades: 10, Tamanho da tela: 68.6 centímetros, Diagonal da tela: 16:9, Resolução horizontal: 597.9 milímetros, Potência em watts: 31.8 watts, Baterias inclusas: Não, Funciona com baterias: Não, Ângulo real de visão: 178 graus', 'of06'); -- Produto com 10% de desconto e frete gratis (Oferta)
INSERT into PRODUTO values('pr00000007', 'Monitor Profissional AOC',        'AOC',          742.00,     50, 'ct12', '63557512000135', '63557512000135', 'Nome da marca: AOC, Cor: Preta, Altura do produto: 37.4 centímetros, Largura do produto: 50.3 centímetros, Tamanho da tela: 21.5 polegadas, Resolução máxima da tela: 1920 x 1080; 60 Hz, Voltagem: 220 volts, Tensão da bateria ou pilha de lítio: 1 volts');
INSERT into PRODUTO values('pr00000008', 'Samsung Galaxy S8',               'SAMSUNG',      3499.00,    100,'ct01', '26267787000146', '61822472000114', 'Sistema operacional: Android 7.0, Registro no Inmetro: 000000/2018, Peso do produto: 154 g, Dimensões do produto: 6,8 x 1 x 14,9 cm, Baterias ou pilhas: 1 Lithium ion baterias ou pilhas necessárias (inclusas), Modelo: SM-G950F, Tecnologia de conexão: Sim, Descrição da câmera	12.0, Peso do produto: 154 g, Cor: Preto, Componentes inclusos: Aparelho, Carregador, Cabos de Dados, Fone de ouvido, extrator de SIM, Adaptador Micro USB para Tipo C', 'of07'); -- Produto com 10% de desconto (Oferta)
INSERT into PRODUTO values('pr00000009', 'Motorola G6 Play',                'MOTOROLA',     1199.00,    70, 'ct01', '26267787000146', '61822472000114', 'Sistema operacional: Android 8.0, Registro no Inmetro: 000000/2018, Peso do produto: 172 g, Dimensões do produto: 7,2 x 1 x 15,4 cm, Baterias ou pilhas: 1 Lithium ion baterias ou pilhas necessárias (inclusas), Modelo: PA9Y0001BR, Tecnologia de conexão: Não, Características especiais: Acompanha Capa Protetora, Resolução de Tela: 1440x720, Resolução: HD+ - 1440 x 720, Descrição da câmera: 13.0, Peso do produto: 172 g, Cor: Índigo, Componentes inclusos: Aparelo, capa protetora, kit de manuais, cabo de sincronização, fone de ouvido estereo, carregador de parede turbopwer 15W, ferramenta de remoção do SIM');
INSERT into PRODUTO values('pr00000010', 'Apple X',                         'APPLE',        8999.00,    100,'ct01', '26267787000146', '61822472000114', 'Nome da marca: Apple, Número da peça: MQAF2BZ/A, Capacidade de armazenamento da memória: 256 GB, Baterias inclusas: Não, Funciona com baterias: Não');
INSERT into PRODUTO values('pr00000011', 'Maquina de Lavar Brastemp',       'BRASTEMP',     2729.00,    90, 'ct04', '67457503000161', '67457503000161', 'Nome da marca: Brastemp, Peso do produto:45,4 g, Dimensões do produto: 10 x 10 x 10 cm, Número da peça: BWN15AK, Voltagem: 110 volts, Peso: 45.4 g', 'of04'); -- Produto com 15% de desconto e frete gratis (Oferta)
INSERT into PRODUTO values('pr00000012', 'Maquina de Lavar Brastemp',       'BRASTEMP',     2089.00,    80, 'ct04', '67457503000161', '67457503000161', 'Nome da marca: Brastemp, Número da peça: BWT12AB, Peso do produto: 39 Kg');
INSERT into PRODUTO values('pr00000013', 'Refrigerador Cycle Defrost 462L', 'ELECTROLUX',   2549.00,    75, 'ct05', '26584520000182', '46515936000156', 'Nome da marca: Electrolux, Baterias inclusas? Não, A bateria ou a pilha? Não');
INSERT into PRODUTO values('pr00000014', 'Geladeira Cycle Defrost Duplex',  'CONSUL',       2889.00,    84, 'ct05', '63557512000135', '63557512000135', 'Nome da marca: Consul, Peso do produto: 72 Kg, Dimensões do produto: 10 x 10 x 10 cm, Número da peça: 1218, Voltagem: 220 volts', 'of05'); -- Produto com 20% de desconto
INSERT into PRODUTO values('pr00000015', 'Fogao Brastemp',                  'BRASTEMP',     1549.00,    84, 'ct06', '67457503000161', '67457503000161', 'Nome da marca: Brastemp, Peso do produto: 59 g, Dimensões do produto: 10 x 10 x 10 cm, Número da peça: 2004494');
INSERT into PRODUTO values('pr00000016', 'Fogao Brastemp',                  'BRASTEMP',     1579.00,    80, 'ct06', '67457503000161', '67457503000161', 'Nome da marca: Brastemp, Peso do produto: 31,8 g, Dimensões do produto: 10 x 10 x 10 cm, Número da peça: 1055', 'of08'); -- Produto com 15% de desconto (Oferta)
INSERT into PRODUTO values('pr00000017', 'Microondas Philco',               'PHILCO',       880.00,     17, 'ct07', '46515978000156', '46515936000156', 'Nome da marca: Philco, Número da peça: 7891356058646, Peso do produto: 15 Kg', 'of09'); -- Produto com 10% de desconto e frete gratis (Oferta)
INSERT into PRODUTO values('pr00000018', 'Microondas Philco',               'PHILCO',       469.00,     20, 'ct07', '46515978000156', '46515936000156', 'Nome da marca: PHILCO, Número da peça: 7899466406128, Voltagem: 220 volts, Baterias inclusas: Não, Funciona com baterias: Não');
INSERT into PRODUTO values('pr00000019', 'Cooktop 4 Bocas Brastemp Ative!', 'BRASTEMP',     777.00,     29, 'ct08', '67457503000161', '67457503000161', 'Nome da marca: BRASTEMP, Número da peça: 4452', 'of03'); -- Produto com 25% de desconto (Oferta)
INSERT into PRODUTO values('pr00000020', 'Cooktop 4 Bocas Tramontina',      'TRAMONTINA',   1499.00,    30, 'ct08', '46515978000156', '61822472000114', 'Nome da marca: Tramontina, Informações do modelo: 94707201, Peso do produto: 15 Kg, Dimensões do produto: 75 x 55 x 12 cm, Número da peça: 94707201');
INSERT into PRODUTO values('pr00000021', 'Lava Louças 14 Serviços',         'BRASTEMP',     3199.00,    25, 'ct09', '67457503000161', '67457503000161', 'Nome da marca: Brastemp, Peso do produto: 45,4 g, Dimensões do produto: 10 x 10 x 10 cm, Número da peça: 2004064, Voltagem: 110 volts, Peso: 45.4 g');
INSERT into PRODUTO values('pr00000022', 'Lava Louças 10 Serviços Slim Branca','BRASTEMP',  2449.00,    40, 'ct09', '67457503000161', '67457503000161', 'Nome da marca: Brastemp, Peso do produto: 45,4 g, Dimensões do produto: 10 x 10 x 10 cm, Número da peça: 1168, Voltagem: 220 volts, Peso: 45.4 g', 'of02'); -- Produto com 5% de desconto e frete gratis (oferta)
INSERT into PRODUTO values('pr00000023', 'Como as democracias morrem',      'ZAHAR',        42.00,      20, 'ct10', '63557512000135', '63557512000135', 'Capa comum: 272 páginas, Editora: Zahar; Edição: 1ª, Idioma: Português, ISBN-10: 9788537818008, ISBN-13: 978-8537818008, ASIN: 8537818003, Dimensões do produto: 22,9 x 16 x 1,8 cm', 'of01'); -- Produto com desconto de 15% e frete gratis (oferta)
INSERT into PRODUTO values('pr00000024', 'Choque de Cultura: 79 filmes pra assistir enquanto dirige','GALERA', 32.00, 19, 'ct10', '63557512000135', '63557512000135', 'Capa comum: 240 páginas, Editora: Galera, Idioma: Português, ISBN-10: 8501115932, ISBN-13: 978-8501115935, Dimensões do produto: 22,8 x 15,4 x 2 cm');
