	--TIPOS DE COMANDOS
		--DDL: Data Definition Language		(Create, Drop, Alter, Truncate)
		--DCL: Data Control Language		(Grant, Revoke)
		--DML: Data Manipulation Language	(Insert, Update, Delete)
		--TCL: Transaction Control Language	(Commit, Rollback, Save Point)
		--DQL: Data Query Language			(Select)

  --É RECOMENDÁVEL UTILIZAR PALAVRAS RESERVADAS EM LETRAS MAIÚSCULAS

  --COMANDO SELECT
  SELECT * FROM Clientes	--SELECIONANDO DADOS DA TABELA: Clientes
  ORDER BY Nome DESC		--ORDENANDO LISTA PELO SOBRENOME, EM ORDEM DECRESCENTE


  --SELECIONANDO COLUNAS E ORDENANDO OS RESULTADOS
  SELECT NOME, SOBRENOME, EMAIL FROM Clientes	--BUSCA POR COLUNAS ESPECÍFICAS
  ORDER BY NOME, SOBRENOME						--ORDENANDO POR NOME E SOBRENOME


  --UTILIZANDO WHERE PARA FILTRAR
  SELECT * FROM Clientes
  WHERE NOME = 'Adam'			--BUSCA COM COMANDO WHERE, ONDE A COLUNA NOME FOR IGUAL A 'Adam'
  AND Sobrenome = 'Reynold'		--ADICIONA OUTRA CONDIÇÃO PARA FILTRO DE BUSCA
  OR Sobrenome = 'Barr'			--INCLUI O OPERADOR LÓGICO 'OU' NA CONSULTA, BASTANDO QUE UMA CONDIÇÃO SEJA VERDADEIRA PARA RETORNAR VERDADEIRO.
  ORDER BY Nome, Sobrenome


  --UTILIZANDO LIKE
  SELECT * FROM Clientes
  WHERE Nome LIKE 'G%'		--FILTRANDO TODOS OS CLIENTES QUE COMEÇAM COM A LETRA 'G'
							--'G%': SIGNIFICA QUE A BUSCA DEVE SER NAS INFORMAÇÕES INICIADAS EM 'G' E O SEGUINTE POUCO IMPORTA, BUSCANDO TODOS QUE INICIAM COM 'G'.
							--BUSCAS PARCIAIS SÓ FUNCIONAM COM SINAL DE LIKE, E NÃO COM SINAL DE IGUAL(=).
  AND Sobrenome LIKE '%G%'	--PEGA TODOS OS SOBRENOMES QUE TENHAM A LETRA G, TENDO QUALQUER COISA ANTES OU DEPOIS, INDEPENDENTE DE ONDE ESTEJA.
  ORDER BY Sobrenome


  --REALIZANDO UM INSERT (INSERT INTO <TABELA> (<COLUNAS DESEJADAS>), VALUES (<DADOS QUE DESEJA PASSAR, EXATAMENTE NA ORDEM DETERMINADA ANTERIORMENTE>))
  INSERT INTO Clientes (Sobrenome, Nome, Email, AceitaComunicados, DataCadastro) --POSSO DEFINIR A ORDEM DAS COLUNAS A SEREM INSERIDAS COMO QUISER
  VALUES ('Rodrigues','Jhoy',  'email@email.com', 1, GETDATE()) --A FUNÇÃO GETDATE() RETORNA DATA E HORA ATUAIS

  SELECT * FROM Clientes WHERE Nome = 'Jhoy'

  --INSERT OMITINDO AS COLUNAS
  INSERT INTO Clientes VALUES ('Jhoy', 'Rordigues', 'email@email.com', 1, GETDATE()) --NESTE CASO, É NECESSÁRIO OBEDECER A ORDEM CORRETA DAS COLUNAS E PREENCHER TODAS ELAS

  --A COLUNA 'Id' É UM IDENTIFICADOR ÚNICO, GERADO POR AUTOINCREMENTO. NÃO SENDO NECESSÁRIO PASSAR O 'Id' NO INSERT, JÁ QUE ELA É PREENCHIDA AUTOMATICAMENTE DEVIDA A CONFIGURAÇÃO: 'IDENTITY(1,1)'


  --REALIZANDO UM UPDATE (É RECOMENDADO FAZER UM SELECT COM O FILTRO DO UPDATE PARA VERIFICÁ-LO ANTES)
  UPDATE Clientes 
  SET Email = 'emailatualizado@email.com',	--DEFINE A COLUNA A SER ALTERADA E PASSA AS INFORMAÇÕES A SEREM INSERIDAS
	  AceitaComunicados = 0					--PASSAMOS NO 'SET', TODOS OS CAMPOS A SEREM ATUALIZADOS
  WHERE Id = 1003							--DEFINE EM QUE LINHA SERÁ ALTERADA A INFORMAÇÃO, DEVEMOS TOMAR CUIDADO COM ESSE CAMPO, PARA NÃO ALTERAR CAMPOS INDESEJADOS


  BEGIN TRAN --TRANSAÇÃO EXPLÍCITA: PODE RETORNAR OU FINALIZAR, APÓS A REALIZAÇÃO
  ROLLBACK --CANCELANDO TRANSAÇÃO EXPLÍCITA (EM CASO DE ERRO, POR EXEMPLO)
  COMMIT --FINALIZAÇÃO DA TRANSAÇÃO EXPLÍCITA


  --DELETANDO UM REGISTRO (TAMBÉM É MUITO IMPORTANTE TOMAR CUIDADO, NUNCA SE ESQUEÇA DO 'WHERE')
  DELETE FROM Clientes WHERE Id = 1004


  --		CRIAÇÃO DE TABELA
 --TIPOS DE DADOS DE TEXTO
	--CHAR(size)	A FIXED length string (can contain letters, numbers, and special characters). The size parameter specifies the column length in characters - can be from 0 to 255. Default is 1
	--VARCHAR(size)	A VARIABLE length string (can contain letters, numbers, and special characters). The size parameter specifies the maximum string length in characters - can be from 0 to 65535
	--BINARY(size)	Equal to CHAR(), but stores binary byte strings. The size parameter specifies the column length in bytes. Default is 1
	--VARBINARY(size)	Equal to VARCHAR(), but stores binary byte strings. The size parameter specifies the maximum column length in bytes.
	--TINYBLOB	For BLOBs (Binary Large Objects). Max length: 255 bytes
	--TINYTEXT	Holds a string with a maximum length of 255 characters
	--TEXT(size)	Holds a string with a maximum length of 65,535 bytes
	--BLOB(size)	For BLOBs (Binary Large Objects). Holds up to 65,535 bytes of data
	--MEDIUMTEXT	Holds a string with a maximum length of 16,777,215 characters
	--MEDIUMBLOB	For BLOBs (Binary Large Objects). Holds up to 16,777,215 bytes of data
	--LONGTEXT	Holds a string with a maximum length of 4,294,967,295 characters
	--LONGBLOB	For BLOBs (Binary Large Objects). Holds up to 4,294,967,295 bytes of data
	--ENUM(val1, val2, val3, ...)	A string object that can have only one value, chosen from a list of possible values. You can list up to 65535 values in an ENUM list. If a value is inserted that is not in the list, a blank value will be inserted. The values are sorted in the order you enter them
	--SET(val1, val2, val3, ...)	A string object that can have 0 or more values, chosen from a list of possible values. You can list up to 64 values in a SET list

