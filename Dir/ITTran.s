<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\CheckVoucherNumber.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandExternalFieldDeclare SYSTEM "..\Include\Command\ExternalFieldDeclare.txt">
  <!ENTITY CommandExternalFieldSelect SYSTEM "..\Include\Command\ExternalFieldSelect.txt">
  <!ENTITY CommandExternalFieldSet SYSTEM "..\Include\Command\ExternalFieldAssign.txt">
  <!ENTITY CommandExternalFieldQuery SYSTEM "..\Include\Command\ExternalFieldQuery.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptCurrency SYSTEM "..\Include\Javascript\Currency.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucher.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">
  <!ENTITY InsertHistoryVoucher SYSTEM "..\Include\Command\InsertHistoryVoucher.txt">
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">

  <!ENTITY DetailVariable "@d85">
  <!ENTITY DetailTable "d85$$partition$current">
  <!ENTITY StockType "2">
  <!ENTITY DeclareStock "declare @stock tinyint
select @stock = 0">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">
  <!ENTITY UpdateCurrentStock "
declare @q nvarchar(4000), @r tinyint
select @r = cast(val as tinyint) from options where lower(name) = 'm_round_sl'
select top 0 ma_kho, ma_vi_tri, ma_vt, ma_lo, so_luong as sl_nhap, so_luong as sl_xuat into #currentStock from &DetailVariable;
if @post = 1 and (@@action = 'New' or @@action = 'Edit') begin
  insert into #currentStock select @ma_kho, ma_vi_tri, ma_vt, ma_lo, 0 as sl_nhap, sum(round(so_luong * he_so, @r)) as sl_xuat from &DetailVariable; group by ma_vi_tri, ma_vt, ma_lo
  if @so_buoc = 1 insert into #currentStock select @ma_khon, ma_vi_trin, ma_vt, ma_lo, sum(round(so_luong * he_so, @r)) as sl_nhap, 0 as sl_xuat from &DetailVariable; group by ma_vi_trin, ma_vt, ma_lo
end
if @@action = 'Edit' insert into #currentStock select ma_kho, ma_vi_tri, ma_vt, ma_lo, -sum(sl_nhap), -sum(sl_xuat) from r70$$partition$previous where stt_rec = left(@stt_rec, 10) + 'PNF' group by ma_kho, ma_vi_tri, ma_vt, ma_lo
set @q = dbo.MaxvOnline$Function$Voucher$GetSQLUpdateCurrentStock('r70$$partition$previous', 'r90$$partition$previous', @stt_rec, @@id, @@action, @Stock)
exec sp_executesql @q">

  <!ENTITY ReviseCurrentStock "
declare @qr nvarchar(4000), @rr tinyint
select @rr = cast(val as tinyint) from options where lower(name) = 'm_round_sl'
select top 0 ma_kho, ma_vi_tri, ma_vt, ma_lo, so_luong as sl_nhap, so_luong as sl_xuat into #reviseStock from &DetailVariable;
if @post = 1 and (@@action = 'New' or @@action = 'Edit') begin
  insert into #reviseStock select @ma_kho, ma_vi_tri, ma_vt, ma_lo, 0 as sl_nhap, sum(round(so_luong * he_so, @rr)) as sl_xuat from &DetailTable; where stt_rec = @stt_rec group by ma_vi_tri, ma_vt, ma_lo
  if @so_buoc = 1 insert into #reviseStock select @ma_khon, ma_vi_trin, ma_vt, ma_lo, sum(round(so_luong * he_so, @rr)) as sl_nhap, 0 as sl_xuat from &DetailTable; where stt_rec = @stt_rec group by ma_vi_trin, ma_vt, ma_lo
end
if @@action = 'Edit' insert into #reviseStock select ma_kho, ma_vi_tri, ma_vt, ma_lo, -sum(sl_nhap), -sum(sl_xuat) from r70$$partition$previous where stt_rec = left(@stt_rec, 10) + 'PNF' group by ma_kho, ma_vi_tri, ma_vt, ma_lo
set @qr = dbo.MaxvOnline$Function$Voucher$GetSQLReviseCurrentStock('r70$$partition$previous', 'r90$$partition$previous', @stt_rec, @@id, @@action, @Stock, '#reviseStock')
exec sp_executesql @qr">

  <!ENTITY DeleteCurrentStock "
