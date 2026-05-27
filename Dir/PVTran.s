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
	
  <!ENTITY BeforeVoucherUpdate "if exists(select 1 from @@prime$partition$previous where stt_rec = @stt_rec and status &lt;&gt; '0') exec MaxvOnline$Voucher$BeforeUpdate$PM @@prime$partition$previous, d71$$partition$previous, @stt_rec, @@action, @@userID">
  <!ENTITY AfterVoucherUpdate "if exists(select 1 from @@prime$partition$current where stt_rec = @stt_rec and status &lt;&gt; '0') exec MaxvOnline$Voucher$AfterUpdate$PM @@prime$partition$current, d71$$partition$current, @stt_rec, @@action, @@userID">

  <!ENTITY DetailVariable "@d71">
  <!ENTITY StockType "1">
  <!ENTITY DeclareStock "declare @stock tinyint
select @stock = case when @loai_ct = '2' then 1 else 0 end">
  <!ENTITY DeclareStock4Delete "declare @stock tinyint
select @stock = case when loai_ct = '2' then 1 else 0 end from m71$$partition$previous where stt_rec = @stt_rec">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">

  <!ENTITY f ", @supplier as ten_ncc, @address as dia_chi, @taxID as ma_so_thue">
  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd71$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec
exec MaxvOnline$App$Voucher$UpdateGeneral @@id, 'm71$$partition$current', 'd71$$partition$current', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec

