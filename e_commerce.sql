create table PRODUTO(
    codProduto      char(10) not null,
    nomeProduto     varchar(60) not null,
    marca           varchar(30) not null,
    preco           numeric not null,
    estoque         numeric not null,
    idCategoria     char(4) not null default 'ct00',
    cnpjVendedor    char(14) not null,
    cnpjEntregador  char(14) not null,
    fichaTecnica    varchar(1000) not null,
    idOferta        char(4),
    foreign key (idCategoria) references CATEGORIA
        on delete set default,
    foreign key (idOferta) references OFERTA
        on delete set null,
    foreign key (cnpjVendedor) references PARCEIRO
        on delete cascade,
    foreign key (cnpjEntregador) references PARCEIRO
        on delete cascade,
    primary key(codProduto)
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
    foreign key (cpf) references CLIENTE
        on delete cascade,
    foreign key (idEndereco) references ENDERECO
        on delete cascade,
    primary key (cpf,idEndereco)
);

create table SELECAO(
    codProduto   char(10) not null,
    idCarrinho  char(4) not null,
    quantidade  numeric not null,
    foreign key (codProduto) references PRODUTO
        on delete cascade,
    foreign key (idCarrinho) references CLEINTE(idCarrinho)
        on delete cascade,
    primary key (codProduto, idCarrinho)
);

create table AVALIACAO(
    idAvaliacao char(4) not null,
    data        date not null,
    nota        numeric not null,
    comentario  varchar(100),
    cpf         char(11) not null,
    codProduto   char(10) not null,
    foreign key (cpf) references CLIENTE
        on delete set null,
    foreign key (codProduto) references PRODUTO,
    primary key(idAvaliacao)
);

create table PEDIDO(
    numeroPedido    char(10) not null,
    total           numeric not null,
    data            date not null,
    cpf             char(11) not null,
    idPagamento     char(4) not null,
    foreign key (cpf) references CLIENTE
        on delete set null,
    foreign key (idPagamento) references FORMA_DE_PAGAMENTO
        on delete restrict,
    primary key(numeroPedido)
);

create table COMPRA(
    codProduto       char(10) not null,
    numeroPedido    char(10) not null,
    quantidade      numeric not null,
    numeroNotaFiscal char(4) not null, -- Fusão de tableas COMPRA e NOTA_FISCAL
    foreign key (codProduto) references PRODUTO
        on delete restrict,
    foreign key (numeroP) references PEDIDO
        on delete restrict,
    primary key (codProduto, numeroPedido)
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
    nomeCategoria   varchar(30) not null,
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
    foreign key (idPropriedade) references PROPRIEDADE
        on delete cascade,
    foreign key (idValor) references VALOR
        on delete cascade,
    primary key (idPropriedade, idValor)
}

create table CARACTERIZACAO(
    idCategoria     char(4) not null,
    idPropriedade   char(4) not null,
    foreign key (idCategoria) references CATEGORIA
        on delete cascade,
    foreign key (idPropriedade) references PROPRIEDADE
        on delete cascade,
    primary key (idCategoria, idPropriedade)
);

create table CUPOM_DE_DESCONTO(
    codigo      char(4) not null,
    validade    date not null,
    desconto    numeric not null,
    idCategoria char(4) not null,
    foreign key (idCategoria) references CATEGORIA
        on delete cascade,
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

