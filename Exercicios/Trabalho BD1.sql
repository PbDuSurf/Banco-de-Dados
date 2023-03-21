/*BD1 Trabalho Autoinstrucional
Pedro, Pablo
*/

/*1)Somar o pib dos países que ficaram independentes a partir de 01/01/1920 inclusive e 
que a renda percapta seja menor ou igual a 1000,00; ou que o país seja do grupo 2 
Nome da Coluna: Total_PIB*/

select PA.PAIS, 
       SUM(GR.CODGRUPO), 
       sum (PA.PIB) as 'total pib'
from PAIS PA inner join GRUPO GR on GR.CODGRUPO = PA.CODGRUPO
where DT_INDEP = convert (datetime, '1920-01-01',102) OR GR.CODGRUPO = 2
group by PA.PAIS,GR.CODGRUPO,PA.PIB,PA.RENDA_PERCAPTA
HAVING PA.RENDA_PERCAPTA <=1000




