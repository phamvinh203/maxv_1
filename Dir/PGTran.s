<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
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
  <!ENTITY f ", @supplier as ten_ncc, @address as dia_chi, @taxID as ma_so_thue">

  <!ENTITY BeforeVoucherUpdate "if exists(select 1 from @@prime$partition$previous where stt_rec = @stt_rec and status &lt;&gt; '0') exec MaxvOnline$Voucher$BeforeUpdate$PG @@prime$partition$previous, d78$$partition$previous, @stt_rec, @@action, @@userID">
  <!ENTITY AfterVoucherUpdate "if exists(select 1 from @@prime$partition$current where stt_rec = @stt_rec and status &lt;&gt; '0') exec MaxvOnline$Voucher$AfterUpdate$PG @@prime$partition$current, d78$$partition$current, @stt_rec, @@action, @@userID">

  <!ENTITY StockType "1">
  <!ENTITY DeclareStock "declare @stock tinyint
select @stock = case when @loai_ct = '2' then 1 else 0 end">
  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd78$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec
exec MaxvOnline$App$Voucher$UpdateGeneral @@id, 'm78$$partition$current', 'd78$$partition$current', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec

declare @allocateKey varchar(128)
select @allocateKey = 'stt_rec = ''' + @stt_rec + ''''
exec MaxvOnline$App$Allocate$Number 'd78$$partition$current', @t_thue_nt, 'thue_nt', 'm_round_tien_nt', 'tien_nt0', @allocateKey, 'stt_rec0'
exec MaxvOnline$App$Allocate$Number 'd78$$partition$current', @t_thue, 'thue', 'm_round_tien', 'tien0', @allocateKey, 'stt_rec0'
exec MaxvOnline$App$Allocate$Charge 'r60$$partition$current', 'd78$$partition$current', @allocateKey

declare @f tinyint, @b tinyint
select @f = rtrim(val) from options where name = 'm_round_gia_nt'
select @b = rtrim(val) from options where name = 'm_round_gia'

update d78$$partition$current set tien = tien_hang + cp, tien_nt = tien_hang_nt + cp_nt where stt_rec = @stt_rec
update d78$$partition$current set tt = tien + thue, tt_nt = tien_nt + thue_nt where stt_rec = @stt_rec
update d78$$partition$current set gia = case when so_luong = 0 then 0 else round(tien/so_luong, @b) end, gia_nt = case when so_luong = 0 then 0 else round(tien_nt/so_luong, @f) end where stt_rec = @stt_rec
update m78$$partition$current set t_tien = d.t_tien, t_tien_nt = d.t_tien_nt, t_tt = d.t_tt, t_tt_nt = d.t_tt_nt from (select sum(tien) as t_tien, sum(tien_nt) as t_tien_nt, sum(tt) as t_tt, sum(tt_nt) as t_tt_nt from d78$$partition$current where stt_rec = @stt_rec) d where stt_rec = @stt_rec
">

  <!ENTITY Post "
declare @group varchar(128), @glMaster nvarchar(256), @glDetail nvarchar(256), @statement nvarchar(4000)
select @group = groupby from @@sysDatabaseName..voucherinfo where ma_ct = @@id
select @glMaster = rtrim(val) from options where name = 'm_gl_master'
select @glDetail = rtrim(val) from options where name = 'm_gl_detail'

if @loai_ct = '2' begin
  update d78$$partition$current set stt_rec_pn = '', stt_rec0pn = '', pn_so = '', pn_ln = 0 where stt_rec = @stt_rec
end

if @status &lt;&gt; '0' begin
  insert into ctgt30 select * from r30$$partition$current where stt_rec = @stt_rec
  
  select @stock = case when @ma_gd = '2' then 1 else 0 end
  select @statement = 'select * into #r from #in'
  select @statement = @statement + char(13) +  'update #r set nxt = 2, sl_xuat = a.sl_nhap, sl_xuat1 = a.sl_nhap1, sl_nhap = 0, sl_nhap1 = 0, tien_nhap = 0, tien_nt_n = 0'
  select @statement = @statement + char(13) +  ', tk_du = a.tk_ck, ma_kh = a.ma_khon, ma_ct = ''PXG'', stt_rec = ''' + left(@stt_rec, 10) + 'PXG'', stt_rec_pn = '''', stt_rec0pn = '''', stt_rec_yc = '''', stt_rec0yc = '''', ma_tt = '''''
  select @statement = @statement + char(13) +  ', tien_xuat = case when a.px_gia_dd = 0 then 0 else a.tien_nhap end, tien_nt_x = case when a.px_gia_dd = 0 then 0 else a.tien_nt_x end, gia = case when a.px_gia_dd = 0 then 0 else a.gia end, gia_nt = case when a.px_gia_dd = 0 then 0 else a.gia_nt end, gia1 = case when a.px_gia_dd = 0 then 0 else a.gia1 end, gia_nt1 = case when a.px_gia_dd = 0 then 0 else a.gia_nt1 end'
  select @statement = @statement + char(13) +  'from #r join #in a on #r.stt_rec = a.stt_rec and #r.stt_rec0 = a.stt_rec0'
  select @statement = @statement + char(13) +  'update #in set ma_nx = tk_du, px_gia_dd = 0, ma_khon = '''', tk_ck = '''''
  select @statement = @statement + char(13) +  'update #in set ma_nx = b.ma_nx from #in a join dmnx b on a.ma_nx = b.tk where b.ma_nx is not null'
  select @statement = @statement + char(13) +  'update #r set tk_ck = '''''
  select @statement = @statement + char(13) +  'insert into #in select * from #r'
  
  exec MaxvOnline$Voucher$Posting$Inventory 'm78$$partition$current', 'd78$$partition$current', 'r70$$partition$current', @stt_rec, @@id, 
    'ct_dc, gia_nt21, gia21, gia_nt2, gia2, tien_nt2, tien2, cp_thue_yn, ck_nt, ck, pn_gia_tb', 
    'so_seri, ma_vi_trin, tk_gv, tk_dt, so_dh2, so_dh3, ma_nvbh, ma_nv, stt_rec_px, stt_rec0px, stt_rec_dc, so_seri0', 
    'tk_du = c.tk, tk_ck = b.tk_cpxt, ma_khon = c.ma_kh_x, gia_nt01 = b.gia_nt0, gia01 = b.gia0, gia_nt1 = b.gia_nt, gia1 = b.gia, tien_xuat = 0, tien_nt_x = 0, tien_nhap = b.tien, tien_nt_n = b.tien_nt', 
    @statement, @stock, &StockType;
  
  if @status = '1' begin
	  insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tt_nt, t_tt, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
	  exec dbo.fs_PostPGTran '@@prime$partition$current', 'd78$$partition$current', @glMaster, @glDetail, @stt_rec , @group, 1
    exec dbo.fs_PostPGTranEx '@@prime$partition$current', 'd78$$partition$current', 'm84$000000', 'd84$000000', @glMaster, @glDetail, @stt_rec , @group, 1
	end else begin  
    exec dbo.fs_PostPGTran '@@prime$partition$current', 'd78$$partition$current', @glMaster, @glDetail, @stt_rec , @group, 2
    exec dbo.fs_PostPGTranEx '@@prime$partition$current', 'd78$$partition$current', 'm84$000000', 'd84$000000', @glMaster, @glDetail, @stt_rec , @group, 2
    exec dbo.fs20_AfterUpdateGL @stt_rec, '@@prime$partition$current', 'd78$$partition$current', @@id, @@userID
    exec dbo.rs_AfterUpdateGL4PXG @stt_rec, '@@prime$partition$current', 'd78$$partition$current', @@id, @@userID
    insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec
    insert into r00$$partition$current select * from ct00 where stt_rec = (left(@stt_rec, 10) + 'PXG')
  end
  insert into r90$$partition$current select * from ct90 where stt_rec = @stt_rec
  insert into r90$$partition$current select * from ct90 where stt_rec = (left(@stt_rec, 10) + 'PXG')
  update r90$$partition$current set ma_nx=tk_du where stt_rec = (left(@stt_rec, 10) + 'PXG')
