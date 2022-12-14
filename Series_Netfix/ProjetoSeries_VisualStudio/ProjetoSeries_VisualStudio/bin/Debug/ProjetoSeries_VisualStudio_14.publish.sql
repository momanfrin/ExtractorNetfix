/*
Deployment script for DbSeries

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DbSeries"
:setvar DefaultFilePrefix "DbSeries"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.TREINAMENTOALURA\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.TREINAMENTOALURA\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
/*
The type for column NomeAtor in table [dbo].[Ator] is currently  NVARCHAR (100) NOT NULL but is being changed to  NVARCHAR (50) NULL. Data loss could occur and deployment may fail if the column contains data that is incompatible with type  NVARCHAR (50) NULL.
*/

IF EXISTS (select top 1 1 from [dbo].[Ator])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
/*
The type for column NomeGenero in table [dbo].[Genero] is currently  NVARCHAR (100) NOT NULL but is being changed to  NVARCHAR (50) NULL. Data loss could occur and deployment may fail if the column contains data that is incompatible with type  NVARCHAR (50) NULL.
*/

IF EXISTS (select top 1 1 from [dbo].[Genero])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
/*
The column [dbo].[PaisOrigem].[CodigoNumerico] is being dropped, data loss could occur.
*/

IF EXISTS (select top 1 1 from [dbo].[PaisOrigem])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
PRINT N'Rename refactoring operation with key 8ea79e90-439c-4b33-b127-f36be7b233ad is skipped, element [dbo].[Diretor].[Id] (SqlSimpleColumn) will not be renamed to IdDiretor';


GO
PRINT N'Rename refactoring operation with key cbf6ede2-60e1-4f12-b068-aec7108cc310 is skipped, element [dbo].[Produtora].[Id] (SqlSimpleColumn) will not be renamed to IdProdutora';


GO
PRINT N'Rename refactoring operation with key 60b64a1b-aaee-4b45-ac69-43f4f5cb1f36 is skipped, element [dbo].[PaisOrigem].[Id] (SqlSimpleColumn) will not be renamed to IdPais';


GO
PRINT N'Rename refactoring operation with key 570c759e-b79f-441e-bfbd-7659a4221844 is skipped, element [dbo].[ClassificacaoEtaria].[Id] (SqlSimpleColumn) will not be renamed to IdClassificacaoEtaria';


GO
PRINT N'Rename refactoring operation with key a644d18b-86a5-4c34-ba6c-3ebc241d055f is skipped, element [dbo].[ClassificacaoEtaria].[NomeProdutora] (SqlSimpleColumn) will not be renamed to FaixaClassificacao';


GO
PRINT N'Rename refactoring operation with key a9fd0c9a-cd5a-4f55-9037-4b5a10027714 is skipped, element [dbo].[ClassificacaoEtaria].[fsfsf] (SqlSimpleColumn) will not be renamed to Descricao';


GO
PRINT N'Rename refactoring operation with key 1a9b5790-cb4e-4ff0-ad38-4b74b51d75e7 is skipped, element [dbo].[Genero].[Id] (SqlSimpleColumn) will not be renamed to IdGenero';


GO
PRINT N'Rename refactoring operation with key b72753aa-6c6c-4287-b824-89c670360f6e is skipped, element [dbo].[Genero].[NomeProdutora] (SqlSimpleColumn) will not be renamed to NomeGenero';


GO
PRINT N'Rename refactoring operation with key 9487ef71-4209-4426-b7fc-63d6d03c691f is skipped, element [dbo].[Ator].[Id] (SqlSimpleColumn) will not be renamed to IdAtor';


GO
PRINT N'Rename refactoring operation with key 95fdcb8c-ce44-4afc-834f-0925b4041b4f is skipped, element [dbo].[Ator].[NomeProdutora] (SqlSimpleColumn) will not be renamed to NomeAtor';


GO
PRINT N'Rename refactoring operation with key a47ef896-1c6e-4796-96ba-9b89ff2c0a02 is skipped, element [dbo].[IdiomaDublado].[Id] (SqlSimpleColumn) will not be renamed to IdIdiomaDublado';


