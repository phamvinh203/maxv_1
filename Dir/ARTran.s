<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY XMLGetTaxRate SYSTEM "..\Include\XML\GetCreditTaxRate.xml">
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
  <!ENTITY BeforeUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\BeforeUpdateCurrentCustomerBalance.txt">
  <!ENTITY AfterUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\AfterUpdateCurrentCustomerBalance.txt">
  <!ENTITY InsertHistoryVoucher SYSTEM "..\Include\Command\InsertHistoryVoucher.txt">
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">
  
  <!ENTITY CommandGetEinvoiceInfo SYSTEM "..\Include\Command\GetEinvoiceInfo.txt">
  <!ENTITY CommandCheckEinvoiceBeforeUpdate SYSTEM "..\Include\Command\WhenEinvoiceBeforeEdit.txt">
  <!ENTITY CommandCheckEinvoiceBeforeDelete SYSTEM "..\Include\Command\WhenEinvoiceBeforeDelete.txt">
  <!ENTITY ScriptEinvoiceInfo SYSTEM "..\Include\Javascript\EinvoiceInfo.txt">
	
  <!ENTITY f ", rtrim(ten_kh) as ten_khthue, rtrim(dia_chi) as dia_chithue, rtrim(ma_so_thue) as ma_so_thue">
  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd21$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec">

  <!ENTITY Post "
declare @group varchar(128)
select @group = rtrim(groupby) from @@sysDatabaseName..voucherinfo where ma_ct = @@id
if @status &lt;&gt; '0' begin
  if @status = '1' begin
	  insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tt_nt, t_tt, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
	  exec fs_PostARTran '@@prime$partition$current', 'd21$$partition$current', @stt_rec, @group, @$ten_khthue, @$dia_chithue, @$ma_so_thue, 1
	end else begin
	  exec fs_PostARTran '@@prime$partition$current', 'd21$$partition$current', @stt_rec, @group, @$ten_khthue, @$dia_chithue, @$ma_so_thue, 2
	  exec fs20_AfterUpdateGL @stt_rec, '@@prime$partition$current', 'd21$$partition$current', @@id, @@userID
  	insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec 
  end
	insert into r20$$partition$current select * from ctgt20 where stt_rec = @stt_rec
end">

  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete ctgt20 where stt_rec = @stt_rec
delete cttt20 where stt_rec = @stt_rec
delete p00$000000 where stt_rec = @stt_rec

if '$partition$current' &lt;&gt; '$partition$previous' begin
	delete r00$$partition$previous where stt_rec = @stt_rec
	delete r20$$partition$previous where stt_rec = @stt_rec
end else begin
	delete r00$$partition$current where stt_rec = @stt_rec
	delete r20$$partition$current where stt_rec = @stt_rec
end">
]>