declare @q nvarchar(4000), @so_buoc tinyint
select @so_buoc = so_buoc from m85$$partition$current where stt_rec = @stt_rec
select top 0 ma_kho, ma_vi_tri, ma_vt, ma_lo, sl_nhap, sl_xuat into #currentStock from wrkin
if @so_buoc = 1 insert into #currentStock select ma_kho, ma_vi_tri, ma_vt, ma_lo, -sum(sl_nhap) as sl_nhap, -sum(sl_xuat) as sl_xuat from r70$$partition$previous where stt_rec = left(@stt_rec, 10) + 'PNF' group by ma_kho, ma_vi_tri, ma_vt, ma_lo
set @q = dbo.MaxvOnline$Function$Voucher$GetSQLUpdateCurrentStock('r70$$partition$previous', 'r90$$partition$previous', @stt_rec, @@id, @@action, @Stock)
exec sp_executesql @q">

  <!ENTITY CommandWhenBeforeProcess "
declare @$updateConflict nvarchar(512)
select @$updateConflict = case when @@language = 'v' then N'Phiếu nhập điều chuyển đã thay đổi trạng thái, không thể sửa được.' else N'Can not edit this voucher, there was stock transfer in transaction.' end  
if @@view = 0 begin    
  if @@action = 'Edit' begin  
    if exists(select 1 from c75$000000 where status &lt;&gt; '0' and stt_rec = (left(@stt_rec, 10) + 'PNF')) begin
      select '' as script, @$updateConflict as message
      return
    end
  end    
end">

  <!ENTITY f1 ", @sourceSiteName as ten_kho, @destinationSiteName as ten_khon, @controlSourceLocation as vi_tri_yn, @controlDestinationLocation as vi_trin_yn">
  <!ENTITY f2 ", @sourceSiteName as ten_kho2, @destinationSiteName as ten_khon2, @controlSourceLocation as vi_tri_yn, @controlDestinationLocation as vi_trin_yn">
  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd85$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec
exec MaxvOnline$App$Voucher$UpdateGeneral @@id, 'm85$$partition$current', 'd85$$partition$current', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec">
  <!ENTITY Check "
if exists(select 1 from options where name = 'm_gia_nh_kho' and val = '1') begin
  if exists(select 1 from dmkho where ma_kho = @ma_kho or ma_kho = @ma_khon group by ma_nh having count(*) = 1) begin
    if exists(select 1 from @d85 a join dmvt b on a.ma_vt = b.ma_vt where b.gia_ton = 1 or b.gia_ton = 4) begin
      select 'ma_kho' as field, case when @@language = 'v' then N'Không được điều chuyển vật tư giá trung bình/trung bình di động giữa hai nhóm kho.' else N'Cannot transfer items with average/moving average cost between two site groups.' end as message
      return
    end
  end