GO
PRINT N'Rename refactoring operation with key 44aefe1a-8886-4fee-b3b5-91c568512497 is skipped, element [dbo].[IdiomaDublado].[NomeProdutora] (SqlSimpleColumn) will not be renamed to NomeIdiomaDublado';


GO
PRINT N'Rename refactoring operation with key 35990623-a8f4-426a-81d9-c217e0e939cf is skipped, element [dbo].[IdiomaLegendado].[Id] (SqlSimpleColumn) will not be renamed to IdIdiomaLegendado';


GO
PRINT N'Rename refactoring operation with key 514e797b-45ad-4cd1-abe3-0c786ed9619a is skipped, element [dbo].[IdiomaLegendado].[NomeProdutora] (SqlSimpleColumn) will not be renamed to NomeIdiomaLegendado';


GO
PRINT N'Rename refactoring operation with key c048b6c0-244e-44b7-8900-8fe064aa5be6 is skipped, element [dbo].[Serie].[Id] (SqlSimpleColumn) will not be renamed to IdSerie';


GO
PRINT N'Rename refactoring operation with key 04bf755d-8bda-4783-a585-1bd54d74ce69 is skipped, element [dbo].[FK_Serie_Diretor] (SqlForeignKeyConstraint) will not be renamed to [FK_Serie_IdDiretor]';


GO
PRINT N'Rename refactoring operation with key b892f271-383b-4978-9c47-ff51b8f9ba8c is skipped, element [dbo].[Episodio].[Id] (SqlSimpleColumn) will not be renamed to IdSerie';


GO
PRINT N'Rename refactoring operation with key 4517d280-9008-4bb5-96eb-64a0feb0dea6 is skipped, element [dbo].[Avaliacao].[Id] (SqlSimpleColumn) will not be renamed to IdAvaliacao';


GO
PRINT N'Rename refactoring operation with key c13e0572-ca17-4130-bd06-671bb883555e is skipped, element [dbo].[Serie_Ator].[Id] (SqlSimpleColumn) will not be renamed to IdSerie';


GO
PRINT N'Rename refactoring operation with key 4d7455e4-19db-4c92-86b3-1ad1cb2a5379 is skipped, element [dbo].[AK_Serie_Ator_Column] (SqlUniqueConstraint) will not be renamed to [AK_Serie_Ator_IdAtor]';


GO
PRINT N'Rename refactoring operation with key 8367d765-6689-4a53-a4d6-2c66ff36399a is skipped, element [dbo].[Serie_Genero].[Id] (SqlSimpleColumn) will not be renamed to IdSerie';


GO
PRINT N'Rename refactoring operation with key 9d048319-b729-4b81-9872-32984bf96b99 is skipped, element [dbo].[Serie_Dublado].[Id] (SqlSimpleColumn) will not be renamed to IdSerie';


GO
PRINT N'Rename refactoring operation with key 6fdcc512-2d47-4c2e-9a5f-cc45aec30c12 is skipped, element [dbo].[FK_Serie_Dublado_ToTable] (SqlForeignKeyConstraint) will not be renamed to [FK_Serie_Dublado_IdSerie]';


GO
PRINT N'Rename refactoring operation with key 863ec657-04da-4415-bc56-bbbb8c6dc5af is skipped, element [dbo].[Serie_Legendado].[Id] (SqlSimpleColumn) will not be renamed to IdSerie';


GO
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[Ator]...';


GO
ALTER TABLE [dbo].[Ator] DROP CONSTRAINT [DF__Ator__Ativo__32E0915F];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[Avaliacao]...';


GO
ALTER TABLE [dbo].[Avaliacao] DROP CONSTRAINT [DF__Avaliacao__Ativo__45F365D3];


GO
PRINT N'Dropping Default Constraint [dbo].[DF__Classific__Ativo__2D27B809]...';


GO
ALTER TABLE [dbo].[ClassificacaoEtaria] DROP CONSTRAINT [DF__Classific__Ativo__2D27B809];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[Diretor]...';


GO
ALTER TABLE [dbo].[Diretor] DROP CONSTRAINT [DF__Diretor__Ativo__24927208];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[Episodio]...';


