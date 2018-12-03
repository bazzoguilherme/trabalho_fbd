drop table if  exists AVALIACAO;
drop table if  exists COMPRA;
drop table if  exists PEDIDO;
drop table if  exists SELECAO;
drop table if  exists PRODUTO;
drop table if  exists PARCEIRO;
drop table if  exists OFERTA;
drop table if  exists CUPOM_DE_DESCONTO;
drop table if  exists CARACTERIZACAO;
drop table if  exists VALORACAO;
drop table if  exists VALOR;
drop table if  exists CATEGORIA;
drop table if  exists PROPRIEDADE;
drop table if  exists FORMA_DE_PAGAMENTO;
drop table if  exists LOCAIS;
drop table if  exists ENDERECO;
drop table if  exists CLIENTE;

create table CLIENTE(
    cpf         char(11) not null,
    nomeCliente varchar(60) not null,
    email       varchar(50) not null,
    senha       varchar(30) not null,
    idCarrinho  char(4) not null, -- Fusão de tableas CLIENTE e CARRINHO
    unique(email),
    unique(idCarrinho),
    primary key(cpf)
);

create table ENDERECO(
    idEndereco  char(4) not null,
    endereco    varchar(100) not null,
    primary key(idEndereco)
);

-- Relacao de cliente e seus enderecos (1,n)
create table LOCAIS( 
    cpf         char(11) not null,
    idEndereco  char(4) not null,
    foreign key (cpf) references CLIENTE
        on delete cascade
        on update restrict,
    foreign key (idEndereco) references ENDERECO
        on delete cascade
        on update cascade,
    primary key (cpf,idEndereco)
);

create table FORMA_DE_PAGAMENTO(
    idPagamento     char(4) not null,
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
    idPropriedade   char(4) not null,
    nomePropriedade varchar(30) not null,
    unique(nomePropriedade), 
    primary key (idPropriedade)
);

create table VALOR(
    idValor     char(4) not null,
    valor       varchar(30) not null, 
    primary key (idValor)
);

-- Relacao entre propriedade e valor (1,n)
create table VALORACAO(
    idPropriedade   char(4) not null,
    idValor         char(4) not null,
    foreign key (idPropriedade) references PROPRIEDADE
        on delete cascade
        on update restrict,
    foreign key (idValor) references VALOR
        on delete cascade
        on update cascade,
    primary key (idPropriedade, idValor)
);

create table CARACTERIZACAO(
    idCategoria     char(4) not null,
    idPropriedade   char(4) not null,
    foreign key (idCategoria) references CATEGORIA
        on delete cascade
        on update restrict,
    foreign key (idPropriedade) references PROPRIEDADE
        on delete cascade
        on update restrict,
    primary key (idCategoria, idPropriedade)
);

create table CUPOM_DE_DESCONTO(
    codigo      char(4) not null,
    validade    date not null,
    desconto    numeric not null,
    idCategoria char(4) not null,
    foreign key (idCategoria) references CATEGORIA
        on delete cascade
        on update cascade,
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
        on delete set default
        on update restrict,
    foreign key (idOferta) references OFERTA
        on delete set null
        on update cascade,
    foreign key (cnpjVendedor) references PARCEIRO
        on delete cascade
        on update restrict,
    foreign key (cnpjEntregador) references PARCEIRO
        on delete cascade
        on update restrict,
    primary key(codProduto)
);

create table SELECAO(
    codProduto   char(10) not null,
    idCarrinho  char(4) not null,
    quantidade  numeric not null,
    foreign key (codProduto) references PRODUTO
        on delete cascade
        on update restrict,
    foreign key (idCarrinho) references CLIENTE(idCarrinho)
        on delete cascade
        on update restrict,
    primary key (codProduto, idCarrinho)
);

create table AVALIACAO(
    idAvaliacao char(4) not null,
    data        date not null,
    nota        numeric not null,
    comentario  varchar(200),
    cpf         char(11) not null,
    codProduto   char(10) not null,
    foreign key (cpf) references CLIENTE
        on delete set null
        on update restrict,
    foreign key (codProduto) references PRODUTO
        on delete cascade
        on update restrict,
    primary key(idAvaliacao)
);

create table PEDIDO(
    numeroPedido    char(10) not null,
    data            date not null,
    cpf             char(11) not null,
    idPagamento     char(4) not null,
    foreign key (cpf) references CLIENTE
        on delete set null
        on update restrict,
    foreign key (idPagamento) references FORMA_DE_PAGAMENTO
        on delete restrict
        on update restrict,
    primary key(numeroPedido)
);

create table COMPRA(
    codProduto          char(10) not null,
    numeroPedido        char(10) not null,
    quantidade          numeric not null,
    valor               numeric not null,
    numeroNotaFiscal    char(10) not null, -- Fusão de tableas COMPRA e NOTA_FISCAL
    foreign key (codProduto) references PRODUTO
        on delete restrict
        on update restrict,
    foreign key (numeroPedido) references PEDIDO
        on delete restrict
        on update restrict,
    unique(numeroNotaFiscal),
    primary key (codProduto, numeroPedido)
);


GRANT SELECT ON ALL TABLES IN SCHEMA public TO trabalhofbd;
GRANT INSERT ON ALL TABLES IN SCHEMA public TO trabalhofbd;
GRANT UPDATE ON ALL TABLES IN SCHEMA public TO trabalhofbd;
GRANT DELETE ON ALL TABLES IN SCHEMA public TO trabalhofbd;