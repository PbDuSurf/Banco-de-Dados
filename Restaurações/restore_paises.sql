--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Esse script será utilizado apenas se você for restaurar o banco de dados na sua máquina pessoal ou profissional
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use master
go
--O caminho (c:\leoribas\BDI\paises\aluno) deverá ser alterado de acordo com o local da sua máquina
RESTORE DATABASE Paises FROM DISK = 'c:\leoribas\BDI\paises\aluno\bkp_full_paises'
WITH
MOVE 'paises_data' TO 'c:\leoribas\BDI\paises\aluno\Paises01_data.MDF',
MOVE 'paises_log' TO 'c:\leoribas\BDI\paises\aluno\Paises01_log.LDF'
go