declare @allocateKey varchar(128)
select @allocateKey = 'stt_rec = ''' + @stt_rec + ''''
exec MaxvOnline$App$Allocate$Number 'd71$$partition$current', @t_thue_nt, 'thue_nt', 'm_round_tien_nt', 'tien_nt0', @allocateKey, 'stt_rec0'
exec MaxvOnline$App$Allocate$Number 'd71$$partition$current', @t_thue, 'thue', 'm_round_tien', 'tien0', @allocateKey, 'stt_rec0'
exec MaxvOnline$App$Allocate$Charge 'r60$$partition$current', 'd71$$partition$current', @allocateKey

declare @f tinyint, @b tinyint
select @f = rtrim(val) from options where name = 'm_round_gia_nt'
select @b = rtrim(val) from options where name = 'm_round_gia'

update d71$$partition$current set tien = tien_hang + cp, tien_nt = tien_hang_nt + cp_nt where stt_rec = @stt_rec
update d71$$partition$current set tt = tien + thue, tt_nt = tien_nt + thue_nt where stt_rec = @stt_rec
update d71$$partition$current set gia = case when so_luong = 0 then 0 else round(tien/so_luong, @b) end, gia_nt = case when so_luong = 0 then 0 else round(tien_nt/so_luong, @f) end where stt_rec = @stt_rec
update m71$$partition$current set t_tien = d.t_tien, t_tien_nt = d.t_tien_nt, t_tt = d.t_tt, t_tt_nt = d.t_tt_nt from (select sum(tien) as t_tien, sum(tien_nt) as t_tien_nt, sum(tt) as t_tt, sum(tt_nt) as t_tt_nt from d71$$partition$current where stt_rec = @stt_rec) d where stt_rec = @stt_rec
">

  <!ENTITY Post "
declare @group varchar(1024), @glMaster nvarchar(256) , @glDetail nvarchar(256)
select @glMaster = rtrim(val) from options where name = 'm_gl_master'
select @glDetail = rtrim(val) from options where name = 'm_gl_detail'
select @group = rtrim(groupby) from @@sysDatabaseName..voucherinfo where ma_ct = @@id

if @loai_ct = '2' begin
  update d71$$partition$current set stt_rec_dh = '', stt_rec0dh = '' where stt_rec = @stt_rec and stt_rec_pn &lt;&gt; ''
  update d71$$partition$current set stt_rec_pn = '', stt_rec0pn = '', pn_so = '', pn_ln = 0 where stt_rec = @stt_rec
end

if @status &lt;&gt; '0' begin
  insert into ctgt30 select * from r30$$partition$current where stt_rec = @stt_rec

  exec MaxvOnline$Voucher$Posting$Inventory 'm71$$partition$current', 'd71$$partition$current', 'r70$$partition$current', @stt_rec, @@id, 
    'ct_dc, px_gia_dd, pn_gia_tb, gia_nt21, gia21, gia_nt2, gia2, tien_nt2, tien2, cp_thue_yn, ck_nt, ck', 
    'so_seri, ma_khon, ma_vi_trin, tk_gv, tk_dt, tk_ck, so_dh2, so_dh3, ma_nvbh, ma_nv, stt_rec_px, stt_rec0px, stt_rec_dc, so_seri0', 
    'tk_du = c.tk, ma_nx = c.tk, gia_nt1 = b.gia_nt, gia_nt01 = b.gia_nt0, gia1 = b.gia, gia01 = b.gia0, tien_xuat = 0, tien_nt_x = 0, tien_nhap = b.tien, tien_nt_n = b.tien_nt', 
    'update #in set ma_nx = b.ma_nx from #in a join dmnx b on a.ma_nx = b.tk where b.ma_nx is not null',
    @stock, &StockType;
  
  if @status = '1' begin
	  insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tt_nt, t_tt, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
	  exec fs_PostPVTran 'm71$$partition$current', 'd71$$partition$current', @glMaster, @glDetail, @stt_rec, @group, 1
	end else begin  
    exec fs_PostPVTran 'm71$$partition$current', 'd71$$partition$current', @glMaster, @glDetail, @stt_rec, @group, 2
    exec fs20_AfterUpdateGL @stt_rec, 'm71$$partition$current', 'd71$$partition$current', @@id, @@userID
    insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec
  end
  insert into r90$$partition$current select * from ct90 where stt_rec = @stt_rec
end">

  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete ct70 where stt_rec = @stt_rec
delete ct90 where stt_rec = @stt_rec
delete ctgt30 where stt_rec = @stt_rec
delete cttt30 where left(stt_rec, 10) = left(@stt_rec, 10)
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

<dir table="m71$000000" code="stt_rec" order="ngay_ct, so_ct" id="HM1" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="hóa đơn" e="Invoice"></title>
  <partition table="c71$000000" prime="m71$" inquiry="i71$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Khách hàng" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and cc_yn = 1" check="cc_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default" row="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBZCjY1pO6/p+NqFQ3l3vjFmZ+SRkeDTSpB/rMZvVpuSg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người giao hàng" e="Delivered by"></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCC5XZ1IDPpaDqirJElpwGphj7k0IfLUu5dBXM9DEqppA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" clientDefault="Default" categoryIndex="-1" readOnly="true">
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
    <field name="ma_tt" categoryIndex="-1">
      <header v="Mã thanh toán" e="Debit Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="-1">
      <header v="" e=""></header>
    </field>

    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri0" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" hidden="true" readOnly="true">
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

    <field name="d71" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="120" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="PVDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r60" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="120" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Chi phí" e="Charge"></label >
      <items style="Grid" controller="PVCharge" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="120" categoryIndex="3">
      <header v="" e=""></header>
      <label v="Thuế" e="Tax"></label >
      <items style="Grid" controller="PVTax" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>


    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien0" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
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
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán" e="Total Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    &XMLUserDefinedMasterFields;
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
    <view id="Dir" height="180" anchor="10" split="10">
      <item value="100, 80, 30, 21, 110, 8, 100, 8, 100, 0, 18, 58, 50, 8, 110, 0"/>
      <item value="110100000--10011: [ma_gd].Label, [ma_gd], [ten_gd%l], [so_ct].Label, [so_ct], [ma_nk]"/>
	  <item value="110100000--10011: [ma_kh].Label, [ma_kh],[ten_kh%l], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
	  <item value="110000000--10010: [ong_ba].Label, [ong_ba], [ngay_ct].Label, [ngay_ct]"/>
      <item value="110000000--11010: [dien_giai].Label, [dien_giai], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="110100000--11000: [tk].Label, [tk], [ten_tk%l], [status].Label, [status]"/>
      
      <item value="1: [d71]"/>
      <item value="1: [r30]"/>
      <item value="1: [r60]"/>	  
	  
      <item value="------1-1-10-1-: [t_so_luong].Label, [t_so_luong], [t_tien_nt0], [t_tien0]"/>
      <item value="--------1-10-1-: [t_cp_nt].Label, [t_cp_nt], [t_cp]"/>
      <item value="--------1-10-1-: [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="1101000-1-10-11: [ma_tt].Label, [ma_tt], [ten_tt%l], [t_tt_nt].Label, [t_tt_nt], [t_tt], [cookie]"/>
	  <item value="11111----1100--: [ma_dvcs], [ten_ncc], [dia_chi], [ma_so_thue],[loai_ct],[fcode1],[fcode2].Description"/>

      <categories>
        <category index="1" columns="809" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="809" anchor="1">
          <header v="Chi phí" e="Charges"/>
        </category>
        <category index="3" columns="809" anchor="1">
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
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>CDSopBU0A254mxbY1PVMvkjMz2/LNvG1Crdt1aHvexDLKQuiVJOJOekO56kH4DBA4yQzcvCX58h+VZPP73ECXsPQhXP4sw7sv8ejeaiSNIB74vtIF8yh9YSgONn2ISsSLFRn+6VMwax/bMHj1cgP1sodo7N/0D4en1WUVArv6jI6WfoV1weLbw1KyVeDGpopG9yBY8PErpZAGjzN3WkcVm9hMS9UpJ4wPuPM83evQlex3+ecXCUx4lL2pXeGS0Ef8y5UXJVGpJnsAwOk3pucyL3rQbrx6EkMfeiUGDuAc1Uqui+BM1YeKX5G3ijiGtUUJ5Yo+MVcfDMNWOSXufv/gg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPi/MPBwztjdaPRme+9kQjQY8vMGZ8eVCz52AcKSAGWVUhxhSNbzCqlX4yP1LLD2+6zPtfDhQTlmCZDRhxBy+gtYXNCLqTilRNNW9W1t3GKVc</encrypted>]]>
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
        <![CDATA[<encrypted>A3N5os1llqWOpk6kuJf//9gyfjzwGKLrO3712ggwL2ANdEjgR96acwR0E4kVcxL/mtaTyNZmZrUGi+sWncpC4avbV88a9RWt64u7z2QJfaK9Vr8iRYsr9H3iD+sKM2aGlD+wK/OOL7Tip2rz4L2k+xW73N4VrVtro6gk5Z4aCVPWgTlXHbjgfVmw+f8gK4cNVCVBAkOTYR4hINAMNv1CccaGrHcpAgHaSo7Bw5XC47SvDNgWnP55v0SA5LcyDEm8Fp1uY1DtD4NYlZ3WPaEZsPG0ElT0M0i6huq+wwVNjzqARHF6928FAr26A3ZDZnZwQkGa2l+UMfqI0Lr5RXuT0KnshyLTSALUgEqkw0p5iJw5iuHfry+wVAAFP7/8tVjpo3nsKvaKj0JLtEdKpHtLrFlscovKi516sj3MFEwCjA/V2uw/kXeBMN8KIVWIG9dbSUx0shl82d5WnQ61igx11MezJthWX81a6IFRybmpMXmAuT4XurbI+NrBybky9pNQN5MTlERpd38UWBODxiB0QxeSiH94k9tvk6EFBCI8nLFN2Z8DMZrKkMWLcqGkHu3l6FVHLL5QRx0g3ZoOAIf3kfn1KbsNt/YYEZ2hbsfBbDE=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>sY7/sFYLtA3aiKJ5cR0AfLRIFedCBXjoUJAtbl6jSiCIcq41sevBZl964Z6MOUrfLvD+H6R4Tb66zE0zTTa+EEMzST0BPFljhu1//VrZVSXgOr4MBZikPXYyAPsjow7ImdFvUA+mEEloqqv+za5XAplbsVzz2cVmwSqWDGhh6Q/97DH1YZGvQ7jLRAwMVNfqXUuYZqmzsZMV22ZZbZcKG4AGnfnwK7eLrjI+6b8UF/zK1HQ3gnwFQTCig0g1+gGl</encrypted>]]>
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
        <![CDATA[<encrypted>Qo3oiaDcoO1g9v+kIds6gylXi8JWP710eKDptF7uaXbnyAd3uH4ZLOQUlK6tX98E4YpGdMz6wODsXW2wsbD7XpPWlhFpBB3dRqWWzFBESqRteTOBH/OAKwYciZWlI6D43/5+CCy5KogtPH/M5mfkAhCWRfx3U3P1uP65xZIVFqiczg70qZFBg0RJcDyaofsXwNe/aAWxlT6pr36vHcrBixQds0UcTDmpMUVQyaXLDc8=</encrypted>]]>
        &DeclareStock4Delete;
        &DeleteCurrentStock;
        &Delete;
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>mGGC2lKnWZ4X0oqe2uLItex6rbIAI5fDhcq7ViByHO7VrQxRh8LbdOuRjVg6wFGKWNDjbXSd6end+fZw3KBhcZhOMR3u6KVtl9ZSwHpl/gx/qQqCqcapvvc1Xm33khTV+1GJDdCokgX15+10kvDKxGuJx7YwSwVN9UjsHn5zGy3q5xpjOsacAbBzIBuzn4sRtDqAMeMYO8/LkNozTOHFprBQZwhHfi31qe/q/yC5filUJkPwLAYHgIdfwuyiAvaDjPaRxH0S0LWaFz8fngyqG1lDub3Qr2zCs32MQBHfH6Rt2TQlEZTYLgVtBu3BmqDTdR/ioehxLHdyoKXZLoe4XgPWhuQuVglQAAupvOGr4kH3rih+ojJsuobqmxAqxuBSY8q8SLB9hXRdnruUABML9EsSl+4+ZTXi7gA/NjPNNlrdFT7yXiuvsgPJDNqnvpYC8SU/8kCBGDGO/pb3V/0h2HlGK0L6oklrDIB94+j+aBl0vhUDx9ivqmvA7sofIvrz+fIf9uAPLiU7e/z+PhTp54kDol+V0+ycSthLxu7qQyZjXHDBn377ImcsOQsPV18uYIJvyuinfLEGrZXmMWyfv4ikkcQ7QRcZKKtca7Js3XY5XBlcv8EmJKydLTKSa6dvGHq8fTJBpmEfx6STG7l4BFCfzp4ivyat0YANhQ3LPdyvsQ/AHgenn5B7ATNoddMJLZVc/fxXhmDNY32xtkPRJTXQxVocupSLGmP2yq0yLJjKd3U4VMAMxNApBbRv+dxLVjq2gD8JeBEPucKtnZInrKHFHU0jZTL3cUFh/ZdsRHPUWHLJ48Mzah9pvxcTjXKxKJzJ4+kA4yZ1xWDC05Cs1TK5HWcqsLwY2H6kDVBDb/UNykGWVHYuOT/Aq/zVy86JwCsEywHejZdEscbKZWQ979egJglYklg9QUwCp95S6g9E/eJR8DD+0zdFSXA2zsAItEwYvrmOM9FrBqG1FWSIjQDCbuO2IPa5aqNnu+RMvxpPWZqLJ2yYB7vXBXxn56n1EioSa4CdizDsoh8UP9W5lg==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS86MfU2bvIdHD+hArj7qQd5Rjgo2Er5/TJhH0k3Bi80yJLatxlBaLEKe/PBvL326Utw8zBlj6j+r1dWFgLy7rU+w==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>BXxeyx9KndNXVcI72kpKmQuNO9JC8WiTx+QTNg0goA4wRvrpSgGqeoS0vt+7ca9vTycvHk4Ky28ujZ+gLH8A9j71I7COJZpS1MB/Esr5bLLBDufmgGaxKUoknA4ZJOLIg/FprbQ19erPRrjX0B7gHuXO8QzFD9+E6AzOASv2o2P7rCd2uJi+k/yW+EeS5+o+U1xz8FWqcGHhG3pYPX4IZEpNashPhZlUdt1jOXLsOvKbOHYUHAeEF0naRkJdIYv+</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>GlNezHyxcs72OQckj4rk/CnyiwbAodnUcUKG555cxJIDn8MiB00oX7rX78SOvDk3Zu7hL9FOP+doXIzJW2pCl60fZITUIVbg3miiCmm8wOqgIMciv9jBcAn2/I29d0QwRMOu+DGrenytc0teE7lih7hU+VokpK1HJpOkROIKIcY=</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>TjuyLqlaXdbO9RyvV6FU4RUmNAP8lBmoTMLCNtewpb+7ZlpFxBgizXKfjyaAsuphvoINP0Qp1+U1X5u1GNc4ZV+dxAkpWRlEZxV6llwRDajMpxn1wuIjA5GjXBpjIscyKjBv6ax7oiJqROw3/NBINRvYTUb+DaOUbuNrAHKz4JiXzMtqSRsTYsrHWbzsCENoS63y4CZ22JgqfoFgRuUPcCQc9jZbOtQGyQZp07ywVrOV1d7SVfRwC9fpqAINKjUhNN1oPpgOenxpPpjjtHNDJhHY73/oOTZANltL+llvqIPM0jyeaSukfbKEYO8o3bHQlTGNqD2aH1ox+BmeJYyYOJoab3I/QysZIh/+DfrM5Oy56Q74HdWYEPUXO4sE8pNasVvWfsuC2miveDSNhu0HV7X1MZldiVvywr38zDkUPeo=</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>L7ny8ge8w5X9maSwGHmZYUCcG2U5GF83FiwrnnZrb5Ijye+oUpDypyDva+NeYDPIStWztlrhB1+WO77msYAWbBFh9ki7ZceE76lq8bgDH7P7BETyn0nFTfU2RnLimXnIirpaq0apteMpUnNULbb9jl6/y/YEPQ4u/O8QTABmooEj5o+1V2QAEKZFPKESxxsTugEtqb5TKS1N7IOPjYtzKpkBaY2wFKVh4m96OrGQ56IQtFoeSjoBL+UYHEukQN809/diYxmlfSHr5A2hejQIOm01p+hLM4fNCflQQr3Z+27zuHssMKioFZ28w9/Pr8hJkM/ovxnPCDadqhkKAgUlsmJ811AbaQJszb41DkkBqFIWxy1rJsOa2fB+W3OoMAT5QAGDb7PL8hg3GI2H5bW4twZoXkjLe9Si5oMB8AOaAjzA1+JRZ5jKSQRuLM/fmN7/BWNzOW/2xmctI4GwkD7/dwZHt3feqR0wGR8m1jhC45mS50wD611VqVAFV/Iglna/SFwhOAXt70fqtyEchQq2f6EOXTzBc0+YejsN0DDo6eTCu1OkSMbp6/c+ggr67dL6dCJexS6czUUpLlZ2IS+whK1rJFWZwV5QGLxe9BxEq8uLyQHNLSi6SysITvzPaGrK</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>VRR5vKbVq1dT8O5ccw2drXNbh2AwW0dedQ2zJN3TsA+PUn1CxSIyAc77lvumadUMz5Q+sa9ArPEGgSDhtIuJLMA3bjZ/fhjrTH/Ri+wIPsSTHU2kyJUdjU8IvxPVKBRI35MLgwGDoyCpWzfOehvjxejorymHr3oiuNf3GeRSLtEBBud+sc5CMtNtQmPSZKLlhli/mk9Uue2rVNOvuwEBIQ==</encrypted>]]>

      <![CDATA[<encrypted>46hCUKGOZKk7oEhJWz76ZafBgdtMabLNp3RFSmCynL6NvY17NAv1d6A50sgKJgpkeY60Oy9p91kkJFxu9JZw1QRdPXrQywSTAtDKUkhaPlqF8Onk1tjD6LDIvsqeYXSm7hkna1ylWkH8+viPgOmeJHfkWb7keKdmFcbgjGlEaX3glZbkp1Z07qsyEqKvAeU0n1tq115pJGHOmkWXg+9Kq8RQVUYVt3dUUnfjbiqCb45suGwVTNj9zCiOnwxYVs4mVzJy4UeiHsX2+y+YcLGOstDQn4MJEizw3nhOg+XKHYEjt5SorhHBIwl9ss1Z4mRYEKaFIaMh2VPwzuOsAUnVsGptaFxrVKbtjHmy3JQapCA=</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0SVG/ZIFBAaT8lyFwW2eU1YEm9B/nkodjj/qIJ+aRz+i</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>BXrAalpi9WbHs8JiwyOD5kGLSLuSeyEkwGnw4AFLzuXWHEg4/q/t5b/ELwXYipnslCzwfpmdF+VABu3u/NuyYks8Li4spN84OsN/xU2kk20urufBJLJs6zUouwTneIF+hohRZSj45GrcrsoARAf/exs4Jgo/X+ulNluweTg38uCb7fScU9UJfoShJfOKLtUAFTzXuhzLxlGLJibpGbNeOxw9s1bDGkS03U+/rAzWHDVQs1XTna6mbJ9uyCoiauJQlJQD7IK3TzUfhebhO767MjfdEM8XGsVqsBJ8GHkrWK4m9f8FLu8YrzA8U34r6KqZ2ID1fGfvLrePcm81uv1VEQwEJRR0AgOdn/TmeAkSBFVrUG3aReioLrPBYr3Fi108nCqskLdmsIeoEeYq58pDRMG7NmbExt4ohfIY+aIDpC45+4G0wToKzxNAcjRdZ3M3OzjNLVS3iVBJGnp0gu4G5RXhlJer4Xpg55gy1lo0JxnhKVH4g0XXNdOs1dZ+ws2m0XKNl95WoXgOfrqpKPFyu+qfKNjlLd77fZMt1IG2QpPBQ93bIId9J9akOif2ng5MCVtg1X8h99zrRICKEz8kQL3+qdUVPBDTJ516m01+lGLTCpcZwEIQnJLKErEOIGDdRHXwj9kPgR93qBtxT8tRd5Ki3IAkxDUqRtTjxsINEgdYvUUWwUekB0yO/pkZ4JOV</encrypted>]]>
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
  <action id="CreatePC">
      <text>
        <![CDATA[<encrypted>FAWBMBQnc+K2bEJwiN5Qxv0/Hq34J88lHPvESh5bIDSbNrVNET36yFLQDf/u3NgaF69fL9tZPTioJLgpvZcX9i6PcPSvcgMWyZRJd0FLySofE1ekCr3e27qU5uONaDduKgTGGtOutKwc9qJqBzqVDGyPpyBVwQc5IZSUoWd/hGW5o+/YQ74w3glFqGBPDFXGMf928i2d9yATM+fooXxzsT2Tj9DAhWKpMfX2aLFN/tCIWEVPqBerug2imQfipFpIU7LMGMtEn7d3EMP+Y4FKrHc4iLJkdReQ/XYi/kkukSZochnwcHng1Nlx2WFvXxV2FaUvh/9ynf+GYucLAkD6+xPDNl6jQJgV/wUONvBT8nKA6lbtLPb0xfjuODqOFkfqmiuuROl99Of1De+DGf0wlEAOPwghrettQ+Vknvf18Ti6ONq3nEXRGNh93x4eYDIG</encrypted>]]>
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Rhj+g7IgJdvxGxW3ZOV+kD+vDDSt6HF+9SncAKOzHSQusARmA1Dr0HMQJAZS2+dZd/fgDVtkVLhvQvBlpWjTeu+COpiVq8xmjmwOEFwKNPufZoo/PUXpv6FHg46V4DqpQ==</encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
  </response>
</dir>
