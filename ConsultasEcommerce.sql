-- Selecionar o nome de parceiros que venderam mais de X produtos distintos
SELECT nomeParceiro
FROM PARCEIRO JOIN PRODUTO ON(cnpj = cnpjVendedor) NATURAL JOIN COMPRA
GROUP BY nomeParceiro
HAVING COUNT(DISTINCT codProduto) > X;

---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Selecionar o nome das categorias que tem todas as propriedades (e talvez outas) que a categoria Fones de Ouvido (idCategoria = 'ct03')
SELECT DISTINCT nomeCategoria
FROM CATEGORIA C
WHERE idCategoria != 'ct03' AND NOT EXISTS (SELECT *
							                FROM caracterizacao
											WHERE idCategoria = 'ct03' AND idPropriedade NOT IN(SELECT DISTINCT idPropriedade
											    												FROM caracterizacao
																								WHERE idCategoria = C.idCategoria)); 
																								
-- Selecionar o nome dos produtos cuja categoria tem todas as propriedades (e talvez outas) que a categoria Fones de Ouvido (idCategoria = 'ct03')
SELECT DISTINCT nomeProduto
FROM produto P
WHERE idCategoria != 'ct03' AND NOT EXISTS (SELECT *
							                FROM caracterizacao
											WHERE idCategoria = 'ct03' AND idPropriedade NOT IN(SELECT DISTINCT idPropriedade
											    												FROM caracterizacao
																								WHERE idCategoria = P.idCategoria)); 

---------------------------------------------------------------------------------------------------------------------------------------------------------------
																								
-- Selecionar o nome dos clientes que compraram produtos com preço maior que X

-- O nome dos parceiros que já venderam e entregaram produtos
SELECT DISTINCT nomeParceiro
FROM PARCEIRO JOIN PRODUTO ON(cnpj = cnpjVendedor) NATURAL JOIN COMPRA
WHERE cnpj IN(SELECT DISTINCT cnpj
			  FROM PARCEIRO JOIN PRODUTO ON(cnpj = cnpjEntregador) NATURAL JOIN COMPRA);
			  
-- O nome dos vendedores de produtos da categoria x mais bem avaliados
SELECT nomeParceiro
FROM  parceiro JOIN produto ON(cnpj = cnpjVendedor) NATURAL JOIN avaliacao
WHERE idCategoria = x AND nota = (SELECT MAX(nota)
								  FROM produto NATURAL JOIN avaliacao
								  WHERE idCategoria = x);
								  
-- O e-mail dos clientes que compraram produtos da marca X mais caros do que a média das compras de produtos desta marca
SELECT DISTINCT email
FROM cliente NATURAL JOIN pedido NATURAL JOIN compra NATURAL JOIN produto
WHERE marca = x AND preco >= (SELECT AVG(preco)
							  FROM compra NATURAL JOIN produto
							  WHERE marca = x);
							  

-- Os produtos com média de avaliacao >= X1 da marca X2
SELECT DISTINCT codProduto, nomeProduto
FROM PRODUTO JOIN AVALIACAO USING (codProduto)
WHERE marca=X2
GROUP BY codProduto, nomeProduto
HAVING AVG(nota) >= X1;

-- Cliente que efetuou a maior quantidade de compras de produtos da marca X
SELECT DISTINCT cpf, nomeCliente
FROM CLIENTE 
WHERE cpf C IN (SELECT DISTINCT cpf
				FROM PEDIDO JOIN COMPRA USING(numeroPedido)
				WHERE codProduto IN (SELECT DISTINCT codProduto
									 FROM PRODUTO
									 WHERE marca = X)
				)


-- os vendedores que venderam todas as marcas que o vendedor X vendeu


-- Selecionar os produtos que apresentem uma oferta com desconto maior ou igual que 5% e um cupom de desconto com desconto maior ou igual que 5%
SELECT DISTINCT codProduto, nomeProduto
FROM produto NATURAL JOIN oferta
WHERE desconto >= 5 AND codProduto IN(SELECT DISTINCT codProduto
									  FROM produto NATURAL JOIN cupom_de_desconto
									  WHERE desconto >= 5);


-- Os produtos com maiores cupons de descontos que estão no carrinho do usuario Y
SELECT nomeProduto
FROM produto

----------- GATILHOS
CREATE TRIGGER verificaEstoque
AFTER INSERT ON compra
REFERENCING NEW ROW AS nc
FOR EACH ROW
WHEN nc.quantidade > (SELECT quantidade 
					  FROM produto
					  WHERE codProduto = nc.codProduto)
DELETE FROM compra WHERE codProduto = nc.codProduto AND numeroPedido = nc.numeroPedido

CREATE TRIGGER verificaPedido
AFTER INSERT ON avaliacao
REFERENCING NEW ROW AS na
FOR EACH ROW
WHEN na.codProduto NOT IN(SELECT DISTINCT codProduto
						  FROM produto JOIN compra USING(codProduto) JOIN pedido USING(numeroPedido)
						  WHERE cpf = na.cpf)

WHEN na.codProduto, na.cpf NOT IN (SELECT DISTINCT codProduto, cpf
						   FROM produto JOIN compra USING(codProduto) JOIN pedido USING(numeroPedido));


