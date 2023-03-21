/*
Exercicio 03 - SELECT ATÉ DUAS TABELAS

Nome: Pedro Henrique Braga Araújo

*/

--1--
SELECT cliente
FROM cliente
WHERE cliente LIKE 'J%'; 

--2--
SELECT pais,
       cliente
FROM cliente
WHERE pais = 'Mexico' OR pais = 'France'
ORDER BY pais,cliente 

--3--
SELECT codpedido,
        codcliente,
		dt_pedido,
		vlrtotal_pedido
FROM pedido 
WHERE vlrtotal_pedido = NULL

--4--
SELECT AVG(vlrtotal_pedido) AS Média
FROM pedido
WHERE dt_pedido > CONVERT(DATETIME, '1997-12-31 23:59:59', 102);

--5--
SELECT MIN(codpedido) AS 'Pedido Menor'
FROM pedido

--6--
SELECT codpedido,
       preco_unit,
	   codproduto,
	   qtde
FROM pedido_detalhe
WHERE (qtde BETWEEN 100 AND 101)
ORDER BY codproduto 

--7--
SELECT COUNT(*) AS 'Qtde_de_Produtos' 
FROM produto
WHERE codcategoria = 3 OR codcategoria = 5  

--8--
SELECT cliente,
       cidade
FROM cliente
WHERE cliente LIKE 'Mar%s' OR cidade = 'London'

--9--
SELECT codcliente,
	   codpedido,
	   vlrtotal_pedido
FROM pedido
WHERE dt_pedido > CONVERT(DATETIME,'1998-03-31 23:59:59',102) 
AND (vlrtotal_pedido < 7.30 or vlrtotal_pedido > 800)

--10--
SELECT codpedido, COUNT(*) AS 'Repetidos'
FROM pedido_detalhe
GROUP BY codpedido
HAVING COUNT(*) > 1

--11--
SELECT C.cliente AS 'Cliente',
	   C.tel AS 'Telefone',
	   P.dt_pedido AS 'Data do Pedido',
	   P.vlrtotal_pedido AS 'Valor Total'
FROM cliente C  INNER JOIN pedido P 
ON P.codcliente = C.codcliente 
WHERE P.vlrtotal_pedido > 800 
OR 
P.dt_pedido = CONVERT(DATETIME,'1996-04-01 23:59:59', 102)

--12--
SELECT  C.categoria,
        COUNT(P.preco_unit) AS 'Total de produtos'
FROM produto P INNER JOIN categoria C 
ON P.codcategoria = C.codcategoria 
WHERE P.preco_unit < 100
GROUP BY c.categoria

--13--
SELECT C.cliente,
       SUM(P.vlrtotal_pedido) AS 'Total'
FROM pedido P INNER JOIN cliente C 
ON C.codcliente = P.codcliente  
WHERE YEAR(dt_pedido) = 1998 AND C.regiao = 'SP'
GROUP BY C.cliente

--14--
SELECT p.produto AS 'Produto',
	   AVG(pd.qtde) AS 'Qtde Media Vendida'
FROM pedido_detalhe pd INNER JOIN produto p INNER JOIN  categoria c 
ON p.codcategoria = c.codcategoria 
ON p.codproduto = pd.codproduto
WHERE p.preco_unit = 120 OR c.codcategoria = 5                                                           
GROUP BY p.produto
ORDER BY p.produto

--15--
SELECT C.codcliente AS 'Cod Cliente',
       P.codproduto AS 'Cod Produto',
	   CONVERT(smallmoney,(SUM(pd.preco_unit * pd.qtde - pd.desconto))) AS 'Total'  
FROM produto P INNER JOIN pedido_detalhe PD INNER JOIN pedido PE INNER JOIN cliente C 
ON C.codcliente = PE.codcliente on PE.codpedido = PD.codpedido 
ON P.codproduto = PD.codproduto
WHERE qtde<=3 AND dt_pedido BETWEEN CONVERT(DATE,'1997-12-15',102) 
AND CONVERT(DATE,'1997-12-31',102) 
GROUP BY c.codcliente,p.codproduto
ORDER BY p.codproduto

--16--
SELECT C.pais AS 'país',
       C.cliente AS 'Cliente',
	   COUNT(P.codpedido) AS 'Qtde de Pedidos'
FROM pedido P INNER JOIN cliente C
ON P.codcliente = C.codcliente
WHERE C.pais IN('Brasil','France') OR C.regiao IS NOT NULL
GROUP BY C.pais, C.cliente,C.regiao 







