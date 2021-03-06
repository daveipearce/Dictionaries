/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [DictionaryName]
      ,[ChangeOrNew]
      ,[Mnemonic]
      ,[Mnemonic2]
      ,[OldActive]
      ,[NewActive]
      ,[ChangeMade]
      ,[Updated]
      ,[OldDate]
  FROM [Decision_Support].[Dictionaries].[Updates]
  where DictionaryName = 'DSchApptTypes'
  order by updated desc
  
  Select c.AppointmentTypeID, C.Description, H.Description,C.RowUpdateDateTime From Dictionaries.DSchApptTypes C inner join Dictionaries.DSchApptTypesHistory H on C.AppointmentTypeID = h.AppointmentTypeID
  and C.Description <> H.Description
  order by C.RowUpdateDateTime Desc
  