<dir table="m21$000000" code="stt_rec" order="ngay_ct, so_ct" id="HB2" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="hóa đơn" e="Invoice"></title>
  <partition table="c21$000000" prime="m21$" inquiry="i21$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(kh_yn = 1 or nv_yn = 1) and status = '1'" check="kh_yn = 1  or nv_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBZCjY1pO6/p+NqFQ3l3vjFmZ+SRkeDTSpB/rMZvVpuSg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người mua" e="Buyer"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCmVcn8h3iz76804lWbbVpa4+qfED8HT/UON2+1BJB+dA==</encrypted>]]></clientScript>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XDnISO+TyyTWM5SdTXjZ+pFaUnTXDH2IIQlglKnHMFrNA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_tt" categoryIndex="-1">
      <header v="Mã thanh toán" e="Credit Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="ma_ht_tt" clientDefault="Default" categoryIndex="-1">
      <header v="H.thức thanh toán" e="Payments Kind"></header>
      <items style="AutoComplete" controller="PaymentKind" reference="ten_ht_tt%l" key="status = '1'" check="1 = 1" information="ma_ht_tt$dmhttt.ten_ht_tt%l"/>
    </field>
    <field name="ten_ht_tt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="-1">
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
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày chứng từ" e="Invoice Date"></header>
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

    <field name="d21" allowNulls="false" external="true" clientDefault="0" defaultValue="0"  rows="125" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="ARDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="tk_thue_no" allowNulls="false" categoryIndex="-1">
      <header v="Tk đối ứng thuế" e="Corr. Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
    </field>
    <field name="ten_tk_thue_no%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>

    <field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" disabled="true" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" disabled="true" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_nvbh">
      <header v="Nv bán hàng" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1 = 1" information="ma_nvbh$dmnvbh.ten_nvbh%l"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="9">
      <header v="" e=""></header>
    </field>

    <field name="ten_khthue" external="true" defaultValue="''" categoryIndex="9" maxLength="-106" allowContain="true">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dia_chithue" external="true" defaultValue="''" categoryIndex="9"  maxLength="-107" allowContain="true">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ma_so_thue" external="true" defaultValue="''" categoryIndex="9"  maxLength="-108" dataFormatString="@upperCaseFormat" allowContain="true">
      <header v="Mã số thuế" e="Tax Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_vtthue" categoryIndex="9">
      <header v="Nhóm hàng" e="Item Group"></header>
    </field>
    <field name="ghi_chuthue" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="t_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền chiết khấu" e="Discount Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
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
	<field name="fcode1" hidden="true" categoryIndex="-1" readOnly="true">
      <header v="" e=""></header>
    </field>
	<field name="fcode2" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
	  <footer v="&lt;button type='button' class='btn-inform' onclick='set$Voucher$CreateCashReceipt();'span style='color:#0000ff;' &gt;Tạo Phiếu thu&lt;/button&gt; " e="&lt;button type='button' class='btn-inform' onclick='set$Voucher$CreateCashReceipt();'span style='color:#0000ff;' &gt;Create Cash Receipt&lt;/button&gt;"></footer>
    </field>

	<field name="mau_hddt" external="true" disabled="true" defaultValue="''" categoryIndex="10" align="right">
		<header v="Mẫu hóa đơn" e="Invoice Form"></header>
	</field>
	<field name="so_seri_hddt" external="true" disabled="true" defaultValue="''" categoryIndex="10" align="right">
		<header v="Ký hiệu" e="Invoice Serial"></header>
	</field>
	<field name="so_hd_hddt" external="true" disabled="true" defaultValue="''" categoryIndex="10" align="right">
		<header v="Số hóa đơn" e="Invoice No."></header>
	</field>
	<field name="ngay_ky_hddt" type="DateTime" dataFormatString="@datetimeFormat" external="true" disabled="true" defaultValue="''" categoryIndex="10">
		<header v="Ngày ký" e="Signed Date"></header>
	</field>

	<field name="status_hddt" external="true" disabled="true" defaultValue="''" categoryIndex="10">
		<header v="Trạng thái hóa đơn" e="Invoice Status"></header>
	</field>
    <field name="e_mail" categoryIndex="10">
      <header v="Email" e="Email"></header>
    </field>
	
	<field name="btn_lap_hddt" hidden="true" categoryIndex="10">
      <header v="" e=""></header>
	  <footer v="&lt;button type='button' class='btn-inform' onclick='set$Voucher$CreateEinvoice();' span style='color:#0000ff;' &gt;Lập HĐĐT&lt;/button&gt; " e="&lt;button type='button' class='btn-inform' onclick='set$Voucher$CreateEinvoice();'&gt;Create EInvoice&lt;/button&gt;"></footer>
    </field>
	<field name="btn_lay_hddt" hidden="true" categoryIndex="10">
      <header v="" e=""></header>
	  <footer v="&lt;button type='button' class='btn-inform' onclick='set$Voucher$UpdateEinvoice();' span style='color:#0000ff;' &gt;Lấy HĐĐT đã PH&lt;/button&gt; " e="&lt;button type='button' class='btn-inform' onclick='set$Voucher$UpdateEinvoice();'&gt;Convert EInvoice&lt;/button&gt;"></footer>
    </field>
  </fields>

  <views>
    <view id="Dir" height="172" anchor="6" split="10">
      <item value="100, 110, 9, 120, 100, 0, 0, 8, 100, 15, 58, 42, 8, 110, 0"/>
      <item value="111000000-10011: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="110000000-10011: [ong_ba].Label, [ong_ba], [so_seri].Label, [so_seri], [stt_rec]"/>
      <item value="110000000-1001-: [dien_giai].Label, [dien_giai], [ngay_lct].Label, [ngay_lct]"/>
      <item value="111000000-1001-: [tk].Label, [tk], [ten_tk%l], [ngay_ct].Label, [ngay_ct]"/>
	  
      <item value="111000000-11011: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l], [ty_gia].Label, [ma_nt], [ty_gia], [ma_dvcs]"/>
      <item value="----------11001: [status].Label, [status], [cookie]"/>

      <item value="1: [d21]"/>

      <item value="1100----1-10-1-: [fcode1],[fcode2].Description,[t_tien2].Label, [t_tien_nt2], [t_tien2]"/>
      <item value="1110000-1-10-1-: [ma_ht_tt].Label,[ma_ht_tt], [ten_ht_tt%l],[t_ck_nt].Label, [t_ck_nt], [t_ck]"/>
      <item value="11------1-10-11: [tk_thue_no].Label, [tk_thue_no], [t_thue_nt].Label, [t_thue_nt], [t_thue], [ten_tk_thue_no%l]"/>
      <item value="111000--1-10-1-: [ma_tt].Label, [ma_tt], [ten_tt%l],[t_tt_nt].Label, [t_tt_nt], [t_tt]"/>
	  
      <item value="110000000------: [ten_khthue].Label, [ten_khthue]"/>
      <item value="110000000------: [dia_chithue].Label, [dia_chithue]"/>
      <item value="110000000------: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="110000000------: [ten_vtthue].Label, [ten_vtthue]"/>
      <item value="110000000------: [ghi_chuthue].Label, [ghi_chuthue]"/>

	  <item value="110: [mau_hddt].Label, [mau_hddt]"/>
	  <item value="110: [so_seri_hddt].Label, [so_seri_hddt]"/>
	  <item value="110: [so_hd_hddt].Label, [so_hd_hddt]"/>
	  <item value="110: [ngay_ky_hddt].Label, [ngay_ky_hddt]"/>
	  <item value="1100000: [status_hddt].Label, [status_hddt]"/>
	  
	  <item value="110000-1100: [e_mail].Label, [e_mail],[btn_lap_hddt].Description,[btn_lay_hddt].Description"/>

      <categories>
        <category index="1" columns="799" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="100, 100, 9, 120, 100, 0, 0, 8, 100, 8, 58, 42, 8, 100, 0" anchor="6" split="10">
          <header v="Khác" e="Other"/>
        </category>
	   <category index="10" columns="120, 30, 70, 20,30, 150, 30,80, 80, 80, 80,80,80,80" anchor="8" split="12">
          <header v="HĐĐT" e="E-Invoice"/>
        </category>	
        <category index="-1" columns="100, 100, 9, 120, 100, 0, 0, 8, 100, 8, 58, 42, 8, 100, 0" anchor="3">
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
        <![CDATA[<encrypted>J/HRvCI3Jvtsk/jf7BU5i5CzxM1b79nB+AM+c7llMpBvDvqFdQC8tQKN0CPp6wx/zpq0DcclB48SuIJY4N/SwzvN6wAef2cJd3aq3BWu/01TWj+pWxzs0zFHI0h6UJfU3bzuznrxn7fsnLabhLTnK/YMsEHEC2eWO3yh9+dmoA/ZKDAaSzpt+M4kxpir3b0S</encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<encrypted>jsguT1F3i8nGtqLMkxZj7XhNigvsfrjcl+I623V+NqEiLq1pCZUy3ScJRnRuoN+eLkLNzIatj1CAgCgsK1jkI1alCrakHjHe4DiCI6U4lzKKv557eyuVZSN2nQZfrQt+</encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
		&CommandGetEinvoiceInfo;
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
        &CommandExternalFieldDeclare;<![CDATA[<encrypted>gJoFmK0sS0RHBg6WicanqfW8GRTAxWMtvLxF2lGmq4CMOS4FWgB7/l9+y3GU1Khy</encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<encrypted>gJoFmK0sS0RHBg6WicanqdURDJsh2H0jnh9j9+Pc6/lwEoOi6IpHIuUBs9BxDlxpqKOxJNU0VtOsoZrqIV+1M/sYSpxax4pnKpgHUj/ytfKwOTQyeffubIsXLtyuv7pS</encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<encrypted>LYsQP+xHunF0V4kGFNFbsPhVXR4W1f/upA5we2o9Fqk7WWTwWH4sM65obt786grD87C0yHi7ICleBL3vjScNg/GbmY+Z6s/nV8wrR9+OmkA=</encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<encrypted>LShulveQMeWQ3P4ZyXMGEEhB2OPFCAmGFBZmph8U+bUJDM3mRL2mVM2Ppp75ZeP+rhnRrZ+vWzpYv5maj5oltQ==</encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<encrypted>LShulveQMeWQ3P4ZyXMGELVvInascRTLJxR2tGzEEDTJYbPFXj8yQmYbLLskyB266Q3j2CIgWFATOVyKydcAHv48j0l0WPqz/Jf4GMZnLvQ=</encrypted>]]>
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
        <![CDATA[<encrypted>j/Dm/6vHzU+noc/DNng5HoRuYQZxwZp5FwigavuO+QemyhHBIcT+B107pS6eEOPIaybo4jVtXvR3iVGjzWo1iQX2hf/pSpx3ceDUjDCFzbsyMJfPxH6Q2x1dxp0X5lBPAwpFcP3jBcxFtPPFWGpDxUJCPXQ9wZmRsHnVYPi+Dr1+xyFBr7E5VrRNaBC0lk80FriavJ/BWY9WGnaUjNZACg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>DI10eLhziTZYL+4BrZtDZRhUMtFsULcUAxOk1M2MEk+X/mQRH7beSGvGyFsTXc223hqYo7U/wzQD/lC260FMSuw01biPb4uWN5Wf5qwHnz5sUUuLHjb8iA5ShLXilCj05AxrkjDxSwC6YfolrqF74guUCUSYldtKtJB5zcCw54kXiIMxRLlME8vGu5KyalhoI42x/4LgDJ8j8Kj2UUXkOw==</encrypted>]]>
        &AfterUpdate;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjNM5DJ9nuOA785bKXqt9ViKX0KXllerWVcqK//gDH6sU6+cB0/Cg4zCuf5+pR5ZL0MVtL01/SSgXvIIkjPEpj2YQwNY1asZaw+EZzQ28ctVS</encrypted>]]>&CommandShowWarningMessage;<![CDATA[<encrypted>FTgzG0Ebn58SWQYsf65nyjIIGuY/GZ6oxX0a/PwjGKzviKX5u9uIEUIVQbbNJofhdxu3S4ep6ls4RjJCLKh4YlshfeCbWblD3/5LcHM/Og0=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        <![CDATA[<encrypted>+hv9dTbIXN8LiYCNpR770LlO8fSrsX6BgPz74bS7WqDjf0lhDb9H9SfHCX1ukPjhhB4L4zDEE6Rqcy/2yQFRIBWK5vetqErSSLg6trbbpc/oTKZyMrXvbUuCBC5AYJXHxjjXuPg1A29yVsFcpfmRoiFUdW3cCdB0UgtQl7XlsZ5Jcf7z0Cmu8tK5GIgPGKlsHai9IP8sFdqPyrCQKfvvDf1auCUkJT1wQcgFNsc7qqPU0BS6T1kvNOFkS3hkUWnp2Q9r0pFYwVdgoB+tl8R7ZxY68fjc9vpJw5s/W3w20bCnyQaEg7RCRYxyL6KdTtThJXViYWG7wKHzaRNLPSzM7zWJG5W5Dyv9irWDxrScHSNfVOWkaBRrrqu+zmQZaGq5sH2srQ5gAGstJNpPJoQzuQ==</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>s3fgwg1KlH4vfLxMnRyE8m6AitRDUBoIsyZbnxlDEqCk03aP8KkdxE0iUMSDAspmrUQOnbFHyfwKkLjzIur3t9LZkbRUJNpIIrHFOMijW1UdCNZYwWnVTL1GUzhMtnY5VhkPn+Il9M4eIU0z4HmhXK4+BKw2KHs9ykGV/wJ8WM7+hmNJ91yjkGZmvdkbbVvMXgdZduo7H8/fIP8psp1QwmEzsUqAufqqkX1S/AuoLF9aFkRlVCUSKYILk5As2R6cBOtLGbmA1zRZF+MXAzRbRSUdI4SnFq0qRgi1fWp9bd0=</encrypted>]]>
        &AfterUpdate;
        &Delete;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        &CommandShowWarningMessage;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<encrypted>6WmqbCv92cCUPmvVLBKG9lAwu741IXxSQXmmjoXn60amUvjD6bSCSJLyLAKRhpaoaXTulB445b6b2FuJ4CTvu7R8v/FqgxHUidJg7vdZdccWI3IwY3zFSkCV0+2KGzIG3IuKo1mdXDtKPYqjHtIufB3OzdyKjj49KIoSe/M7mo4=</encrypted>]]>
