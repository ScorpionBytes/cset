

GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[FINDING_CONTACT]'
GO
ALTER TABLE [dbo].[FINDING_CONTACT] DROP CONSTRAINT [FK_FINDING_CONTACT_USER_DETAIL_INFORMATION]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[GEN_FILE]'
GO
ALTER TABLE [dbo].[GEN_FILE] DROP CONSTRAINT [SYS_C0014719]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[NEW_REQUIREMENT]'
GO
ALTER TABLE [dbo].[NEW_REQUIREMENT] DROP CONSTRAINT [FK_NEW_REQUIREMENT_QUESTION_GROUP_HEADING]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[UNIVERSAL_SUB_CATEGORY_HEADINGS]'
GO
ALTER TABLE [dbo].[UNIVERSAL_SUB_CATEGORY_HEADINGS] DROP CONSTRAINT [FK_UNIVERSAL_SUB_CATEGORY_HEADINGS_QUESTION_GROUP_HEADING]
GO
ALTER TABLE [dbo].[UNIVERSAL_SUB_CATEGORY_HEADINGS] DROP CONSTRAINT [FK_UNIVERSAL_SUB_CATEGORY_HEADINGS_UNIVERSAL_SUB_CATEGORIES]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[USERS]'
GO
ALTER TABLE [dbo].[USERS] DROP CONSTRAINT [FK_USERS_USER_DETAIL_INFORMATION]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[UNIVERSAL_SUB_CATEGORY_HEADINGS]'
GO
ALTER TABLE [dbo].[UNIVERSAL_SUB_CATEGORY_HEADINGS] DROP CONSTRAINT [PK_UNIVERSAL_SUB_CATEGORY_HEADINGS_1]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[ASSESSMENTS]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[ASSESSMENTS] ADD
[CreditUnionName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Charter] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Assets] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IRPTotalOverride] [int] NULL,
[IRPTotalOverrideReason] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ASSESSMENT_IRP]'
GO
CREATE TABLE [dbo].[ASSESSMENT_IRP]
(
[Answer_Id] [int] NOT NULL IDENTITY(1, 1),
[Assessment_Id] [int] NOT NULL,
[IRP_Id] [int] NOT NULL,
[Response] [int] NULL,
[Comment] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_Assessment_IRP] on [dbo].[ASSESSMENT_IRP]'
GO
ALTER TABLE [dbo].[ASSESSMENT_IRP] ADD CONSTRAINT [PK_Assessment_IRP] PRIMARY KEY CLUSTERED  ([Assessment_Id], [IRP_Id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ASSESSMENT_IRP_HEADER]'
GO
CREATE TABLE [dbo].[ASSESSMENT_IRP_HEADER]
(
[HEADER_RISK_LEVEL_ID] [int] NULL,
[ASSESSMENT_ID] [int] NOT NULL,
[IRP_HEADER_ID] [int] NOT NULL,
[RISK_LEVEL] [int] NULL,
[COMMENT] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_ASSESSMENT_IRP_HEADER] on [dbo].[ASSESSMENT_IRP_HEADER]'
GO
ALTER TABLE [dbo].[ASSESSMENT_IRP_HEADER] ADD CONSTRAINT [PK_ASSESSMENT_IRP_HEADER] PRIMARY KEY CLUSTERED  ([ASSESSMENT_ID], [IRP_HEADER_ID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[IRP_HEADER]'
GO
CREATE TABLE [dbo].[IRP_HEADER]
(
[IRP_Header_Id] [int] NOT NULL,
[Header] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_IRP_HEADER] on [dbo].[IRP_HEADER]'
GO
ALTER TABLE [dbo].[IRP_HEADER] ADD CONSTRAINT [PK_IRP_HEADER] PRIMARY KEY CLUSTERED  ([IRP_Header_Id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[IRP]'
GO
CREATE TABLE [dbo].[IRP]
(
[IRP_ID] [int] NOT NULL,
[Item_Number] [int] NULL,
[Risk_1_Description] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Risk_2_Description] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Risk_3_Description] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Risk_4_Description] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Risk_5_Description] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Validation_Approach] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Header_Id] [int] NOT NULL,
[Description] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_IRP] on [dbo].[IRP]'
GO
ALTER TABLE [dbo].[IRP] ADD CONSTRAINT [PK_IRP] PRIMARY KEY CLUSTERED  ([IRP_ID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[ANSWER]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[ANSWER] ADD
[Reviewed] [bit] NOT NULL CONSTRAINT [DF_ANSWER_Reviewed] DEFAULT ((0))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ASSESSMENTS_REQUIRED_DOCUMENTATION]'
GO
CREATE TABLE [dbo].[ASSESSMENTS_REQUIRED_DOCUMENTATION]
(
[Assessment_Id] [int] NOT NULL,
[Documentation_Id] [int] NOT NULL,
[Answer] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_ASSESSMENTS_REQUIRED_DOCUMENTATION_Answer] DEFAULT ('N'),
[Comment] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_ASSESSMENTS_REQUIRED_DOCUMENTATION] on [dbo].[ASSESSMENTS_REQUIRED_DOCUMENTATION]'
GO
ALTER TABLE [dbo].[ASSESSMENTS_REQUIRED_DOCUMENTATION] ADD CONSTRAINT [PK_ASSESSMENTS_REQUIRED_DOCUMENTATION] PRIMARY KEY CLUSTERED  ([Assessment_Id], [Documentation_Id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[REQUIRED_DOCUMENTATION]'
GO
CREATE TABLE [dbo].[REQUIRED_DOCUMENTATION]
(
[Documentation_Id] [int] NOT NULL IDENTITY(1, 1),
[Number] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Document_Description] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RDH_Id] [int] NOT NULL,
[Document_Order] [int] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_REQUIRED_DOCUMENTATION] on [dbo].[REQUIRED_DOCUMENTATION]'
GO
ALTER TABLE [dbo].[REQUIRED_DOCUMENTATION] ADD CONSTRAINT [PK_REQUIRED_DOCUMENTATION] PRIMARY KEY CLUSTERED  ([Documentation_Id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[SETS]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[SETS] ADD
[IsACET] [bit] NOT NULL CONSTRAINT [DF_SETS_IsACET] DEFAULT ((0))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[APP_CODE]'
GO
CREATE TABLE [dbo].[APP_CODE]
(
[AppCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Populate APP_CODE table so that later foreign keys can be created
INSERT INTO [dbo].[APP_CODE] ([AppCode], [Description]) VALUES ('ACET', 'The NCUA ACET Application')
INSERT INTO [dbo].[APP_CODE] ([AppCode], [Description]) VALUES ('CSET', 'The Main CSET Application')



PRINT N'Creating primary key [PK_APP_CODE] on [dbo].[APP_CODE]'
GO
ALTER TABLE [dbo].[APP_CODE] ADD CONSTRAINT [PK_APP_CODE] PRIMARY KEY CLUSTERED  ([AppCode])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[DEMOGRAPHICS_ASSET_VALUES]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[DEMOGRAPHICS_ASSET_VALUES] ADD
[AppCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_DEMOGRAPHICS_ASSET_VALUES_AppCode] DEFAULT ('CSET')
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[FINANCIAL_ASSESSMENT_VALUES]'
GO
CREATE TABLE [dbo].[FINANCIAL_ASSESSMENT_VALUES]
(
[Assessment_Id] [int] NOT NULL,
[AttributeName] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AttributeValue] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_FINANCIAL_ASSESSMENT_VALUES] on [dbo].[FINANCIAL_ASSESSMENT_VALUES]'
GO
ALTER TABLE [dbo].[FINANCIAL_ASSESSMENT_VALUES] ADD CONSTRAINT [PK_FINANCIAL_ASSESSMENT_VALUES] PRIMARY KEY CLUSTERED  ([Assessment_Id], [AttributeName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[FINANCIAL_ATTRIBUTES]'
GO
CREATE TABLE [dbo].[FINANCIAL_ATTRIBUTES]
(
[AttributeName] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_FINANCIAL_ATTRIBUTES] on [dbo].[FINANCIAL_ATTRIBUTES]'
GO
ALTER TABLE [dbo].[FINANCIAL_ATTRIBUTES] ADD CONSTRAINT [PK_FINANCIAL_ATTRIBUTES] PRIMARY KEY CLUSTERED  ([AttributeName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[FINANCIAL_GROUPS]'
GO
CREATE TABLE [dbo].[FINANCIAL_GROUPS]
(
[FinancialGroupId] [int] NOT NULL IDENTITY(1, 1),
[DomainId] [int] NOT NULL,
[AssessmentFactorId] [int] NOT NULL,
[FinComponentId] [int] NOT NULL,
[MaturityId] [int] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_FINANCIAL_GROUPS] on [dbo].[FINANCIAL_GROUPS]'
GO
ALTER TABLE [dbo].[FINANCIAL_GROUPS] ADD CONSTRAINT [PK_FINANCIAL_GROUPS] PRIMARY KEY CLUSTERED  ([FinancialGroupId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating index [IX_FINANCIAL_GROUPS] on [dbo].[FINANCIAL_GROUPS]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FINANCIAL_GROUPS] ON [dbo].[FINANCIAL_GROUPS] ([DomainId], [AssessmentFactorId], [FinComponentId], [MaturityId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[FINANCIAL_DETAILS]'
GO
CREATE TABLE [dbo].[FINANCIAL_DETAILS]
(
[Label] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StmtNumber] [int] NOT NULL,
[FinancialGroupId] [int] NOT NULL,
[Binary Criteria ID] [float] NULL,
[Maturity Target] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CSC Organizational (17-20)] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CSC Foundational  (7-16)] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CSC Basic (1-6)] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CSC Mapping] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NCUA R&R 748 Mapping] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NCUA R&R 749 Mapping] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FFIEC Booklets Mapping] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_FINANCIAL_TIERS] on [dbo].[FINANCIAL_DETAILS]'
GO
ALTER TABLE [dbo].[FINANCIAL_DETAILS] ADD CONSTRAINT [PK_FINANCIAL_TIERS] PRIMARY KEY CLUSTERED  ([StmtNumber])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[FINANCIAL_FFIEC_MAPPINGS]'
GO
CREATE TABLE [dbo].[FINANCIAL_FFIEC_MAPPINGS]
(
[StmtNumber] [int] NOT NULL,
[FFIECBookletsMapping] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_FINANCIAL_FFIEC_MAPPINGS_1] on [dbo].[FINANCIAL_FFIEC_MAPPINGS]'
GO
ALTER TABLE [dbo].[FINANCIAL_FFIEC_MAPPINGS] ADD CONSTRAINT [PK_FINANCIAL_FFIEC_MAPPINGS_1] PRIMARY KEY CLUSTERED  ([StmtNumber], [FFIECBookletsMapping])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[FINANCIAL_ASSESSMENT_FACTORS]'
GO
CREATE TABLE [dbo].[FINANCIAL_ASSESSMENT_FACTORS]
(
[AssessmentFactorId] [int] NOT NULL,
[AssessmentFactor] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AssessmentFactorWeight] [int] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_FINANCIAL_ASSESSMENT_FACTORS] on [dbo].[FINANCIAL_ASSESSMENT_FACTORS]'
GO
ALTER TABLE [dbo].[FINANCIAL_ASSESSMENT_FACTORS] ADD CONSTRAINT [PK_FINANCIAL_ASSESSMENT_FACTORS] PRIMARY KEY CLUSTERED  ([AssessmentFactorId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating index [IX_FINANCIAL_ASSESSMENT_FACTORS] on [dbo].[FINANCIAL_ASSESSMENT_FACTORS]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FINANCIAL_ASSESSMENT_FACTORS] ON [dbo].[FINANCIAL_ASSESSMENT_FACTORS] ([AssessmentFactor])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[FINANCIAL_COMPONENTS]'
GO
CREATE TABLE [dbo].[FINANCIAL_COMPONENTS]
(
[FinComponentId] [int] NOT NULL,
[FinComponent] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_FINANCIAL_COMPONENTS] on [dbo].[FINANCIAL_COMPONENTS]'
GO
ALTER TABLE [dbo].[FINANCIAL_COMPONENTS] ADD CONSTRAINT [PK_FINANCIAL_COMPONENTS] PRIMARY KEY CLUSTERED  ([FinComponentId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating index [IX_FINANCIAL_COMPONENTS] on [dbo].[FINANCIAL_COMPONENTS]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FINANCIAL_COMPONENTS] ON [dbo].[FINANCIAL_COMPONENTS] ([FinComponent])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[FINANCIAL_DOMAINS]'
GO
CREATE TABLE [dbo].[FINANCIAL_DOMAINS]
(
[Domain] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DomainId] [int] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_FINANCIAL_DOMAINS] on [dbo].[FINANCIAL_DOMAINS]'
GO
ALTER TABLE [dbo].[FINANCIAL_DOMAINS] ADD CONSTRAINT [PK_FINANCIAL_DOMAINS] PRIMARY KEY CLUSTERED  ([DomainId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating index [IX_FINANCIAL_DOMAINS] on [dbo].[FINANCIAL_DOMAINS]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FINANCIAL_DOMAINS] ON [dbo].[FINANCIAL_DOMAINS] ([Domain])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[FINANCIAL_MATURITY]'
GO
CREATE TABLE [dbo].[FINANCIAL_MATURITY]
(
[MaturityId] [int] NOT NULL,
[MaturityLevel] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_FINANCIAL_MATURITY] on [dbo].[FINANCIAL_MATURITY]'
GO
ALTER TABLE [dbo].[FINANCIAL_MATURITY] ADD CONSTRAINT [PK_FINANCIAL_MATURITY] PRIMARY KEY CLUSTERED  ([MaturityId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating index [IX_FINANCIAL_MATURITY] on [dbo].[FINANCIAL_MATURITY]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FINANCIAL_MATURITY] ON [dbo].[FINANCIAL_MATURITY] ([MaturityLevel])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[FINANCIAL_HOURS]'
GO
CREATE TABLE [dbo].[FINANCIAL_HOURS]
(
[Assessment_Id] [int] NOT NULL,
[Component] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ReviewType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Hours] [decimal] (9, 2) NOT NULL CONSTRAINT [DF_FINANCIAL_ASSESSMENT_HOURS_Hours] DEFAULT ((0)),
[OtherSpecifyValue] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_FINANCIAL_ASSESSMENT_HOURS] on [dbo].[FINANCIAL_HOURS]'
GO
ALTER TABLE [dbo].[FINANCIAL_HOURS] ADD CONSTRAINT [PK_FINANCIAL_ASSESSMENT_HOURS] PRIMARY KEY CLUSTERED  ([Assessment_Id], [Component], [ReviewType])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[FINANCIAL_HOURS_COMPONENT]'
GO
CREATE TABLE [dbo].[FINANCIAL_HOURS_COMPONENT]
(
[Component] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DomainId] [int] NULL,
[PresentationOrder] [int] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_FINANCIAL_HOURS_COMPONENT] on [dbo].[FINANCIAL_HOURS_COMPONENT]'
GO
ALTER TABLE [dbo].[FINANCIAL_HOURS_COMPONENT] ADD CONSTRAINT [PK_FINANCIAL_HOURS_COMPONENT] PRIMARY KEY CLUSTERED  ([Component])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[FINANCIAL_REVIEWTYPE]'
GO
CREATE TABLE [dbo].[FINANCIAL_REVIEWTYPE]
(
[ReviewType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_FINANCIAL_REVIEWTYPE] on [dbo].[FINANCIAL_REVIEWTYPE]'
GO
ALTER TABLE [dbo].[FINANCIAL_REVIEWTYPE] ADD CONSTRAINT [PK_FINANCIAL_REVIEWTYPE] PRIMARY KEY CLUSTERED  ([ReviewType])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[FINANCIAL_QUESTIONS]'
GO
CREATE TABLE [dbo].[FINANCIAL_QUESTIONS]
(
[StmtNumber] [int] NOT NULL,
[Question_Id] [int] NOT NULL,
[Id] [int] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_FINANCIAL_QUESTIONS_1] on [dbo].[FINANCIAL_QUESTIONS]'
GO
ALTER TABLE [dbo].[FINANCIAL_QUESTIONS] ADD CONSTRAINT [PK_FINANCIAL_QUESTIONS_1] PRIMARY KEY CLUSTERED  ([StmtNumber], [Question_Id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[FINANCIAL_REQUIREMENTS]'
GO
CREATE TABLE [dbo].[FINANCIAL_REQUIREMENTS]
(
[StmtNumber] [int] NOT NULL,
[Requirement_Id] [int] NOT NULL,
[ID] [int] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_FINANCIAL_REQUIREMENTS] on [dbo].[FINANCIAL_REQUIREMENTS]'
GO
ALTER TABLE [dbo].[FINANCIAL_REQUIREMENTS] ADD CONSTRAINT [PK_FINANCIAL_REQUIREMENTS] PRIMARY KEY CLUSTERED  ([StmtNumber], [Requirement_Id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[NEW_REQUIREMENT]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[NEW_REQUIREMENT] ADD
[ExaminationApproach] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[FINANCIAL_TIERS]'
GO
CREATE TABLE [dbo].[FINANCIAL_TIERS]
(
[StmtNumber] [int] NOT NULL,
[Label] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_FINANCIAL_TIERS_1] on [dbo].[FINANCIAL_TIERS]'
GO
ALTER TABLE [dbo].[FINANCIAL_TIERS] ADD CONSTRAINT [PK_FINANCIAL_TIERS_1] PRIMARY KEY CLUSTERED  ([StmtNumber], [Label])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[FILE_TYPE]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[FILE_TYPE] ALTER COLUMN [Mime_Type] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[NEW_QUESTION_LEVELS]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[NEW_QUESTION_LEVELS] ADD
[IgnoreMe] [int] NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[UNIVERSAL_SUB_CATEGORY_HEADINGS]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[UNIVERSAL_SUB_CATEGORY_HEADINGS] ADD
[Set_Name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_UNIVERSAL_SUB_CATEGORY_HEADINGS_Set_Name] DEFAULT ('Standards')
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_UNIVERSAL_SUB_CATEGORY_HEADINGS_1] on [dbo].[UNIVERSAL_SUB_CATEGORY_HEADINGS]'
GO
ALTER TABLE [dbo].[UNIVERSAL_SUB_CATEGORY_HEADINGS] ADD CONSTRAINT [PK_UNIVERSAL_SUB_CATEGORY_HEADINGS_1] PRIMARY KEY CLUSTERED  ([Question_Group_Heading_Id], [Universal_Sub_Category_Id], [Set_Name])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[QUESTION_GROUP_HEADING]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[QUESTION_GROUP_HEADING] ADD
[Is_Custom] [bit] NOT NULL CONSTRAINT [DF_QUESTION_GROUP_HEADING_Is_Custom] DEFAULT ((0))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[REQUIRED_DOCUMENTATION_HEADERS]'
GO
CREATE TABLE [dbo].[REQUIRED_DOCUMENTATION_HEADERS]
(
[RDH_Id] [int] NOT NULL IDENTITY(1, 1),
[Requirement_Documentation_Header] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Header_Order] [int] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_REQUIRED_DOCUMENTATION_HEADERS] on [dbo].[REQUIRED_DOCUMENTATION_HEADERS]'
GO
ALTER TABLE [dbo].[REQUIRED_DOCUMENTATION_HEADERS] ADD CONSTRAINT [PK_REQUIRED_DOCUMENTATION_HEADERS] PRIMARY KEY CLUSTERED  ([RDH_Id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating index [IX_REQUIRED_DOCUMENTATION_HEADERS] on [dbo].[REQUIRED_DOCUMENTATION_HEADERS]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_REQUIRED_DOCUMENTATION_HEADERS] ON [dbo].[REQUIRED_DOCUMENTATION_HEADERS] ([Requirement_Documentation_Header])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[SET_FILES]'
GO
CREATE TABLE [dbo].[SET_FILES]
(
[SetName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Gen_File_Id] [int] NOT NULL,
[Comment] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_SET_FILES] on [dbo].[SET_FILES]'
GO
ALTER TABLE [dbo].[SET_FILES] ADD CONSTRAINT [PK_SET_FILES] PRIMARY KEY CLUSTERED  ([SetName], [Gen_File_Id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[UNIVERSAL_SUB_CATEGORIES]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[UNIVERSAL_SUB_CATEGORIES] ADD
[Is_Custom] [bit] NOT NULL CONSTRAINT [DF_UNIVERSAL_SUB_CATEGORIES_Is_Custom] DEFAULT ((0))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[Answer_Components]'
GO
EXEC sp_refreshview N'[dbo].[Answer_Components]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[vQUESTION_HEADINGS]'
GO
EXEC sp_refreshview N'[dbo].[vQUESTION_HEADINGS]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[Answer_Requirements]'
GO
EXEC sp_refreshview N'[dbo].[Answer_Requirements]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[Answer_Questions]'
GO
EXEC sp_refreshview N'[dbo].[Answer_Questions]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[VIEW_QUESTIONS_STATUS]'
GO
EXEC sp_refreshview N'[dbo].[VIEW_QUESTIONS_STATUS]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[vFinancialGroups]'
GO
CREATE VIEW [dbo].[vFinancialGroups]
AS
SELECT        dbo.FINANCIAL_GROUPS.FinancialGroupId, dbo.FINANCIAL_DOMAINS.Domain, dbo.FINANCIAL_MATURITY.MaturityLevel, dbo.FINANCIAL_ASSESSMENT_FACTORS.AssessmentFactor, 
                         dbo.FINANCIAL_COMPONENTS.FinComponent
FROM            dbo.FINANCIAL_GROUPS INNER JOIN
                         dbo.FINANCIAL_DOMAINS ON dbo.FINANCIAL_GROUPS.DomainId = dbo.FINANCIAL_DOMAINS.DomainId INNER JOIN
                         dbo.FINANCIAL_MATURITY ON dbo.FINANCIAL_GROUPS.MaturityId = dbo.FINANCIAL_MATURITY.MaturityId INNER JOIN
                         dbo.FINANCIAL_ASSESSMENT_FACTORS ON dbo.FINANCIAL_GROUPS.AssessmentFactorId = dbo.FINANCIAL_ASSESSMENT_FACTORS.AssessmentFactorId INNER JOIN
                         dbo.FINANCIAL_COMPONENTS ON dbo.FINANCIAL_GROUPS.FinComponentId = dbo.FINANCIAL_COMPONENTS.FinComponentId
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[usp_financial_attributes]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_financial_attributes]
	@Assessment_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
	INSERT INTO [dbo].[FINANCIAL_ASSESSMENT_VALUES]
			   ([Assessment_Id]
			   ,[AttributeName]
			   ,[AttributeValue])
	SELECT Assessment_Id = @Assessment_Id,a.AttributeName, isnull(AttributeValue,'No') AttributeValue
	  FROM [dbo].[FINANCIAL_ATTRIBUTES] a
		left join  [dbo].[FINANCIAL_ASSESSMENT_VALUES] v on a.AttributeName = v.AttributeName
		where v.AttributeName is null

	select * from FINANCIAL_ASSESSMENT_VALUES where Assessment_Id = @Assessment_Id
END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ExcelExport]'
GO
CREATE VIEW [dbo].[ExcelExport]
AS
SELECT        dbo.INFORMATION.Assessment_Name, dbo.INFORMATION.Facility_Name, dbo.INFORMATION.City_Or_Site_Name, dbo.INFORMATION.State_Province_Or_Region, 
                         dbo.INFORMATION.Executive_Summary, dbo.ASSESSMENTS.Assessment_Id, dbo.ASSESSMENTS.AssessmentCreatedDate, 
                         dbo.ASSESSMENTS.AssessmentCreatorId, dbo.ASSESSMENTS.LastAccessedDate, dbo.ASSESSMENTS.Alias, dbo.ASSESSMENTS.Assessment_GUID, 
                         dbo.ASSESSMENTS.Assessment_Date, dbo.ASSESSMENTS.CreditUnionName, dbo.ASSESSMENTS.Charter, dbo.ASSESSMENTS.Assets, 
                         dbo.INFORMATION.Assessment_Description, dbo.USERS.PrimaryEmail, dbo.USERS.UserId, dbo.USERS.PasswordResetRequired, dbo.USERS.FirstName, 
                         dbo.USERS.LastName
FROM            dbo.ASSESSMENTS INNER JOIN
                         dbo.INFORMATION ON dbo.ASSESSMENTS.Assessment_Id = dbo.INFORMATION.Id INNER JOIN
                         dbo.USERS ON dbo.ASSESSMENTS.AssessmentCreatorId = dbo.USERS.UserId
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Refreshing [dbo].[Answer_Questions_No_Components]'
GO
EXEC sp_refreshview N'[dbo].[Answer_Questions_No_Components]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[GetRelevantAnswers]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Returns a table containing ANSWER rows that are relevant
--              to the assessment's current question mode, standard selection and SAL level.
-- =============================================
CREATE PROCEDURE [dbo].[GetRelevantAnswers]
	@assessment_id int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	EXECUTE [dbo].[FillEmptyQuestionsForAnalysis]  @Assessment_Id

	-- get the application mode
	declare @applicationMode varchar(50)
	exec dbo.GetApplicationModeDefault @assessment_id, @ApplicationMode output

	-- get currently selected sets
	IF OBJECT_ID('tempdb..#mySets') IS NOT NULL DROP TABLE #mySets
	select set_name into #mySets from AVAILABLE_STANDARDS where Assessment_Id = @assessment_Id and Selected = 1
	
	if(@ApplicationMode = 'Questions Based')	
	begin
		
		select a.assessment_id, a.answer_id, a.is_requirement, a.question_or_requirement_id, a.component_id, a.mark_for_review, 
			a.comment, a.alternate_justification, a.question_number, a.answer_text, 
			a.component_guid, a.is_component, a.custom_question_guid, a.is_framework, a.old_answer_id, a.reviewed

			FROM ANSWER a 
			join NEW_QUESTION c on a.Question_Or_Requirement_Id = c.Question_Id			
			join (
				select distinct s.question_id, ns.Short_Name from NEW_QUESTION_SETS s 
					join AVAILABLE_STANDARDS v on s.Set_Name = v.Set_Name 								
					join SETS ns on s.Set_Name = ns.Set_Name
					join NEW_QUESTION_LEVELS l on s.New_Question_Set_Id = l.New_Question_Set_Id
					join STANDARD_SELECTION ss on v.Assessment_Id = ss.Assessment_Id
					join UNIVERSAL_SAL_LEVEL ul on ss.Selected_Sal_Level = ul.Full_Name_Sal
					where v.Selected = 1 and v.Assessment_Id = @assessment_id and l.Universal_Sal_Level = ul.Universal_Sal_Level
			)	s on c.Question_Id = s.Question_Id		
			where a.Assessment_Id = @assessment_id 
			and a.Is_Requirement = 0
	
	end
	else
	begin		

		select a.assessment_id, a.answer_id, a.is_requirement, a.question_or_requirement_id, a.component_id, a.mark_for_review, 
			a.comment, a.alternate_justification, a.question_number, a.answer_text, 
			a.component_guid, a.is_component, a.custom_question_guid, a.is_framework, a.old_answer_id, a.reviewed

			from REQUIREMENT_SETS rs
				left join ANSWER a on a.Question_Or_Requirement_Id = rs.Requirement_Id
				left join [SETS] s on rs.Set_Name = s.Set_Name
				left join NEW_REQUIREMENT req on rs.Requirement_Id = req.Requirement_Id
				left join REQUIREMENT_LEVELS rl on rl.Requirement_Id = req.Requirement_Id		
				left join STANDARD_SELECTION ss on ss.Assessment_Id = @assessment_Id
				left join UNIVERSAL_SAL_LEVEL u on u.Full_Name_Sal = ss.Selected_Sal_Level
			where rs.Set_Name in (select set_name from #mySets)
			and a.Assessment_Id = @assessment_id
			and rl.Standard_Level = u.Universal_Sal_Level 	

	end
END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[usp_MaturityDetailsCalculations]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_MaturityDetailsCalculations]
	-- Add the parameters for the stored procedure here
	@Assessment_Id int
AS
BEGIN
	declare @applicationMode varchar(50)

	exec dbo.GetApplicationModeDefault @assessment_id, @ApplicationMode output

	SET NOCOUNT ON;
	EXECUTE [dbo].[FillEmptyQuestionsForAnalysis]  @Assessment_Id

	if(@ApplicationMode = 'Questions Based')	
	BEGIN    
	select grouporder, a.Total,Domain,AssessmentFactor,FinComponent,MaturityLevel,b.Answer_Text, isnull(b.acount, 0) as acount,   isnull((cast(b.acount as float)/cast(total as float)),0) as AnswerPercent, CAST(c.complete AS BIT) AS complete from (
			select distinct min(StmtNumber) as grouporder, fd.financialGroupId, Domain,AssessmentFactor,FinComponent,MaturityLevel,count(stmtnumber) Total
			FROM [FINANCIAL_DETAILS] fd 
			JOIN vFinancialGroups g ON fd.financialGroupId = g.financialGroupId			
			GROUP BY fd.financialGroupId,Domain,AssessmentFactor,FinComponent,MaturityLevel				
			) a 
		left join (SELECT  fd.FinancialGroupId , answer_text, count(a.Answer_Text) acount
			FROM       [dbo].[FINANCIAL_QUESTIONS] f
			INNER JOIN [dbo].[NEW_QUESTION] q ON f.[Question_Id] = q.[Question_Id]
			INNER JOIN (select assessment_id,Question_Or_Requirement_Id, is_requirement, case when Answer_Text in ('Y','A','NA') then 'Y'   end as Answer_Text from [dbo].[ANSWER] where Assessment_Id = @Assessment_Id and answer_text not in ('U','N')) a ON F.[Question_Id] = a.[Question_Or_Requirement_Id]
			INNER JOIN [dbo].[FINANCIAL_DETAILS] AS FD ON f.[StmtNumber] = FD.[StmtNumber]    			
			WHERE [Assessment_Id] = @Assessment_Id AND [Is_Requirement] = 0 
			group by fd.FinancialGroupId, Answer_Text
			)  b  on a.financialGroupId = b.FinancialGroupId
    	join (SELECT fd.financialGroupId,  min(case answer_text when 'U' then 0 else 1 end) as Complete
			from (select * from [ANSWER] WHERE assessment_Id=@assessment_id and Is_Requirement = 0) u 
			join [dbo].[FINANCIAL_QUESTIONS] f ON F.[Question_Id] = u.[Question_Or_Requirement_Id]						
			INNER JOIN [dbo].[FINANCIAL_DETAILS] AS FD ON f.[StmtNumber] = FD.[StmtNumber]    
			WHERE assessment_Id=@assessment_id 
			group by fd.financialGroupId) c on a.FinancialGroupId = c.FinancialGroupId
		order by grouporder			
	end 
	else
	begin 	
	select grouporder, a.Total,Domain,AssessmentFactor,FinComponent,MaturityLevel,b.Answer_Text, isnull(b.acount, 0) as acount,   isnull((cast(b.acount as float)/cast(total as float)),0) as AnswerPercent , CAST(c.Complete AS BIT) AS complete FROM (
			select distinct min(StmtNumber) as grouporder, fd.financialGroupId,Domain,AssessmentFactor,FinComponent,MaturityLevel,count(stmtnumber) Total 
			FROM [FINANCIAL_DETAILS] fd 
			JOIN vFinancialGroups g ON fd.financialGroupId = g.financialGroupId	
			group by fd.FinancialGroupId,Domain,AssessmentFactor,FinComponent,MaturityLevel				
			) a 
		left join (SELECT  fd.FinancialGroupId, answer_text, count(a.Answer_Text) acount
			FROM       [dbo].[FINANCIAL_REQUIREMENTS] f
			INNER JOIN [dbo].[NEW_REQUIREMENT] q ON f.[Requirement_Id] = q.[Requirement_Id]
			INNER JOIN (select assessment_id,Question_Or_Requirement_Id, is_requirement, case when Answer_Text in ('Y','A','NA') then 'Y' else 'N' end as Answer_Text from [dbo].[ANSWER] where Assessment_Id = @Assessment_Id and answer_text not in ('U','N')) a ON F.[Requirement_Id] = a.[Question_Or_Requirement_Id]
			INNER JOIN [dbo].[FINANCIAL_DETAILS] AS FD ON f.[StmtNumber] = FD.[StmtNumber]    			
			WHERE [Assessment_Id] = @Assessment_Id AND [Is_Requirement] = 1 
			group by fd.FinancialGroupId, Answer_Text
			) b  on a.FinancialGroupId = b.FinancialGroupId
		join (SELECT fd.financialGroupId,  min(case answer_text when 'U' then 0 else 1 end) as Complete
			from (select * from [ANSWER] WHERE assessment_Id=@assessment_id and Is_Requirement = 1)  u 
			join [dbo].[FINANCIAL_REQUIREMENTS] f ON F.[Requirement_Id] = u.[Question_Or_Requirement_Id]						
			INNER JOIN [dbo].[FINANCIAL_DETAILS] AS FD ON f.[StmtNumber] = FD.[StmtNumber]    
			WHERE assessment_Id=@assessment_id 
			group by fd.financialGroupId) c on a.FinancialGroupId = c.FinancialGroupId
		order by grouporder
	end

				
END

GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[usp_StatementsReviewed]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_StatementsReviewed]
	@Assessment_Id int	
AS
BEGIN

------------- get relevant answers ----------------
	IF OBJECT_ID('tempdb..#answers') IS NOT NULL DROP TABLE #answers

	create table #answers (assessment_id int, answer_id int, is_requirement bit, question_or_requirement_id int, component_id int, mark_for_review bit, 
	comment ntext, alternate_justification ntext, question_number int, answer_text varchar(50), 
	component_guid varchar(36), is_component bit, custom_question_guid varchar(50), is_framework bit, old_answer_id int, reviewed bit)

	insert into #answers exec [GetRelevantAnswers] @assessment_id

----------------------------------------

	declare @applicationMode varchar(50)

	exec dbo.GetApplicationModeDefault @assessment_id, @ApplicationMode output

	SET NOCOUNT ON;

	EXECUTE [dbo].[FillEmptyQuestionsForAnalysis]  @Assessment_Id

	if(@ApplicationMode = 'Questions Based')	
	BEGIN

		SELECT assessment_id, c.Component, ReviewType, Hours, isnull(ReviewedCount, 0) as ReviewedCount, f.OtherSpecifyValue, c.DomainId, PresentationOrder, grouporder acount
		from FINANCIAL_HOURS f 
			join FINANCIAL_HOURS_COMPONENT c on f.Component = c.Component
			left join (
				select grouporder, a.DomainId, isnull(ReviewedCount, 0) as ReviewedCount
				from (
						select distinct min(StmtNumber) as grouporder, d.Domain, g.DomainId,count(stmtnumber) Total from [FINANCIAL_DETAILS] fd 
						INNER JOIN dbo.FINANCIAL_GROUPS G on FD.FinancialGroupId = g.FinancialGroupId		
						INNER JOIN [dbo].[FINANCIAL_DOMAINS] AS D ON g.[DomainId] = D.[DomainId]						
						group by g.DomainId, d.Domain
						)  a left join (
						SELECT  g.DomainId, isnull(count(ans_rev.answer_id), 0) as ReviewedCount
						FROM       [dbo].[FINANCIAL_QUESTIONS] f			
						INNER JOIN [dbo].[NEW_QUESTION] q ON f.[Question_Id] = q.[Question_Id]
						INNER JOIN #answers a ON q.[Question_Id] = a.[Question_Or_Requirement_Id]
						INNER JOIN #answers ans_rev ON q.[Question_Id] = ans_rev.[Question_Or_Requirement_Id]
						INNER JOIN [dbo].[FINANCIAL_DETAILS] AS FD ON f.[StmtNumber] = FD.[StmtNumber]    
						inner join dbo.FINANCIAL_GROUPS G on FD.FinancialGroupId = g.FinancialGroupId
						WHERE ans_rev.Reviewed = 1
						group by g.DomainId
						) b  on a.DomainId = b.DomainId
		) b on c.DomainId = b.DomainId		
		where f.assessment_id = @assessment_id
		order by PresentationOrder

	END 
	ELSE
	BEGIN 

		SELECT Assessment_id, c.Component, ReviewType, Hours, isnull(ReviewedCount, 0) as ReviewedCount, f.OtherSpecifyValue, c.DomainId, PresentationOrder, grouporder acount
		from FINANCIAL_HOURS f 
		join FINANCIAL_HOURS_COMPONENT c on f.Component = c.Component
		left join (
			select grouporder, a.DomainId, isnull(ReviewedCount, 0) as ReviewedCount
			from (
					select distinct min(StmtNumber) as grouporder, d.Domain, g.DomainId, count(stmtnumber) Total from [FINANCIAL_DETAILS] fd 
					INNER JOIN dbo.FINANCIAL_GROUPS G on FD.FinancialGroupId = g.FinancialGroupId		
					INNER JOIN [dbo].[FINANCIAL_DOMAINS] AS D ON g.[DomainId] = D.[DomainId]			
					group by g.DomainId, d.Domain
					)  a left join (
					SELECT  g.DomainId, isnull(count(ans_rev.Answer_Id), 0) as ReviewedCount
					FROM       [dbo].[FINANCIAL_REQUIREMENTS] f
					INNER JOIN [dbo].[NEW_REQUIREMENT] q ON f.[Requirement_Id] = q.[Requirement_Id]
					INNER JOIN #answers a ON q.[Requirement_Id] = a.[Question_Or_Requirement_Id]
					INNER JOIN #answers ans_rev ON q.[Requirement_Id] = ans_rev.[Question_Or_Requirement_Id]
					INNER JOIN [dbo].[FINANCIAL_DETAILS] AS FD ON f.[StmtNumber] = FD.[StmtNumber]    
					inner join dbo.FINANCIAL_GROUPS G on FD.FinancialGroupId = g.FinancialGroupId
					WHERE ans_rev.Reviewed = 1
					group by g.DomainId
					) b  on a.DomainId = b.DomainId 		
		) b on c.DomainId = b.DomainId
		where f.assessment_id = @assessment_id
		order by PresentationOrder		
			
	END
	
END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[usp_StatementsReviewedTabTotals]'
GO
-- =============================================
-- Author:		hansbk
-- Create date: Mar 2, 2019
-- Description:	fill it and if missing get the data 
-- =============================================
CREATE PROCEDURE [dbo].[usp_StatementsReviewedTabTotals]
	@Assessment_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO [dbo].[FINANCIAL_HOURS]
				([Assessment_Id]
				,[Component]
				,[ReviewType]
				,[Hours])     
	select a.* from (
	SELECT @assessment_id Assessment_id, Component, ReviewType, [Hours] = 0
		FROM [dbo].[FINANCIAL_HOURS_COMPONENT], FINANCIAL_REVIEWTYPE) a left join [dbo].[FINANCIAL_HOURS] f on 
		a.Assessment_id = f.Assessment_Id and a.Component = f.Component and a.ReviewType = f.ReviewType
		where f.Assessment_Id is null
  
	select * from (select Assessment_Id,ReviewType,sum([Hours]) as Totals from FINANCIAL_HOURS
	where assessment_id = @Assessment_id
	group by Assessment_Id,ReviewType) a,(
	select SUM([Hours]) AS GrandTotal from FINANCIAL_HOURS
	where assessment_id = @Assessment_id) b
END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[EXTRA_ACET_MAPPING]'
GO
CREATE TABLE [dbo].[EXTRA_ACET_MAPPING]
(
[Set_Name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Question_Id] [int] NOT NULL,
[New_Question_Set_Id] [int] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_EXTRA_ACET_MAPPING] on [dbo].[EXTRA_ACET_MAPPING]'
GO
ALTER TABLE [dbo].[EXTRA_ACET_MAPPING] ADD CONSTRAINT [PK_EXTRA_ACET_MAPPING] PRIMARY KEY CLUSTERED  ([Set_Name], [Question_Id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[LEVEL_BACKUP_ACET]'
GO
CREATE TABLE [dbo].[LEVEL_BACKUP_ACET]
(
[requirement_id] [int] NOT NULL,
[Standard_Level] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_LEVEL_BACKUP_ACET] on [dbo].[LEVEL_BACKUP_ACET]'
GO
ALTER TABLE [dbo].[LEVEL_BACKUP_ACET] ADD CONSTRAINT [PK_LEVEL_BACKUP_ACET] PRIMARY KEY CLUSTERED  ([requirement_id], [Standard_Level])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[LEVEL_BACKUP_ACET_QUESTIONS]'
GO
CREATE TABLE [dbo].[LEVEL_BACKUP_ACET_QUESTIONS]
(
[question_id] [int] NOT NULL,
[New_Question_Set_Id] [int] NOT NULL,
[universal_sal_level] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_LEVEL_BACKUP_ACET_QUESTIONS] on [dbo].[LEVEL_BACKUP_ACET_QUESTIONS]'
GO
ALTER TABLE [dbo].[LEVEL_BACKUP_ACET_QUESTIONS] ADD CONSTRAINT [PK_LEVEL_BACKUP_ACET_QUESTIONS] PRIMARY KEY CLUSTERED  ([New_Question_Set_Id], [universal_sal_level])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[ASSESSMENTS_REQUIRED_DOCUMENTATION]'
GO
ALTER TABLE [dbo].[ASSESSMENTS_REQUIRED_DOCUMENTATION] ADD CONSTRAINT [CK_ASSESSMENTS_REQUIRED_DOCUMENTATION] CHECK (([Answer]='NA' OR [Answer]='N' OR [Answer]='Y'))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[DEMOGRAPHICS_ASSET_VALUES]'
GO
ALTER TABLE [dbo].[DEMOGRAPHICS_ASSET_VALUES] ADD CONSTRAINT [FK_DEMOGRAPHICS_ASSET_VALUES_APP_CODE] FOREIGN KEY ([AppCode]) REFERENCES [dbo].[APP_CODE] ([AppCode]) ON DELETE CASCADE ON UPDATE CASCADE
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[ASSESSMENTS_REQUIRED_DOCUMENTATION]'
GO
ALTER TABLE [dbo].[ASSESSMENTS_REQUIRED_DOCUMENTATION] ADD CONSTRAINT [FK_ASSESSMENTS_REQUIRED_DOCUMENTATION_ASSESSMENTS] FOREIGN KEY ([Assessment_Id]) REFERENCES [dbo].[ASSESSMENTS] ([Assessment_Id]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ASSESSMENTS_REQUIRED_DOCUMENTATION] ADD CONSTRAINT [FK_ASSESSMENTS_REQUIRED_DOCUMENTATION_REQUIRED_DOCUMENTATION] FOREIGN KEY ([Documentation_Id]) REFERENCES [dbo].[REQUIRED_DOCUMENTATION] ([Documentation_Id]) ON DELETE CASCADE
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[ASSESSMENT_IRP]'
GO
ALTER TABLE [dbo].[ASSESSMENT_IRP] ADD CONSTRAINT [FK__Assessmen__Asses__5DEAEAF5] FOREIGN KEY ([Assessment_Id]) REFERENCES [dbo].[ASSESSMENTS] ([Assessment_Id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ASSESSMENT_IRP] ADD CONSTRAINT [FK__Assessmen__IRP_I__5EDF0F2E] FOREIGN KEY ([IRP_Id]) REFERENCES [dbo].[IRP] ([IRP_ID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[ASSESSMENT_IRP_HEADER]'
GO
ALTER TABLE [dbo].[ASSESSMENT_IRP_HEADER] ADD CONSTRAINT [FK__ASSESSMEN__ASSES__658C0CBD] FOREIGN KEY ([ASSESSMENT_ID]) REFERENCES [dbo].[ASSESSMENTS] ([Assessment_Id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ASSESSMENT_IRP_HEADER] ADD CONSTRAINT [FK__ASSESSMEN__IRP_H__668030F6] FOREIGN KEY ([IRP_HEADER_ID]) REFERENCES [dbo].[IRP_HEADER] ([IRP_Header_Id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[FINANCIAL_GROUPS]'
GO
ALTER TABLE [dbo].[FINANCIAL_GROUPS] ADD CONSTRAINT [FK_FINANCIAL_GROUPS_FINANCIAL_ASSESSMENT_FACTORS] FOREIGN KEY ([AssessmentFactorId]) REFERENCES [dbo].[FINANCIAL_ASSESSMENT_FACTORS] ([AssessmentFactorId]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[FINANCIAL_GROUPS] ADD CONSTRAINT [FK_FINANCIAL_GROUPS_FINANCIAL_COMPONENTS] FOREIGN KEY ([FinComponentId]) REFERENCES [dbo].[FINANCIAL_COMPONENTS] ([FinComponentId]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[FINANCIAL_GROUPS] ADD CONSTRAINT [FK_FINANCIAL_GROUPS_FINANCIAL_DOMAINS] FOREIGN KEY ([DomainId]) REFERENCES [dbo].[FINANCIAL_DOMAINS] ([DomainId]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[FINANCIAL_GROUPS] ADD CONSTRAINT [FK_FINANCIAL_GROUPS_FINANCIAL_MATURITY] FOREIGN KEY ([MaturityId]) REFERENCES [dbo].[FINANCIAL_MATURITY] ([MaturityId]) ON DELETE CASCADE ON UPDATE CASCADE
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[FINANCIAL_ASSESSMENT_VALUES]'
GO
ALTER TABLE [dbo].[FINANCIAL_ASSESSMENT_VALUES] ADD CONSTRAINT [FK_FINANCIAL_ASSESSMENT_VALUES_ASSESSMENTS] FOREIGN KEY ([Assessment_Id]) REFERENCES [dbo].[ASSESSMENTS] ([Assessment_Id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[FINANCIAL_ASSESSMENT_VALUES] ADD CONSTRAINT [FK_FINANCIAL_ASSESSMENT_VALUES_FINANCIAL_ATTRIBUTES] FOREIGN KEY ([AttributeName]) REFERENCES [dbo].[FINANCIAL_ATTRIBUTES] ([AttributeName]) ON DELETE CASCADE ON UPDATE CASCADE
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[FINANCIAL_FFIEC_MAPPINGS]'
GO
ALTER TABLE [dbo].[FINANCIAL_FFIEC_MAPPINGS] ADD CONSTRAINT [FK_FINANCIAL_FFIEC_MAPPINGS_FINANCIAL_DETAILS] FOREIGN KEY ([StmtNumber]) REFERENCES [dbo].[FINANCIAL_DETAILS] ([StmtNumber]) ON DELETE CASCADE
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[FINANCIAL_QUESTIONS]'
GO
ALTER TABLE [dbo].[FINANCIAL_QUESTIONS] ADD CONSTRAINT [FK_FINANCIAL_QUESTIONS_FINANCIAL_DETAILS] FOREIGN KEY ([StmtNumber]) REFERENCES [dbo].[FINANCIAL_DETAILS] ([StmtNumber]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FINANCIAL_QUESTIONS] ADD CONSTRAINT [FK_FINANCIAL_QUESTIONS_NEW_QUESTION] FOREIGN KEY ([Question_Id]) REFERENCES [dbo].[NEW_QUESTION] ([Question_Id]) ON DELETE CASCADE
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[FINANCIAL_REQUIREMENTS]'
GO
ALTER TABLE [dbo].[FINANCIAL_REQUIREMENTS] ADD CONSTRAINT [FK_FINANCIAL_REQUIREMENTS_FINANCIAL_DETAILS] FOREIGN KEY ([StmtNumber]) REFERENCES [dbo].[FINANCIAL_DETAILS] ([StmtNumber]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FINANCIAL_REQUIREMENTS] ADD CONSTRAINT [FK_FINANCIAL_REQUIREMENTS_NEW_REQUIREMENT] FOREIGN KEY ([Requirement_Id]) REFERENCES [dbo].[NEW_REQUIREMENT] ([Requirement_Id]) ON DELETE CASCADE
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[FINANCIAL_TIERS]'
GO
ALTER TABLE [dbo].[FINANCIAL_TIERS] ADD CONSTRAINT [FK_FINANCIAL_TIERS_FINANCIAL_DETAILS] FOREIGN KEY ([StmtNumber]) REFERENCES [dbo].[FINANCIAL_DETAILS] ([StmtNumber]) ON DELETE CASCADE
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[FINANCIAL_DETAILS]'
GO
ALTER TABLE [dbo].[FINANCIAL_DETAILS] ADD CONSTRAINT [FK_FINANCIAL_DETAILS_FINANCIAL_GROUPS] FOREIGN KEY ([FinancialGroupId]) REFERENCES [dbo].[FINANCIAL_GROUPS] ([FinancialGroupId]) ON DELETE CASCADE ON UPDATE CASCADE
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[FINANCIAL_HOURS_COMPONENT]'
GO
ALTER TABLE [dbo].[FINANCIAL_HOURS_COMPONENT] ADD CONSTRAINT [FK_FINANCIAL_HOURS_COMPONENT_FINANCIAL_DOMAINS] FOREIGN KEY ([DomainId]) REFERENCES [dbo].[FINANCIAL_DOMAINS] ([DomainId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[FINANCIAL_HOURS]'
GO
ALTER TABLE [dbo].[FINANCIAL_HOURS] ADD CONSTRAINT [FK_FINANCIAL_HOURS_ASSESSMENTS] FOREIGN KEY ([Assessment_Id]) REFERENCES [dbo].[ASSESSMENTS] ([Assessment_Id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[FINANCIAL_HOURS] ADD CONSTRAINT [FK_FINANCIAL_HOURS_FINANCIAL_HOURS_COMPONENT] FOREIGN KEY ([Component]) REFERENCES [dbo].[FINANCIAL_HOURS_COMPONENT] ([Component]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[FINANCIAL_HOURS] ADD CONSTRAINT [FK_FINANCIAL_HOURS_FINANCIAL_REVIEWTYPE] FOREIGN KEY ([ReviewType]) REFERENCES [dbo].[FINANCIAL_REVIEWTYPE] ([ReviewType]) ON DELETE CASCADE ON UPDATE CASCADE
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[GEN_FILE]'
GO
ALTER TABLE [dbo].[GEN_FILE] ADD CONSTRAINT [FK_GEN_FILE_FILE_TYPE] FOREIGN KEY ([File_Type_Id]) REFERENCES [dbo].[FILE_TYPE] ([File_Type_Id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[IRP]'
GO
ALTER TABLE [dbo].[IRP] ADD CONSTRAINT [FK_IRP_IRP_HEADER] FOREIGN KEY ([Header_Id]) REFERENCES [dbo].[IRP_HEADER] ([IRP_Header_Id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[NEW_QUESTION]'
GO
ALTER TABLE [dbo].[NEW_QUESTION] ADD CONSTRAINT [FK_NEW_QUESTION_UNIVERSAL_SAL_LEVEL] FOREIGN KEY ([Universal_Sal_Level]) REFERENCES [dbo].[UNIVERSAL_SAL_LEVEL] ([Universal_Sal_Level]) ON UPDATE CASCADE
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[NEW_REQUIREMENT]'
GO
ALTER TABLE [dbo].[NEW_REQUIREMENT] ADD CONSTRAINT [FK_NEW_REQUIREMENT_QUESTION_GROUP_HEADING] FOREIGN KEY ([Question_Group_Heading_Id]) REFERENCES [dbo].[QUESTION_GROUP_HEADING] ([Question_Group_Heading_Id]) ON UPDATE CASCADE
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[REQUIRED_DOCUMENTATION]'
GO
ALTER TABLE [dbo].[REQUIRED_DOCUMENTATION] ADD CONSTRAINT [FK_REQUIRED_DOCUMENTATION_REQUIRED_DOCUMENTATION_HEADERS] FOREIGN KEY ([RDH_Id]) REFERENCES [dbo].[REQUIRED_DOCUMENTATION_HEADERS] ([RDH_Id]) ON DELETE CASCADE
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[SET_FILES]'
GO
ALTER TABLE [dbo].[SET_FILES] ADD CONSTRAINT [FK_SET_FILES_SETS] FOREIGN KEY ([SetName]) REFERENCES [dbo].[SETS] ([Set_Name]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SET_FILES] ADD CONSTRAINT [FK_SET_FILES_GEN_FILE] FOREIGN KEY ([Gen_File_Id]) REFERENCES [dbo].[GEN_FILE] ([Gen_File_Id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[UNIVERSAL_SUB_CATEGORY_HEADINGS]'
GO
ALTER TABLE [dbo].[UNIVERSAL_SUB_CATEGORY_HEADINGS] ADD CONSTRAINT [FK_UNIVERSAL_SUB_CATEGORY_HEADINGS_SETS] FOREIGN KEY ([Set_Name]) REFERENCES [dbo].[SETS] ([Set_Name]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[UNIVERSAL_SUB_CATEGORY_HEADINGS] ADD CONSTRAINT [FK_UNIVERSAL_SUB_CATEGORY_HEADINGS_QUESTION_GROUP_HEADING] FOREIGN KEY ([Question_Group_Heading_Id]) REFERENCES [dbo].[QUESTION_GROUP_HEADING] ([Question_Group_Heading_Id]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[UNIVERSAL_SUB_CATEGORY_HEADINGS] ADD CONSTRAINT [FK_UNIVERSAL_SUB_CATEGORY_HEADINGS_UNIVERSAL_SUB_CATEGORIES] FOREIGN KEY ([Universal_Sub_Category_Id]) REFERENCES [dbo].[UNIVERSAL_SUB_CATEGORIES] ([Universal_Sub_Category_Id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Enabling constraints on [dbo].[GEN_FILE]'
GO
ALTER TABLE [dbo].[GEN_FILE] WITH CHECK CHECK CONSTRAINT [FK_GEN_FILE_FILE_REF_KEYS]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO



