-- TRIGGERS

-- Uma avaliação só pode ser inserida se o cliente comprou o produto ao qual a avaliação se refere. 
-- Desse modo, sempre que é feita uma inserção na tabela AVALIACAO é verificado se o cliente tem um pedido com este produto. Caso não
-- tenha, a tupla inserida é removida.
CREATE OR REPLACE FUNCTION verificaAvaliacao()
RETURNS TRIGGER AS $$
BEGIN
	IF(NEW.codProduto NOT IN(SELECT DISTINCT codProduto
				 FROM produto JOIN compra USING(codProduto) JOIN pedido USING(numeroPedido)
	                         WHERE cpf = NEW.cpf))
	THEN
		DELETE FROM avaliacao
		WHERE idAvaliacao = NEW.idAvaliacao;
		RETURN NEW;
	END IF;

	RETURN NULL;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER insereAvaliacao 
AFTER INSERT ON avaliacao
FOR EACH ROW 
EXECUTE PROCEDURE verificaAvaliacao();

-- TESTE
-- insert into avaliacao
-- values('a013', '2000-05-05', 3, 't',  '01262510965', 'pr00000001');

-- select *
-- from avaliacao




-- Uma compra não pode ser realizada se não houver em estoque a quantidade de unidades de um produtos que o cliente deseja comprar.
-- Assim, quando uma compra é inserida, verifica-se se existe em estoque a quantidade requerida por ele. Caso não, a compra é removida.
-- Ainda, deseja-se manter o estoque atualizado. Portanto, caso a compra seja válida, é reduzido do estoque o número de únidades compradas.   
CREATE OR REPLACE FUNCTION verificaEstoque()
RETURNS TRIGGER AS $$
BEGIN
	IF(NEW.quantidade > (SELECT estoque 
			     FROM produto
		             WHERE codProduto = NEW.codProduto)) 
	THEN
		DELETE FROM compra 
		WHERE codProduto = NEW.codProduto AND numeroPedido = NEW.numeroPedido;
		RETURN NEW;

	ELSE
		UPDATE produto
		SET estoque = estoque - NEW.quantidade
		WHERE codProduto = NEW.codProduto;
		RETURN NEW;
	END IF;

	RETURN NULL;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER insereCompra 
AFTER INSERT ON compra
FOR EACH ROW 
EXECUTE PROCEDURE verificaEstoque();


-- TESTE
-- Compra não adicionada
-- INSERT into COMPRA values('pr00000001', 'pd10000000', 40, 290, 'n100000000');

-- Compra adicionada e estoque reduzido
-- INSERT into COMPRA values('pr00000001', 'pd10000000', 2, 290, 'n100000000');