&InsertHistoryVoucher;
<![CDATA[<encrypted>gf1kCmGzopQeffAMFVthPHhnctLt+Br0j8Tjy50DGUfDKofDvdzQfJmKPw0NOlEt7+BPEuaVHvgoBnOeym7GiGhjYK8BF1zS4gL6bBOIF8Xg+nqVt6z1C6t2+7O9TdO4mXtcXyapQk+Gl29SI47rbwNlQa5lG3NqWiu241U8Hp0pTH2mbqI/c28rUss49xOfblpWbaes2Ecikz2ln2IN1OAfE/1pqNdx7qnmXklnHZc=</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS86MfU2bvIdHD+hArj7qQd5YEYJ0+70Bh8DJcI81Q4sVOKIvBITQ1smxn0Yb4froHS25eW51dCwPmCs4gXLR6Ocw==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>holZ9nnnS4fCln+Zadky2zqO6Xu1JUvaDEUNN/zMZCgVU6mbciWXmZko+sdXgGclt1k/qw++ZaSujx7TujAgakbbE+aruBBg3lJ0sWSgF87YG74l2o3UkuTQXZq9fSDgldaiILVFp5l6wuObJNf9jXbPORgoRzXgjVV/p4101+s=</encrypted>]]>&ScriptEinvoiceInfo;<![CDATA[<encrypted>lgM35MsWe2Oy0KQi6TSvc0zkHFw7YTUgyXDP8elc435uxwfyxWK0m5k5Zhh8QmtGEhRXWQ49TwfXtQogoPSutw==</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>S306XDTuzLrc8Jzckjo4t2f/Xq9LDTc0WntjEANcc86IifqIULcqQpmLhBsN4K7TiaGjBkYeTj/Tm/Z+PeBCPQ==</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>jIeeK4soNu3ISGcV1Hc6bLwSmRbkLNiXpILYEAAX5r+rqk6BIp+VKN1NlptuUX2DGYm5/qChWhOBRcA5XLqYuj1q80Fq7fW1up1HnuCvenNcU9/oDE8qnP1u1VByOz2WUhdc0t6jLpv2vbdGHF/74XnQbvOhtoOtWZUMALZVEAqnJjY+o9cfo2f/WprPOY522ZVpY4QxkkePm7lvMnRBKYgkPC1KBHXIn2KNji4oFYRtjE2fhs3Qe5s2B5OnvhbiczU0K4E1M6CHLltNgdefKlojgloVOjWz1LxtONhHLH+yVku2ZS6gd3NVVaCNi+KLSrgTG2TQTQDcX36KDUb8AuFNgBKlVjiBn2KdfzN5ZiodL4lUbA1LZQBDhIk7e+QO</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>GuAr1WZAHqjppu29MzpqHsWTibpGdYJz4DO2tAEXWZDSsWlTh6UM1DeaCHOwqKlFTSq6+Cx0x2fgyYAr57fisLKjTMTjSg4/3dz866VPa93N0IaAsK805sg8faOYgrisHy2w42U0eYvUrUQDmFouElyUwnnuRlZqsBaRnrkWaSkCjybaQmNO2ZosPCFdepqtUrFM5g20pHOhTsRG6FLxWgAKV0VvubN6PLnYLXOgfEfjBYnCTNOI9Q+nt0+AhyQ5rgnn96CeqrGanN9TLimPbtQI6ZjDV5bCdlSMHqIGouYWu55q58sroxh97tn8SA5h33JABDy1l9T1IXsxN5EGdfSwgoezY0bU7AnHZye6V8gbo8xxd9acmvL4bENL9DiHNnQ6XWE60VbD5CPXtaGb4vNGMnbfkN9/huQFzeXgz2XXq7Dm98M3KqTIFnsqVSPNC+3B+a7hL0z8zb7UcPrkRi3TsQ1vp0WV7MQD5Of5dG72f9eSomHxawBYkhDOOOsbmRQ7RTurk4QFgRKCLyD8tc60NBU03CVBzd+CN1sNxffHBSMcA210fNGQ+eraSm3g2qS7MLLAoQTyAnlUJ5h83A==</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>5j8CBbimWiuNaalmCQ8Ng5k/Dc02LsO4EmUhPO/4rK9A91lCUTFpX7oiVWJphviyLwADE3i0vqNN0/pC5WzZs1tYEq03IuR9rHPavF7BoNQdYMJufYSDvTheV0fPTE7SeuiD33/jxYr0mc9v6NSLxli9ByghH1pdevaddIirnBsHJb5bBLQDp+RCiy5upSeJTrpSvrpx/lcIFAU9gaQ4Og==</encrypted>]]>

      <![CDATA[<encrypted>a8HgqNUyVIl0EChQn/0ExXDa0MOypoGRmhLWRhfqQmrkyXHypjmt8LaMakAuPGCotps5vSIHdAKMaYz0TJQbfc4aYkwUeuNQaR++VeTr6l+A+d9rVKaMc9fa2hqfnN5IwRmkKGaKZaNAU41eMoniH3VjUx5bTUSVSpZc7G1cpDrtndNH4ojUu1WOxTw980bS8OXYpeDy1s5KVAjnQzBb4CaePx+CpCPc2UL80pzECSIRhRGsy1bOvoGSh4J8OeTw5MQiRZCJiwf8Pj6Kmu+9qdV36xhSCjuDNl882RzKeaQSTVgkhHPZktmdwHi1VetdhZHTLmeVIt1KRCZVYb1pDALdW272wf2F2pMVZ7Kb3kpOu7IO1gjpSKT8Ndn8MwIljCa4CmT/kpr1F+2dQD8FZ4jda2JPVRSgyGDE8vWjla0=</encrypted>]]>

      <![CDATA[<encrypted>v1mcdMOMviRdgI07lhNNtZAi6r89u4Esb32okLcszZPbBl/+xpWXZfECB07Z8wGYcuaoLrVKx+evRIQO0aWjuMLXpfjd7VwTVJTFlAyigl/6weZxNJca6eXaKKJu3jPDbXLLYkk/VGiwuk3hYCVGHvsgwGJ90kBI8QmroRMQ3a1N3nZmt1KDXVpgfv6YgZgTUcdb4TvLo9G4yXzbD8gHaA==</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0SVG/ZIFBAaT8lyFwW2eU1YEm9B/nkodjj/qIJ+aRz+i</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>NNXN5PQFilSpwb2tyADVvOzXb2gxZSm7UbJQOUcy4gawBkjb6+AEJwz4tv66e1nCF8MkliUUGRjW3eAvlyve4BFI8bEKp20L8CZkaL1zTLZ6T+qf4ZJozwaPdjO34bIK4klmL+UQzok+o18vlrcRw0tHAdjXaUd2uLj4NUia87hI1jIS1ja8UVb7saOezBeuXi2zumT2HHEHWppF7hPu6WrraH2XmPccd8x1CXa4Rmn2d4js0Y0JTgwdDdVuedqmsI9iarLfTD/IuNUHK/1P7YKdKH87LfEP2/OYZhFXGCqz/ZuYLyJv3SFbOcAWL9jI6m1PSQspD+eEeZSCgRfQptRRf4PzTIA400YjIBr+ZsaDFUIYX7ibW6JCtshZD9qzhe77moZVUsISNle/tQfJR58MFpFf7WBWNMrswP4EVMEMo8NG6wtsTosMFfzN20rWItNUE4U4zeSSB4KthbPMAA4H2fNuJyn1KfrJwTtgX80c3kAmmcpiD6s66T9OD/hN/B1vYjRTFEoaJiHeW/35gS7l2Xefa57HiMhm1PDQb21xa30EQqgnmRe4zjwquDa4vBycl0u9qO8r18VTxjH0LlHRLGqtKmZzTtDAKnhptMUHbgHBVbLpRGDoQwOMX5SdwC4s/rZm/+FyHwAyj2PglV4uZS4XyrNIwQ8y+mOP5nWsOKcjmgFYbV+7I4i7k36lLwoqNFxBZQwvA+h2t1uV9xTbxgvwGB2S41OWRo7hA3j2IcZhAsc2agEHHzMOUgnGzWddPKnOKlhVP5HpEdKoHUOdZssOX4bvBJeRQr07oVggfgtICKxZ0OrFIKArlqnV3TnfCZxWkVBALqZ3GCwTnHTiUwZTOCrb21lm4lu2mjwATFXGQkocVQM/Tm1407MPeydckvYHzKG8U4D418Z3Y466MWukgidfU9sakwTKgRwrZ8Ve2jgiVryxmr9rOQ1OrvxGi7MhUMdeRaB1+U8VxrhT5YyOcsdQyvh67bIF9KiUvRVm8QTCvwuPCS5bbYKoGSJG0qxEwM+irRaKwEZRDWTnguRki5YhQce2P3SA9TKTxIbkDnOmnCV0sAMCDdiEzZ1SS4mnZg0G/LQQaNLVo2XE953M2LdXAh2ZOjipOomN03CyQBrc4I3D+QvIfkXHXjL+nTax4Nr/7cZ7zUFs6KSElrt0B0DZQKBR4Y/nYk1iS1fJnYQtswzsbTMrxbNVhM9XYGxFtx9aCNvxIN3dosevl5Zj39nCvjfnfmIL8K5tDWfb8GhxWIzDyWwEBQbTY/k5zpFuRpcGQ1EJcBqsAhOmyNy3zMocV5YJM4c5Ulc9lRsw2ItcRPyZA9/bYZP1KyVmBHIPc3wHGoNv+Y1xx6WeIO0IklqxRQ6YcfgrQy43kjHkIId37Vxo2L8jUwaYoD9o7dD+TUXjhqd7t7+FJIdUvDcr6Z51JSZ0CEm4cYnyAW3HYcIxzgoT8WZfzmSWumlLMgayB6H5HGEGmGl81f5Nv0iaVrvGX3AcbJ83HCHSovKjPTx5GgUOhwBcAyWubKnlCDZdJjDT78rQYRT4YA==</encrypted>]]>
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
        <![CDATA[<encrypted>czetJu8FNMbGwoAHCseLjsWBnOZO5q/UkZC0jCXMPWkPbYbrThOqRasWswcxrLOGxANffkikKkeXtAyu1YUrQ9azbJoWFY75xyICJoSXsaJJbD3px3n3tCR7JCyOwXBD/7S/PJBbrfkLyg5P4ABV4f2lJypJxI6E/XoEtbL5TlFaq7+JlvZmvXl/7/MhNMMsWOC70tbWQDJRvqtNVLjeNGPxjHrMllHHVPw2P4tnaRG6sJylqOoNaINTQJzFzbauOwSA3UPr3x/Zadugcvq0MQGt4YBAT5ASC5dVvegLWHxyFEaajtylHxZiDoac/xNIvB5ZkQvJJsut2OZpWN9M0BJwGnMsgYhb3Grs+LsEqi8=</encrypted>]]>
     </text>
    </action>
  <action id="CreatePT">
      <text>
        <![CDATA[<encrypted>YZYE5jI1VLXaVHLC/6FkvwX05RTJx5t2mMjM987dFna2uLkcszjFHQiuoJoLFYJqat0Bfm+QTZqXTJ697PazACRrLNQNPd9pJLA05YavrxwjyC1OWpoYqe3P+QzaYqGLMYE/z/o7CAwjrk9xSYvZjEIiU0REaxhutCpCvHqGIDNbrAb8p39hzAvJc63Yy5NrKA5W7ZJnCM968RWVvAOQKBoBpEIEi/xpGJnlQvd/ilGCBUHoPag7aseJVUCzdiEsYapB7XLMABhW6DfPuJ63elIeJH9XWImmjK3y8f6RTa40QKpUQEVn2salj/85BBA4criZvkhry+VADLVZLQcwDdvEX9qGxvM4DvfPueQw/EuaTs4ozAh8qtVrxJmWF/oS4MNDvxYfpC191WpQtpNud+Wk62MPtkprOJiO9RjjNyTUq0h4xRphefN88zA8bxbW</encrypted>]]>
      </text>
    </action>


    <action id="DebitAccount">
      <text>
        <![CDATA[<encrypted>lbl1/awQvH7NpAjXBsCQKMtRQvMedxdLhsY6V+JqvwYr874i6LoZ8wMYomsiWBSOMqTsjSNQRUUD+x1dowV3QhV9uMmqQYj7Fqhc1AvXE2zzV1jk+/vokaOQ5UNolE7ECpgkOiZmkX2flymzavENcA==</encrypted>]]>
      </text>
    </action>