GO
ALTER TABLE [dbo].[Episodio] DROP CONSTRAINT [DF__Episodio__Ativo__4222D4EF];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[Genero]...';


GO
ALTER TABLE [dbo].[Genero] DROP CONSTRAINT [DF__Genero__Ativo__300424B4];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[IdiomaDublado]...';


GO
ALTER TABLE [dbo].[IdiomaDublado] DROP CONSTRAINT [DF__IdiomaDub__Ativo__35BCFE0A];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[IdiomaLegendado]...';


GO
ALTER TABLE [dbo].[IdiomaLegendado] DROP CONSTRAINT [DF__IdiomaLeg__Ativo__38996AB5];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[PaisOrigem]...';


GO
ALTER TABLE [dbo].[PaisOrigem] DROP CONSTRAINT [DF__PaisOrige__Ativo__2A4B4B5E];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[Produtora]...';


GO
ALTER TABLE [dbo].[Produtora] DROP CONSTRAINT [DF__Produtora__Ativo__276EDEB3];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[Serie]...';


GO
ALTER TABLE [dbo].[Serie] DROP CONSTRAINT [DF__Serie__Ativo__3B75D760];


GO
PRINT N'Dropping Foreign Key unnamed constraint on [dbo].[Serie_Ator]...';


GO
ALTER TABLE [dbo].[Serie_Ator] DROP CONSTRAINT [FK__Serie_Ato__IdAto__4AB81AF0];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_Avaliacao_IdSerie]...';


GO
ALTER TABLE [dbo].[Avaliacao] DROP CONSTRAINT [FK_Avaliacao_IdSerie];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_Serie_IdClassificacaoEtaria]...';


GO
ALTER TABLE [dbo].[Serie] DROP CONSTRAINT [FK_Serie_IdClassificacaoEtaria];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_Serie_IdDiretor]...';


GO
ALTER TABLE [dbo].[Serie] DROP CONSTRAINT [FK_Serie_IdDiretor];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_Episodio_IdSerie]...';


GO
ALTER TABLE [dbo].[Episodio] DROP CONSTRAINT [FK_Episodio_IdSerie];


GO
PRINT N'Dropping Foreign Key unnamed constraint on [dbo].[Serie_Genero]...';


GO
ALTER TABLE [dbo].[Serie_Genero] DROP CONSTRAINT [FK__Serie_Gen__IdGen__4E88ABD4];


GO
PRINT N'Dropping Foreign Key unnamed constraint on [dbo].[Serie_Dublagem]...';


GO
ALTER TABLE [dbo].[Serie_Dublagem] DROP CONSTRAINT [FK__Serie_Dub__IdDub__5629CD9C];


GO
PRINT N'Dropping Foreign Key unnamed constraint on [dbo].[Serie_Legenda]...';


GO
ALTER TABLE [dbo].[Serie_Legenda] DROP CONSTRAINT [FK__Serie_Leg__IdLeg__52593CB8];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_Serie_IdPaisOrigem]...';


GO
ALTER TABLE [dbo].[Serie] DROP CONSTRAINT [FK_Serie_IdPaisOrigem];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_Serie_IdProdutora]...';


GO
ALTER TABLE [dbo].[Serie] DROP CONSTRAINT [FK_Serie_IdProdutora];


GO
PRINT N'Dropping Foreign Key unnamed constraint on [dbo].[Serie_Ator]...';


GO
ALTER TABLE [dbo].[Serie_Ator] DROP CONSTRAINT [FK__Serie_Ato__IdSer__49C3F6B7];


GO
PRINT N'Dropping Foreign Key unnamed constraint on [dbo].[Serie_Genero]...';


GO
ALTER TABLE [dbo].[Serie_Genero] DROP CONSTRAINT [FK__Serie_Gen__IdSer__4D94879B];


GO
PRINT N'Dropping Foreign Key unnamed constraint on [dbo].[Serie_Legenda]...';


GO
ALTER TABLE [dbo].[Serie_Legenda] DROP CONSTRAINT [FK__Serie_Leg__IdSer__5165187F];


GO
PRINT N'Dropping Foreign Key unnamed constraint on [dbo].[Serie_Dublagem]...';


GO
ALTER TABLE [dbo].[Serie_Dublagem] DROP CONSTRAINT [FK__Serie_Dub__IdSer__5535A963];


GO
PRINT N'Starting rebuilding table [dbo].[Ator]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Ator] (
    [IdAtor]   NVARCHAR (50) NOT NULL,
    [NomeAtor] NVARCHAR (50) NULL,
    [Ativo]    BIT           DEFAULT 'true' NULL,
    PRIMARY KEY CLUSTERED ([IdAtor] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Ator])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Ator] ([IdAtor], [NomeAtor], [Ativo])
        SELECT   [IdAtor],
                 [NomeAtor],
                 [Ativo]
        FROM     [dbo].[Ator]
        ORDER BY [IdAtor] ASC;
    END

DROP TABLE [dbo].[Ator];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Ator]', N'Ator';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Avaliacao]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Avaliacao] (
    [IdAvaliacao]   NVARCHAR (50) NOT NULL,
    [IdSerie]       NVARCHAR (50) NULL,
    [Nota]          NVARCHAR (50) NULL,
    [DataAvaliacao] NVARCHAR (50) NULL,
    [Ativo]         BIT           NULL,
    PRIMARY KEY CLUSTERED ([IdAvaliacao] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Avaliacao])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Avaliacao] ([IdAvaliacao], [IdSerie], [Nota], [DataAvaliacao], [Ativo])
        SELECT   [IdAvaliacao],
                 [IdSerie],
                 [Nota],
                 [DataAvaliacao],
                 [Ativo]
        FROM     [dbo].[Avaliacao]
        ORDER BY [IdAvaliacao] ASC;
    END

DROP TABLE [dbo].[Avaliacao];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Avaliacao]', N'Avaliacao';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[ClassificacaoEtaria]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_ClassificacaoEtaria] (
    [IdClassificacaoEtaria] NVARCHAR (50)  NOT NULL,
    [FaixaClassificacao]    NVARCHAR (300) NULL,
    [Descricao]             NVARCHAR (500) NULL,
    [Ativo]                 BIT            DEFAULT 'true' NULL,
    PRIMARY KEY CLUSTERED ([IdClassificacaoEtaria] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[ClassificacaoEtaria])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_ClassificacaoEtaria] ([IdClassificacaoEtaria], [FaixaClassificacao], [Descricao], [Ativo])
        SELECT   [IdClassificacaoEtaria],
                 [FaixaClassificacao],
                 [Descricao],
                 [Ativo]
        FROM     [dbo].[ClassificacaoEtaria]
        ORDER BY [IdClassificacaoEtaria] ASC;
    END

DROP TABLE [dbo].[ClassificacaoEtaria];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_ClassificacaoEtaria]', N'ClassificacaoEtaria';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Diretor]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Diretor] (
    [IdDiretor]   NVARCHAR (50)  NOT NULL,
    [NomeDiretor] NVARCHAR (100) NULL,
    [Ativo]       BIT            DEFAULT 'true' NULL,
    PRIMARY KEY CLUSTERED ([IdDiretor] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Diretor])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Diretor] ([IdDiretor], [NomeDiretor], [Ativo])
        SELECT   [IdDiretor],
                 [NomeDiretor],
                 [Ativo]
        FROM     [dbo].[Diretor]
        ORDER BY [IdDiretor] ASC;
    END

DROP TABLE [dbo].[Diretor];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Diretor]', N'Diretor';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Episodio]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Episodio] (
    [IdEpisodio]     NVARCHAR (50)  NOT NULL,
    [IdSerie]        NVARCHAR (50)  NULL,
    [NomeEpisodio]   NVARCHAR (100) NULL,
    [DataLancamento] NVARCHAR (50)  NULL,
    [Duracao]        NVARCHAR (50)  NULL,
    [Ativo]          BIT            DEFAULT 'true' NULL,
    PRIMARY KEY CLUSTERED ([IdEpisodio] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Episodio])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Episodio] ([IdEpisodio], [IdSerie], [NomeEpisodio], [DataLancamento], [Duracao], [Ativo])
        SELECT   [IdEpisodio],
                 [IdSerie],
                 [NomeEpisodio],
                 [DataLancamento],
                 [Duracao],
                 [Ativo]
        FROM     [dbo].[Episodio]
        ORDER BY [IdEpisodio] ASC;
    END

