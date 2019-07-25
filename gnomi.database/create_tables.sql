CREATE DATABASE gnomi_dev;

GO

USE gnomi_dev;


CREATE TABLE [dbo].[gender](
[genderId] [tinyint] IDENTITY(1,1) NOT NULL,
[genderName] [nvarchar](150),
CONSTRAINT [PK_gender] PRIMARY KEY ([genderId]));

CREATE TABLE [dbo].[human](
[humanId] [bigint] IDENTITY(1,1) NOT NULL,
[email] [nvarchar](254),
[password] [nvarchar](500) NOT NULL,
[firstName] [nvarchar](120) NOT NULL,
[lastName] [nvarchar](150) NOT NULL,
[dateOfBirth] [datetime] NOT NULL,
[genderId] [tinyint] NOT NULL,
[zipcode] [nvarchar](30)
CONSTRAINT [PK_human] PRIMARY KEY CLUSTERED ([humanId])
CONSTRAINT [FK_genderId] FOREIGN KEY ([genderId]) REFERENCES [dbo].[gender] ON UPDATE CASCADE);