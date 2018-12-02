-- Selecionar o nome de parceiros que venderam mais de X produtos distintos
SELECT nomeParceiro
FROM parceiro JOIN produto ON(cnpj, cnpjVendedor) NATURAL JOIN compra
GROUP BY nomeParceiro
HAVING COUNT(DISTINCT codProduto) > X;

-- Selecionar o nome das categorias que tem todas as propriedades (e talvez outas) que a categoria Fones de Ouvido (idCategoria = 'ct03')
SELECT DISTINCT nomeCategoria
FROM categoria C
WHERE idCategoria != 'ct03' AND NOT EXISTS (SELECT *
							                FROM caracterizacao
											WHERE idCategoria = 'ct03' AND idPropriedade NOT IN(SELECT DISTINCT idPropriedade
											    												FROM caracterizacao
																								WHERE idCategoria = C.idCategoria)); 

-- Selecionar o nome dos clientes que compraram produtos com preço maior que X

-- O nome dos parceiros que já venderam e entregaram produtos
SELECT DISTINCT nomeParceiro
FROM parceiro JOIN produto ON(cnpj, cnpjVendedor) NATURAL JOIN compra
WHERE cnpj IN(SELECT DISTINCT cnpj
			  FROM parceiro JOIN produto ON(cnpj, cnpjEntregador) NATURAL JOIN compra);
			  
-- O nome dos vendedores de produtos da categoria x mais bem avaliados
SELECT nomeParceiro
FROM  parceiro JOIN produto ON(cnpj, cnpjVendedor) NATURAL JOIN avaliacao
WHERE idCategoria = x AND nota = (SELECT MAX(nota)
								  FROM produto NATURAL JOIN avaliacao
								  WHERE idCategoria = x);
								  
-- O e-mail dos clientes que compraram produtos da marca X mais caros do que a média das compras de produtos desta marca
SELECT DISTINCT email
FROM cliente NATURAL JOIN pedido NATURAL JOIN compra NATURAL JOIN produto
WHERE marca = x AND preco >= (SELECT AVG(preco)
							  FROM compra NATURAL JOIN produto
							  WHERE marca = x);
							  
							  