--TIPOS DE DADOS NUMÉRICOS
	--BIT(size)	A bit-value type. The number of bits per value is specified in size. The size parameter can hold a value from 1 to 64. The default value for size is 1.
	--TINYINT(size)	A very small integer. Signed range is from -128 to 127. Unsigned range is from 0 to 255. The size parameter specifies the maximum display width (which is 255)
	--BOOL	Zero is considered as false, nonzero values are considered as true.
	--BOOLEAN	Equal to BOOL
	--SMALLINT(size)	A small integer. Signed range is from -32768 to 32767. Unsigned range is from 0 to 65535. The size parameter specifies the maximum display width (which is 255)
	--MEDIUMINT(size)	A medium integer. Signed range is from -8388608 to 8388607. Unsigned range is from 0 to 16777215. The size parameter specifies the maximum display width (which is 255)
	--INT(size)	A medium integer. Signed range is from -2147483648 to 2147483647. Unsigned range is from 0 to 4294967295. The size parameter specifies the maximum display width (which is 255)
	--INTEGER(size)	Equal to INT(size)
	--BIGINT(size)	A large integer. Signed range is from -9223372036854775808 to 9223372036854775807. Unsigned range is from 0 to 18446744073709551615. The size parameter specifies the maximum display width (which is 255)
	--FLOAT(size, d)	A floating point number. The total number of digits is specified in size. The number of digits after the decimal point is specified in the d parameter. This syntax is deprecated in MySQL 8.0.17, and it will be removed in future MySQL versions
	--FLOAT(p)	A floating point number. MySQL uses the p value to determine whether to use FLOAT or DOUBLE for the resulting data type. If p is from 0 to 24, the data type becomes FLOAT(). If p is from 25 to 53, the data type becomes DOUBLE()
	--DOUBLE(size, d)	A normal-size floating point number. The total number of digits is specified in size. The number of digits after the decimal point is specified in the d parameter
	--DOUBLE PRECISION(size, d)	 
	--DECIMAL(size, d)	An exact fixed-point number. The total number of digits is specified in size. The number of digits after the decimal point is specified in the d parameter. The maximum number for size is 65. The maximum number for d is 30. The default value for size is 10. The default value for d is 0.
	--DEC(size, d)	Equal to DECIMAL(size,d)

