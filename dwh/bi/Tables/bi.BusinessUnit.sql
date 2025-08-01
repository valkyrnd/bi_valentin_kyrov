create table [bi].[BusinessUnit] (
	[ID] int not null,
	[Code] varchar(63) not null,
	[Name] varchar(255) not null,
	[MDT_DateCreate] datetime not null,
	[MDT_ID_PrincipalCreatedBy] int not null,
	[MDT_FlagActive] bit not null,
	[MDT_DateDeleted] datetime null,
	constraint [PK_BusinessUnit] primary key clustered ([ID] asc) with (STATISTICS_NORECOMPUTE = ON)
);
go
create unique nonclustered index [IX_BusinessUnit]
	on [bi].[BusinessUnit] ([ID] asc)
	with (STATISTICS_NORECOMPUTE = ON);