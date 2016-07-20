USE [Decision_Support]
GO

/****** Object:  View [Dictionaries].[DMisProviderService]    Script Date: 03/11/2015 11:23:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER View [Dictionaries].[DMisProviderService]
As
SELECT     
	SourceID, ProviderID, mis.Active, mis.Name, DeaNumber, BirthDateTime, Sex, DeaNumberExpirationDateTime, Pager, Address, City, State, PostalCode, Phone, 
    ProviderTypeID, TypeName, mis.ServiceID, mis.ServiceName, mis.Number, AdmitPrivilege, LicenseNumber, SpecialtyAbsServiceID, AbsSpecialtyServiceName, ProviderGroupID, 
    ProviderGroupName, OnStaff, SendCoverPage, Address2, OfficeManager, ElectronicSignature, ProviderOrder, VendorID, VendorAddress1, VendorAddress2, 
    VendorAddress3, VendorBankAccount, VendorExpenseType, VendorFedIdNumber, VendorFedIdNumberType, VendorMnemonic, VendorName, VendorName2, 
    VendorOurAccountNumber, VendorRegistrationNumber, GlAccountID, GlAccountType, GlAccountClass, GlAccountControlAccount, GlAccountControlCode, 
    GlAccountCorporation, GlAccountDescription, Company, FaxNumber, RowUpdateDateTime, LabClient, ClinicalAlertEmailLevel, ClinicalAlertFaxLevel, 
    ClinicalAlertMigLevel, ClinicalAlertPagerLevel, DftQueueAttendYn, Email, FirstName, ImageExistsYn, ImageType, LastName, MiddleInitial, PagerPin, PagerType, 
    PagerWait, NationalProviderIdNumber, EnableErx, ErxNumber, AbsSpecialtyServiceID1, AbsSpecialtyServiceID2, AbsSpecialtyServiceName1, 
    AbsSpecialtyServiceName2, ErxPwmDatabase, DefaultQueueAttend, MrmAddTextYn
	,CASE WHEN SpecialtyAbsServiceID IS NOT NULL AND ISNUMERIC(SpecialtyAbsServiceID) = 1 THEN SpecialtyAbsServiceID ELSE AbsSpecialtyServiceID1 END AS CombinedServiceID
	,CASE WHEN AbsSpecialtyServiceName IS NOT NULL AND ISNUMERIC(SpecialtyAbsServiceID) = 1 THEN AbsSpecialtyServiceName ELSE AbsSpecialtyServiceName1  END AS CombinedServiceName
	,nlchi.Name as Name_Nlchi, nlchi.Active as Active_Nlchi, nlchi.ServiceID as ServiceID_Nlchi, nlchi.ServiceName as ServiceName_Nlchi
FROM         Dictionaries.DMisProvider mis
	Full Outer Join
	Dictionaries.NLCHI_Providers nlchi
	on nlchi.number = mis.number




GO


