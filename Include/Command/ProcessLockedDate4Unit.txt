<![CDATA[
declare @$lockedDate nvarchar(512)
select @$lockedDate = case when @@language = 'v' then N'Đã khóa số liệu, kiểm tra lại ngày giới hạn hoặc ngày khóa sổ.' else N'Data is locked, you must modify system locked date.' end
if exists(select 1 from dmstt where ngay_ks >= dateadd(m, 1, cast(str(@nam, 4) + replace(str(@ky, 2), ' ', '0') + '01' as smalldatetime)) - 1) begin
  select 'ky' as field, @$lockedDate as message
  return
end
if @ma_dvcs <> '' begin
  if exists(select 1 from dmdvcsks where charindex(',' + rtrim(ma_dvcs) + ',', ',' + replace(@ma_dvcs, ' ', '') + ',') > 0 and ngay_ks >= dateadd(m, 1, cast(str(@nam, 4) + replace(str(@ky, 2), ' ', '0') + '01' as smalldatetime)) - 1) begin
	select 'ky' as field, @$lockedDate as message
	return
  end
end else begin
  if exists(select 1 from dmdvcsks where ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and ngay_ks >= dateadd(m, 1, cast(str(@nam, 4) + replace(str(@ky, 2), ' ', '0') + '01' as smalldatetime)) - 1) begin
	select 'ky' as field, @$lockedDate as message
	return
  end
end
]]>