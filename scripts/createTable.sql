CREATE TABLE [Diretor] (
	IdDiretor INT IDENTITY(1,1) NOT NULL,
	NomeDiretor NVARCHAR(100) NOT NULL,
	Ativo BIT NOT NULL DEFAULT 'true',
	

  CONSTRAINT [PK_DIRETOR] PRIMARY KEY 
  (
  [IdDiretor] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

CREATE TABLE [Produtora] (
	IdProdutora INT IDENTITY(1,1) NOT NULL,
	NomeProdutora NVARCHAR(100) NOT NULL,
	Ativo BIT NOT NULL DEFAULT 'true',
	

  CONSTRAINT [PK_PRODUTORA] PRIMARY KEY 
  (
  [IdProdutora] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

CREATE TABLE [PaisOrigem] (
	IdPais INT IDENTITY(1,1) NOT NULL,
	CodigoNumerico INT NOT NULL,
	NomePais NVARCHAR(100) NOT NULL,
	Ativo BIT NOT NULL DEFAULT 'true',
	

  CONSTRAINT [PK_PAISORIGEM] PRIMARY KEY 
  (
  [IdPais] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

CREATE TABLE [ClassificacaoEtaria] (
	IdClassificacaoEtaria INT IDENTITY(1,1) NOT NULL,
	FaixaClassificacao NVARCHAR(100) NOT NULL,
	Descricao NVARCHAR(300) NOT NULL,
	Ativo BIT NOT NULL DEFAULT 'true',
	

	CONSTRAINT [PK_CLASSIFICACAOETARIA] PRIMARY KEY 
  (
  [IdClassificacaoEtaria] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

CREATE TABLE [Genero] (
	IdGenero INT IDENTITY(1,1) NOT NULL,
	NomeGenero NVARCHAR(100) NOT NULL,
	Ativo BIT NOT NULL DEFAULT 'true',
	

  CONSTRAINT [PK_GENERO] PRIMARY KEY 
  (
  [IdGenero] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

CREATE TABLE [Ator] (
	IdAtor INT IDENTITY(1,1) NOT NULL,
	NomeAtor NVARCHAR(100) NOT NULL,
	Ativo BIT NOT NULL DEFAULT 'true',
	

  CONSTRAINT [PK_ATOR] PRIMARY KEY 
  (
  [IdAtor] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

CREATE TABLE [IdiomaDublado] (
	IdIdiomaDublado INT IDENTITY(1,1) NOT NULL,
	NomeIdiomaDublado NVARCHAR(100) NOT NULL,
	Ativo BIT NOT NULL DEFAULT 'true',
	

  CONSTRAINT [PK_IDIOMADUBLADO] PRIMARY KEY 
  (
  [IdIdiomaDublado] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

CREATE TABLE [IdiomaLegendado] (
	IdIdiomaLegendado INT IDENTITY(1,1) NOT NULL,
	NomeIdiomaLegendado NVARCHAR(100) NOT NULL,
	Ativo BIT NOT NULL DEFAULT 'true',
	

  CONSTRAINT [PK_IDIOMALEGENDADO] PRIMARY KEY 
  (
  [IdIdiomaLegendado] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

CREATE TABLE [Serie] (
	IdSerie INT IDENTITY(1,1)  NOT NULL,
	IdDiretor INT NOT NULL,
	IdProdutora INT NOT NULL,
	IdPaisOrigem INT NOT NULL,
	IdClassificacaoEtaria INT NOT NULL,
	Ativo BIT NOT NULL DEFAULT 'true',
	Nome NVARCHAR(60) NOT NULL,
	AnoProducao NVARCHAR(4) NOT NULL,

    CONSTRAINT [PK_SERIE] PRIMARY KEY
  (
  [IdSerie] ASC
  ) WITH (IGNORE_DUP_KEY = OFF), 
   
    CONSTRAINT [FK_Serie_IdDiretor] 
    FOREIGN KEY ([IdDiretor]) 
    REFERENCES [Diretor]([IdDiretor]), 
    CONSTRAINT [FK_Serie_IdProdutora] 
    FOREIGN KEY ([IdProdutora]) 
    REFERENCES [Produtora]([IdProdutora]), 
    CONSTRAINT [FK_Serie_IdPaisOrigem] 
    FOREIGN KEY ([IdPaisOrigem]) 
    REFERENCES [PaisOrigem]([IdPais]), 
    CONSTRAINT [FK_Serie_IdClassificacaoEtaria] 
    FOREIGN KEY ([IdClassificacaoEtaria]) 
    REFERENCES [ClassificacaoEtaria]([IdClassificacaoEtaria])
	
)

GO
CREATE TABLE [Episodio] (
	IdEpisodio INT IDENTITY(1,1) NOT NULL,
	IdSerie INT NOT NULL,
	NomeEpisodio NVARCHAR(100) NOT NULL,
	DataLancamento DATETIME NOT NULL,
	Duracao SMALLINT NOT NULL,
	Ativo BIT NOT NULL DEFAULT 'true',
	

CONSTRAINT [PK_EPISODIO] PRIMARY KEY 
  (
  [IdEpisodio] ASC
  ) WITH (IGNORE_DUP_KEY = OFF),

CONSTRAINT [FK_Episodio_IdSerie] 
    FOREIGN KEY ([IdSerie]) REFERENCES [Serie]([IdSerie])
  
)

GO
CREATE TABLE [Avaliacao] (
	IdAvaliacao INT IDENTITY(1,1) NOT NULL,
	IdSerie INT NOT NULL,
	Nota SMALLINT NOT NULL,
	DataAvaliacao DATETIME NOT NULL,
	Ativo BIT NOT NULL DEFAULT 'true',
    

  CONSTRAINT [PK_AVALIACAO] PRIMARY KEY 
  (
  [IdAvaliacao] ASC
  ),

  CONSTRAINT [FK_Avaliacao_IdSerie] 
    FOREIGN KEY ([IdSerie]) REFERENCES [Serie]([IdSerie])

)
GO

CREATE TABLE [Serie_Ator] (
	IdSerie INT FOREIGN KEY REFERENCES Serie(IdSerie) NOT NULL,
	IdAtor INT FOREIGN KEY REFERENCES Ator(IdAtor) NOT NULL,
    
 CONSTRAINT [PK_SERIE_ATOR] PRIMARY KEY (IdAtor,IdSerie)

)
GO

CREATE TABLE [Serie_Genero] (
	IdSerie INT FOREIGN KEY REFERENCES Serie(IdSerie) NOT NULL,
	IdGenero INT FOREIGN KEY REFERENCES Genero(IdGenero)NOT NULL,
    
  CONSTRAINT [PK_SERIE_GENERO] PRIMARY KEY (IdGenero,IdSerie)

  )
GO

CREATE TABLE [Serie_Legenda] (
	IdSerie INT FOREIGN KEY REFERENCES Serie(IdSerie) NOT NULL,
	IdLegendado INT FOREIGN KEY REFERENCES IdiomaLegendado(IdIdiomaLegendado) NOT NULL,
    
  CONSTRAINT [PK_SERIE_LEGENDADO] PRIMARY KEY (IdLegendado,IdSerie)

)
GO

CREATE TABLE [Serie_Dublagem] (
	IdSerie INT FOREIGN KEY REFERENCES Serie(IdSerie) NOT NULL,
	IdDublado INT FOREIGN KEY REFERENCES IdiomaDublado(IdIdiomaDublado) NOT NULL,
    
  CONSTRAINT [PK_SERIE_DUBLADO] PRIMARY KEY (IdDublado,IdSerie)

)