DROP TABLE [dbo].[Episodio];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Episodio]', N'Episodio';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Genero]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Genero] (
    [IdGenero]   NVARCHAR (50) NOT NULL,
    [NomeGenero] NVARCHAR (50) NULL,
    [Ativo]      BIT           DEFAULT 'true' NULL,
    PRIMARY KEY CLUSTERED ([IdGenero] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Genero])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Genero] ([IdGenero], [NomeGenero], [Ativo])
        SELECT   [IdGenero],
                 [NomeGenero],
                 [Ativo]
        FROM     [dbo].[Genero]
        ORDER BY [IdGenero] ASC;
    END

DROP TABLE [dbo].[Genero];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Genero]', N'Genero';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[IdiomaDublado]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_IdiomaDublado] (
    [IdIdiomaDublado]   NVARCHAR (50)  NOT NULL,
    [NomeIdiomaDublado] NVARCHAR (100) NULL,
    [Ativo]             BIT            DEFAULT 'true' NULL,
    PRIMARY KEY CLUSTERED ([IdIdiomaDublado] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[IdiomaDublado])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_IdiomaDublado] ([IdIdiomaDublado], [NomeIdiomaDublado], [Ativo])
        SELECT   [IdIdiomaDublado],
                 [NomeIdiomaDublado],
                 [Ativo]
        FROM     [dbo].[IdiomaDublado]
        ORDER BY [IdIdiomaDublado] ASC;
    END

DROP TABLE [dbo].[IdiomaDublado];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_IdiomaDublado]', N'IdiomaDublado';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[IdiomaLegendado]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_IdiomaLegendado] (
    [IdIdiomaLegendado]   NVARCHAR (50)  NOT NULL,
    [NomeIdiomaLegendado] NVARCHAR (100) NULL,
    [Ativo]               BIT            DEFAULT 'true' NULL,
    PRIMARY KEY CLUSTERED ([IdIdiomaLegendado] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[IdiomaLegendado])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_IdiomaLegendado] ([IdIdiomaLegendado], [NomeIdiomaLegendado], [Ativo])
        SELECT   [IdIdiomaLegendado],
                 [NomeIdiomaLegendado],
                 [Ativo]
        FROM     [dbo].[IdiomaLegendado]
        ORDER BY [IdIdiomaLegendado] ASC;
    END

DROP TABLE [dbo].[IdiomaLegendado];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_IdiomaLegendado]', N'IdiomaLegendado';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[PaisOrigem]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_PaisOrigem] (
    [IdPais]   NVARCHAR (50)  NOT NULL,
    [NomePais] NVARCHAR (100) NULL,
    [Ativo]    BIT            NULL,
    PRIMARY KEY CLUSTERED ([IdPais] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[PaisOrigem])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_PaisOrigem] ([IdPais], [NomePais], [Ativo])
        SELECT   [IdPais],
                 [NomePais],
                 [Ativo]
        FROM     [dbo].[PaisOrigem]
        ORDER BY [IdPais] ASC;
    END

DROP TABLE [dbo].[PaisOrigem];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_PaisOrigem]', N'PaisOrigem';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Produtora]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Produtora] (
    [IdProdutora]   NVARCHAR (50)  NOT NULL,
    [NomeProdutora] NVARCHAR (100) NULL,
    [Ativo]         BIT            DEFAULT 'true' NULL,
    PRIMARY KEY CLUSTERED ([IdProdutora] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Produtora])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Produtora] ([IdProdutora], [NomeProdutora], [Ativo])
        SELECT   [IdProdutora],
                 [NomeProdutora],
                 [Ativo]
        FROM     [dbo].[Produtora]
        ORDER BY [IdProdutora] ASC;
    END

