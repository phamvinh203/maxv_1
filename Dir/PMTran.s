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
  <!ENTITY UpdateCurrentStock SYSTEM "..\Include\Command\UpdateCurrentStock.txt">
  <!ENTITY DeleteCurrentStock SYSTEM "..\Include\Command\DeleteCurrentStock.txt">
  <!ENTITY InsertHistoryVoucher SYSTEM "..\Include\Command\InsertHistoryVoucher.txt">
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">
	
  <!ENTITY BeforeVoucherUpdate "if exists(select 1 from @@prime$partition$previous where stt_rec = @stt_rec and status &lt;&gt; '0') exec MaxvOnline$Voucher$BeforeUpdate$PM @@prime$partition$previous, d72$$partition$previous, @stt_rec, @@action, @@userID">
  <!ENTITY AfterVoucherUpdate "if exists(select 1 from @@prime$partition$current where stt_rec = @stt_rec and status &lt;&gt; '0') exec MaxvOnline$Voucher$AfterUpdate$PM @@prime$partition$current, d72$$partition$current, @stt_rec, @@action, @@userID">

  <!ENTITY DetailVariable "@d72">
  <!ENTITY StockType "1">
  <!ENTITY DeclareStock "declare @stock tinyint
select @stock = case when @loai_ct = '2' then 1 else 0 end">
  <!ENTITY DeclareStock4Delete "declare @stock tinyint
select @stock = case when loai_ct = '2' then 1 else 0 end from m72$$partition$previous where stt_rec = @stt_rec">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">

  <!ENTITY f ", @supplier as ten_ncc, @address as dia_chi, @taxID as ma_so_thue">
  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd72$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec
exec MaxvOnline$App$Voucher$UpdateGeneral @@id, 'm72$$partition$current', 'd72$$partition$current', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec

declare @allocateKey varchar(128)
select @allocateKey = 'stt_rec = ''' + @stt_rec + ''''
if 1 = 0 begin
  exec MaxvOnline$App$Allocate$Number 'd72$$partition$current', @t_thue_nt, 'thue_nt', 'm_round_tien_nt', 'tien_nt0', @allocateKey, 'stt_rec0'
  exec MaxvOnline$App$Allocate$Number 'd72$$partition$current', @t_thue, 'thue', 'm_round_tien', 'tien0', @allocateKey, 'stt_rec0'
end
exec MaxvOnline$App$Allocate$Charge 'r60$$partition$current', 'd72$$partition$current', @allocateKey

update r60$$partition$current set tien_cp=round(tien_cp_nt*@ty_gia,0) where stt_rec=@stt_rec and tien_cp_nt &lt;&gt;0

update d72$$partition$current set cp=round(cp_nt*@ty_gia,0) where stt_rec=@stt_rec and cp_nt &lt;&gt; 0
update d72$$partition$current set cp_vc=round(cp_vc_nt*@ty_gia,0) where stt_rec=@stt_rec and cp_vc_nt &lt;&gt; 0
update d72$$partition$current set cp_bh=round(cp_bh_nt*@ty_gia,0) where stt_rec=@stt_rec and cp_bh_nt &lt;&gt; 0
update d72$$partition$current set cp_khac=round(cp_khac_nt*@ty_gia,0) where stt_rec=@stt_rec and cp_khac_nt &lt;&gt; 0

declare @f tinyint, @b tinyint
select @f = rtrim(val) from options where name = 'm_round_gia_nt'
select @b = rtrim(val) from options where name = 'm_round_gia'

update d72$$partition$current set tien = tien0 + nk + ttdb + cp, tien_nt = tien_nt0 + nk_nt + ttdb_nt + cp_nt where stt_rec = @stt_rec
update d72$$partition$current set tt = tien + thue, tt_nt = tien_nt + thue_nt where stt_rec = @stt_rec
update d72$$partition$current set gia = case when so_luong = 0 then 0 else round(tien/so_luong, @b) end, gia_nt = case when so_luong = 0 then 0 else round(tien_nt/so_luong, @f) end where stt_rec = @stt_rec
update m72$$partition$current set t_tien = d.t_tien, t_tien_nt = d.t_tien_nt, t_tt = d.t_tt, t_tt_nt = d.t_tt_nt from (select sum(tien) as t_tien, sum(tien_nt) as t_tien_nt, sum(tt) as t_tt, sum(tt_nt) as t_tt_nt from d72$$partition$current where stt_rec = @stt_rec) d where stt_rec = @stt_rec
">

  <!ENTITY Post "
declare @group varchar(1024), @glMaster nvarchar(256) , @glDetail nvarchar(256)
select @glMaster = rtrim(val) from options where name = 'm_gl_master'
select @glDetail = rtrim(val) from options where name = 'm_gl_detail'
select @group = rtrim(groupby) from @@sysDatabaseName..voucherinfo where ma_ct = @@id

if @loai_ct = '2' begin
  update d72$$partition$current set stt_rec_dh = '', stt_rec0dh = '' where stt_rec = @stt_rec and stt_rec_pn &lt;&gt; ''
  update d72$$partition$current set stt_rec_pn = '', stt_rec0pn = '', pn_so = '', pn_ln = 0 where stt_rec = @stt_rec
end

if @status &lt;&gt; '0' begin
  insert into ctgt30 select * from r30$$partition$current where stt_rec = @stt_rec

  exec MaxvOnline$Voucher$Posting$Inventory 'm72$$partition$current', 'd72$$partition$current', 'r70$$partition$current', @stt_rec, @@id, 
    'ct_dc, px_gia_dd, pn_gia_tb, gia_nt21, gia21, gia_nt2, gia2, tien_nt2, tien2, cp_thue_yn, ck_nt, ck', 
    'so_seri, ma_khon, ma_vi_trin, tk_gv, tk_dt, tk_ck, so_dh2, so_dh3, ma_nvbh, ma_nv, stt_rec_px, stt_rec0px, stt_rec_dc, so_seri0', 
    'tk_du = c.tk, ma_nx = c.tk, gia_nt1 = b.gia_nt, gia_nt01 = b.gia_nt0, gia1 = b.gia, gia01 = b.gia0, tien_xuat = 0, tien_nt_x = 0, tien_nhap = b.tien, tien_nt_n = b.tien_nt', 
    'update #in set ma_nx = b.ma_nx from #in a join dmnx b on a.ma_nx = b.tk where b.ma_nx is not null',
    @stock, &StockType;

  if @status = '1' begin
	  insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tt_nt, t_tt, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
	  exec fs_PostPMTran 'm72$$partition$current', 'd72$$partition$current', @glMaster, @glDetail, @stt_rec, @group, 1
	end else begin
    exec fs_PostPMTran 'm72$$partition$current', 'd72$$partition$current', @glMaster, @glDetail, @stt_rec, @group, 2
    exec fs20_AfterUpdateGL @stt_rec, 'm72$$partition$current', 'd72$$partition$current', @@id, @@userID 
    insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec
  end
  insert into r90$$partition$current select * from ct90 where stt_rec = @stt_rec
end">

  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete ct70 where stt_rec = @stt_rec
delete ct90 where stt_rec = @stt_rec
delete cttt30 where left(stt_rec, 10) = left(@stt_rec, 10)
delete ctgt30 where stt_rec = @stt_rec
delete p00$000000 where stt_rec = @stt_rec

if '$partition$current' &lt;&gt; '$partition$previous' begin
  delete r00$$partition$previous where stt_rec = @stt_rec
  delete r70$$partition$previous where stt_rec = @stt_rec
  delete r90$$partition$previous where stt_rec = @stt_rec
end else begin
  delete r00$$partition$current where stt_rec = @stt_rec
  delete r70$$partition$current where stt_rec = @stt_rec
  delete r90$$partition$current where stt_rec = @stt_rec
end">
]>

<dir table="m72$000000" code="stt_rec" order="ngay_ct, so_ct" id="HMA" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="hóa đơn" e="Invoice"></title>
  <partition table="c72$000000" prime="m72$" inquiry="i72$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <field name="ong_ba">
      <header v="Người giao" e="Delivered by"></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCC5XZ1IDPpaDqirJElpwGphj7k0IfLUu5dBXM9DEqppA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" width="0" clientDefault="Default" readOnly="true">
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
    <field name="ma_tt" clientDefault="20" categoryIndex="-1">
      <header v="Mã thanh toán" e="Debit Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="so_seri0" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left" hidden="true" readOnly="true">
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
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
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

    <field name="d72" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="148" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="PMDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r60" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="148" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Chi phí" e="Charge"></label >
      <items style="Grid" controller="PMCharge" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="148" categoryIndex="9">
      <header v="" e=""></header>
      <label v="Thuế" e="Tax"></label >
      <items style="Grid" controller="PMTax" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Thuế gtgt" e="VAT Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="t_cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Chi phí" e="Charges"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_cp" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="t_tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng tiền vốn" e="COGS Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien0" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt3" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền tính thuế" e="Taxed Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien3" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="t_nk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Thuế nhập khẩu" e="Import Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_nk" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ttdb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="&lt;span id='idf_t_ttdb_nt'>Thuế tiêu thụ đb&lt;/span>" e="&lt;span id='idf_gt_da_kh'>Excise Tax&lt;/span>"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ttdb" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    &XMLUserDefinedMasterFields;
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_ncc" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="dia_chi" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_so_thue" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="196" anchor="10" split="10">
      <item value="100, 70, 35, 21, 105, 8, 105, 8, 105, 0, 18, 58, 42, 8, 105, 0"/>
      <item value="110100000--10011: [ma_gd].Label, [ma_gd], [ten_gd%l], [so_ct].Label, [so_ct], [ma_nk]"/>
	  <item value="110100000--10011: [ma_kh].Label, [ma_kh], [ten_kh%l], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
	  <item value="110000000--10010: [ong_ba].Label, [ong_ba],[ngay_ct].Label, [ngay_ct]"/>
      <item value="110000000--11010: [dien_giai].Label, [dien_giai], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="110100000--11000: [tk].Label, [tk], [ten_tk%l], [status].Label, [status]"/>
      
      
      <item value="1101------111111: [ngay_ct0].Label, [ngay_ct0],[loai_ct], [cookie], [ma_dvcs], [ten_ncc], [dia_chi], [ma_so_thue],[so_seri0]"/>

      <item value="1: [d72]"/>
      <item value="1: [r60]"/>
      <item value="1: [r30]"/>

      <item value="110-1-10--1-10-1: [t_so_luong].Label, [t_so_luong], [t_tien_nt0], [t_tien0], [t_nk_nt].Label, [t_nk_nt], [t_nk]"/>
      <item value="-10-1-10--1-10-1: [t_tien_nt3].Label, [t_tien_nt3], [t_tien3],[t_ttdb_nt].Label, [t_ttdb_nt], [t_ttdb]"/>
      <item value="-10-1-10--1-10-1: [t_cp_nt].Label, [t_cp_nt], [t_cp], [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="11010000--1-10-1: [ma_tt].Label, [ma_tt], [ten_tt%l], [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

      <categories>
        <category index="1" columns="799" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="799" anchor="1" split="1">
          <header v="Chi phí" e="Charge"/>
        </category>
        <category index="9" columns="799" anchor="1" split="1">
          <header v="Thuế" e="Tax"/>
        </category>
        <category index="-1" columns="100, 30, 70, 8, 100, 8, 13, 87, 13, 8, 100, 8, 58, 42, 8, 100" anchor="9">
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
        <![CDATA[<encrypted>pe0HoYaFN0aQM0XsqQpunLftLH5RqvzQSZFlxBWKjcaxfcEsmpFQ8DcpGaM1w+mGV8wWxgjcNgyKFCxt5BaS6zIMDXxB16N1ktw/U+hkXQyhb+O/Nay2V/Zg1uARJdlsy8glqDgc5+pwjqf2VS2JeZ2dbbr6zeeCZ2uatIAX0oU=</encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<encrypted>lbSQcpJN7S+imMHSMMEpFuxMaQ+YHc+WwN32WbWEvDgP97ZVNwByO9VDqCKlMF2nPmmORo5xQLuua4yTWHkwbL9cvWN66aovfTcYxu9KoiayGG/qGtnfKFDw3ZEn9E4HEgyancmyrV00zV4j0LCQVltuh9NVWVFGclpm49Z0FL0=</encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX+h8+/zDkfxNKEkuCaDXg5D5afWvPREV8SxT+4cgS4spA==</encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<encrypted>jsguT1F3i8nGtqLMkxZj7ZE3/7wegKNgL0bQHB5rxUHCKdWEuCuz6Y+bcJ0Ai+Ew</encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<encrypted>gJoFmK0sS0RHBg6WicanqfW8GRTAxWMtvLxF2lGmq4BENPIaanQyi9CsVwpvZMAfwkZzbejXMAVbSkF0y5wRqb9+I5FC2Dh0CssoSkJ72MA=</encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<encrypted>xtpsVzpDOO4EX7tUqx1S6zYuvYvLLDRVU7uAa73+Y74iHFIQaIDcyrdIn9gri8j1SFqgoaimb7m0i8XPZ2tVE1WVS4ojAJgjjsM53l+YcpQiRc+XMOsPdfWNXBVs+X/Z+E+hXJJ6cXRs9OOYvDz0GItRX+U+lLnP0SL3ChXQkjE4Yg53AHXgtNCKhZK8vLIyZEM4+fo045V3TfiDCMGp9g==</encrypted>]]>
        &CommandExternalFieldSet;
        &CommandExternalFieldQuery;&f;
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>H3u+n02nzX3HDWbpoYhFmUw8G/59AdFCGBOceN63U5VuO8bQsxi0QdTjHaJ2kE38RUIAbtxUC42TvumYaz6UmOkqHDOe4QhOxFMZriGctOf4pXVihLV2gLmH7aejB1J9vFco8uj5EZv3PKA4fz8fIWxsG/4lGMtmXqcKnKnZNmxUSnsrgYBpXMe5i7kB5Xj0VjdMJA0DHks3vNk4GQBxg1/eSRT4uplLsTUoXhKK8FKYJ/9L+D+0gAhfPV7RipYJ89n8DUqyofYRxpSspis8ZKexh/GtL1KJeZmTaegtDXt7xXctpkwXiWnnukwiV9KGZ0VwRkC7NHFxqn7iNzVR1Q==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckLockedDate;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>zoFD8mgdVFlQzFKY8ztBsdiUewO5Bj6Tfdovrm1BgHL9r7TXuapanJKdPBlBrr8Tjqg4phFzkhrR0AW+4N0s0CR8/rLo8DCh/hzWhlMxcTsk5ZC+aiQVz1WxLHAlA2q+pvBwZCgHvyZVdrfMHM973bwht+bGbURpPL+/MwJZpZVP9Gb6+5Pbyot8bde4GIZ7Cq2q56t7RMPcjfPPUff2m+JS/4/9YWdYr6k2TQS8Mh28FzZq12n1fGD93QytWtB0T4p7dLCxhnLu2n3gD7nL2ZsARDENiVuZ3Z2qyoTdoiwPvpUzTawALEQm2Rp2qs55</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPi0JYEt/fmyj13lkZkzSwhUFLsKjYKMzfew7ZDBxZ5MWRxMqIIuSqz6GLWU9DNzofqOPV2R3q868eXkEdEg4stQ5ZpbG8i1R9keEG0A8F6E3</encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        &UpdateCurrentStock;
        &Post;
        &AfterVoucherUpdate;
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjNM5DJ9nuOA785bKXqt9ViKX0KXllerWVcqK//gDH6sU6+cB0/Cg4zCuf5+pR5ZL0MVtL01/SSgXvIIkjPEpj2YQwNY1asZaw+EZzQ28ctVS</encrypted>]]>&CommandShowWarningMessage;<![CDATA[<encrypted>FTgzG0Ebn58SWQYsf65nyjIIGuY/GZ6oxX0a/PwjGKzviKX5u9uIEUIVQbbNJofhdxu3S4ep6ls4RjJCLKh4YlshfeCbWblD3/5LcHM/Og0=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckLockedDate;
        &CommandCheckVoucherNumber;
        <![CDATA[<encrypted>7de0syDeRV9jfvTPLdJB/BsJ+9ZmZPujoOQQocz+i9VdViEGDNHEPAkyB7CWvV2J115+xFajCijYdu5/nMfUUtVyEzzdifd9kZm6vg4paYuLoupFon8wZ6M4hplBp/4kTsPrYU9jBSovbUE4KS6d9v7tbWBU/fMgv8dKcSkOCpj9K6MpGWSjSk36GGwdr45G</encrypted>]]>
        &BeforeVoucherUpdate;
        <![CDATA[<encrypted>H9R9N5c2HEkYTzIvjtduvBFzcAJB3Uler1S8E/WUlMmGm7disSMiiitykJY5yv2gHv3aFzxWLs3bxAOkOapnYFN4volAjcVvXrL/vg/yP//cQS9yYr1LyeIlRrbZ1raIvl9hNgX2v7NFp7MB4bp2cSkd818wiPPJeMZ9gg0hk2+0/2sCZqC7tNojBbJG/Rq4z0ds41nClCXA+E7AeeM7+kUnv4PX6VOYlacTxyDsjGu8Imfb79r0n/n3hhpSZZjuPTw2osc6hKQtNq6o6lpSkQNYymmJnsb2Wb1td90CZpcUX0kpUDAT4Tn6+9G9lVkNFhFUoDBE32xfcfqDkn1Y/UuYh1HWxf7eJX9RTc5V63qVoW4EVAdIJXDIjK5k9Zm8h/BmrWPXLJorN7oYGyfYfAcjDixmP0RBz46RTrX9IRJQDCllj7op6BMkFVbzjkvhvvfSfrNjbNrMI3PEXIVrIo7/3M9KSk15/pnO4us9mNgPYeAnzHHylsPPqxRnNrnE4rgGC7OWzPZXNOIxpux9NA44yqaq9sJ9HcOQ+mhkLw5zxmVBYu87JUs9frarnz+4ZylQibaNiv44cQy/BHdfVKvoRa82xs6kQ5FqXMhU1cM=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>sY7/sFYLtA3aiKJ5cR0AfJAHyf98zEIUly13dAuv9l3+Oa9WDiHuco+mSfG+H4qFLxLP+57y/vOTd13nWiEzG1iqBwnwd3LesCOvDShBUvAh+pMnJT0hnphVBUzjMD8J5AQPPUWjb4PaPRIcTHbGGhXd6CGaT83g4AgnmNKwq1Rp7dgJLYLp2Gb/NMhKODX2zfWqyanL7L9IW+JFy0iCfpnqn63I8X1hMC+LlaNcvHyyBOlCLaGRPVyclRKkKLZf</encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        &UpdateCurrentStock;
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
        <![CDATA[<encrypted>FlvgT74qhfqGf/OvPvZtexkub+Xbf6DVgf09lMBbZ+N+yX5TOkQh1zQjClWcAyToo6u7PV2NBaK9HNnQc7tYSi+FDSPDmKNZUXgTE012lhkfO7G35LlTFe/DmcD1IzGhiO9JXrimmLj1djdbolx9e5YnFqi20iK9h+Un5+5BT9Hfc34aNvLwHSEfr/0r7ot8</encrypted>]]>
        &BeforeVoucherUpdate;
		&InsertHistoryVoucher;
        <![CDATA[<encrypted>N48N8EMXpHnLcQdkuCcKw+/FiWhqeUQ8MHwjW64DoLOAdYgaisP3cG2eYDJcw5g79r3mfCWy965oPQBb+UDkfbdnJjf+ELaL7ySiL1oByHvPXTMmXzYJ6e4ygfQq/xMpSqYntYWy3PkLbCo06fQVcJ5QrgIVZUmOm9JkLIlxvJ0=</encrypted>]]>
        &DeclareStock4Delete;
        &DeleteCurrentStock;
        &Delete;
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>j+u6XtzVPxuMVEPhhyFkDfBfVoB23VmGhcQYW2XW0tQwJXfjOEhwhctUKTzpctxHwiHlpxMydAfdL6BADlEkW61kCEUk2K3RjtVI70p0mw7VjhXKYa9vi/FRcc8UdJTx+Sxt+fyjsRu+JDE+z/VL9dt8tJzVZ9GBpZ7rtoIQVM1usfMi1gSYxMiJvZZFmiH01oBtcAynmE7E1YOd/W7AsYA2AbagMJQBv6w3NubSlkurcrrXl1A3Q7pRdkPZ48fIlzDAW2XPKZMEb1xMyN21nKQs6w8x5LEM5oEz4yjp03Wc9Ykxqhe86OKxhUeVXAW12SaHb4Iu8SFanGNdw6NhKdmEig0Q9nxEFOqFI04fcQRr7aDYsUIBcydwxIFQAl4TST+fh5/pSRxRIrZPq/OpNwA6EBgV5QWonyqpgLNXd41awZ9BoUnmyfGpCBkkm+yd9mUlPB1doPNnBg7T5VoyJfihk0rX0AinL9YJ7O6zaqOKf9qM/5d0YO/YxTGLxtSqrbNQwCtpQ9BZZKet80NnV+u8fITRRmF7AnvepdDDnrFS6BCmXGXORaca2cxOVGassu2Fnt/+woCHU6QXA1F2bKrx+z1skg6O0TL/CWRNBd1VpmNn1GgKHcJlyi9G02sPbOmcjHQUe/VRdrdaPjrgai+29NGSnVaRKFe/Svrt6hSBpss8Yg33wxoV93y8nJwKJLZuxs4z5tYUamkCOUwITkyu/pS1uPhNabKZxgVQNkssrkdxtB3J+dd/o8guHypXF5vvO8TEa49EmX35pKc28oFHNEgtWSWgu3qPnhRUO9rgYPRhlMJiBr0oWEVu7mxAWWHk3h/hvMxLNnX9dwoo7nQV2Oc2WGRQ7F2tEEmaP91MqHs03H8yo8iLtje2Za4/PpJxXZxXePbtV08fWGBiwc+OEeHfBtjXLHdYDpVXeql74uQYvgZnHPPD6U4MSpvkxZAITo32ngTilvJe9UIJ1lDC48l4jPej3XyuMRZ8rJsKIizWTap2vo1OCi2b9q++C15m8dN/O59drkuUGx1HIKa8pA3ErIdPSswM9kbDnkSj3cqNw3V6D0YOOBONVTXmgMzGiNWvPIOOeY4C+1NnD6b+cAo+uAWWc2lzJ4fqOZcJk8SGxMKa2V0p+e7we2TlUgfWBmH3pT16USAbQGMMlfJZ2LkyEsWz6lL4ih+PetD2uhS1DQv5cVZKu40faiC0UMmsfHUhk5UMKlyq8zbrH5xVXiTaWqk680gohHM8fB96hy85C56NEZnLdu5hqtRg+x3LBFi/GmiZgQp0mV5IhA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS86MfU2bvIdHD+hArj7qQd5Rjgo2Er5/TJhH0k3Bi80yJLatxlBaLEKe/PBvL326Utw8zBlj6j+r1dWFgLy7rU+w==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>7kY8k8douf9F9NSP2KxkVXT0s2/AqhD9bdjJVqDaQZcGPxing2gvQ7lQVjE+bnmrx4hnkaF22DQ6DhsX6YwThU4onxVA+6KpLTYlAN/fj95Miaih1p6ZQ75ykfdpk5Z1d/dRDWZCC6TFrQ1rQhoKtdAXQdaW/0kVA/Z3fRqKutUyJ7jcxoEBorRPAaqj8BKFfuLUelQsjNXxwtLMnXGJMvV1ktUUUlPQrS5Fgz9RqkumlsgWoWgOVT/5VCJFF4otjMCCOA1XqBTnFJnN2w5UjQ==</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>GlNezHyxcs72OQckj4rk/CnyiwbAodnUcUKG555cxJIDn8MiB00oX7rX78SOvDk3Zu7hL9FOP+doXIzJW2pCl60fZITUIVbg3miiCmm8wOqgIMciv9jBcAn2/I29d0QwRMOu+DGrenytc0teE7lih7hU+VokpK1HJpOkROIKIcY=</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>TjuyLqlaXdbO9RyvV6FU4WFSPhAsuCoDe7Td7ctwliOojd3FHXg6k5aOcZJJ1nK5dDGb8gfaZ5oIXVg1eDrLP+afLhD11Uj69c5LGix47qfqPB9ARwcxIVycXctYwCx24/RnKHr7k7QLh/ZiVH9ITzdU6gqneoB+SMOXsHPfOKu+4zDU3hJpJhjUPTFADSrEZUKLI8Es/hwiRfj4PyLehkz6BjjwUrOEcYurT3oB/lzA0oRXaresQ7jsdKYGy9aOH3LLjPSjh5rTSjbZhArP94i+uu4Qwtx27k0eY8ScnoIb/kjugyGV9x39aSoa6xy+SloYdiByxldNW/fbeMF+qHIetzUDw1WPpl5RYymTLjuwks9RmAhhS29x3pW3jjLDLJ3+mxDVptYrJov/RIiobDDIERjSNfWiYsx24CoDrUc=</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>p6aEYs35OzqBxLoRoF5G2zcIHhjVARuIRgt4pU0SfhLI3iMsnKeO1wcWb9xx985eBuoahdJp2jX7Top8MYex3KR9wJIE3uplnuRa10bG3FjEvbMrQZqzoy6PgPKf7KPJhnVPJNX/mUrgIG3EB1esSfAaq6MpQZmez/qhAVFV9g+YmTOgHxkLgK+bsN7fe8W5gQmWLAk8itk90FiKzeNHXFAyelaTwIsVWbg/zXXFooWsniDRj029am0zgRBD+4Gh1hwB2fpO0u/vALjywN7IW8iKz29cTBPbbyyhuq+DULpnEjvLNS35G79US8p668u44QjeKvWXJlkg/gnqq6/OvSHRDCpoEE5Fqn/qGAzGPXdBue+gfukLNP09vgw5nr+Dp6FFXR7BbOFSirZj8gM9LXW3BTx67PY5v8UOrlSAuDs67uu7YsH7LtpNuGG+X2pQyaaUV0myImLd5VEmGlNT6YXkWD8YGcbIFCfH086kQOqsCaKA1ySkgBA7sMjUAt8U/fEqRYAuUI/GkBAdIhRetMVHr2IqXtgJPAs1/EtA7o2ZOzfRdiFUJ7vgctYwlQDoVWTjpxi8NcFhDGQM85jhYJbeXtP809Sis8SGmoP7dmqwiEBKIZZff/XUzdI3vlJeXaz+f4Z/Ls3gIJ1c9C0YSsn3v+fmWn3bge7cGM2gUZRKJlpW42JZR+/B4szWbqdZvH2IHUV+QuqLpwkhp8qmJPOrLJ0pNtR/HYfv3FXFcfnrH8FwjINDcpMSAk1Dczz2</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>VRR5vKbVq1dT8O5ccw2drb5kAE63FGVvL9LwnO23OCDzQ4FVtkZ1PfZ6NZqIB6XgB3hyZML9/gIbfkWSLME59VuXexGXv3GxXQBx8yJ4Z7catzBEEaUd8zF6OtNGCRhVmoiD7BmBWdTgfVyonkUxhsBn6ZRKg6uTO40lr71s3dNR/BipOBsYIPp3r2TYLlc5r2ynfDITsfWejigoV1ceTQ==</encrypted>]]>

      <![CDATA[<encrypted>U0+XvG/xeBVFSJArSLwwXA3J6a4nhvKHHDoJtPJwtaLOTwHChz/+Lntxr5G0HULAHs/G/ibGZR5LzemNOtLeXiLnqdoriRycqug5/VvzjimxtBg4PODLT7d8u0jYaJ3tiZnxBVc8GGv8eXhmDj3/GsOKzbnvAvHaL7zcf41MU1tcickH2FHZRQuxnOG5YC3ykbkarhJE+zMlf+1AAWqXGTLa49ULfm83rEkjDreSCREbL1XJ81gnN3zu1IRknUlx4ribCAYGFSYAdm3dHvkzFDqFoVrfXOhVSyXs/ML1qG7GGZlPjGDu/N8ScTd05uJq+3RUusUxNKAA5a60aCA7F7K0yna6wB1zICSmIp9ecvU=</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0SVG/ZIFBAaT8lyFwW2eU1YEm9B/nkodjj/qIJ+aRz+i</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>Fc4YsFtfeXTyf5UdCT3f4Mkx9sATZhWewnnA2ofstsAtpzsUMEPva5f59QYC2cEFmw8KsKl/3WuB+snTRcuDaTh17pRF1AGENjo4wQzVb5HkW1uOrYES/mJjAAOBBxnnwiLTepktTgLyyn+FiJc/ymHYhKC2qEe8Qj/HqFPrbLULFcT+u3szSkg99b+DKkX1jH2DCcuLN8MmuhsMfgccKd6thtoM59YeV/DBB/4EuBKhm76HRoT5j9qg2egC4WHJf3ac7R2l2So7Smcn5IUXYjJtx7HjUPuW+JkG0XGqy+xRpj0FFlncs4+CP+ua45o3</encrypted>]]>
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
        <![CDATA[<encrypted>opx3vUPmEzooRko3LZrBkM91EggO0/vuYdtdZxnu/n3zvbEUvTy64EtOacvH8syKZNVe2+G67wYMnjcZk447WjXB/70I/T3GJf7Z8JCf5Na9iEoE+xO+XAIq4B1eWFMffzzWirj/ohS/SChL3LFGSc9x7wbWdn5qxCqr1QkwdE5BCQXRK5ZO1MaQ4qtt8dgS89ybi2ZGD0YdlUDy0dVYWLzSQZFc07h0stnWb1jkJtPXCOwWMQm4SrlepHQNoXbiBkFYfdQdDqmTrJOqkGZTaArv91ImKc+EkEP9vKxT4lHnrx7b7Xf7JKOIZcoXvyfC</encrypted>]]>
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Rhj+g7IgJdvxGxW3ZOV+kD+vDDSt6HF+9SncAKOzHSQusARmA1Dr0HMQJAZS2+dZaM6ZPZaHOvPbFuM7MpM1UGc31GP1gM4Gjoh+hPGbzLU4hQSsStOsWtukD8JjodySQ==</encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;

  </response>
</dir>
