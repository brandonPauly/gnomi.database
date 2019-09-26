CREATE DATABASE gnomi_dev;

GO

USE gnomi_dev;


CREATE TABLE [dbo].[gender]
(
	[genderId] [tinyint] IDENTITY(1,1) NOT NULL,
	[genderName] [nvarchar](150),
	CONSTRAINT [PK_gender] PRIMARY KEY ([genderId])
);

CREATE TABLE [dbo].[human]
(
	[humanId] [bigint] IDENTITY(1,1) NOT NULL UNIQUE,
	[email] [nvarchar](254) NOT NULL UNIQUE,
	[password] [nvarchar](500) NOT NULL,
	[firstName] [nvarchar](120),
	[lastName] [nvarchar](150),
	[dateOfBirth] [datetime],
	[genderId] [tinyint],
	[zipcode] [nvarchar](30),
	[signUpDate] [DateTime],
	[isVerified] [bit],
	CONSTRAINT [PK_human] PRIMARY KEY CLUSTERED ([humanId]),
	CONSTRAINT [FK_genderId] FOREIGN KEY ([genderId]) REFERENCES [dbo].[gender] ON UPDATE CASCADE
);

CREATE TABLE [dbo].[verificationKey]
(
	[humanId] [bigint] NOT NULL UNIQUE,
	[verificationCode] [nvarchar](60) NOT NULL,
	CONSTRAINT [PK_verificationKey] PRIMARY KEY ([humanId], [verificationCode]),
	CONSTRAINT [FK_humanId] FOREIGN KEY ([humanId]) REFERENCES [dbo].[human] ON UPDATE CASCADE
);