end
  update r70$$partition$current set ma_nx=tk_du where stt_rec = (left(@stt_rec, 10) + 'PXG')
  update ct70 set ma_nx=tk_du where stt_rec = (left(@stt_rec, 10) + 'PXG')
">

  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete ct00 where stt_rec = (left(@stt_rec, 10) + 'PXG')
delete ct70 where stt_rec = @stt_rec
delete ct70 where stt_rec = (left(@stt_rec, 10) + 'PXG')
delete ct90 where stt_rec = @stt_rec
delete ct90 where stt_rec = (left(@stt_rec, 10) + 'PXG')
delete ctgt30 where stt_rec = @stt_rec
delete cttt30 where left(stt_rec, 10) = left(@stt_rec, 10)
delete p00$000000 where stt_rec = @stt_rec

if '$partition$current' &lt;&gt; '$partition$previous' begin
  delete r00$$partition$previous where stt_rec = @stt_rec
  delete r00$$partition$previous where stt_rec = (left(@stt_rec, 10) + 'PXG')
  delete r70$$partition$previous where stt_rec = @stt_rec
  delete r70$$partition$previous where stt_rec = (left(@stt_rec, 10) + 'PXG')
  delete r90$$partition$previous where stt_rec = @stt_rec
  delete r90$$partition$previous where stt_rec = (left(@stt_rec, 10) + 'PXG')
