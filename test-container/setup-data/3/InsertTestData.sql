USE [TESTDB]
GO
SET IDENTITY_INSERT [dbo].[Persons] ON 
INSERT [dbo].[Persons] ([Id], [Name], [Gender]) VALUES (1, N'Tom Brown', 1)
SET IDENTITY_INSERT [dbo].[Persons] OFF