DROP TABLE [dbo].[Produtora];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Produtora]', N'Produtora';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Serie]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Serie] (
    [IdSerie]               NVARCHAR (50)  NOT NULL,
    [IdDiretor]             NVARCHAR (50)  NULL,
    [IdProdutora]           NVARCHAR (50)  NULL,
    [IdPaisOrigem]          NVARCHAR (50)  NULL,
    [IdClassificacaoEtaria] NVARCHAR (50)  NULL,
    [Ativo]                 BIT            NULL,
    [Nome]                  NVARCHAR (100) NULL,
    [AnoProducao]           NVARCHAR (4)   NULL,
    PRIMARY KEY CLUSTERED ([IdSerie] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Serie])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Serie] ([IdSerie], [IdDiretor], [IdProdutora], [IdPaisOrigem], [IdClassificacaoEtaria], [Ativo], [Nome], [AnoProducao])
        SELECT   [IdSerie],
                 [IdDiretor],
                 [IdProdutora],
                 [IdPaisOrigem],
                 [IdClassificacaoEtaria],
                 [Ativo],
                 [Nome],
                 [AnoProducao]
        FROM     [dbo].[Serie]
        ORDER BY [IdSerie] ASC;
    END

DROP TABLE [dbo].[Serie];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Serie]', N'Serie';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Serie_Ator]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Serie_Ator] (
    [IdSerie] NVARCHAR (50) NOT NULL,
    [IdAtor]  NVARCHAR (50) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_SERIE_ATOR1] PRIMARY KEY CLUSTERED ([IdAtor] ASC, [IdSerie] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Serie_Ator])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Serie_Ator] ([IdAtor], [IdSerie])
        SELECT   [IdAtor],
                 [IdSerie]
        FROM     [dbo].[Serie_Ator]
        ORDER BY [IdAtor] ASC, [IdSerie] ASC;
    END

DROP TABLE [dbo].[Serie_Ator];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Serie_Ator]', N'Serie_Ator';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_SERIE_ATOR1]', N'PK_SERIE_ATOR', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Serie_Genero]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Serie_Genero] (
    [IdSerie]  NVARCHAR (50) NOT NULL,
    [IdGenero] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdSerie] ASC, [IdGenero] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Serie_Genero])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Serie_Genero] ([IdSerie], [IdGenero])
        SELECT   [IdSerie],
                 [IdGenero]
        FROM     [dbo].[Serie_Genero]
        ORDER BY [IdSerie] ASC, [IdGenero] ASC;
    END

DROP TABLE [dbo].[Serie_Genero];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Serie_Genero]', N'Serie_Genero';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating Table [dbo].[Serie_Dublado]...';


GO
CREATE TABLE [dbo].[Serie_Dublado] (
    [IdSerie]         NVARCHAR (50) NOT NULL,
    [IdIdiomaDublado] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdSerie] ASC, [IdIdiomaDublado] ASC)
);


GO
PRINT N'Creating Table [dbo].[Serie_Legendado]...';


GO
CREATE TABLE [dbo].[Serie_Legendado] (
    [IdSerie]           NVARCHAR (50) NOT NULL,
    [IdIdiomaLegendado] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdSerie] ASC, [IdIdiomaLegendado] ASC)
);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Avaliacao_IdSerie]...';


GO
ALTER TABLE [dbo].[Avaliacao] WITH NOCHECK
    ADD CONSTRAINT [FK_Avaliacao_IdSerie] FOREIGN KEY ([IdSerie]) REFERENCES [dbo].[Serie] ([IdSerie]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_IdClassificacaoEtaria]...';


GO
ALTER TABLE [dbo].[Serie] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_IdClassificacaoEtaria] FOREIGN KEY ([IdClassificacaoEtaria]) REFERENCES [dbo].[ClassificacaoEtaria] ([IdClassificacaoEtaria]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_IdDiretor]...';


GO
ALTER TABLE [dbo].[Serie] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_IdDiretor] FOREIGN KEY ([IdDiretor]) REFERENCES [dbo].[Diretor] ([IdDiretor]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Episodio_IdSerie]...';


