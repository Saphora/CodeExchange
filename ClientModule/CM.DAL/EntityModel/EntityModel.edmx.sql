
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/27/2016 12:29:37
-- Generated from EDMX file: C:\Projects\SecretView\ClientModule\CM.DAL\EntityModel\EntityModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SecretView-ClientModule];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ClientMetas'
CREATE TABLE [dbo].[ClientMetas] (
    [ClientID] uniqueidentifier  NOT NULL,
    [ClientCreateDate] bigint  NOT NULL,
    [ClientAuthorID] nvarchar(max)  NOT NULL,
    [ClientRowVersion] bigint  NOT NULL
);
GO

-- Creating table 'BusinessContactMetas'
CREATE TABLE [dbo].[BusinessContactMetas] (
    [BusinessContactID] uniqueidentifier  NOT NULL,
    [BusinessMetaCreateDate] nvarchar(max)  NOT NULL,
    [BusinessMetaAuthorID] nvarchar(max)  NOT NULL,
    [BusinessMetaRowVersion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'LocationMetas'
CREATE TABLE [dbo].[LocationMetas] (
    [LocationID] uniqueidentifier  NOT NULL,
    [LocationCreateDate] nvarchar(max)  NOT NULL,
    [LocationAuthorID] nvarchar(max)  NOT NULL,
    [LocationRowVersion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'LocationTypeMetas'
CREATE TABLE [dbo].[LocationTypeMetas] (
    [LocationTypeID] uniqueidentifier  NOT NULL,
    [LocationTypeAuthorID] nvarchar(max)  NOT NULL,
    [LocationTypeCreateDate] nvarchar(max)  NOT NULL,
    [LocationTypeRowVersion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'LocationMetas_Location'
CREATE TABLE [dbo].[LocationMetas_Location] (
    [LocationName] nvarchar(max)  NOT NULL,
    [LocationAddress] nvarchar(max)  NOT NULL,
    [LocationZip] nvarchar(max)  NOT NULL,
    [LocationCountry] nvarchar(max)  NOT NULL,
    [LocationPhone] nvarchar(max)  NOT NULL,
    [LocationWebsite] nvarchar(max)  NOT NULL,
    [LocationImageFileName] nvarchar(max)  NOT NULL,
    [LocationLat] nvarchar(max)  NOT NULL,
    [LocationLong] nvarchar(max)  NOT NULL,
    [LocationID] uniqueidentifier  NOT NULL,
    [LocationType_LocationTypeID] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'LocationTypeMetas_LocationType'
CREATE TABLE [dbo].[LocationTypeMetas_LocationType] (
    [LocationTypeName] nvarchar(max)  NOT NULL,
    [LocationTypeID] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'ClientMetas_Client'
CREATE TABLE [dbo].[ClientMetas_Client] (
    [ClientName] nvarchar(max)  NOT NULL,
    [ClientPhone] nvarchar(max)  NOT NULL,
    [ClientEmail] nvarchar(max)  NOT NULL,
    [ClientWebsite] nvarchar(max)  NOT NULL,
    [ClientLogoFileName] nvarchar(max)  NOT NULL,
    [ClientID] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'BusinessContactMetas_BusinessContact'
CREATE TABLE [dbo].[BusinessContactMetas_BusinessContact] (
    [BCGivenName] nvarchar(max)  NOT NULL,
    [BCSurName] nvarchar(max)  NOT NULL,
    [BCEmail] nvarchar(max)  NOT NULL,
    [BCPhone] nvarchar(max)  NOT NULL,
    [BCWebsite] nvarchar(max)  NOT NULL,
    [ClientClientID] uniqueidentifier  NOT NULL,
    [BusinessContactID] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'ClientLocation'
CREATE TABLE [dbo].[ClientLocation] (
    [ClientLocation_Location_ClientID] uniqueidentifier  NOT NULL,
    [Locations_LocationID] uniqueidentifier  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ClientID] in table 'ClientMetas'
ALTER TABLE [dbo].[ClientMetas]
ADD CONSTRAINT [PK_ClientMetas]
    PRIMARY KEY CLUSTERED ([ClientID] ASC);
GO

-- Creating primary key on [BusinessContactID] in table 'BusinessContactMetas'
ALTER TABLE [dbo].[BusinessContactMetas]
ADD CONSTRAINT [PK_BusinessContactMetas]
    PRIMARY KEY CLUSTERED ([BusinessContactID] ASC);
GO

-- Creating primary key on [LocationID] in table 'LocationMetas'
ALTER TABLE [dbo].[LocationMetas]
ADD CONSTRAINT [PK_LocationMetas]
    PRIMARY KEY CLUSTERED ([LocationID] ASC);
GO

-- Creating primary key on [LocationTypeID] in table 'LocationTypeMetas'
ALTER TABLE [dbo].[LocationTypeMetas]
ADD CONSTRAINT [PK_LocationTypeMetas]
    PRIMARY KEY CLUSTERED ([LocationTypeID] ASC);
GO

-- Creating primary key on [LocationID] in table 'LocationMetas_Location'
ALTER TABLE [dbo].[LocationMetas_Location]
ADD CONSTRAINT [PK_LocationMetas_Location]
    PRIMARY KEY CLUSTERED ([LocationID] ASC);
GO

-- Creating primary key on [LocationTypeID] in table 'LocationTypeMetas_LocationType'
ALTER TABLE [dbo].[LocationTypeMetas_LocationType]
ADD CONSTRAINT [PK_LocationTypeMetas_LocationType]
    PRIMARY KEY CLUSTERED ([LocationTypeID] ASC);
GO

-- Creating primary key on [ClientID] in table 'ClientMetas_Client'
ALTER TABLE [dbo].[ClientMetas_Client]
ADD CONSTRAINT [PK_ClientMetas_Client]
    PRIMARY KEY CLUSTERED ([ClientID] ASC);
GO

-- Creating primary key on [BusinessContactID] in table 'BusinessContactMetas_BusinessContact'
ALTER TABLE [dbo].[BusinessContactMetas_BusinessContact]
ADD CONSTRAINT [PK_BusinessContactMetas_BusinessContact]
    PRIMARY KEY CLUSTERED ([BusinessContactID] ASC);
GO

-- Creating primary key on [ClientLocation_Location_ClientID], [Locations_LocationID] in table 'ClientLocation'
ALTER TABLE [dbo].[ClientLocation]
ADD CONSTRAINT [PK_ClientLocation]
    PRIMARY KEY CLUSTERED ([ClientLocation_Location_ClientID], [Locations_LocationID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [LocationType_LocationTypeID] in table 'LocationMetas_Location'
ALTER TABLE [dbo].[LocationMetas_Location]
ADD CONSTRAINT [FK_LocationLocationType]
    FOREIGN KEY ([LocationType_LocationTypeID])
    REFERENCES [dbo].[LocationTypeMetas_LocationType]
        ([LocationTypeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LocationLocationType'
CREATE INDEX [IX_FK_LocationLocationType]
ON [dbo].[LocationMetas_Location]
    ([LocationType_LocationTypeID]);
GO

-- Creating foreign key on [ClientLocation_Location_ClientID] in table 'ClientLocation'
ALTER TABLE [dbo].[ClientLocation]
ADD CONSTRAINT [FK_ClientLocation_Client]
    FOREIGN KEY ([ClientLocation_Location_ClientID])
    REFERENCES [dbo].[ClientMetas_Client]
        ([ClientID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Locations_LocationID] in table 'ClientLocation'
ALTER TABLE [dbo].[ClientLocation]
ADD CONSTRAINT [FK_ClientLocation_Location]
    FOREIGN KEY ([Locations_LocationID])
    REFERENCES [dbo].[LocationMetas_Location]
        ([LocationID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientLocation_Location'
CREATE INDEX [IX_FK_ClientLocation_Location]
ON [dbo].[ClientLocation]
    ([Locations_LocationID]);
GO

-- Creating foreign key on [ClientClientID] in table 'BusinessContactMetas_BusinessContact'
ALTER TABLE [dbo].[BusinessContactMetas_BusinessContact]
ADD CONSTRAINT [FK_ClientBusinnessContact]
    FOREIGN KEY ([ClientClientID])
    REFERENCES [dbo].[ClientMetas_Client]
        ([ClientID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientBusinnessContact'
CREATE INDEX [IX_FK_ClientBusinnessContact]
ON [dbo].[BusinessContactMetas_BusinessContact]
    ([ClientClientID]);
GO

-- Creating foreign key on [LocationID] in table 'LocationMetas_Location'
ALTER TABLE [dbo].[LocationMetas_Location]
ADD CONSTRAINT [FK_Location_inherits_LocationMeta]
    FOREIGN KEY ([LocationID])
    REFERENCES [dbo].[LocationMetas]
        ([LocationID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [LocationTypeID] in table 'LocationTypeMetas_LocationType'
ALTER TABLE [dbo].[LocationTypeMetas_LocationType]
ADD CONSTRAINT [FK_LocationType_inherits_LocationTypeMeta]
    FOREIGN KEY ([LocationTypeID])
    REFERENCES [dbo].[LocationTypeMetas]
        ([LocationTypeID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ClientID] in table 'ClientMetas_Client'
ALTER TABLE [dbo].[ClientMetas_Client]
ADD CONSTRAINT [FK_Client_inherits_ClientMeta]
    FOREIGN KEY ([ClientID])
    REFERENCES [dbo].[ClientMetas]
        ([ClientID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [BusinessContactID] in table 'BusinessContactMetas_BusinessContact'
ALTER TABLE [dbo].[BusinessContactMetas_BusinessContact]
ADD CONSTRAINT [FK_BusinessContact_inherits_BusinessMeta]
    FOREIGN KEY ([BusinessContactID])
    REFERENCES [dbo].[BusinessContactMetas]
        ([BusinessContactID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------