<action id="CreateEinvoice">
      <text>
        <![CDATA[<encrypted>M7Efl8RBk+Fiz7oeEilhQIWQdwpGnWv0sEMfRlmsE7ZkPjtOiQNaHmXA6tjWqqGc/FRFkRH1LPxewbhl1L6u8wLFwQ1VJvVcjlSeU87IwILUMkdctRxtmLXngNksO+qfXFD6kmz6d5DJQXDPBNBuSmKLEwAmADJhRj+hazlhYumvkoUvTsDQDRKuiWTy3D/3uVBEl7QazDeMNMCo/ZEgxfcxxbUdB+AEuJiYiSixqKOTtnC+EyYkJ5jaPBGtkPceDRMxb8dyoUWANGmAjJ7L1ZuP0LWhC9eM2CS2wJ7+7d6AiYP+NYBTsjXc2436boVSj+4tR7OM3UyvqIYhXWFZL/2VHJsjZCiNk2hkSp+NbCVzV6Pkuz65d81HXTQ6+QKZAUZ2PIVIZBcMLyHoha6XbQ==</encrypted>]]>
      </text>
    </action>	
  <action id="UpdateEinvoice">
      <text>
        <![CDATA[<encrypted>ww+A66a7agNjoFe1GGzim9A7hk9Xs8ZtqHmJ+u+Qh2hNlLVgHwbD41HB6Xumspbh23FJEWxDtciV7pQ3DDwVmmR6jZe2BjVWjqgDyXYHJHJmZEe+7PXxoePgcJn2mroVfGdZrDdvCy8MmZwXMkOx+DuKBUVlVPYWurVB1VVtL3aF2EVKd38CU9hXhyGnZwYS4bwZHGNgajn5sdUktCHLv4KRGV/I4myJt0/ef6WjnuexrDqQSg+QBZDVVshA/PLjStQiysbPG1cmBUbk1M3G7S/heXzdXHrzYEwFMWnXuyE=</encrypted>]]>
      </text>
    </action>	
  <action id="UpdateEinvoiceVoucher">
      <text>
        <![CDATA[<encrypted>cSfQ/Z/nKKqDdwRRzpUCkiFQbDtYG9WqJY0qPGADfUJoe+E9h3ID6WIawzRORI3CVVNHLkRR/MAKldbuiHKKYkqBz6VOKRJ8wjzVqhEDWrWJiil5mmcdM7cPKpAoWo3fg2EU8ypjUByNNGu9vB6ioScCbRvoSq0xksK2TNVuzIRrZ3R0F7UfMqQb8XYJNt0hfrWobMJcqOj9pwdhl1hvLQ==</encrypted>]]>
      </text>
    </action>	
    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;

  </response>

</dir>
