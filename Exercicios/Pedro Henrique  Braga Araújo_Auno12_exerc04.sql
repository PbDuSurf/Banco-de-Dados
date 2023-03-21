
	--PEDRO HENRIQUE BRAGA ARAÚJO--

--1--
select c.cliente,
       c.pais,
  sum(vlrtotal_pedido) as Total
from cliente c inner join pedido pd
on c.codcliente = pd.codcliente
where c.pais = 'Germany'
group by c.cliente,c.pais
having sum(vlrtotal_pedido) > 1100

--2--
select c.categoria,
       p.produto,
  avg(pd.preco_unit*pd.qtde-pd.desconto) as Media
from categoria c inner join produto p
on c.codcategoria = p.codcategoria
inner join pedido_detalhe pd
on p.codproduto = pd.codproduto
inner join pedido pe
on pd.codpedido = pe.codpedido
where year(pe.dt_pedido) = '1997'
group by c.categoria, p.produto
having avg(pd.preco_unit*pd.qtde-pd.desconto) > 1000
order by Media

--3--
select cl.pais,
       c.categoria,
	    sum (pd.preco_unit*pd.qtde) as total_gasto
from categoria c inner join produto p
on c.codcategoria = p.codcategoria
inner join pedido_detalhe pd
on p.codproduto = pd.codproduto
inner join pedido pe
on pd.codpedido = pe.codpedido
inner join cliente cl
on pe.codcliente = cl.codcliente
where pe.dt_pedido between convert(datetime, '01/03/1997', 103) 
and convert(datetime, '31/03/1997', 103)
group by cl.pais, c.categoria
having  sum (pd.preco_unit*pd.qtde)<100 
order by pais