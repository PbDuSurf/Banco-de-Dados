--TRABALHO AUTOINSTRUCIONAL BANCO DE DADOS 1--

--Nomes: Pedro Braga e Pablo Lucas--


--1--
select sum(PIB) as Total_PIb
from PAIS 
where YEAR(DT_INDEP)>='1920' and RENDA_PERCAPTA <=1000 or CODGRUPO = 2

--2--
select min(pib) as Menor_PIB
from PAIS pa inner join CONTINENTE ct on pa.CODCONTINENTE = ct.CODCONTINENTE
where ct.CONTINENTE ='Asia' or CONTINENTE ='Africa' and pa.RENDA_PERCAPTA <=150

--3--
select PAIS,
        sum(PIB / QTDE_HAB) as 'PIBXQTDEHAB'
from PAIS
group by PAIS
order by PAIS

--4--
select PAIS,
sum(RENDA_PERCAPTA * QTDE_HAB) as 'PercXQtdeHab'
from PAIS
group by PAIS,RENDA_PERCAPTA
having sum(RENDA_PERCAPTA * QTDE_HAB)< 10000000
order by PercXQtdeHab desc

--5--
select pa.CODPAIS,
       pa.PAIS,
	   gr.GRUPO,
	   sum(PIB-QTDE_HAB)as'PIB_QTDEHAB' 
from PAIS pa inner join GRUPO gr on pa.CODGRUPO = gr.CODGRUPO
where GRUPO = 'mercosul' or grupo = 'outros'
group by pa.CODPAIS,pa.PAIS,gr.GRUPO	

--6--
select avg(QTDE_HAB) as Media_Habitantes
from PAIS
where DT_INDEP is null

--7--
select sum(PIB) as Soma_pib
from PAIS pa inner join GRUPO gr on pa.CODGRUPO = gr.CODGRUPO   
where YEAR(DT_INDEP) >='1950' and (RENDA_PERCAPTA <=1000 or gr.GRUPO = 'outros');

--8--
select pa.PAIS,
       pa.QTDE_HAB,
       pa.PIB
from PAIS pa inner join CONTINENTE ct on pa.CODCONTINENTE = ct.CODCONTINENTE
inner join GRUPO gr on gr.CODGRUPO = pa.CODGRUPO
where ct.CONTINENTE = 'oceania' or QTDE_HAB > 500 and GRUPO = 'alca'
group by pa.PAIS,pa.QTDE_HAB,pa.PIB
 
 --9--
 select pa.PAIS,
    ct.CONTINENTE,
    ps.VALORNEGOCIADO
from CONTINENTE ct inner join PAIS pa on ct.CODCONTINENTE = pa.CODCONTINENTE
 inner join PAISXSEG ps on pa.CODPAIS = ps.CODPAIS inner join 
 SEGMENTO sg on ps.CODSEGMENTO = sg.CODSEGMENTO
where sg.SEGMENTO = 'TECONOLOGIA' and ct.CONTINENTE = 'EUROPA' or ct.CONTINENTE = 'AMERICA DO NORTE'
group by  pa.PAIS, ct.CONTINENTE, ps.VALORNEGOCIADO
order by  ps.VALORNEGOCIADO 

--10-
select ct.CONTINENTE,
    AVG(pa.RENDA_PERCAPTA) as Media
from PAIS pa inner join CONTINENTE ct 
on ct.CODCONTINENTE = pa.CODCONTINENTE
group by ct.CONTINENTE

--11--
select  gr.GRUPO,
        sum(ps.VALORNEGOCIADO) as Total_VLRNeg
from  GRUPO gr inner join PAIS pa 
on gr.CODGRUPO = pa.CODGRUPO
inner join PAISXSEG ps on pa.CODPAIS = ps.CODPAIS
where ps.DTREFERENCIA between CONVERT(datetime, '01/04/2007',103) and CONVERT(datetime, '01/08/2008',103)
group by gr.GRUPO

--12--
select sg.SEGMENTO,
       AVG(pa.PIB) as Media_Pib
from GRUPO gr inner join PAIS pa on gr.CODGRUPO = pa.CODGRUPO
inner join PAISXSEG ps on pa.CODPAIS = ps.CODPAIS 
inner join SEGMENTO sg on sg.CODSEGMENTO = ps.CODSEGMENTO
where gr.GRUPO = 'uniao europeia'
group by  sg.SEGMENTO

--13--
select ct.CONTINENTE,
       avg(pa.RENDA_PERCAPTA) as 'Media Percapta'
from CONTINENTE ct inner join PAIS pa 
on ct.CODCONTINENTE = pa.CODCONTINENTE 
group by ct.CONTINENTE
having  avg(pa.RENDA_PERCAPTA) > 2000

--14--
select gr.GRUPO,
       sum(ps.VALORNEGOCIADO) as 'Total Geral'
from GRUPO gr inner join PAIS pa on gr.CODGRUPO = pa.CODGRUPO
inner join PAISXSEG ps on pa.CODPAIS = ps.CODPAIS
group by gr.GRUPO
having sum(ps.VALORNEGOCIADO) > 20000000000

--15--
select sg.SEGMENTO, 
    AVG(pa.PIB) as Media_Pib
from CONTINENTE ct inner join PAIS pa 
    on ct.CODCONTINENTE = pa.CODCONTINENTE inner join GRUPO gp on gp.CODGRUPO = pa.CODGRUPO
    inner join PAISXSEG px 
    on px.CODPAIS = pa.CODPAIS inner join SEGMENTO sg 
    on px.CODSEGMENTO = sg.CODSEGMENTO
where gp.GRUPO = 'ongs' or ct.CONTINENTE =  'asia'
group by sg.SEGMENTO
having AVG(pa.PIB) < 2000000000

