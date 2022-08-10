USE DbSeries;

DELETE FROM Serie_Dublagem;

DELETE FROM Serie_Legenda;


DELETE FROM Serie_Genero;

DELETE FROM Serie_Ator;

DELETE FROM Avaliacao;
--DBCC CHECKIDENT (Avaliacao, reseed, 0)

DELETE FROM Episodio;
--DBCC CHECKIDENT (Episodio, reseed, 0)

DELETE FROM Serie;
--DBCC CHECKIDENT (Serie, reseed, 0)

DELETE FROM IdiomaLegendado;
DBCC CHECKIDENT (IdiomaLegendado, reseed, 0)

DELETE FROM IdiomaDublado;
--DBCC CHECKIDENT (IdiomaDublado, reseed, 0)

DELETE FROM Ator;
DBCC CHECKIDENT (Ator, reseed, 0)

DELETE FROM Genero;
DBCC CHECKIDENT (Genero, reseed, 0)

DELETE FROM ClassificacaoEtaria;
--DBCC CHECKIDENT (ClassificacaoEtaria, reseed, 0)

DELETE FROM PaisOrigem;
--DBCC CHECKIDENT (PaisOrigem, reseed, 0)

DELETE FROM Produtora;
DBCC CHECKIDENT (Produtora, reseed, 0)

DELETE FROM Diretor;
--DBCC CHECKIDENT (Diretor, reseed, 0)