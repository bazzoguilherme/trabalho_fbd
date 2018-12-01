create table PRODUTO(
    idProduto   numeric not null,
    nomeProduto varchar(60) not null,
    marca       varchar(30) not null,
    preco       numeric not null,
    estoque     numeric not null,
    fichaTecnica varchar(100) not null,
    idCategoria numeric not null,
    idOferta    numeric,
    cnpj        char(14) not null,
    foreign key (idCategoria) references CATEGORIA,
    foreign key (idOferta) references OFERTA,
    foreign key (cnpj) references PARCEIRO,
    primary key(idProduto)
);

create table CLIENTE(
    cpf         char(11) not null,
    nomeCliente varchar(60) not null,
    email       varchar(30) not null,
    senha       varchar(30) not null,
    idCarrinho  numeric not null, -- Fusão de tableas CLIENTE e CARRINHO
    unique(email),
    primary key(cpf)
);

create table ENDERECO(
    idEndereco  numeric not null
    endereco    varchar(100) not null;
    primary key(endereco)
);

-- Relacao de cliente e seus enderecos (1,n)
create table LOCAIS( 
    cpf         char(11) not null,
    idEndereco  numeric not null,
    foreign key (cpf) references CLIENTE,
    foreign key (idEndereco) references ENDERECO,
    primary key (cpf,idEndereco)
);

create table SELECAO(
    idProduto   numeric not null,
    idCarrinho  numeric not null,
    quantidade  numeric not null,
    foreign key (idProduto) references PRODUTO,
    foreign key (idCarrinho) references CLEINTE(idCarrinho),
    primary key (idProduto, idCarrinho)
);

create table AVALIACAO(
    idAvaliacao numeric not null,
    data        date not null,
    nota        numeric not null,
    comentario  varchar(100),
    cpf         numeric not null,
    idProduto   numeric not null,
    foreign key (cpf) references CLIENTE,
    foreign key (idProduto) references PRODUTO,
    primary key(idAvaliacao)
);

create table PEDIDO(
    numeroPedido    numeric not null,
    total           numeric not null,
    data            date not null,
    cpf             numeric not null,
    idPagamento   numeric not null,
    foreign key (cpf) references CLIENTE,
    foreign key (idPagamento) references FORMA_DE_PAGAMENTO,
    primary key(numeroPedido)
);

create table COMPRA(
    idProduto       numeric not null,
    numeroPedido    numeric not null,
    quantidade      numeric not null,
    foreign key (idProduto) references PRODUTO,
    foreign key (numeroP) references PEDIDO,
    primary key (idProduto, numeroPedido)
);

create table FORMA_DE_PAGAMENTO(
    idPagamento     numeric not null
    tipo            varchar(20) not null,
    desconto        numeric not null,
    parcelaMinima  numeric not null,
    unique (tipo), -----
    primary key (idPagamento) 
);

create table NOTA_FISCAL(
    numeroNota    numeric not null,
    numeroPedido  numeric not null,
    foreign key(numeroPedido) references PEDIDO,
    primary key(numeroNota)
);

create table CATEGORIA(
    idCategoria     numeric not null,
    nomeCategoria   varchar(20) not null,
    unique(nomeCategoria), --
    primary key(idCategoria)
);

create table PROPRIEDADE(
    idPropriedade   numeric not null
    nomePropriedade varchar(60) not null,
    unique(nomePropriedade), --
    primary key (idPropriedade)
);

create table VALOR(){
    idValor     numeric not null
    valor       varchar(30) not null,
    primary key (idValor)
}

-- Relacao entre propriedade e valor (1,n)
create table VALORACAO(){
    idPropriedade   numeric not null,
    idVAlor         numeric not null,
    foreign key (idPropriedade) references PROPRIEDADE,
    foreign key (idVAlor) references VALOR,
    primary key (idPropriedade, idValor)
}

create table CARACTERIZACAO(
    idCategoria     numeric not null,
    idPropriedade   numeric not null,
    foreign key (idCategoria) references CATEGORIA,
    foreign key (idPropriedade) references PROPRIEDADE,
    primary key (idCategoria, idPropriedade)
);

create table CUPOM_DE_DESCONTO(
    codigo      numeric not null,
    validade    date not null,
    desconto    numeric not null,
    idCategoria numeric not null,
    foreign key (idCategoria) references CATEGORIA,
    primary key (codigo)
);

create table OFERTA(
    idOferta    numeric not null,
    desconto    numeric not null,
    frete_gratis boolean not null,
    primary key(idOferta)
);

create table PARCEIRO(
    cnpj        char(14) not null,
    politica    varchar(100) not null,
    endereco    varchar(160) not null,
    telefone    char(11) not null,
    papel       varchar(30) not null,
    primary key(cnpj)
);

create table VENDEDOR(
    cnpj        char(14) not null,
    foreign key (cnpj) references PARCEIRO
    primary key(cnpj),
);

create table ENTREGADOR(
    cnpj        char(14) not null,
    foreign key (cnpj) references PARCEIRO
    primary key(cnpj),
);