end else begin
  delete r00$$partition$current where stt_rec = @stt_rec
  delete r00$$partition$current where stt_rec = (left(@stt_rec, 10) + 'PXG')
  delete r70$$partition$current where stt_rec = @stt_rec
  delete r70$$partition$current where stt_rec = (left(@stt_rec, 10) + 'PXG')
  delete r90$$partition$current where stt_rec = @stt_rec
  delete r90$$partition$current where stt_rec = (left(@stt_rec, 10) + 'PXG')
end">
]>

<dir table="m78$000000" code="stt_rec" order="ngay_ct, so_ct" id="HMB" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="hóa đơn nhập mua - xuất thẳng" e="Purchase Receipt - Direct Issue Invoice"></title>
  <partition table="c78$000000" prime="m78$" inquiry="i78$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã NCC" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and cc_yn = 1" check="cc_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBZCjY1pO6/p+NqFQ3l3vjFmZ+SRkeDTSpB/rMZvVpuSg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba" hidden="true" readOnly="true">
      <header v="Người giao hàng" e="Delivered by"></header>
    </field>
    <field name="ma_kh_x" allowNulls="false">
      <header v="Mã khách xuất" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_x%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh_x%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCC5XZ1IDPpaDqirJElpwGphj7k0IfLUu5dBXM9DEqppA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right" >
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri0" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right" >
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left" >
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
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
      <header v="Số chứng từ" e="Voucher Number"></header>
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
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1 = 1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>

    <field name="status" inactivate="true" clientDefault="2">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Chuyển KTTH" e="1. Release Later"/>
        </item>
        <item value="2">
          <text v="2. Chuyển sổ cái" e="2. Release"/>
        </item>
      </items>
    </field>

    <field name="d78" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="128" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="PGDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r60" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="128" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Chi phí" e="Charges"></label >
      <items style="Grid" controller="PGCharges" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="128" categoryIndex="9">
      <header v="" e=""></header>
      <label v="Thuế" e="Tax"></label >
      <items style="Grid" controller="PGTax" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="ma_tt" categoryIndex="-1">
      <header v="Mã thanh toán" e="Debit Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="-1">
      <header v="" e=""></header>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thanh toán nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien0" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_cp" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Chi phí" e="Charges"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Chi phí nt" e="FC Charges"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế nt" e="FC Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán nt" e="Total in FC"></header>
      <items style="Numeric"/>
    </field>
    &XMLUserDefinedMasterFields;
    <field name="loai_ct" hidden="true" width="0" clientDefault="Default" categoryIndex="-1" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" hidden="true" readOnly="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_ncc" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="dia_chi" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="ma_so_thue" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
	<field name="fcode1" hidden="true" categoryIndex="-1" readOnly="true">
      <header v="" e=""></header>
    </field>
	<field name="fcode2" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
	  <footer v="&lt;button type='button' class='btn-inform' onclick='set$Voucher$CreateCashDisbursement();'span style='color:#0000ff;'&gt;Tạo Phiếu chi&lt;/button&gt; " e="&lt;button type='button' class='btn-inform' onclick='set$Voucher$CreateCashDisbursement();'span style='color:#0000ff;'&gt;Create Cash Disbursement&lt;/button&gt;"></footer>
    </field>
  </fields>

  <views>
    <view id="Dir" height="178" anchor="10" split="10">
      <item value="100, 70, 35, 21, 105, 8, 105, 8, 105, 18, 58, 42, 8, 105, 0"/>
      <item value="110100000-10011: [ma_gd].Label, [ma_gd], [ten_gd%l], [so_ct].Label, [so_ct], [ma_nk]"/>
	  <item value="110100000-10011: [ma_kh].Label, [ma_kh], [ten_kh%l], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
	  <item value="110100000-10010: [ma_kh_x].Label, [ma_kh_x], [ten_kh_x%l], [ngay_ct].Label, [ngay_ct]"/>
      <item value="110000000-11010: [dien_giai].Label, [dien_giai], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="110100000-11000: [tk].Label, [tk], [ten_tk], [status].Label, [status]"/>
      
      <item value="1: [d78]" />
      <item value="1: [r60]" />
      <item value="1: [r30]" />

      <item value="------1-1-10-1-: [t_so_luong].Label, [t_so_luong], [t_tien_nt0], [t_tien0]"/>
      <item value="--------1-10-1-: [t_cp].Label, [t_cp_nt], [t_cp]"/>
      <item value="--------1-10-11: [t_thue].Label, [t_thue_nt], [t_thue], [ong_ba]"/>
      <item value="1101000-1-10-11: [ma_tt].Label, [ma_tt], [ten_tt%l], [t_tt].Label, [t_tt_nt], [t_tt], [cookie]"/>
	  <item value="11111----1100: [loai_ct],[ma_dvcs], [ten_ncc], [dia_chi], [ma_so_thue],[fcode1],[fcode2].Description"/>

      <categories>
        <category index="1" columns="799" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="769" anchor="1">
          <header v="Chi phí" e="Charge"/>
        </category>
        <category index="9" columns="769" anchor="1">
          <header v="Thuế" e="Tax"/>
        </category>
        <category index="-1" columns="100, 70, 30, 21, 100, 8, 100, 8, 100, 8, 58, 42, 8, 100, 0" anchor="6">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenVoucherInit;

    <command event="Loading">
      <text>
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
        &CommandGetVoucherNumber;
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX+vL/lMKqrWwOswDzY1LUU5eecpGPYOo7nlvhDG0Hb9Tg==</encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<encrypted>jsguT1F3i8nGtqLMkxZj7ZE3/7wegKNgL0bQHB5rxUHCKdWEuCuz6Y+bcJ0Ai+Ew</encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjDEQ3kCZYIzXDrbWrsMmh7u/oKtoI2Jct/atPcvdSHfrbM7qdzC0OS8g4IVC9xQWQ==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<encrypted>gJoFmK0sS0RHBg6WicanqfW8GRTAxWMtvLxF2lGmq4BENPIaanQyi9CsVwpvZMAfwkZzbejXMAVbSkF0y5wRqb9+I5FC2Dh0CssoSkJ72MA=</encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<encrypted>lsf9i48iCFsD7cYoW2mVrQMPhk/z/ngxJzr1+BAd6oikVi2q+7XpLzUUiAava2CqyuWRoHLC72gPWOw7CEYo5wbpGMJsZ/eZugFELd7eU9OHl4PTlMrXD1XHva1ahS+2/05Lu4cBwdHfhnOiIk+MgM8bC80gzpZAnNNJhsAydmXPbtmomtBTvCpSDohE1mcsKZT4gmf9u2n2Ra5ENqIQcA==</encrypted>]]>
        &CommandExternalFieldSet;
        &CommandExternalFieldQuery;&f;
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>Y5rIOYiQWoUsWRiz53cxaUAll0udMBFJL0yfjZnv56Ws5XrMCCnBKv1HrXqKMD+kBiFVGtUPvrnmhO/eLqPkxnzyqxn5KlbzwvI2ozV9J5kFPYAFUE8Ito9cZJjvl/lEfbhzuFS+nXvVvcx//ieI9v4+6YxBFweyrRlII+ZCdgkbxEwQzpJnJcOJUn7iwWhHi6fsHUBN+PTxbhhKvKCXjjxQxkPOYrAgiDSxkdS/VN+pJhzKLjASd+fs7g+Dh3qinj+UC3sL7bkV3U1q33jf2lL1q/uM/d7qPNsnMwG1aCVoQjeulXhxWEU96LPDiXKDgwiyD55r/f+gnpe5v1Uakg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>otbWrCFrifJ8xAwCAerHd1bCE1QFEtQHQ9zMCTCNHHLsukw/EqCgcx4j70afnvGj7T3UrxupqO7y9Fv34ykX2tq6qPUYso3uLSChdqSTVa5cDqCwrmZC/4saNEE4/5fCpNMS9yiFB9CbPODv/0C39OLpidtKPCt7Id9/cN22ETDIwlXP0sV2tc/p3TONbrz2Ei/hrZvEmslISB/Jgj+izhjUTtn6l5jAbd6SU1WVMZODI7+dNNNmb87HzE6aGArG0/u1FdhQeap2RwlJrY5VC4/Y33T8nEdyP86YQJYoiTORzijQjDYV7k2LK7Ez0fd/dBBhbfY4qDbyGSl+/VODPA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>FFheiTy+5Vkq6wF14IjLS1C/YOndeZwKkiphN91ZQDACS/GlTSJRO5RGpv/OjZdRtrQF/Rrt/yU+9DUwAmi+utzZbziHzDyO3CypxIfMjYNpyzhk8CDv+ePBXdX8hKTO</encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &Post;
        &AfterVoucherUpdate;
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjNM5DJ9nuOA785bKXqt9ViKX0KXllerWVcqK//gDH6sU6+cB0/Cg4zCuf5+pR5ZL0NrvzFJX4o4KNG8dMFIDXOay+w/wfzJiqDvgyfe/dqXD</encrypted>]]>&CommandShowWarningMessage;<![CDATA[<encrypted>FTgzG0Ebn58SWQYsf65nyjIIGuY/GZ6oxX0a/PwjGKzviKX5u9uIEUIVQbbNJofhdxu3S4ep6ls4RjJCLKh4YlshfeCbWblD3/5LcHM/Og0=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckLockedDate;
        &CommandCheckVoucherNumber;
        <![CDATA[<encrypted>7de0syDeRV9jfvTPLdJB/IyzKafipWBX0kJE2WT+gfftMs21AE/s8ovDRPZ5KYqDUbFnWDIH0gHZOv9egTPVa1lNhE9obPWRCQ8eqjBAir5+u2v1mJuoBfwuwZjFJS4OVlWc1wB2DvDTFrjQ9QXZ9pwZZLWmESknQEdHFMR2ljY=</encrypted>]]>
        &BeforeVoucherUpdate;
        <![CDATA[<encrypted>mXnGaNTRwvNZKpeOokYe2Qx9uN4OrdoQ6m2Ax6kSiy9lktDNXv7urxyBcbLGzX7sFVbZGuAFTyKJmQt0JLRu87Aw9uPUco+NjUVz/EHohvcBVHhumvRNf0W8mjoy/iVP7+NCWPlgsu6fA5ybAiPLOhcaPZY/80KRJ5QJKmgpTKQ0RojjekQkzUUQjXzi05bw1XZW8FKzQB1whz+QYMXUN3U8/wUU8Gnv7fMq63ZnRaG6UAhk2rqb570ud6snWHbgPvwqJMpM9jETUq8NW7TNv2ExW0APUPh/w2lWrWgnXHxitXooW+9CNT1qH2qMGPOFaVPQdcCiv71JFRmN3W2raG/6z6GR+XYCnhfEDg3SWftnKMQiuph1ysMHnVNsRMQv/iLc2bU80IV2FGA075MMh4twkuzJKWVTU60mtlUUdxtaXme2N3GmXks6dJjRl1Tr+0l7rlAU7ShhexLiVRiciGg2axVtf8KyL6nvTI9m00wcJ1fTPT0hmFgOuhfM8X5I0fvTVx29x9cMe4X4a38nacgIf+n+yI7hRjKesofW9PeHWhJ+3eYO4HbZkPja5byX3Y2mR2nKKBriKlvf/1QWwXP7pmJY/0ubxc9b8U1BNHc=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>sY7/sFYLtA3aiKJ5cR0AfA+ebZ/QfgFe0ic0prmScSy26I3uFd4CFZzRxhkZQu8xfIgSfet5yVCmVnxDCql0mlVQX2wbyZgsWCUOQLmXTHj07g0omGWWo41o9UF03GyaLInMuYXZR/kSj5vVxdS+5RgIc6aGEHwe4XUiAqJ2uAF9QliU5yStp7AsHVIFoqs/w7lgv1uParpUxKhsGkUVzmexTeoKQt9pkwUk4jD6OMUr5Rd57tbdomiQt36ZHV13</encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &Delete;
        &Post;
        &AfterVoucherUpdate;
        &CommandShowWarningMessage;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<encrypted>rCwvp7lhVU0nKh4mD6DZeoUvlduKQ8qaCFHJKX2JKKVIvA54qD21+fIEC5rKbnaL6tOWz9Z5hduYDhVtOFq5pePLCQrvmS3NTF+3A098KV24bE/3KeSnqlx7xdSb7M0LCIuIqm/TQdSrb4G/NSJVPKuqB4uaNEqpUFV+qyq4c6em0RriB/yuG6IOJe324kq2</encrypted>]]>
        &BeforeVoucherUpdate;
		&InsertHistoryVoucher;
        <![CDATA[<encrypted>7Ydw2FQA2IXj51U7RaFNhba+lI/CXl0ocwm2TLsy4ZqiiQZOVSXFW8nES8HR7zacwg7+UmjHkZzNFLlmoTRPfkA7wK4YcWYg+eJjO8a3XulJgiqbdjz8lKdCBT4muv7VaPUNbwlduB6t8ka2b+KZNr6WGPWeDs2mqcJwzycoeQZ57Nj9EJKtWQ7dzjrRviclt7HJbnVZJNpbnVqLToXOgRuY+Hj4XzAd79VaokpAaG8=</encrypted>]]>
        &Delete;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>RW4sqGK0p4umOmYWNmadGhA9uBVOJ9m5KxVtugetgitM+8nUFGtanJSE8wRrdGXVs7X+hnQO61bJtJOGsu1fY8AyhuXIX3rPld3WWyJ/ttDUVaEFSf/pVw+Pnxgfv3lLagpghz8yHbpm4e87PLeYi5+/WpBzWIpo3+W3cu9TVZdm4fjqVJNUpT+LSeyWNIlxcLp/j1GKm9gT/gL53TyaZmJ7jaEdD601Xx0Ov4+VlD0XFS3Y81SA7b7/FUFAGgsVvRsoenuWaCJo54aJtliJF36cTTHtOkrSDrRm3QnRtfDuT9CDqPqQM/76omURG7W9mC4me7y15lmVLsm2DF7S+s+Y42PPOwC+YIIloXii9ika54JW+eeL91khqIY7HoBQeY2eZGuFZ0wVw4Xv+dDGNfxD+UVNQuZZX99wMf1VZQFSdW68buNZi3HnpkmqkI6ULD2Kuu6H/R77droK7fPXFZlpXZQoNIw0JVNltNCSG3U+U0sE+w1yR+D+Ot5hi07EereO7X32kOhfYNLyJDEteao7k63Uef2veTQfbCyh1vaCV9GAuY+iLFc8BZMFGkIwVRIr4kky2IpGCZpiatYCwF6/lX111yHkTF7gnOLJxLiKH2DOP/FSoUHiFTesFbxELG2V2de7DDrIw7wgZIElw2PaSPfRE4kQGBADH76UJ8i5W2cNj/Jb8dmiR8oceis0eLS4IDI8BM40jUDS4Gx4JvGOtAQcrFp8Csbb6hf0mEu0spCDmI6sCx+w0/qvP/pzmdFFZQZ29w4oQNRxO/rvzQh7bd8dDeW9l+Y8ws0MvGATSSBTZ2eAm0BHbJTLUru9/+cPWQIwxxqiE2iwrs2HZOuK65QZVhxSlPPXEUMfWnFnfT1GRExSapFYkmh/s79yHvnw+ittUg1i9BA3j6hM1YodgyBF0kW3qc5vU3hPFA4jwuEfu6aR5TEzFX7744p7DwK8lB49kKY7xVwepcsuQ0sKglScgVDgiTozqYFLaQ71Kdg1bkKpcFG74u+tJ5R7yogtaQmGm3yU3/gsMj6EN8Z86Y6QU9PiK0Wg2NtMwe2FxGur8P5r4I9zi1dwRv8s</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>Zi0ZLVoUp0YDaJoPvnLsludJzkWQihUUVXOHLbZfZZNmcb2oZpZRME5mKiYyo/awVppqdYPIQ/yqQE0uhgUeKjD7vOOlrDsejK9x2hlzUwp1oRfQSXBVlxpZPElSvVhIIHKyFJnRhVVxXiZurljjRA==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>7jXFiE39afzZ4ncvAfrxYFbGPEj6AugM6iBrod1V8Mz1gDh4esEr885p0/m6A/ePpQBTpKmdD59lu+gP4Ll9113j3IgFWvW2oVenM1t+BhL40rSSyGK80mOc2kakYsvnh5/1KXTJx4utaxbbw3CYIpF+mg210N9pHd78kRDM33Hhpm7kVSmmybshjtwrDECD3qfu11klH8S26SuCzAnSWRj2fCxRyYDaJLnXzdgjXQuk+meH38eZkInWW2FTbENv</encrypted>]]>&ScriptScatterVoucher;
      <![CDATA[<encrypted>GlNezHyxcs72OQckj4rk/CnyiwbAodnUcUKG555cxJIDn8MiB00oX7rX78SOvDk3Zu7hL9FOP+doXIzJW2pCl60fZITUIVbg3miiCmm8wOqgIMciv9jBcAn2/I29d0QwRMOu+DGrenytc0teE7lih7hU+VokpK1HJpOkROIKIcY=</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>TjuyLqlaXdbO9RyvV6FU4TAoLjGGz3LkDTXcEQoZ/JARLqhYyBKj8IH5SuN8a8NbLrJeizl7d/4aUD+XWL0FcYK/aYiMsQ0GyTG9iYw3daK3QKQayd337CAjf4gl0dLBGN568ui8o73i5gHnUh2vhdoZ3LX5tLZJvOEPjTT6i4+YrUZxbPX5tZnkn9nHo0PIBfEjnd9stETNgais+wVg5MGXQs2TKVeBcumxpn+AKz8U+qIDsLSjUoSxPJOHNc1q1MWCUgFkkQrOuw26WiF0picb+7hni3OW7M/uTvdI6V/5eVeBxYRLq8FbwZ6tR8Ndw88Ps9ZdJSKU60JcsMVEJEcwSTdhJP6OEd3U38pT+nI/SZYSvTlMkpHH2++hxEmUaojEBjlI8GaRTWzeMh6ELkJoosztXBFJXePlCVTng68=</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>VOtsgWyUTDuaQ3PeoA5lcBc4paZly5pWDs3DRaUCqIpiCaiDdkd4bh/y89XX1kA5emLaoJYER+vDjk0+dVOJ4g==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>Bs/yCAMRJhh9lVEHTfngIwJdjYTvn5I7XSIAbH4W/HAFx8AuzIUsTCZWtBUxQ/SVeCM8SA2KHe3IdcZsn3LQ99Sz9WwuRwOxHx1ZroUl/XiF98mrqx56USOXkZUw447eKeHzbZbrTsgA9Qb/EAan4mZwcnZjuSpogrvA/viSMubnEUuZzwU8xI81Zgdg9n4llRGHmtixGbqylkdiWQZS1P22tgYPSOkRzXj84qKDOEady21+1jCQpuhj9PBxmmCdMIflUOkJrky7sMAfiBfvBUQS9SA9RvkiLO9hMqyoTvOLCoplKwuSzfv2kqNrU1FpG5gVXM+t/vf46fyPCzrPuMyJbsU3q9vcO48T+VeGqJKwJtKJJyDU6SGg007PWAOiJcNNqiMbY7FdqmxaKPHfWshpLu4ymJMMRUnK0r7BXADZwxn3zIE/XclrlXCi+r8VjLnklOqzWAfcbuaYmeh44voNyS+t3h3xaFlxP5RJvmTadgsTo+PtVH0j61fO/acnhjF8WUZZdEqWi/sGv5UkqcHZe00tSBs7Re02wP1o0c5ee9UW09ga0tAFNCsZnW0fvvI0hcEvwkBUpkllRjCwsL4LNBt0AStL2NxIduowtP+5JlRHOYm2HR4RA89VCJDh</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>ZpwnQItqN3+oFhrtYsm7XMax7gU++Cu5RpcH+/voPScTxMJHSIW9sZXEHwjBuyuCr3g/1ajphL/VT0J5ZmR3BkrBSF7OSuE8hezN2SQTaL2mp63CzL8/J6rptQFh+1g7IyjuMM85l8yp2BG7drDVc3VVyO3w/w7UPEY0T3/vcvHzZI5mA4U396eXZZGGbooUPpVZpLGwOdKmXVql2HZOVQ==</encrypted>]]>

      <![CDATA[<encrypted>qF75yWgZ+UGTvjGuFyb/8HludCWvPX3LmfjpEhNwSl+UrpOp9y8A0d3nEuVyhkZmP0dsjVI7FcQEEk+t9KiH2XpuIljsyZ+St7cZYKuDS41Avr31QaqhhS2anSlPX34+xY2fJb2RnDjstauDqH/rtHsCc98ohQnxf9SXk1C5gq3BxmdQJcyG8bDgxHZ+NQKup2HYIFKOrqNijHEmJkoJFBmJYTIjj6Xr6Pze4kIQ1ObFmkmuaZtjci9ZSdNJ0nKhkULfRZSZk3rqoxdsmyWU3Q3VTLSUrw7MqvIUiaN+OaoLwynUH7BfMvRUTqYyePDpBUOg7Re1KX0e/dYOmE0AVWDHu9XyklMsLYa8EukUQU0=</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>ok197SQK5VUeaBeC2/S3726so2TTjkVTNswaNYUCadIMp3a+ptLdxzbzim9iohUcTgzEfSq9k9R0zlDwT0A+DA==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>ok197SQK5VUeaBeC2/S37288mxDOasB+mfMcYmLgBho=</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>BXrAalpi9WbHs8JiwyOD5kGLSLuSeyEkwGnw4AFLzuXWHEg4/q/t5b/ELwXYipnslCzwfpmdF+VABu3u/NuyYlSEToCP858T4dPsWmYrRtHIfAz8hKoEePFF1Y4YIx0PLDcgRI5vr2/1UaqxZ/BlQOkv6sHp9KVQWGxQClhVKqcdvb+IcR9qevdOji67Z77RIv81v+JNM+yTBxSsvo/lsytiMzi4Coi9JRq9zF/tmy7P3ZNq2/dPKPgdlqa6oDFUHTxLbUpXtQcCjqnuWfuNGeDSfPM9v6LeJrfEFMr84viY78Z3bjxFDLWZAQSTab3i8vf7MSqRz8TR0Dd096E/JAX6SlopgHiX52Tfi16EdBwElahC8q8n4LNYNPt05cD302MIYAYKc/dv0BuEpSakt0k8l5YD9Sizbdpjd+VjkiB8wti7KSyeqsG/kcrSHcqt5XmsJxu6BGKZrIb8jcsG8IDdn+OP7KbN9lDAcmCRPISt6YEauouTdUE5NTZnzWIzD1xB0jX0qLeTFtNmnlNOgwKa/J+GY69V3KcYa83pmyTxy889ijkd/SZQoDnCvTmgZwdepgapEZNWjbq1qEKPDC8Wis5dJf7Z2977KYwsMOz3Q81rPJVFIhkNOAzZkunnFlieP46u4U8z/rdqgrEvqOlrQLuAJxbNtiBwbtA4YM6xa9WXguW4KyBRaLWlAyj/</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    <action id="Customer">
      <text>
        <![CDATA[<encrypted>UpzVdkklvokdYL0QzGIRwMWkMsYjklcpXUXuhhxFvJzzjlKpncg4T53mwqm49xmvP6ZpWQgEvpJRUwCQUpyAv3RpMvDRRrZ49OjciVS2ZOinKwa5DKl2ueLzF4jzkQRryjjt7v4bkR+lg2SeN2UaVJZcktLSKcd1sPOeIkpxZ7rJ0NRYPklUAC6NH3RzIqHy02HVE6c1+bJ3fK+SoQIXxrJzoqm6uYDF85x7ElRHEDsc2kCSNTbxfNHqq46Z4ITCVEVk5s2PHJiMeK+tdUwaRTuJe2ynktKbTN1Mllai69s=</encrypted>]]>
      </text>
    </action>
 <action id="CreatePC">
      <text>
        <![CDATA[<encrypted>FAWBMBQnc+K2bEJwiN5QxtBo4Ai+SmYAWW8kohq9LH2FpOgcI2BHzsjzXrm3D+gOWlIBjnCKDKGDst9OURuTc1rJbsXKTTl0D2bkrkH4iI8Y02nonTbYs6ydCg7bSBV56IS0ROSjLAoU1iMBSFlvecRtB+PjoBFgh9M3P4X7urpAk0GDSwO75z+uUan6gUbOyQ4sx1hTJXILp85NprMbHHGGEQr85hbcogSzMwwRpB36RZjpTw4QsDgLiRJnSr2TdU7GbkBr68hUROuzK1FhtMLqYeQXkBJg1rOYSY+3ZVsUkfVkl52wPUby8rNFSd83LjhFkUHFRaZGc1bsXeh9Un30rpHop9luwHPvUjWsRolqxvkJpdn6+3mCQ3PT/g8ZbkeP+iaA046xAImi+sGPHbDOgLevqobEL/2LPx0gO7iSlt4VIJXnuSBhBr8tZbLe</encrypted>]]>
      </text>
    </action>
    <action id="Transaction">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjloZ8/6sVigf+vY50+JdF+cznn29mGIANbWQav1/j3jEleopRzpvvXA9rx0+ycx+eACGKZ5rB0FEM1jrZXz2udQ050IqeJc2Xub33zbbBDNf7Ev1T0KdS8Osst62kjbMQ==</encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;

  </response>
</dir>

