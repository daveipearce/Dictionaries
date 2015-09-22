SELECT DISTINCT 
                      Dictionaries.DMisProviderService.ProviderID, Dictionaries.DMisProviderService.Active, Dictionaries.DMisProviderService.Name, 
                      Dictionaries.DMisProviderService.TypeName, Dictionaries.DMisProviderService.ServiceID, 
                      Dictionaries.DMisProviderService.ServiceName, Dictionaries.DMisProviderService.Number, Dictionaries.DMisProviderService.SpecialtyAbsServiceID, 
                      Dictionaries.DMisProviderService.AbsSpecialtyServiceName, Dictionaries.DMisProviderService.AbsSpecialtyServiceID1, 
                      Dictionaries.DMisProviderService.AbsSpecialtyServiceName1, Dictionaries.DMisProviderService.CombinedServiceID, 
                      Dictionaries.DMisProviderService.CombinedServiceName, Dictionaries.DMisProviderService.LicenseNumber, ip.license_number, ip.SpecCode, ip.SpecDesc, ip.PracCategory, ip.staff_category, ip.specialty
FROM         Waitlist.OR_DATAMART INNER JOIN
                      Dictionaries.DMisProviderService ON Waitlist.OR_DATAMART.[Book Surgeon Mnemonic] = Dictionaries.DMisProviderService.ProviderID LEFT OUTER JOIN
                      Dictionaries.Intellicred_Providers AS ip ON 
                       CASE WHEN substring(LicenseNumber, 2, 1) 
                      = ' ' THEN substring(LicenseNumber, 1, 1) + substring(LicenseNumber, 3, 30) ELSE LicenseNumber END = license_number
WHERE     (Waitlist.OR_DATAMART.book_status = 'W')
and  Dictionaries.DMisProviderService.AbsSpecialtyServiceName <>                       CombinedServiceName