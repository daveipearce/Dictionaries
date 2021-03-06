--test

SELECT ChangeMade, Updated, loc.*
, case when left(right(GLDept,7),2) = '29' then 'LTC' else 'Other' end
  FROM [Decision_Support].[Dictionaries].[Updates] upd
  left outer join
  Dictionaries.DMisLocation loc 
  on upd.Mnemonic =  loc.LocationID
  left outer join
[Dictionaries].[DMisLocationFacility] lf
on loc.LocationID = lf.LocationId AND loc.SourceID = lf.SourceID
where DictionaryName = 'DMisLocation' and ChangeOrNew = 'New' 
  and FacilityID = '.'
  and Updated > '2013-04-11'
order by ChangeMade