--TIPOS DE DADOS DE DATA E HORA
	--DATE	A date. Format: YYYY-MM-DD. The supported range is from '1000-01-01' to '9999-12-31'
	--DATETIME(fsp)	A date and time combination. Format: YYYY-MM-DD hh:mm:ss. The supported range is from '1000-01-01 00:00:00' to '9999-12-31 23:59:59'. Adding DEFAULT and ON UPDATE in the column definition to get automatic initialization and updating to the current date and time
	--TIMESTAMP(fsp)	A timestamp. TIMESTAMP values are stored as the number of seconds since the Unix epoch ('1970-01-01 00:00:00' UTC). Format: YYYY-MM-DD hh:mm:ss. The supported range is from '1970-01-01 00:00:01' UTC to '2038-01-09 03:14:07' UTC. Automatic initialization and updating to the current date and time can be specified using DEFAULT CURRENT_TIMESTAMP and ON UPDATE CURRENT_TIMESTAMP in the column definition
	--TIME(fsp)	A time. Format: hh:mm:ss. The supported range is from '-838:59:59' to '838:59:59'
	--YEAR	A year in four-digit format. Values allowed in four-digit format: 1901 to 2155, and 0000.
	--MySQL 8.0 does not support year in two-digit format.

	
	--CRIANDO UMA TABELA
	CREATE TABLE Produtos (
		Id int IDENTITY(1,1) PRIMARY KEY NOT NULL, --CAMPO OBRIGATÓRIO, AUTOINCREMENTO (Identity), CHAVE PRIMÁRIA - GARANTE QUE O Id NUNCA SE REPITA
		Nome varchar(255) NOT NULL, --255 É O TAMANHO MÁXIMO
		Cor varchar(50) NULL, --PERMITE NULO DE FORMA EXPLÍCITA
		Preco decimal(13, 2) NULL, --PERMITIR ATÉ 13 DÍGITOS COM ATÉ 2 CASAS DECIMAIS
		Tamanho varchar(5) NULL,
		Genero char(1) NULL
		)

	SELECT * FROM Produtos


	--BUILT-IN FUNCTIONSS
		--São funções pré-existentes que auxiliam na manipulação de dados, como por exemplo, contar, somar, média, etc... -> INSERI DADOS DO Script 2: Tabela Produtos.sql
	
	--COUNT: RETORNA QUANTAS LINHAS NA TABELA BASEADO EM DETERMINADA CONDIÇÃO
	SELECT COUNT(*) QuantidadeProdutos FROM Produtos --QuantidadeProdutos é o nome dado à coluna gerada referente a quantidade

	SELECT COUNT(*) QuantidadeProdutosTamanhoM FROM Produtos WHERE Tamanho = 'M'

	--SUM: RETORNA A SOMA DE UMA COLUNA ENTRE SI, TODOS OS VALORES DE DETERMINADA COLUNA, APENAS NUMÉRICO
	SELECT SUM(Preco) PrecoTotal FROM Produtos

	SELECT SUM(Preco) PrecoTotal FROM Produtos WHERE Tamanho = 'M' --SOMA TODOS OS PRODUTOS COM TAMANHO 'M'


	--OPERADORES MAX(VALOR MÁXIMO) E MIN(VALOR MÍNIMO)
	SELECT MAX(Preco) MaiorPreco, MIN(Preco) MenorPreco  FROM Produtos --NESTE CASO, ESTOU EXIBINDO UMA COLUNA AO LADO DA OUTRA, MAS PODE SER SEPARADO

	--OPERADOR AVG: RETORNA A MÉDIA DOS VALORES
	SELECT AVG(Preco) MediaPreco FROM Produtos


	--CONCATENANDO COLUNAS, DUAS EM UMA MESMA COLUNA
	SELECT 
		Nome + ' - ' + Cor + ' - ' + Genero NomeProduto --NomeProduto é o nome da nova coluna gerada
	FROM Produtos