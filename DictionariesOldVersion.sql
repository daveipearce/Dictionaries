declare @AsOfDate as datetime
declare @TableName varchar(200)
declare @SchemaName varchar(200)
declare @KeyFields varchar(1000)


set @AsOfDate = '2012-12-10 10:13:00.000'
Set @TableName = 'DSchResources' 
Set @SchemaName = 'Dictionaries'
Set @KeyFields = 'SourceID, ResourceId'

--Attach the Dictionaries schema to the table name
declare @FullTableName varchar(200)
Set @FullTableName = 'Dictionaries.' + @TableName

--Get Earliest update after date requested
Select  @AsOfDate  = max(Updated) From Dictionaries.Updates where DictionaryName = @TableName and Updated <= @AsOfDate
if @AsOfDate is null begin Select  @AsOfDate  = min(Updated) From Dictionaries.Updates where DictionaryName = @TableName end

--Get Column Names for 
declare @ColumnNames varchar(4000)
Set @ColumnNames = Stuff((select ',' + column_name from information_schema.columns  where table_name = @TableName order by ordinal_position For Xml Path('')),1,1,'')

Declare @strAsOfDate varchar(30)
set @strAsOfDate = convert(varchar, @AsOfDate, 120)
Declare @cmd as varchar(4000)
set @cmd =  'SELECT * FROM ' + @FullTableName + ' where RowUpdateDateTime <= ''' + @strAsOfDate + ''' Union 
   Select ' + @ColumnNames + ' From (SELECT *, Rank() Over(Partition By ' + @KeyFields + ' Order By RowUpdateDateTime Desc) as Rnk
    FROM ' + @FullTableName + 'History where RowUpdateDateTime <= ''' + @strAsOfDate + ''' ) as Ranked Where rnk = 1'
    
    print 'As of ' + convert(varchar, @AsOfDate)
    print  @cmd
--    Exec ( @cmd)

