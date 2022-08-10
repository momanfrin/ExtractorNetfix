﻿CREATE TABLE [dbo].[Serie_Ator]
(
	[IdSerie] NVARCHAR(50) NOT NULL , 
    [IdAtor] NVARCHAR(50) NOT NULL, 
    CONSTRAINT [PK_SERIE_ATOR] PRIMARY KEY (IdAtor,IdSerie),
    CONSTRAINT [FK_SERIEATOR] FOREIGN KEY (IdSerie) 
    REFERENCES Serie(IdSerie),
    CONSTRAINT [FK_ATOR] FOREIGN KEY (IdAtor) 
    REFERENCES Ator(IdAtor)
)
