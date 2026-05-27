<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
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
  <!ENTITY CommandExternalFieldSet SYSTEM "..\Include\Command\ExternalFieldSet.txt">
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
  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd73$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec
exec MaxvOnline$App$Voucher$UpdateGeneral @@id, 'm73$$partition$current', 'd73$$partition$current', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec

declare @allocateKey varchar(128)
select @allocateKey = 'stt_rec = ''' + @stt_rec + ''''
exec MaxvOnline$App$Allocate$Number 'd73$$partition$current', @t_thue_nt, 'thue_nt', 'm_round_tien_nt', 'tien0', @allocateKey, 'stt_rec0'
exec MaxvOnline$App$Allocate$Number 'd73$$partition$current', @t_thue, 'thue', 'm_round_tien', 'tien0', @allocateKey, 'stt_rec0'
if @ma_gd = '1'
  exec MaxvOnline$App$Allocate$Charge 'r60$$partition$current', 'd73$$partition$current', @allocateKey
else
  exec MaxvOnline$App$Allocate$Charge 'r60$$partition$current', 'd73$$partition$current', @allocateKey, 'tien3'

declare @f tinyint, @b tinyint
select @f = rtrim(val) from options where name = 'm_round_gia_nt'
select @b = rtrim(val) from options where name = 'm_round_gia'

update d73$$partition$current set tien = cp, tien_nt = cp_nt where stt_rec = @stt_rec
update d73$$partition$current set tt = tien + thue, tt_nt = tien_nt + thue_nt where stt_rec = @stt_rec
update d73$$partition$current set gia = case when so_luong = 0 then 0 else round(tien/so_luong, @b) end, gia_nt = case when so_luong = 0 then 0 else round(tien_nt/so_luong, @f) end where stt_rec = @stt_rec
update m73$$partition$current set t_tt = d.t_tt, t_tt_nt = d.t_tt_nt from (select sum(tt) as t_tt, sum(tt_nt) as t_tt_nt from d73$$partition$current where stt_rec = @stt_rec) d where stt_rec = @stt_rec
">

  <!ENTITY Post "
declare @group varchar(1024), @glMaster nvarchar(256) , @glDetail nvarchar(256)
select @glMaster = rtrim(val) from options where name = 'm_gl_master'
select @glDetail = rtrim(val) from options where name = 'm_gl_detail'
select @group = rtrim(groupby) from @@sysDatabaseName..voucherinfo where ma_ct = @@id

if @status &lt;&gt; '0' begin
  insert into ctgt30 select * from r30$$partition$current where stt_rec = @stt_rec

  exec MaxvOnline$Voucher$Posting$Inventory 'm73$$partition$current', 'd73$$partition$current', 'r70$$partition$current', @stt_rec, @@id, 
    'pn_gia_tb, ct_dc, px_gia_dd, gia_nt21, gia21, gia_nt2, gia2, tien_nt2, tien2, cp_thue_yn, ck_nt, ck', 
    'so_seri, ma_khon, ma_vi_trin, tk_gv, tk_dt, tk_ck, so_dh2, so_dh3, ma_nvbh, ma_nv, stt_rec_px, stt_rec0px, stt_rec_dc, so_seri0', 
    'tk_du = c.tk, ma_nx = c.tk, stt_rec_pn = b.stt_rec_hd, stt_rec0pn = b.stt_rec0hd, tien_xuat = 0, tien_nt_x = 0, tien_nhap = b.cp, tien_nt_n = b.cp_nt', 
    'update #in set sl_nhap = 0, sl_xuat = 0, sl_nhap1 = 0, sl_xuat1 = 0, gia_nt = 0, gia = 0, gia_nt0 = 0, gia0 = 0, tien0 = 0, tien_nt0 = 0, gia_nt1 = 0, gia_nt01 = 0, gia1 = 0, gia01 = 0, ma_nx = isnull(b.ma_nx, a.ma_nx) from #in a left join dmnx b on a.ma_nx = b.tk', 
    0
    
    if @status = '1' begin
	    insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tt_nt, t_tt, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
	    exec fs_PostPFTran 'm73$$partition$current', 'd73$$partition$current', @glMaster, @glDetail, @stt_rec, @group, 1
	  end else begin
      exec fs_PostPFTran 'm73$$partition$current', 'd73$$partition$current', @glMaster, @glDetail, @stt_rec, @group, 2
      exec fs20_AfterUpdateGL @stt_rec, 'm73$$partition$current', 'd73$$partition$current', @@id, @@userID
      insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec
    end
end">

  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete ct70 where stt_rec = @stt_rec
delete ctgt30 where stt_rec = @stt_rec
delete cttt30 where left(stt_rec, 10) = left(@stt_rec, 10)
delete p00$000000 where stt_rec = @stt_rec

if '$partition$current' &lt;&gt; '$partition$previous' begin
  delete r00$$partition$previous where stt_rec = @stt_rec
  delete r70$$partition$previous where stt_rec = @stt_rec
end else begin
  delete r00$$partition$current where stt_rec = @stt_rec
  delete r70$$partition$current where stt_rec = @stt_rec
end">
]>

<dir table="m73$000000" code="stt_rec" order="ngay_ct, so_ct" id="HMC" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="phiếu nhập chi phí mua hàng" e="Purchase Expense Transaction"></title>
  <partition table="c73$000000" prime="m73$" inquiry="i73$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã NCC" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and cc_yn=1" check="cc_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default" row="1"/>
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
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri0" dataFormatString="@upperCaseFormat" align="right">
      <header v="&lt;div style=&quot;text-align:right&quot;&gt;Ký hiệu&lt;/div&gt;" e="&lt;div style=&quot;text-align:right&quot;&gt;Serial Number&lt;/div&gt;"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat">
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

    <field name="d73" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="150" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="PFDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r60" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="150" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Chi phí" e="Charge"></label >
      <items style="Grid" controller="PFCharge" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="150" categoryIndex="3">
      <header v="" e=""></header>
      <label v="Thuế" e="Tax"></label >
      <items style="Grid" controller="PFTax" row="1">
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

    <field name="t_cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng chi phí" e="Charges"></header>
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
    <field name="ma_dvcs" hidden="true" readOnly="true">
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
	
	<field name="fcode1" hidden="true" readOnly="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
	<field name="fcode2" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
	  <footer v="&lt;button type='button' class='btn-inform' onclick='set$Voucher$CreateCashDisbursement();'span style='color:#0000ff;'&gt;Tạo Phiếu chi&lt;/button&gt; " e="&lt;button type='button' class='btn-inform' onclick='set$Voucher$CreateCashDisbursement();'span style='color:#0000ff;'&gt;Create Cash Disbursement&lt;/button&gt;"></footer>
    </field>
  </fields>

  <views>
    <view id="Dir" height="201" anchor="8" split="9">
      <item value="100, 30, 75, 129, 105, 8, 105, 1, 17, 58, 48, 8, 105, 0, 0"/>
      <item value="1101000--100111: [ma_gd].Label, [ma_gd], [ten_gd%l], [so_ct].Label, [so_ct], [ma_nk], [stt_rec]"/>
	  <item value="1101000--100111: [ma_kh].Label, [ma_kh],[ten_kh%l], [ngay_lct].Label, [ngay_lct], [ma_dvcs], [cookie]"/>
	  <item value="1100000--1001--: [ong_ba].Label, [ong_ba], [ngay_ct].Label, [ngay_ct]"/>
      <item value="1100000--1101--: [dien_giai].Label, [dien_giai], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="1101000--1100--: [tk].Label, [tk], [ten_tk%l], [status].Label, [status]"/>
      
      <item value="1: [d73]"/>
      <item value="1: [r30]"/>
      <item value="1: [r60]"/>

      <item value="------1--10-1--: [t_cp_nt].Label, [t_cp_nt], [t_cp]"/>
      <item value="------1--10-1--: [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="11010-1--10-1--: [ma_tt].Label, [ma_tt], [ten_tt%l], [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>
	  
	  <item value="111----1100: [ten_ncc], [dia_chi], [ma_so_thue], [fcode1],[fcode2].Description"/>

      <categories>
        <category index="1" columns="799" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="799" anchor="1">
          <header v="Chi phí" e="Charges"/>
        </category>
        <category index="3" columns="799" anchor="1">
          <header v="Thuế" e="Tax"/>
        </category>
        <category index="-1" columns="100, 30, 70, 129, 100, 8, 100, 1, 7, 58, 42, 8, 100, 0, 0" anchor="6">
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
        <![CDATA[<encrypted>muEy7/ViA7Eta7UNjdanxyM6W+6Qq3FTfqzFesreG+sl9ggllH43+MUZm15hWAIXtp2IO2viyH89CHNcQ8g/Su99K0ejlnYZOC1Ek3HVGxRJvxDNmdf7xYhBTAQMeT9Sg1Pdpgq9Mghw9nu5HYj/tO5asmewmE9P0vnwO7kd4I3V0cY3Et2BTfYMCfnZfVRlQHhRLKRnQrB9NBNsU3Lk1FwonjSgkWRetnKhtuokQeN1wEalcNv92raU2N/cVHDC10FZBis3/nqrsX4yscOzl3U6ps5vEwV82EM5tHkVB7kXmLbyfk0R81781nf0dlJ+eZ2DuWRPXlCwDvbaOwS+Gw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPgeL+qBgO2Xc/PoliAxDXb+RgRahKCDx+3i9baX5i/LNeMNXky0K5saRtIovjsnQe40UphS/PdaNbnF10QFbuvJbI3I1IphhjeSLv5OddmaY</encrypted>]]>
        &AfterUpdate;
        &Post;
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjNM5DJ9nuOA785bKXqt9ViKX0KXllerWVcqK//gDH6sU6+cB0/Cg4zCuf5+pR5ZL0MVtL01/SSgXvIIkjPEpj2YQwNY1asZaw+EZzQ28ctVS</encrypted>]]>&CommandShowWarningMessage;<![CDATA[<encrypted>FTgzG0Ebn58SWQYsf65nyjIIGuY/GZ6oxX0a/PwjGKzviKX5u9uIEUIVQbbNJofhdxu3S4ep6ls4RjJCLKh4YlshfeCbWblD3/5LcHM/Og0=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckLockedDate;
        &CommandCheckVoucherNumber;
        <![CDATA[<encrypted>1s4zmi3ybTXHci2vWbgceWRcp8wsE8BofqTM6B6lrWH2+Ge40lIUi4bxPfLARtfTgMgIaT9Pm5g2Gb41sn5hGXczEiQQ5LzeU87g2S/nAX1c7U2AcM0SMzlsgER9vhEpvuFsiIF7fKPgOx0jZrybNVyxlzJ8r9SXD2vqCuckrfXIeLITpz9vTnEGKNDJ2H2ofNZ5mMPLlsRbAoOboTOR8T7gwXMiMtSp6A7MaeBL8/E93r9T/NLy7cKdcpVvSvxCumtsFABg8arPGf6n+9ksBvCcBrg+eYxnO7m17UHp/Xc54QGWPUQmGQz7TLnVIZDIoai1Lld4LrWJck2wYBf2bIdiwyfdcgtxSJchbrxhHx2/AnNMofTedZ9J95QT4MH5u+q8HGRDa7ERra31XneeH1yOhArkuz5fGfovk2zkh67GXTAOxtFunChkaW11TDX1cRnSu+v3L8UzUhjz11mrDwzyTtmsdXzuQaW8jcJHKShg6guqH/DpCk1KeHlseIxfBvrKCgdHxUz4cPvQlOjbZ7VI5e16zASSPYeTtZnJNqao93CPdBHHCTauefhGB/sOxVTogXPmShOFqyfmkLxUhjqVhBOBDoPDSy8GAMPmuGKOgX+r+K/vz4zbUhqwHIYT6CPCOgsdA/Sxh/+8AiRqjBD8hI2J2R+vIiD1W5IaZKMHLOuXvyprgPZ/aWqA+uib</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>sY7/sFYLtA3aiKJ5cR0AfEzVmmKzXdTLPRMIzGFCOdQRHb33sHHHUyDbjd7d02WnJ+UwSej/jZjmW6qlvF9uhbXxP/nyB7eUcCVBc2M8lbKKC5y+0+8wuWg72MRIMvCss3vjvcak/DsE8w8hvhli7Sb5m3cFkifXgNaTl6KWAGKKkOi+3Y5tmuxlZ3BYc9c8CuTJXdyRfGAXczVQmt9B0wJM3THn46zrmIDxMhZB98WR5XjLLo8DeQoWxClDGOUZ</encrypted>]]>
        &AfterUpdate;
        &Delete;
        &Post;
        &CommandShowWarningMessage;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<encrypted>rCwvp7lhVU0nKh4mD6DZeoUvlduKQ8qaCFHJKX2JKKVIvA54qD21+fIEC5rKbnaLH1Ov1q3AfNYm0HT9tV2SGamwHjEUgKOR4fSw5Cl5TVmh8SgwArWRNGdYk+bOuAoPp4wpMfY+yf2e4vA66sBhAxAR6G6kty+5z6Q9HvHn498MC/zIVTLiU6cX1ufuRmI3</encrypted>]]>
	&InsertHistoryVoucher;
 <![CDATA[<encrypted>s2O6wSTArDsUPCAgJs0RHF4C75Wlk9W0lowzd5+LF6Ojswo1ortUqU4q5Iq/AhH4PtOxTSMG/8vGZeJ1o13isS20X8ZKKrHnLhqyUacUKvR+5vXDTO6F5hqQTmBKmOU3e8+dTCxR0DlPtBhmpv2k0YgCiikRR3bIYH0C/0ax/Gk=</encrypted>]]>
        &Delete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS86MfU2bvIdHD+hArj7qQd5YEYJ0+70Bh8DJcI81Q4sVOKIvBITQ1smxn0Yb4froHS25eW51dCwPmCs4gXLR6Ocw==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>58fEQfDuBImx1IdA1jOnJRtb7VG5FO43PCqr1B3BmRFVFFeTtKiD84jIMMkey92zOpGVw+/Q1oB2yfLgMHFlQluCXRbX25u3FL/X5OAUqsT2p/PariVGf1XHehP4fjOiJfyfC3XKP/weRymreZcR1siRfCxUlnoFwy0LVjVIW6CG1gBrDdB1zX/ysPQEBh6L</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>S306XDTuzLrc8Jzckjo4t2f/Xq9LDTc0WntjEANcc86IifqIULcqQpmLhBsN4K7TiaGjBkYeTj/Tm/Z+PeBCPQ==</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>TjuyLqlaXdbO9RyvV6FU4f1N5iQXRiuPFI2JLhlfj76Fwcay32G2ER/YTvcEGLqpqXM4LF8xrNlwVwBrXJ/lI0W1EF/wy1jVpBGv3j/ytaN7u9PvImWn/41JfosJn6nsUskU1z4GtqwasVT308pQrTvqDFS6gskewXsr5vdz8ZWoQel9jHsMpQXYE0v5GL5DpWr1kPmSdCtOKegs2sTt7X3aumdnp3tEK7FNIHqxulOD2CZ+Vr+bPlZkFRspw9z6QEzGiAWcazOD4FsRKzBoLBZGzSv03lf45l8mMQi45wmnOhefuCaOKZh64eSpq+xGxrb+KsTQpeziOgUeXN/ELb8/tSuDJvOtBNua0ptCAI/VzOgt4rQPKytSFfAwuDBaMxYzZiiDc6zQvld309KvUmA0Z5LmDJgnE56LQY27Q/Y=</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>UjTn1+mEW2aOcM5nDhhd1HDVHHd3YJoNzfuRwjevlu46/Y7A1CO/s4n47i6DoeD5EpRt8c4DPLFIdEYZW2aYGhrrVWL5z7skDw4ok75o1OlZH2fLEwI1zn2W1jwjWtSaW2IsmH3XcBimmQ++qnqrRgYbTfMFZL5nMxTpXjzi1b9bCDFJHxFVEjK9dGYKwtAYTLm6frWhX7YSI6xfsEpM6LB7MpncOcGC4JdTShJ+petTrfW3r3PWNWbetCQqENlrLNlu6wt9ayWqm8DIlBa73vXZomXLa2U5sTCLFs6jDv7aoRRDRym9S3iOBJAZbavIauTGH2CI+2DXTTlncNpl0oDvSspxk88TpBs521KvHzsU1I7JqOyNFJeP2+MaCou3vPnkLiz/C7Scrs0Ol8jKA+S3Y4qMouvP3n4AQYkbdEM1U9m98+wVNDxl9JUouXJrYeILmkSDJEiLCIezSATHVg12HQ4rNWjZa5+nQkgE+nlA1LTrhyc2IW5i0slC0ZtMUQv/3m5N2uDZ5xr7EF3X+S5iyCudDW/TIcgnsO5+OGx57qcetz1pan2nsaWHY2ES</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>zxYFgbMTdfWeBSeWCLKMchXvNHJAiS0rREovrlUln2hjB1waZZ0va4OlhvfzX9BowOXCHHE1bfeFFcHvoqvAj2sjblsjG3RKzBudapBhjWmQlRVyzA1K4+Zoha71lZnkWmLHCE+y9A27SVdBxLTrVJ82+Ma+tLteGSz9MXzbu7NmrBeZv3Scv2FeB9t7h3yalY3/MM2kojwV0ZI+lgFdag==</encrypted>]]>

      <![CDATA[<encrypted>UbISJupCOTI0U8fZwYxA4Lss5GeD4XgHQfjBsZecXbA9u9R5apR0XR/bocIby7ub1NRKj4snFh/J+xOxN+byDVM2N3BjnfQunlRfL3y3w88QoIuN18b9qMjPW0hh5rryKuQR2lTczAv08xeFCQZTWZBlblRuLxUOgAqe6BVPN2MlBvz0AvmayKmbZFahNYkwUV+aOyBvWhPkB2d5+acaEzBPMLLuQIu6zEVwDYd1F1g8SpIHvqqA5pAUFqG/tk45ZfzXkS33gT10Xd4ubeHpo+uzZLFvV/547Vz8bDObw8wx9MYwaZRNMjVvAryA3iUsApyzUFeXlU5GgZoiqS8JNw==</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0SVG/ZIFBAaT8lyFwW2eU1YEm9B/nkodjj/qIJ+aRz+i</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>t6Q1yetwWx36FD4TPnhBzCct3ZNsyzIG9NNw1TADtln+50WQ08VGjB488B0qXzTV5ulgcRIlNjigwdir5M5XMJleOE5jPl52SJ52uR5zal1LefKguHy5jKdAO067vWS+ixW3U4BeO4c6gHuCwZKL8sxBfjByWIG4/RsnJuN2eoQJLHVY0+Gv5bul/OEBfmZCBcRlwh/tKPmSlMGEw73hsiJF9xRkD43aaSSGbtJZWarOsnPGCays4VvwBU2+L6Za70Rx2qTgeXz1qpIosTfZESV8ymK3dKfhkzK4MuUR/8v7/xnjleDsDHkxjbs1uhNlXO8JbNhol2huYDsVPBnPkwzOUyNgLacNBhMd750coaw/QTSZeEfdd6EeAr5Rti+Nz20VwmoSYR6zo7kdNPZbdjlI0PRpAOV/IOQ3TzK+svdGVqX24MT9f9V2NHZU0hbU36GYTS80rNgw19hx76BSZKwD7B8IvdCXbBa2OxtkClGotczuMJTkvfEjrrNe45enxyh/OTGYU2htpGB2t6BdYclkjo75Q9e3V5JNS9yHmRHYLDKUvZ2m+Lz5E8Uc+v1FjUuTWUxen+uI+pb4fjpG+eC5FGQ0Cfwxolm5Jv23Ckw=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>
  <action id="CreatePC">
      <text>
        <![CDATA[<encrypted>FAWBMBQnc+K2bEJwiN5Qxr7MpSjG4UJat59StcWi/YK6sAVjLSxy5xAhhg9MYqEh3pRSJaNQNgQEri2JLzjosmKiOvO7PTsOUSg+4Z2EF/lrJvvn43mjXIk9GXg5HY71p511tUHMaohb2VRV2MPtXhmWObe3YEeo2AUK988/1kVnwYV59UyRpJfeZGhdtde6AwFipbAbvPq+j7VS6MDhzL3vhcf1TiiMj5N8sP+cFlHVmb5eDzxDDUaSpjcpoodVyak6KmzvyEP04B/K54CM+2ZGSjBpmwrVmox+6KdZcgASxcqnBN5BLGQ8d84t+5CiJaYyx2E04cPC6dNxLinYQ0UR7oSRGuDJjVgLU+RlkiB8q7aazrgvjzcVh1DI4HaeaHMHsz6yAokTNLC/m0Qfjfqs/HbdokNxL+1avKrtbHIPefvzGSz7j4byZamH+PhR</encrypted>]]>
      </text>
    </action>
    <action id="Customer">
      <text>
        <![CDATA[<encrypted>opx3vUPmEzooRko3LZrBkM91EggO0/vuYdtdZxnu/n3zvbEUvTy64EtOacvH8syKZNVe2+G67wYMnjcZk447WjXB/70I/T3GJf7Z8JCf5Na9iEoE+xO+XAIq4B1eWFMffzzWirj/ohS/SChL3LFGSc9x7wbWdn5qxCqr1QkwdE5BCQXRK5ZO1MaQ4qtt8dgS89ybi2ZGD0YdlUDy0dVYWLzSQZFc07h0stnWb1jkJtPXCOwWMQm4SrlepHQNoXbiBkFYfdQdDqmTrJOqkGZTaArv91ImKc+EkEP9vKxT4lHnrx7b7Xf7JKOIZcoXvyfC</encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
  </response>
</dir>
