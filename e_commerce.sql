create table PRODUTO(
    idProduto       char(10) not null,
    nomeProduto     varchar(60) not null,
    marca           varchar(30) not null,
    preco           numeric not null,
    estoque         numeric not null,
    idCategoria     char(4) not null,
    cnpjVendedor    char(14) not null,
    cnpjEntregador  char(14) not null,
    fichaTecnica    varchar(1000) not null,
    idOferta        char(4),
    foreign key (idCategoria) references CATEGORIA,
    foreign key (idOferta) references OFERTA,
    foreign key (cnpjVendedor) references PARCEIRO,
    foreign key (cnpjEntregador) references PARCEIRO,
    primary key(idProduto)
);

create table CLIENTE(
    cpf         char(11) not null,
    nomeCliente varchar(60) not null,
    email       varchar(50) not null,
    senha       varchar(30) not null,
    idCarrinho  char(3) not null, -- Fusão de tableas CLIENTE e CARRINHO
    unique(email),
    unique(idCarrinho),
    primary key(cpf)
);

create table ENDERECO(
    idEndereco  char(4) not null
    endereco    varchar(100) not null;
    primary key(endereco)
);

-- Relacao de cliente e seus enderecos (1,n)
create table LOCAIS( 
    cpf         char(11) not null,
    idEndereco  char(4) not null,
    foreign key (cpf) references CLIENTE,
    foreign key (idEndereco) references ENDERECO,
    primary key (cpf,idEndereco)
);

create table SELECAO(
    idProduto   char(10) not null,
    idCarrinho  char(4) not null,
    quantidade  numeric not null,
    foreign key (idProduto) references PRODUTO,
    foreign key (idCarrinho) references CLEINTE(idCarrinho),
    primary key (idProduto, idCarrinho)
);

create table AVALIACAO(
    idAvaliacao char(4) not null,
    data        date not null,
    nota        numeric not null,
    comentario  varchar(100),
    cpf         char(11) not null,
    idProduto   char(10) not null,
    foreign key (cpf) references CLIENTE,
    foreign key (idProduto) references PRODUTO,
    primary key(idAvaliacao)
);

create table PEDIDO(
    numeroPedido    char(10) not null,
    total           numeric not null,
    data            date not null,
    cpf             char(11) not null,
    idPagamento     char(4) not null,
    foreign key (cpf) references CLIENTE,
    foreign key (idPagamento) references FORMA_DE_PAGAMENTO,
    primary key(numeroPedido)
);

create table COMPRA(
    idProduto       char(10) not null,
    numeroPedido    char(10) not null,
    quantidade      numeric not null,
    numeroNotaFiscal char(4) not null, -- Fusão de tableas COMPRA e NOTA_FISCAL
    foreign key (idProduto) references PRODUTO,
    foreign key (numeroP) references PEDIDO,
    primary key (idProduto, numeroPedido)
);

create table FORMA_DE_PAGAMENTO(
    idPagamento     char(4) not null
    tipo            varchar(20) not null,
    desconto        numeric not null,
    parcelaMinima  numeric not null,
    unique (tipo), 
    primary key (idPagamento) 
);

create table CATEGORIA(
    idCategoria     char(4) not null,
    nomeCategoria   varchar(20) not null,
    unique(nomeCategoria),
    primary key(idCategoria)
);

create table PROPRIEDADE(
    idPropriedade   char(4) not null
    nomePropriedade varchar(30) not null,
    unique(nomePropriedade), 
    primary key (idPropriedade)
);

create table VALOR(){
    idValor     char(4) not null
    valor       varchar(30) not null, 
    primary key (idValor)
}

-- Relacao entre propriedade e valor (1,n)
create table VALORACAO(){
    idPropriedade   char(4) not null,
    idValor         char(4) not null,
    foreign key (idPropriedade) references PROPRIEDADE,
    foreign key (idValor) references VALOR,
    primary key (idPropriedade, idValor)
}

create table CARACTERIZACAO(
    idCategoria     char(4) not null,
    idPropriedade   char(4) not null,
    foreign key (idCategoria) references CATEGORIA,
    foreign key (idPropriedade) references PROPRIEDADE,
    primary key (idCategoria, idPropriedade)
);

create table CUPOM_DE_DESCONTO(
    codigo      char(4) not null,
    validade    date not null,
    desconto    numeric not null,
    idCategoria char(4) not null,
    foreign key (idCategoria) references CATEGORIA,
    primary key (codigo)
);

create table OFERTA(
    idOferta    char(4) not null,
    desconto    numeric not null,
    frete_gratis boolean not null,
    primary key(idOferta)
);

create table PARCEIRO(
    cnpj        char(14) not null,
    nomeParceiro varchar(60) not null,
    papel       varchar(30) not null,   -- Fusão de tabelas para representar a especialização (VENDEDOR / EMTREGADOR)
    endereco    varchar(100) not null,
    telefone    char(10) not null,
    politica    varchar(1000) not null,
    primary key(cnpj)
);

