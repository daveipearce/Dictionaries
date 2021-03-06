/****** Script for SelectTopNRows command from SSMS  ******/
SELECT ChangeMade, Updated, room.*, loc.Active Location_Active, loc.GLDept
, case when left(right(GLDept,7),2) = '29' then 'LTC' else 'Other' end
  FROM [Decision_Support].[Dictionaries].[Updates] upd
  left outer join
  Dictionaries.DMisRoom room
  on upd.Mnemonic = room.RoomID
  
  
  left outer join
  Dictionaries.DMisLocation loc on room.LocationID = loc.LocationID
  left outer join
[Dictionaries].[DMisLocationFacility] lf
on loc.LocationID = lf.LocationId AND loc.SourceID = lf.SourceID
  where DictionaryName = 'DMisRoom' and ChangeOrNew = 'New' 
  and FacilityID = '.'
  and Updated > '2013-04-11'
order by ChangeMade