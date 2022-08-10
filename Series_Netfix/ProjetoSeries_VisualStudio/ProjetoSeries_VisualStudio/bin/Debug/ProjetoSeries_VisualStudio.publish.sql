﻿/*
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
PRINT N'Rename refactoring operation with key 8ea79e90-439c-4b33-b127-f36be7b233ad is skipped, element [dbo].[Diretor].[Id] (SqlSimpleColumn) will not be renamed to IdDiretor';


GO
PRINT N'Creating Table [dbo].[Diretor]...';


GO
CREATE TABLE [dbo].[Diretor] (
    [IdDiretor]   INT           NOT NULL,
    [NomeDiretor] VARCHAR (100) NULL,
    [Ativo]       BIT           NULL,
    PRIMARY KEY CLUSTERED ([IdDiretor] ASC)
);


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Diretor]...';


GO
ALTER TABLE [dbo].[Diretor]
    ADD DEFAULT 'true' FOR [Ativo];


GO
PRINT N'Creating Check Constraint [dbo].[CK_Diretor_Column]...';


GO
ALTER TABLE [dbo].[Diretor] WITH NOCHECK
    ADD CONSTRAINT [CK_Diretor_Column] CHECK (1 = 1);


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

GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Diretor] WITH CHECK CHECK CONSTRAINT [CK_Diretor_Column];


GO
PRINT N'Update complete.';


GO