GO
ALTER TABLE [dbo].[Episodio] WITH NOCHECK
    ADD CONSTRAINT [FK_Episodio_IdSerie] FOREIGN KEY ([IdSerie]) REFERENCES [dbo].[Serie] ([IdSerie]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_IdPaisOrigem]...';


GO
ALTER TABLE [dbo].[Serie] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_IdPaisOrigem] FOREIGN KEY ([IdPaisOrigem]) REFERENCES [dbo].[PaisOrigem] ([IdPais]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_IdProdutora]...';


GO
ALTER TABLE [dbo].[Serie] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_IdProdutora] FOREIGN KEY ([IdProdutora]) REFERENCES [dbo].[Produtora] ([IdProdutora]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_SERIEATOR]...';


GO
ALTER TABLE [dbo].[Serie_Ator] WITH NOCHECK
    ADD CONSTRAINT [FK_SERIEATOR] FOREIGN KEY ([IdSerie]) REFERENCES [dbo].[Serie] ([IdSerie]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_ATOR]...';


GO
ALTER TABLE [dbo].[Serie_Ator] WITH NOCHECK
    ADD CONSTRAINT [FK_ATOR] FOREIGN KEY ([IdAtor]) REFERENCES [dbo].[Ator] ([IdAtor]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_Genero_IdSerie]...';


GO
ALTER TABLE [dbo].[Serie_Genero] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_Genero_IdSerie] FOREIGN KEY ([IdSerie]) REFERENCES [dbo].[Serie] ([IdSerie]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_Genero_IdGenero]...';


GO
ALTER TABLE [dbo].[Serie_Genero] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_Genero_IdGenero] FOREIGN KEY ([IdGenero]) REFERENCES [dbo].[Genero] ([IdGenero]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_Dublado_IdSerie]...';


GO
ALTER TABLE [dbo].[Serie_Dublado] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_Dublado_IdSerie] FOREIGN KEY ([IdSerie]) REFERENCES [dbo].[Serie] ([IdSerie]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_Dublado_IdIdiomaDublado]...';


GO
ALTER TABLE [dbo].[Serie_Dublado] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_Dublado_IdIdiomaDublado] FOREIGN KEY ([IdIdiomaDublado]) REFERENCES [dbo].[IdiomaDublado] ([IdIdiomaDublado]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_Legendado_ToTable]...';


GO
ALTER TABLE [dbo].[Serie_Legendado] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_Legendado_ToTable] FOREIGN KEY ([IdSerie]) REFERENCES [dbo].[Serie] ([IdSerie]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_Legendado_ToTable_1]...';


