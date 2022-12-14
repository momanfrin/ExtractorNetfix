/*
Deployment script for VS_Series

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "VS_Series"
:setvar DefaultFilePrefix "VS_Series"
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
PRINT N'Rename refactoring operation with key cbf6ede2-60e1-4f12-b068-aec7108cc310 is skipped, element [dbo].[Produtora].[Id] (SqlSimpleColumn) will not be renamed to IdProdutora';


GO
PRINT N'Dropping Check Constraint [dbo].[CK_Diretor_Column]...';


GO
ALTER TABLE [dbo].[Diretor] DROP CONSTRAINT [CK_Diretor_Column];


GO
PRINT N'Creating Table [dbo].[Produtora]...';


GO
CREATE TABLE [dbo].[Produtora] (
    [IdProdutora]   INT           IDENTITY (1, 1) NOT NULL,
    [NomeProdutora] NVARCHAR (50) NULL,
    [Ativo]         BIT           NULL,
    PRIMARY KEY CLUSTERED ([IdProdutora] ASC)
);


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Produtora]...';


GO
ALTER TABLE [dbo].[Produtora]
    ADD DEFAULT 'true' FOR [Ativo];


GO
-- Refactoring step to update target server with deployed transaction logs
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'cbf6ede2-60e1-4f12-b068-aec7108cc310')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('cbf6ede2-60e1-4f12-b068-aec7108cc310')

GO

GO
PRINT N'Update complete.';


GO