end">
  <!ENTITY Stock "
    if @so_buoc = 1 begin
      select @statement = 'select * into #r from #in'
      select @statement = @statement + char(13) +  'update #r set nxt = 1, ma_kho = a.ma_khon, ma_vi_tri = a.ma_vi_trin, ma_khon = a.ma_kho, ma_kh = a.ma_khon,'
      select @statement = @statement + char(13) +  'loai_ct = ''2'', ma_gd = ''2'', sl_nhap = a.sl_xuat, sl_nhap1 = a.sl_xuat1, sl_xuat = 0, sl_xuat1 = 0, tien_nhap = a.tien_xuat, tien_xuat = 0, tien_nt_n = a.tien_nt_x, tien_nt_x = 0, tk_du = a.tk_vt, tk_vt = a.tk_du,'
      select @statement = @statement + char(13) +  'pn_gia_tb = case when (c.gia_ton = 1 or c.gia_ton = 4) and a.px_gia_dd = 0 then 1 else 0 end, ma_ct = ''PNF'', stt_rec = ''' + left(@stt_rec, 10) + 'PNF' + ''', stt_rec_dc = ''' + @stt_rec + ''''
      select @statement = @statement + char(13) +  'from #r join #in a on #r.stt_rec = a.stt_rec and #r.stt_rec0 = a.stt_rec0 join dmvt c on #r.ma_vt = c.ma_vt'
      select @statement = @statement + char(13) +  'insert into #in select * from #r'
    end else begin
      select @statement = ''
      exec dbo.fs_PostIT2Receipt @@id, '@@prime$partition$current', 'd85$$partition$current', 'm75$$partition$current', 'd75$$partition$current', 'i75$$partition$current', @stt_rec , '0'
    end

    exec MaxvOnline$Voucher$Posting$Inventory 'm85$$partition$current', 'd85$$partition$current', 'r70$$partition$current', @stt_rec, @@id, 
      'gia_nt0, tien_nt0, gia0, tien0, gia01, gia_nt01, pn_gia_tb, cp_nt, cp, thue_suat_nk, nk_nt, nk, gia_nt21, gia21, gia_nt2, gia2, tien_nt2, tien2, cp_thue_yn, thue_suat, thue_nt, thue, ck_nt, ck', 
      'so_seri, tk_gv, tk_dt, tk_thue_nk, ma_tt, tk_thue_no, tk_thue_co, tk_ck, so_dh2, so_dh3, ma_nvbh, stt_rec_px, stt_rec0px, stt_rec_dc, so_ct0, so_seri0', 
      'ct_dc = 1, ma_kh = a.ma_kho, gia_nt1 = b.gia_nt, gia1 = b.gia, tien_nhap = 0, tien_nt_n = 0, tien_xuat = b.tien, tien_nt_x = b.tien_nt, ma_nx=b.tk_du', 
      @statement, @stock, &StockType;">

  <!ENTITY Post "
declare @group varchar(128), @glMaster nvarchar(256), @glDetail nvarchar(256), @statement nvarchar(4000)
select @group = groupby from @@sysDatabaseName..voucherinfo where ma_ct = @@id
select @glMaster = rtrim(val) from options where name = 'm_gl_master'
select @glDetail = rtrim(val) from options where name = 'm_gl_detail'

if @status = '1' begin
  &Stock;  
end

if @status = '2' or @status = '3' begin
  &Stock;
  if @status = '2' begin
	  insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tien_nt, t_tien, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
	  exec dbo.fs_PostITTran '@@prime$partition$current', 'd85$$partition$current', @glMaster, @glDetail, @stt_rec , @group, 1
	end else begin
    exec dbo.fs_PostITTran '@@prime$partition$current', 'd85$$partition$current', @glMaster, @glDetail, @stt_rec , @group, 2
    exec dbo.fs20_AfterUpdateGL @stt_rec, '@@prime$partition$current', 'd85$$partition$current', @@id, @@userID
    insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec
  end
end">
  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete ct70 where stt_rec = @stt_rec
delete ct70 where stt_rec = (left(@stt_rec, 10) + 'PNF')
delete p00$000000 where stt_rec = @stt_rec
delete c75$000000 where stt_rec = (left(@stt_rec, 10) + 'PNF')

if '$partition$current' &lt;&gt; '$partition$previous' begin
  delete r00$$partition$previous where stt_rec = @stt_rec
  delete r70$$partition$previous where stt_rec = @stt_rec
  delete r70$$partition$previous where stt_rec = (left(@stt_rec, 10) + 'PNF')
  delete m75$$partition$previous where stt_rec = (left(@stt_rec, 10) + 'PNF')
  delete d75$$partition$previous where stt_rec = (left(@stt_rec, 10) + 'PNF')
  delete i75$$partition$previous where stt_rec = (left(@stt_rec, 10) + 'PNF')
end else begin
  delete r00$$partition$current where stt_rec = @stt_rec
  delete r70$$partition$current where stt_rec = @stt_rec
  delete r70$$partition$current where stt_rec = (left(@stt_rec, 10) + 'PNF')
  delete m75$$partition$current where stt_rec = (left(@stt_rec, 10) + 'PNF')
  delete d75$$partition$current where stt_rec = (left(@stt_rec, 10) + 'PNF')
  delete i75$$partition$current where stt_rec = (left(@stt_rec, 10) + 'PNF')
end">
<!ENTITY UpdatePriceStock "
	DECLARE @m_ma_nt_ht VARCHAR(10), @m_round_tien INT, @m_round_tien_nt INT, @m_gia_vt INT, @m_gia1 INT, @m_ngay_ap_gia DATETIME, @t_tien_px NUMERIC(18,4), @t_tien_px_nt NUMERIC(18,4)
	SELECT @m_ma_nt_ht = val FROM options WHERE upper(name)='M_MA_NT0'
	SELECT @m_round_tien = val FROM options WHERE upper(name) ='M_ROUND_TIEN'
	SELECT @m_round_tien_nt = val FROM options WHERE upper(name) ='M_ROUND_TIEN_NT'
	SELECT @m_gia_vt = val FROM options WHERE upper(name)='M_GIA_VT'
	SELECT @m_gia1 = val FROM options WHERE upper(name)='M_GIA1'
	SELECT @m_ngay_ap_gia = val FROM options WHERE upper(name) = 'M_NGAY_AP_GIA'
	
IF @m_gia1 = 1 AND @ngay_ct >= @m_ngay_ap_gia
BEGIN
	SELECT * INTO #d85tmp FROM @d85
	SELECT TOP 0 a.ma_kho, a.ma_vt, a.sl_xuat AS so_luong, a.tien_xuat AS tien, a.tien_nt_x AS tien_nt, a.gia, a.gia_nt INTO #giatmp FROM wrkin a
	
	INSERT INTO #giatmp EXEC MaxvOnline$Voucher$UpdatePriceStock @ngay_ct, '#d85tmp', @stt_rec, @@action, @@unit, @@userID, @@admin
	IF @m_gia_vt = 2
	BEGIN
		UPDATE @d85 SET gia = ISNULL(b.gia,0), gia_nt = ISNULL(b.gia_nt,0) FROM @d85 a
			LEFT JOIN #giatmp b ON a.ma_vt = b.ma_vt AND a.ma_kho = b.ma_kho
			LEFT JOIN dmvt c ON a.ma_vt = c.ma_vt
		WHERE (c.gia_ton = 1 or c.gia_ton=4) AND a.px_gia_dd=0
	
		UPDATE d85$$partition$current SET gia = ISNULL(b.gia,0), gia_nt = ISNULL(b.gia_nt,0) FROM d85$$partition$current a
			LEFT JOIN #giatmp b ON a.ma_vt = b.ma_vt AND a.ma_kho = b.ma_kho
			LEFT JOIN dmvt c ON a.ma_vt = c.ma_vt
		WHERE (c.gia_ton = 1 or c.gia_ton=4) AND a.px_gia_dd=0
	END
	IF @m_gia_vt = 1
	BEGIN
		UPDATE @d85 SET gia = ISNULL(b.gia,0), gia_nt = ISNULL(b.gia_nt,0) FROM @d85 a
			LEFT JOIN #giatmp b ON a.ma_vt = b.ma_vt
			LEFT JOIN dmvt c ON a.ma_vt = c.ma_vt
		WHERE (c.gia_ton = 1 or c.gia_ton=4) AND a.px_gia_dd=0
	
		UPDATE d85$$partition$current SET gia = ISNULL(b.gia,0), gia_nt = ISNULL(b.gia_nt,0) FROM d85$$partition$current a
			LEFT JOIN #giatmp b ON a.ma_vt = b.ma_vt
			LEFT JOIN dmvt c ON a.ma_vt = c.ma_vt
		WHERE (c.gia_ton = 1 or c.gia_ton=4) AND a.px_gia_dd=0
	END
	
	UPDATE @d85 SET tien = round(so_luong * gia, @m_round_tien), tien_nt = round(so_luong * gia_nt, @m_round_tien_nt) WHERE px_gia_dd=0
	UPDATE d85$$partition$current SET tien = round(so_luong * gia, @m_round_tien), tien_nt = round(so_luong * gia_nt, @m_round_tien_nt) WHERE px_gia_dd=0
	
	IF @ma_nt = @m_ma_nt_ht UPDATE d85$$partition$current SET gia_nt = gia, tien_nt = tien WHERE px_gia_dd=0
	IF @ma_nt = @m_ma_nt_ht UPDATE @d85 SET gia_nt = gia, tien_nt = tien WHERE px_gia_dd=0
	
	SELECT @t_tien_px = sum(tien), @t_tien_px_nt=sum(tien_nt) FROM @d85
	UPDATE m85$$partition$current SET t_tien = @t_tien_px, t_tien_nt = case when ma_nt=@m_ma_nt_ht then @t_tien_px else @t_tien_px_nt end
	
END
">
]>

<dir table="m85$000000" code="stt_rec" order="ngay_ct, so_ct" id="PX2" type="Voucher" uniKey="true" navigation="true" name="cookie" check="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="phiếu xuất điều chuyển" e="Stock Transfer"></title>
  <partition table="c85$000000" prime="m85$" inquiry="i85$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" allowNulls="false">
      <header v="Mã kho xuất" e="Source Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status = '1' and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))" check="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))" information="ma_kho$dmkho.ten_kho%l" new="Default" row ="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XC3Z4Jo1uLrFso9OLtNQxd5odoCv2LaNuWrovR9FsJR5A==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ma_khon" allowNulls="false">
      <header v="Mã kho nhập" e="Destination Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_khon%l" key="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and status = '1'" check="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}'))" information="ma_kho$dmkho.ten_kho%l" new="Default" row="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBxQYyWLDhZRxAKKbx5HEtrL4Un94QyO8y8LhTIB7dUBUTULmSkZlGi3BZnzSM0x3E=</encrypted>]]></clientScript>
    </field>
    <field name="ten_khon%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người nhận" e="Recipient"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="3">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_nk" clientDefault="Default" inactivate="true">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_nk%l" key="status = '1' and ma_nk in (select ma_nk from v20dmctnk where ma_ct = @@id and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') > 0))" check="1=1" information="ma_nk$v20dmnk.ten_nk%l"/>
      <handle reference="so_ct"/>
    </field>
    <field name="ten_nk%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số phiếu xuất" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày hạch toán" e="Posting Date"></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>

    <field name="status" inactivate="true" clientDefault="1">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Điều chuyển" e="1. Transfer"/>
        </item>
        <item value="2">
          <text v="2. Chuyển KTTH" e="2. Release Later"/>
        </item>
        <item value="3">
          <text v="3. Chuyển sổ cái" e="3. Release"/>
        </item>
      </items>
    </field>

    <field name="d85" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="196" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="ITDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="so_buoc" dataFormatString="1, 2" clientDefault="1" align="right" inactivate="true" categoryIndex="-1" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Mask"/>
    </field>
    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" categoryIndex="-1" disabled="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="-1" disabled="true">
      <header v="Tổng tiền nt" e="Total FC"></header>
      <items style="Numeric"/>
    </field>
    &XMLUserDefinedMasterFields;
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" defaultValue="0" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="vi_trin_yn" type="Boolean" width="0" external="true" hidden="true" defaultValue="0" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = ma_khon) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="252" anchor="6" split="8">
      <item value="100, 50, 55, 129, 100, 8, 100, 28, 58, 42, 12, 105, 0, 0"/>
      <item value="1101000-100111: [ma_gd].Label, [ma_gd], [ten_gd%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
	  <item value="1101000-1001--: [ma_kho].Label, [ma_kho], [ten_kho%l], [ngay_lct].Label, [ngay_lct]"/>
      <item value="1101000-1001-1: [ma_khon].Label, [ma_khon], [ten_khon%l], [ngay_ct].Label, [ngay_ct], [vi_tri_yn]"/>
	  <item value="1100000-1101-1: [ong_ba].Label, [ong_ba],[ty_gia].Label, [ma_nt], [ty_gia], [vi_trin_yn]"/>
     
      <item value="1100000-110011: [dien_giai].Label, [dien_giai], [status].Label, [status], [ma_dvcs], [cookie]"/>
      <item value="1: [d85]"/>
      <item value="11---101-10-1--: [so_buoc].Label, [so_buoc], [t_tien].Label, [t_so_luong], [t_tien_nt], [t_tien]"/>

      <categories>
        <category index="1" columns="799" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        <category index="-1" columns="100, 30, 20, 50, 129, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0" anchor="4">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>
  
  <commands>
    &XMLWhenVoucherInit;

    <command event="Loading">
      <text>
        &CommandWhenBeforeProcess;
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX+h8+/zDkfxNKEkuCaDXg5D5afWvPREV8SxT+4cgS4spA==</encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<encrypted>Prfg37kMJ8WBqoB5CvJCKf7bGLn7xzhd/qTwELa/vRyx2yQIA2RHENHp4ogjvxpOgLuPugRZg31KNe08ByME5w==</encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandWhenBeforeProcess;
        &CommandGetVoucherNumber;
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX+h8+/zDkfxNKEkuCaDXg5D5afWvPREV8SxT+4cgS4spA==</encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<encrypted>jsguT1F3i8nGtqLMkxZj7ZE3/7wegKNgL0bQHB5rxUHCKdWEuCuz6Y+bcJ0Ai+Ew</encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<encrypted>sGOO9c3oUfQV7UuB9gMEmLAStF74BGPvhBxZAVQjZtmAD5f5GQyFUUEtKhEdJ+f2k3kmad+Uex/RpFP8HKyF66pFNGL952ydb0pKndJ7xf1Xs6jdmdOTNy4yT82QFnmq82SXzUOmRIvKt9FbBQgy+g==</encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<encrypted>YJw0LXymHg2Je61p6CbNAs7Rt5ReotAjcZMcltNLuH/S11+nDAi4Wy6+4tLPd/yNo6ZUo47wxMNVZlodwKVTw8X70TXOC/sJBbjAqQDC4JJ9RyEZUe1An9RUZhCLVFNPR5a6mK9jpmdcU3xxcW7vwk/g1XhRNecA4Lir31GIU0W6MHnT0iYuQavg1LP/f3dIUUeeahwXGWUvg8ZEhNNU8y/dV2KnzD60mt5TkmX5SD+k0zonTW5DWhSJYlxPvroT</encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<encrypted>cnyZxBLMX3dRpAXqDFv97IjtD6SEmnZQRRXKsoEFqEVXMZPxGDLQFH+jdy6ejvRbhS4ODOk93ARemM2eij5msMWH9qlE46JNjceABb63p3EX6e2JJ4tGOCZNQtKJKu+foReCV3pm8pQsYUEpBRJAsuzPG7Pkw90xJkWkyxkLmI4=</encrypted>]]>
        &CommandExternalFieldQuery;&f1;<![CDATA[<encrypted>4k6ju/dVbl5wlQvb5znk6leGLYIs1K6PI1WX3lWDci7nHFFl1t5fUyscd7zN9PfSWdNjlMYG6UWV/adUCNTtfcM6/OtoUzH5HIDdezgg+hCARUXMwwVI8E/gHWba8Q6u/YI3KPRJt0Tab3FejtZxpxzMiYqpgSJH0sdPa3yBD0E=</encrypted>]]>
        &CommandExternalFieldQuery;&f2;<![CDATA[<encrypted>sj1HAMsEH3pXI+Krl4f7M8oYyXtTLKJYwy/9WwaNlqo3UnBEQS/DCXYeISx36lWS</encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &Check;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>Xdg6J+Hsxor/VZli06bT7oNWZpYUZbVKUSlnUtys7w+FRvAEDrn81ajj476Kpf6DrkrsS1GtTG0w37fTWrMgjJ2oKefCklUo7mDjxXklZ0ypXLBgzBJ5VG+r8FJ9DaaPeGQaUraJESyuGOVmwVDtoiqQ4T8q4eplN4YYx+xaTd0iaDlOT4ZGzIoJpJEJZPX0lijUSJYAnFkI9ss2DdDsbHii7HboAKGlFge8L7Uphe4=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPjAmiAE2nisoJm8OpbvpVAms82jfVGANxzy4XWZi+q3pEU5ECI85S0Hz/gjGm+S/cXYPUpuc/wecWuSVV6uswfg=</encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
		&UpdatePriceStock;
        &UpdateCurrentStock;
        &Post;
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjNM5DJ9nuOA785bKXqt9ViKX0KXllerWVcqK//gDH6sU6+cB0/Cg4zCuf5+pR5ZL0MVtL01/SSgXvIIkjPEpj2YQwNY1asZaw+EZzQ28ctVS</encrypted>]]>&CommandShowWarningMessage;<![CDATA[<encrypted>FTgzG0Ebn58SWQYsf65nyjIIGuY/GZ6oxX0a/PwjGKzviKX5u9uIEUIVQbbNJofhdxu3S4ep6ls4RjJCLKh4YlshfeCbWblD3/5LcHM/Og0=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        <![CDATA[<encrypted>PowiIjaAvPt4gN9kD/dPERdgNalISymA6C3tkX+EGFt9PtHwPbRJRDyotqLrX1EtCbJ/X//Mx7pcC4Nxkhn1ORl0R11C8M5lOMrwQRjI6/LpwV1KC+JF5ZxKGfbwGKmc9LoQUptfL7oVVuwW3a0pRfCswBIS9nkSQcDBxnQB7pgh+PRTAl24VS9DGZMJIZkgDf+01RZYjp6pci3FqKbPYqyrzoOznc+yze2kJSzhG6WoqcDz25YuibTg4sQXE68ulkMCbwGn0SJrspQJhsK/zKGO3mn79+Ra9NeiFZcPeI4me3lquXO98xnLthuROa65bMTYuhWsqnrrLm1Is5edC2/bvJDPasU7WpAaJUSIXTUAQTnOrAwS0YDeD9qXCnBKSAe1SujgRN35xroL1rh/NlcLErwlBH7V8OrWDJA9D267Fs9E6DaJP53zH0Vul+1rnFIeIhstpxxOyn8/M81J3A==</encrypted>]]>
        &Check;
        <![CDATA[<encrypted>K2EbZqFwTvESwTzAS3EPlPEoh5Cy1VqZJ3LuSqesNBwzZyymXyihzHAOx+bfsLZLHpC5HEvfamnt+lGrEj2jzPbrdyO4EZ4LzUTqApcFjgA2wOkKJ5aj2vr15qRQkfF9OGoy/QhKKwlZ1y8u+uqDJ610ehTmbr/DeCnkwUdT0H1zK8yTKMR+zY8gyf0CoUXebI1KTNkSdEJHr6wbB9qctBePcDEBuW96bjmQcWxsucv3tvfmjIp2+ZEfkajbHbfLGf3uD6zhlXlWhYSRMhbgqppH0x+6VIv5HKRj3TDZAxHCJEqlvRC0iFkoo53A6Wocd+tKKO9lZjxCl/h1BZkxcdvWoGZNIOOhVC+IWU2BvAnp7sE9olG3DVv1x3Tlup6y1AgIkuuwXzSmSshXKHECEgu0HiuDQ2w5GK/fWqF8Q3Wi1z4AVA7YF+DtRlsVPtMjbtnytb9PNXCzQmwSMWitSw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>OTunyz2blYd8MsaA18jHEfRSjnOb6YX12sC0oL6JeWQ8451goV2Mhlj3NVkOiRX/BrsuQHDN+diYtyhSsne/kchxBgy67uqvNAH0Emg8jYfdnl8pglXjtOhh+1Jt3e7jG33VGp4RdJEImFB65djqGJS4nhRYw2qRTEr+3j8Q+lEGw+mSnY1J69VhbBbFxn4I0oXKgEjdUV0pYjF2Z+rQgA==</encrypted>]]>
		&UpdatePriceStock;
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        <![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN/u7AYVP5HC8dnvmfqnkurRzzTtbbjm2ETdBTsX/8OkJG19/bIcI3rjbvvzG+1ciTBNliW3uKgKvb+lMlhHDeBE=</encrypted>]]>&ReviseCurrentStock;<![CDATA[<encrypted>iZzd+T9L5VmV4PzygBLM/Acau1LNqi3ssl4Pq7DFQOFVoWqcAzuPm5ccQ0giXub/</encrypted>]]>&UpdateCurrentStock;<![CDATA[<encrypted>iZzd+T9L5VmV4PzygBLM/LT9SLXOPq8e+PKr0oTg+as=</encrypted>]]>
        &Delete;
        &Post;
        &CommandShowWarningMessage;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<encrypted>FKopJig1lC3jJVG6UP19WkA0iDgo0829X0J8FZwRpOAh8qqDmbh5+M+Tra7IBWzdF63vtKouWG/LJiEp/za/dj2DCT7muA00bT02hY9/4plocC9xtkO/7a6ycs7DjF5uYfzQAzE7X8RSiKyuPyrvCMki+UzXBQSOMr72T6HKvCXVbtYJE/Teix2Ode1rWB8sgJFSv5YazoxNog2/aeGo4ngBj/jc+JFMkGuet/CyY9GoU0g1diwy7YkUEAE1BnEaGMzV6e4psFPPyD/drc5e61iLOo20gP6Oz5lzaJOTAUO/rSzm7Z5fzyetuLGs6Le4YcGQWVraTChSTnWQi+ddwrz5MeE5qXR84eN0H3kg6iE4izH02e/UA9ugt+V79Lr49Da8YRrEFXebvWEOqTOcKVzE7Pks48isCOkYdqboQnrUsAIyABRfkDO8tTEUYfgbckTlg7faEoiJ+45auJvQkw==</encrypted>]]>
	&InsertHistoryVoucher;
<![CDATA[<encrypted>N48N8EMXpHnLcQdkuCcKwxgkBaYFtCzGAY23lynNsSxuMgF9S938tDZ5iFfjyYOEXu5hGtm5egMzXiIqY+IHccVEUehKbtItliOvsoTZeApXNd2XWE3J6AljxFIXrhPK</encrypted>]]>
        &DeclareStock;
        &DeleteCurrentStock;
        &Delete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS86MfU2bvIdHD+hArj7qQd5YEYJ0+70Bh8DJcI81Q4sVOKIvBITQ1smxn0Yb4froHS25eW51dCwPmCs4gXLR6Ocw==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>c2Uxkhp8dnFad+svGg+TCAPMENSeuKt6ihA+vm4Vr0/G+tGZ2ihdzamIfDjDKUKw8HOoVkSPE3oo6BYivqLiPtRQVFVShsJeSrdIqwoCkiVisY0k0x0OLSp5zl12n1AT</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>S306XDTuzLrc8Jzckjo4t2f/Xq9LDTc0WntjEANcc86IifqIULcqQpmLhBsN4K7TiaGjBkYeTj/Tm/Z+PeBCPQ==</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>/6Pq5JBiSWMm7sZA6oKL3NbkAmtEEsUQvfaCuna3M52S1FxXwNQMZqqm6vNnkBgEIk71GMmRd38xTiupoJppdR/uul0J/uNtM3xOw4JcqDicbmXAPhye7TkT2+MX9FRfT8Ugl7dqevoWOSa8w2P7vfUukPJCM7oGbbW9REbxZ7jQMrwkIaXjobQF1wonbV3R8ClhMHpf0qz2j6IjmVmU3ksNNOfSA8pdHaaSlrKxiMIP92ZjxGoSsr5vCi+RMaaP0gSJYKx0QfeBoMstlf455lLrVq/TjnxllZBnwo+Av6ZUeYS0G8ZRPel4wE6EedFz</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>zjXLIchVNAnfo2KquGb4VW2RT7LMUTPNrPybIrHVjmeL/OvMYI+6cNKyWo9+n7+GI7OHlcfQFkavXQWm54RgXOlKMEKBFFy8VGdBDrHOqSGoz1qpRKttn1Qgis/w9ds80g63HrA6Qo6gFpUkRcZDL88uu+uuxpr3W/slCxSqwx+xLO3PzP86YjDG6+YT5r0UaZEZVifQ5iMQRmIRPnQHAVJ93c85sm3ytG4VuSrV43HJ25bQpMh6mVMi5/UlCEBJs3VOeOLPFN6XiWwXLqPy4QcEkDmnlgJ4sgKVKnUoi3QYfwd10Hm0iqMLcQFXD7aFrzsOmVmI5ypnL2Jb4xgb6dhicXx8kJ9JUUkfBA/WLE6Ly6s9bFQUdB7TJweiyBE+0YUXh8kzZS0fOlhjItpzT4BN6MgExOO4Vz4RtggHubDT+O9KZpwCs/UFzSyFTR9X</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>qkcFnOyPONoEtzTELZg8WJNe5e2nOxMvdBPOO1jFp1xp8hqzas/obqljRzxRnFF5YwmUAhrTqXkEIqZZUo33ERT/0BLEkq82mNUsLtszwSLw28oDWOgZ1OD0FCEyzvyq8H1d9EDGhQe3yu1fHUlN9NjtJrkmVOZeZmtq4c+DGz+WppZhfFyfrgSOcI3cObBl</encrypted>]]>

      <![CDATA[<encrypted>v1mcdMOMviRdgI07lhNNtZAi6r89u4Esb32okLcszZPbBl/+xpWXZfECB07Z8wGYcuaoLrVKx+evRIQO0aWjuMLXpfjd7VwTVJTFlAyigl/6weZxNJca6eXaKKJu3jPDbXLLYkk/VGiwuk3hYCVGHvsgwGJ90kBI8QmroRMQ3a1N3nZmt1KDXVpgfv6YgZgTUcdb4TvLo9G4yXzbD8gHaA==</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0SVG/ZIFBAaT8lyFwW2eU1YEm9B/nkodjj/qIJ+aRz+i</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>G6gCoGERL2YAE7XizJgQlPxzPronxCeWthM5dKQ8YKxzQg9QTsMfo0mtZ13N5PsFXhSgwiNU01DypX9ulVufbARLntBqogRjq5bKLFMBiJlchQ7JdpCNmWw9Wb+ZTsbAPDbrsqVWzegClVktpyM0izp64HKFEZgHwNgvUV8D0eAo2J5KIAvTQNtonz1sWeHu6kD0Ubbu5cgN/oIVICtn7GwYl9obmkDqtHZDyjSa25se2oyO305Zm1AnUYJ5mW2dQrVLxPAdjVmVgDnl2rhkKmQiGXQ0uICqNYvXPoThjA+qpeQB3I5CGBXixLq9b0+rxX5PJtcFkJKZ5Fj1lT88xk3TA7vjhBhm6fyB9ypxrQbE3Csm8eYgUBy/9lvQUcSGMg56CDNtFtj06CLyg4m6A+0+xEaQ4eQaLmBRSTfWfNLEgHDZuj2/bM5MIuah5XDSL+/aijxJxpEu9Cq+1EC0PqNvo8EAPS/M9tuIXEfWzRuXh08eCDms0sR+gggDpotxDGiwX9OTi4ueYMQSu9pvARJCtQ/lcsLlsBTuLdT2WIggpbZzLlKI2dZX9ZcGVkYZGcCsaoV36l026SyhiHmOoh2vhQtz7FAdsiA6zFCsKeMLgKkVv6DjrrKx5HwOmA2u5lZ+1YDKTF72M8a0UTvcb6TRe9TZBTKDiv5uJOeOGiNeeVjh8+nJZdF+wpNWi9vvFKHgzud8HM4TsbUJtY561bqx6t1t6WO5/lws5DM0UeuIpNmpYDur1qXnP1x2owZG</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="SourceSite">
      <text>
        <![CDATA[<encrypted>mV634QGeGaw3RL6DNSjIzgTfLU1s9Wqm3+MZrwm/0jtB+K9uVMFnhrxG8XumfvKCOQkpHC7Oi7XtiHUcaxldMyp7eCAHA9IPdL5XiQj6hboqLUsA1xx13QYHf/nyfFyHRKXUd59vkXmA3SlJ45IS8q3z4PQlRahSnO1yYgzZxvSsFcvnkM/ISIgNuJyRfwcp</encrypted>]]>&SiteCheck;<![CDATA[<encrypted>WPjJ8wlGbBtlIKhjQhkhy9TetTLHUg577go2VQKjkhhiqzVClvxEGnSwyZ4OjVInWqAAxl2oKC+7h4iW25EUCsg3CoIPGiP3K5Z8xm/hdJ1mrgjxBo9qTo7rrVqPsDgr5TkIjaDWmNIWf2Ju4Uf6av86VfxG2HwpckMKCxhGUwc0FywCq7wkWu/3XWZJZsGh</encrypted>]]>
      </text>
    </action>

    <action id="DestinationSite">
      <text>
        <![CDATA[<encrypted>2+ShplibD9kxKY+LQUQ3KpcTt6808rD8PxftN/p+uIgtLB7TkPQwQvKPqPYiDsNFwDJwPb5iuGOc5au9kW4kBwde2Tj7N5JWoSUeLj5JF7Ge1/5P5ql9r0dtapdFHQNOM+7+ofWzVjqQUeuOkfd+2TJtMqfcLrL+HeKgNfgAPIFrE7diUVsPODTAD3U18Ge+OmBnJmEQnmBTGxRr8aUeGoknV2h4z6zPC7PCjfP0unI+87vfxSVsqQ6Uvj59az0pTJhTEi08vcMsR/lKDMMiPA==</encrypted>]]>
      </text>
    </action>

    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
  </response>

</dir>
    
