-- Selecionar o nome de parceiros que venderam 3 ou mais produtos distintos.
-- Utilização: pode ser utilizado para verificar os parceiros que mais vendem produtos distintos (ou não distintos, retirando-se o "Distinct" da cláusula having).
SELECT nomeParceiro
FROM PARCEIRO JOIN PRODUTO ON(cnpj = cnpjVendedor) NATURAL JOIN COMPRA
GROUP BY nomeParceiro
HAVING COUNT(DISTINCT codProduto) >= 3;


-- Selecionar o nome dos produtos (e de sua categoria) cuja categoria tem todas as propriedades (e talvez outas) que a categoria Fones de Ouvido (idCategoria = 'ct03').													
-- Utilização: pode ser utilizado para verificar se um produto está na categoria certa ou se diferentes categorias não deveriam ser a mesma. 
SELECT DISTINCT nomeProduto, nomeCategoria
FROM produto P NATURAL JOIN categoria
WHERE idCategoria != 'ct03' AND NOT EXISTS (SELECT *
				            FROM caracterizacao
					    WHERE idCategoria = 'ct03' AND idPropriedade NOT IN(SELECT DISTINCT idPropriedade
											 FROM caracterizacao
									                 WHERE idCategoria = P.idCategoria)); 


-- O nome dos vendedores de produtos da categoria Livro (idCategoria = 'ct10') mais bem avaliados.
-- Utilização: analisar os vendedores de uma determinada categoria cujo produto tem mais qualidade.
SELECT nomeParceiro
FROM  parceiro JOIN produto ON(cnpj = cnpjVendedor) NATURAL JOIN avaliacao
WHERE idCategoria = 'ct10' AND nota = (SELECT MAX(nota)
				       FROM produto NATURAL JOIN avaliacao
				       WHERE idCategoria = 'ct10');


-- O e-mail dos clientes que compraram produtos da marca Brastemp mais caros do que a média das compras de produtos desta marca.
-- Utilização: uma marca lançou um novo produto, cujo preço é elevado, e deseja-se anunciar este produto para clientes da marca que, provavelmente,
-- têm condições financeiras de adquiri-lo.
SELECT DISTINCT email
FROM cliente NATURAL JOIN pedido NATURAL JOIN compra NATURAL JOIN produto
WHERE marca = 'BRASTEMP' AND preco >= (SELECT AVG(preco)
				       FROM compra NATURAL JOIN produto
		        	       WHERE marca = 'BRASTEMP');


-- Selecionar os produtos que apresentem uma oferta com desconto maior ou igual que 5% e um cupom de desconto com desconto maior ou igual que 5%
-- Utilização: pode ser um filtro realizado por um cliente que deseja ver produtos com descontos ou uma seleção realizada pelo e-commerce para realizar 
-- anúncios de produtos com descontos. 
SELECT DISTINCT codProduto, nomeProduto
FROM produto NATURAL JOIN oferta
WHERE desconto >= 5 AND codProduto IN(SELECT DISTINCT codProduto
				      FROM produto NATURAL JOIN cupom_de_desconto
        			      WHERE desconto >= 5);


-- Selecionar o nome da empresa, seu telefone e o produto vendido por ela para todo produto cuja seleção em carrinhos é maior que a quantidade 
-- deste produto em estoque.  
-- Utilização: informar às empresas quando um determinado produto vendido por ela tem mais procura (e possível compra) do que a quantidade deste
-- produto em estoque. 
SELECT distinct nomeParceiro, telefone, codProduto
FROM PARCEIRO JOIN PRODUTO ON(cnpj = cnpjVendedor)
WHERE codProduto IN (SELECT DISTINCT codProduto
			    FROM PRODUTO JOIN SELECAO USING(codProduto)
			    GROUP BY codProduto
			    HAVING SUM(quantidade) > estoque);