GO
ALTER TABLE [dbo].[Serie_Legendado] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_Legendado_ToTable_1] FOREIGN KEY ([IdIdiomaLegendado]) REFERENCES [dbo].[IdiomaLegendado] ([IdIdiomaLegendado]);


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '8ea79e90-439c-4b33-b127-f36be7b233ad')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('8ea79e90-439c-4b33-b127-f36be7b233ad')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'cbf6ede2-60e1-4f12-b068-aec7108cc310')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('cbf6ede2-60e1-4f12-b068-aec7108cc310')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '60b64a1b-aaee-4b45-ac69-43f4f5cb1f36')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('60b64a1b-aaee-4b45-ac69-43f4f5cb1f36')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '570c759e-b79f-441e-bfbd-7659a4221844')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('570c759e-b79f-441e-bfbd-7659a4221844')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a644d18b-86a5-4c34-ba6c-3ebc241d055f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a644d18b-86a5-4c34-ba6c-3ebc241d055f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a9fd0c9a-cd5a-4f55-9037-4b5a10027714')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a9fd0c9a-cd5a-4f55-9037-4b5a10027714')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '1a9b5790-cb4e-4ff0-ad38-4b74b51d75e7')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('1a9b5790-cb4e-4ff0-ad38-4b74b51d75e7')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b72753aa-6c6c-4287-b824-89c670360f6e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b72753aa-6c6c-4287-b824-89c670360f6e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '9487ef71-4209-4426-b7fc-63d6d03c691f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('9487ef71-4209-4426-b7fc-63d6d03c691f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '95fdcb8c-ce44-4afc-834f-0925b4041b4f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('95fdcb8c-ce44-4afc-834f-0925b4041b4f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a47ef896-1c6e-4796-96ba-9b89ff2c0a02')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a47ef896-1c6e-4796-96ba-9b89ff2c0a02')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '44aefe1a-8886-4fee-b3b5-91c568512497')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('44aefe1a-8886-4fee-b3b5-91c568512497')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '35990623-a8f4-426a-81d9-c217e0e939cf')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('35990623-a8f4-426a-81d9-c217e0e939cf')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '514e797b-45ad-4cd1-abe3-0c786ed9619a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('514e797b-45ad-4cd1-abe3-0c786ed9619a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c048b6c0-244e-44b7-8900-8fe064aa5be6')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c048b6c0-244e-44b7-8900-8fe064aa5be6')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '04bf755d-8bda-4783-a585-1bd54d74ce69')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('04bf755d-8bda-4783-a585-1bd54d74ce69')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b892f271-383b-4978-9c47-ff51b8f9ba8c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b892f271-383b-4978-9c47-ff51b8f9ba8c')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '4517d280-9008-4bb5-96eb-64a0feb0dea6')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('4517d280-9008-4bb5-96eb-64a0feb0dea6')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c13e0572-ca17-4130-bd06-671bb883555e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c13e0572-ca17-4130-bd06-671bb883555e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '4d7455e4-19db-4c92-86b3-1ad1cb2a5379')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('4d7455e4-19db-4c92-86b3-1ad1cb2a5379')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '8367d765-6689-4a53-a4d6-2c66ff36399a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('8367d765-6689-4a53-a4d6-2c66ff36399a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '9d048319-b729-4b81-9872-32984bf96b99')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('9d048319-b729-4b81-9872-32984bf96b99')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '6fdcc512-2d47-4c2e-9a5f-cc45aec30c12')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('6fdcc512-2d47-4c2e-9a5f-cc45aec30c12')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '863ec657-04da-4415-bc56-bbbb8c6dc5af')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('863ec657-04da-4415-bc56-bbbb8c6dc5af')

GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Avaliacao] WITH CHECK CHECK CONSTRAINT [FK_Avaliacao_IdSerie];

ALTER TABLE [dbo].[Serie] WITH CHECK CHECK CONSTRAINT [FK_Serie_IdClassificacaoEtaria];

ALTER TABLE [dbo].[Serie] WITH CHECK CHECK CONSTRAINT [FK_Serie_IdDiretor];

ALTER TABLE [dbo].[Episodio] WITH CHECK CHECK CONSTRAINT [FK_Episodio_IdSerie];

ALTER TABLE [dbo].[Serie] WITH CHECK CHECK CONSTRAINT [FK_Serie_IdPaisOrigem];

ALTER TABLE [dbo].[Serie] WITH CHECK CHECK CONSTRAINT [FK_Serie_IdProdutora];

ALTER TABLE [dbo].[Serie_Ator] WITH CHECK CHECK CONSTRAINT [FK_SERIEATOR];

ALTER TABLE [dbo].[Serie_Ator] WITH CHECK CHECK CONSTRAINT [FK_ATOR];

ALTER TABLE [dbo].[Serie_Genero] WITH CHECK CHECK CONSTRAINT [FK_Serie_Genero_IdSerie];

ALTER TABLE [dbo].[Serie_Genero] WITH CHECK CHECK CONSTRAINT [FK_Serie_Genero_IdGenero];

ALTER TABLE [dbo].[Serie_Dublado] WITH CHECK CHECK CONSTRAINT [FK_Serie_Dublado_IdSerie];

ALTER TABLE [dbo].[Serie_Dublado] WITH CHECK CHECK CONSTRAINT [FK_Serie_Dublado_IdIdiomaDublado];

ALTER TABLE [dbo].[Serie_Legendado] WITH CHECK CHECK CONSTRAINT [FK_Serie_Legendado_ToTable];

ALTER TABLE [dbo].[Serie_Legendado] WITH CHECK CHECK CONSTRAINT [FK_Serie_Legendado_ToTable_1];


GO
PRINT N'Update complete.';


GO
