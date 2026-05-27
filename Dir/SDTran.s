<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
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
  <!ENTITY BeforeUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\BeforeUpdateCurrentCustomerBalance.txt">
  <!ENTITY AfterUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\AfterUpdateCurrentCustomerBalance.txt">
  <!ENTITY InsertHistoryVoucher SYSTEM "..\Include\Command\InsertHistoryVoucher.txt">
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">
  
  <!ENTITY CommandGetEinvoiceInfo SYSTEM "..\Include\Command\GetEinvoiceInfo.txt">
  <!ENTITY CommandCheckEinvoiceBeforeUpdate SYSTEM "..\Include\Command\WhenEinvoiceBeforeEdit.txt">
  <!ENTITY CommandCheckEinvoiceBeforeDelete SYSTEM "..\Include\Command\WhenEinvoiceBeforeDelete.txt">
  <!ENTITY ScriptEinvoiceInfo SYSTEM "..\Include\Javascript\EinvoiceInfo.txt"> 
  
  <!ENTITY f ", rtrim(ten_kh) as ten_khthue, rtrim(dia_chi) as dia_chithue, rtrim(ma_so_thue) as ma_so_thue, rtrim(@invoiceNumber) as so_ct_hd, rtrim(@invoiceSerial) as so_seri_hd, @invoiceDate as ngay_ct_hd">
  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd22$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec
exec MaxvOnline$App$Voucher$UpdateGeneral @@id, 'm22$$partition$current', 'd22$$partition$current', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec

declare @allocateKey varchar(128)
select @allocateKey = 'stt_rec = ''' + @stt_rec + ''''
exec MaxvOnline$App$Allocate$Number 'ctpbgg', @t_tien_nt2, 'pb_nt', 'm_round_tien_nt', 'tien2', @allocateKey, 'stt_rec0'
exec MaxvOnline$App$Allocate$Number 'ctpbgg', @t_tien2, 'pb', 'm_round_tien', 'tien2', @allocateKey, 'stt_rec0'
exec MaxvOnline$App$Allocate$Number 'ctpbgg', @t_thue_nt, 'pb_thue_nt', 'm_round_tien_nt', 'tien2', @allocateKey, 'stt_rec0'
exec MaxvOnline$App$Allocate$Number 'ctpbgg', @t_thue, 'pb_thue', 'm_round_tien', 'tien2', @allocateKey, 'stt_rec0'
">

  <!ENTITY Post "
declare @group varchar(128)
select @group = rtrim(groupby) from @@sysDatabaseName..voucherinfo where ma_ct = @@id
if @status = '1' begin
  exec fs_PostSDTran '@@prime$partition$current', 'd22$$partition$current', @stt_rec, @group, @$ten_khthue, @$dia_chithue, @$ma_so_thue, 2
  exec fs20_AfterUpdateGL @stt_rec, '@@prime$partition$current', 'd22$$partition$current', @@id, @@userID
  
  insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec
  insert into r70$$partition$current select * from ct70 where stt_rec = @stt_rec
  insert into r20$$partition$current select * from ctgt20 where stt_rec = @stt_rec
  
  exec MaxvOnline$Posting$Allocation @@id, '', 'm22$$partition$current', 'd22$$partition$current', 't_tt_nt', 't_tt', 'tt_nt', 'tt', 'cttt50', @stt_rec, ''
end">

  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete ct70 where stt_rec = @stt_rec
delete ctgt20 where stt_rec = @stt_rec
delete cttt20 where stt_rec = @stt_rec
delete cttt50 where stt_rec = @stt_rec

if '$partition$current' &lt;&gt; '$partition$previous' begin
  delete r00$$partition$previous where stt_rec = @stt_rec
  delete r70$$partition$previous where stt_rec = @stt_rec
  delete r20$$partition$previous where stt_rec = @stt_rec
end else begin
  delete r00$$partition$current where stt_rec = @stt_rec
  delete r70$$partition$current where stt_rec = @stt_rec
  delete r20$$partition$current where stt_rec = @stt_rec
end">
]>

<dir table="m22$000000" code="stt_rec" order="ngay_ct, so_ct" id="HB6" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="hóa đơn" e="Invoice"></title>
  <partition table="c22$000000" prime="m22$" inquiry="i22$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_hd" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and kh_yn = 1" check="kh_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBZCjY1pO6/p+NqFQ3l3vjFmZ+SRkeDTSpB/rMZvVpuSg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người mua" e="Buyer"></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="1">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XAGERfv6WGGKi3cVG98eiH2XPA6Y37WxSS4XLq3drcYfRgNFpos0rQwGk9+s5Q6WM4=</encrypted>]]></clientScript>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
   
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCmVcn8h3iz76804lWbbVpa4+qfED8HT/UON2+1BJB+dA==</encrypted>]]></clientScript>
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
    <field name="so_seri" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right">
      <header v="Ký hiệu" e="Serial Number"></header>
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
          <text v="1. Chuyển sổ cái" e="1. Release"/>
        </item>
      </items>
    </field>

    <field name="d22" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="148" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="SDDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
    <field name="dpb" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="148" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Hóa đơn" e="Allocation"></label >
      <items style="Grid" controller="SDAllocation" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>


    <field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
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
      <header v="Tổng thanh toán" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
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
    <field name="ghi_chu" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
    </field>
    &XMLUserDefinedMasterFields;
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
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
    <field name="ma_ht_tt" clientDefault="Default" categoryIndex="-1">
      <header v="H.thức thanh toán" e="Payments Kind"></header>
      <items style="AutoComplete" controller="PaymentKind" reference="ten_ht_tt%l" key="status = '1'" check="1 = 1" information="ma_ht_tt$dmhttt.ten_ht_tt%l"/>
    </field>
    <field name="ten_ht_tt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="-1">
      <header v="" e=""></header>
    </field>

	<field name="so_ct_hd" dataFormatString="@upperCaseFormat" align="right" external="true" defaultValue="''" allowContain="false" disabled="true" categoryIndex="10">
      <header v="Số HĐ gốc" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri_hd" dataFormatString="@upperCaseFormat" align="right" external="true" defaultValue="''" allowContain="false" disabled="true" categoryIndex="10">
      <header v="Ký hiệu HĐ gốc" e="Invoice Serial No."></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct_hd" type="DateTime" dataFormatString="@datetimeFormat" align="left" external="true" defaultValue="''" allowContain="false" disabled="true" categoryIndex="10">
      <header v="Ngày HĐ gốc" e="Invoice Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="200" anchor="10" split="10">
      <item value="25, 75, 110, 29, 71, 29, 100, 8, 100, 0, 18, 58, 42, 8, 110, 0, 0"/>
      <item value="1011000000-100111: [ma_gd].Label, [ma_gd], [ten_gd%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="1011000000-1001-1: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_seri].Label, [so_seri],[stt_rec_hd]"/>
      <item value="1010000000-1001--: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct]"/>
      <item value="1010000000-1001--: [dien_giai].Label, [dien_giai], [ngay_ct].Label, [ngay_ct]"/>
      <item value="1011000000-1101--: [tk].Label, [tk], [ten_tk%l],[ty_gia].Label, [ma_nt], [ty_gia]"/>
	  <item value="-----------1100-1: [status].Label, [status], [ma_dvcs]"/>
   

      <item value="1: [d22]" />
      <item value="1: [dpb]" />

      <item value="11--: [ten_khthue].Label, [ten_khthue]"/>
      <item value="11--: [dia_chithue].Label, [dia_chithue]"/>
      <item value="11--: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="11-1: [ten_vtthue].Label, [ten_vtthue], [cookie]"/>
      <item value="11--: [ghi_chu].Label, [ghi_chu]"/>
			
      <item value="11010000-1-10-1: [ma_ht_tt].Label, [ma_ht_tt], [ten_ht_tt%l],[t_tien2].Label, [t_tien_nt2], [t_tien2]"/>
      <item value="---------1-10-1:  [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="---------1-10-1: [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>
	  
	  <item value="110: [mau_hddt].Label, [mau_hddt]"/>
	  <item value="110----11: [so_seri_hddt].Label, [so_seri_hddt], [so_seri_hd].Label, [so_seri_hd]"/>
	  <item value="110----11: [so_hd_hddt].Label, [so_hd_hddt], [so_ct_hd].Label, [so_ct_hd]"/>
	  <item value="110----11: [ngay_ky_hddt].Label, [ngay_ky_hddt], [ngay_ct_hd].Label, [ngay_ct_hd]"/>
	  <item value="1100000: [status_hddt].Label, [status_hddt]"/>
	   <item value="11000001100: [e_mail].Label, [e_mail],[btn_lap_hddt].Description,[btn_lay_hddt].Description"/>
	   
      <categories>
        <category index="1" columns="795" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="789" anchor="1">
          <header v="Hóa đơn" e="Allocation"/>
        </category>
        <category index="9" columns="100, 437, 216, 0" anchor="2">
          <header v="Khác" e="Other"/>
        </category>
	   <category index="10" columns="120, 30, 70, 20,30, 150, 30,80, 80, 80, 80,80,80,80" anchor="8" split="12">
          <header v="HĐĐT" e="E-Invoice"/>
        </category>	
        <category index="-1" columns="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 42, 8, 100" anchor="2">
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
        &CommandExternalFieldDeclare;<![CDATA[<encrypted>gJoFmK0sS0RHBg6WicanqfW8GRTAxWMtvLxF2lGmq4DxJQMFyAkjGZmxiqcp3XwhNo0Zvem50B5XvEjPBOpyc1z0cAGuRYSKqlY/cCqgoQo+DR+/8ZBP/8F7Y6fgK2f3YAJNF7YhWel9azYs2fjqYNtPXs1kBNeKXAmH0eboHpA=</encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<encrypted>IniXQXqSlPbubsORsVikCi+wVl2D/j2TnkOtzsDROUsHcsdr4jpZYYMtazlYTitVL8iIuJDbw4Z8f2rgWHjSCe7AeFsY6lxrFQkBT4o5gBdo7mPYrEzo+D2Nz9Ckef5jbNxTQpu6aLA28KPXcJAmOA==</encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<encrypted>j7QbgTa4Hr+w0Xo+D1ZTy+xf8yU9lfregQ2IYlKcvK1oOH76pW26RkolnF/a2S7TcdKLwDckHcGmHz6YyrhlUxnO5t2S/aDmOK9LfyMPPYzGMX9zh8xFt3fXgVf9XpZ0D0udoUBi72Ab/p4LGmRouQ1z1YYdJbPV8iRlqUe1eJ/DxFhCE62kOur2hvXK3mWNcldCLOQRzkeeG/bFP2GIGGEzZNyEjYx1Mh+oh2uhQHjqucTJ2vigsJLJST1tVwCPL4y+bC1kT3ZjfS1sP7oXUtHfuWc3mcpXhnZz8TBgGQ2JUwemIbY80+5B/tIxbFCKzLlX30jQnAGKCqVhcpPK7wdTdqknENVzNXUgs2B8elRP68WOTJFKCYfIP5dylEiJCwel6Ovh/adRDdXWde7HJQzYquHsaij3kgfMslE56JGoPYJ5AP3ivj3854ZnfkCZ1uhte3YDdARGjQbhgHDVvQ==</encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<encrypted>LShulveQMeWQ3P4ZyXMGEEhB2OPFCAmGFBZmph8U+bUJDM3mRL2mVM2Ppp75ZeP+rhnRrZ+vWzpYv5maj5oltQ==</encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<encrypted>LShulveQMeWQ3P4ZyXMGELVvInascRTLJxR2tGzEEDTJYbPFXj8yQmYbLLskyB266Q3j2CIgWFATOVyKydcAHv48j0l0WPqz/Jf4GMZnLvQ=</encrypted>]]>
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
        <![CDATA[<encrypted>NwqXWJj5BQMC6RRDQlNAbY3Ms35o1Pz6PCEI2mSS6pNMM9kYrAP49Ihfg89r7U1pN6I4eUyl3LkUpfHSotsIzIoGFOvn4/8VF4AFws/pGAzhBQo2pfMR4OFSbnk6IsLAOjM4HgmYw7ji9yQzJfClHRPiCnGIAfd6Z2DtgwH1gO6R1/FFCDoeCxnR4wb3Qx2fMSBqyLxzofFLrXgy64iSAA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>efUD6Pvl8UMMDiA+s5WaBUKjZlwpDa/nT3cplCRiIHNd0IzCSgZPrSxinju7+7RBxWrnaNwo75J2EGTYQcpLFcpUUfg5gOJBcUdOcGq2ZNMKza5UqhbR9AYcENsWlrk0O2OUz6E+ogD5dnYQKs2E7HT3NWinn6ZBTVOLy5aPKnZWJSYKmxTusy87aJyFJILdGdoxmDoYIeoKd9VZZaUxeC06OwwnI7pzO1iaPG0x8D4=</encrypted>]]>
        &AfterUpdate;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        <![CDATA[<encrypted>0oECxu3sR2njkO9Co8hIKSNVEcwkDOtNCtTqIUFTEUozvFzYV9ZxMG/31ahFCl4DojDNkrcLK3DzooLBNzdCA+OzvUqft0npLwrTem4QkIyd9mdAu0QfF6cwswckht1H0MDbORyHOKOoZI6prpbgXBlHIMQUkzvcu0dTIYY/1Ev49c/xuW9yVF1jkLudWohz3zGMZn0lgpnWqNYx3h6moPtvd2kzNRoE7bIKwvdytBy7cnNO7fyoAdHGJa7V+0VAXvpwZeNpvuCC7PZJIvkdirflvLuXqHxFPYbCQjNbTdukfw/N0fi5p6oLq6BLEcj6</encrypted>]]>&CommandShowWarningMessage;<![CDATA[<encrypted>FTgzG0Ebn58SWQYsf65nyjIIGuY/GZ6oxX0a/PwjGKzviKX5u9uIEUIVQbbNJofhWP65jrNPKs7yyyKgVmhm9Ov+urBa9DF7GlbNWQ+gZi8=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        <![CDATA[<encrypted>GFY24Wsr05ZjahzIzPJcXoQl4OSvnyAvWXgWLHWKd8YdaXYTjwzViNet7ivyGeT0rh8mpDn1Yu8s4B8ynmxdAxLAucIksd3UXZzKhaWWpTnp2wKyTzoCriahfw/kZOGPLgVolZzSEcwDXAqAl0iL0zY1VqaMBUUlYDEDAGnE/6xLSZeefoYtAaby34HsCA6J9bCHu9C8XldhbJet3xm5aXidVUSyorgMLT3E0MD/V54nXkR6GJYhh8wivIfb6pKaWWEQ658ZiL/cwZOCd2zOyFu/CS4zV+PZlUZ8OyORiGPKr3Ynk7yB/S6wnzbKLXVbROUqcaZwVAmnek0LcWxq8rFsZcTKGqeEqlFF33CWYUjerSXnQGRLqlGkxIyk6Be+95Ax4mvyy5IcOjOMhLjyoKLV5ZRt7WoQ20zlOLjrV+nmemZAOw1HBP34iDIsVudjZ/sC7Uz4WbzBFU1Y1tBpE2CMy1LoDQB2PsgyRKqzC0g=</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>6fQIgvtmKhNmxx58EYyaftGxgALnmTHfBnLKbCQjfrUj8DkIH/7qUE1XTeSPal4at34hlS7130xWWse6o8MtElc4EqQCB8yd12quuZZ8BUuSMZxicQgsB8yxkqoF2c2nAiJkM8w50gmhdqp7Bje8ec/mhQOMk7Of87xu+y+ZTNb8up9OKrKMTXIxSlWotPPJ2KY1TID5dzXaXAv1SRMn3rMcySZW2MBKVhMVvqojYwNtQsrRbn5rHJ5pg4yA7duUH02QAVt5fvReN3Ur708Z86Hi/dUokKEiDgGKiFXJxZm1+CHcFHniPUQ6m0+3QB5s</encrypted>]]>
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
        <![CDATA[<encrypted>4si6A0Gz+FTpca1qB+9LfCtGPa0DkidFHh0aSwHVEBC2UNQf+qyhybNTcohN0V9VJKTIw2cylyFhRlXxBZobjTOyafvf86QWBPBAWDsLYQkXjg8kDzfW9r5FZX8PM6q9pzyaHRFRkia739acevD0fTYYS0+Thpc0d+o3WmJedrDwZB+qmBIjlHvebDMsJPZD</encrypted>]]>
  &InsertHistoryVoucher;
<![CDATA[<encrypted>12YSEBjIM3F/sO49K+/f30fD3bqcEL4sTxVsIv/uSHO/+jOk9xCzhEof/e0ebakFzhdzwyWpOsBj0TqlyWZVKEClhxi0oGBnL/1tU66BuFEst5z/0sdFzlCN5STePjC3YZrcGCZtZVJKvATb77fFrvz3AwgsD2UKg+OIWkUCOHQ=</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS8p9nsRRanAtEXKcI5YLfU2LTEPj7kP/stj6JSHsKnX2e8zxSujBYhoW8apCbsnZ78SqxqkCDWz9QCczSKWrVejA==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>o5iMIK28KTzAwpXkP0IrAYO2k2/TxIxQEmzhAtWjDL7Z6ZYeE6qkW+UcQxAWxaz7JIg+2eveaBe50mlAggrQQJxQruf6OF8XS9Aqff/geb12pk6tfndXJarSQl5DX1oDlXaBG0bvly2dvyW/iDpkyNwKO7+pl692umUBFVLXKt0=</encrypted>]]>&ScriptEinvoiceInfo;<![CDATA[<encrypted>z6XAeCe9Xbs0uyHGQIy3OGDNXw9zsXMI28eumAYuvWSvurQf6XxJU/ptgp5+43PbNFSUar6ROQxKUT08Xc9Iiw==</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>S306XDTuzLrc8Jzckjo4t2f/Xq9LDTc0WntjEANcc86IifqIULcqQpmLhBsN4K7TiaGjBkYeTj/Tm/Z+PeBCPQ==</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>rAiQj9neuOp4HpOHHlM1obd+qsTS9b4gkl37soQxaWR3fGgJCWF4a2m0pISvlZvX8sShnbxj5zgNNpfL2tbdIdMrHBGvzMP45YnZGieVrKbAHSDAeAmauhgiS6d+w/ZaR2kXdqiddN/XuWLv3joNerNt0ocdgnWFtRliIOaEVw5exj7BqYBoZc8sTI6hnyCxpHanby7uz2645vrss4opZtX1mW3IqDeuCVAt7AxEOsaNeHLLIJ1s++Q/zx+U0ItpqRs7oTVmP8FqLjKrm7vkwoM5rOa5//u1wp1xr/2fpHhTMDrJZ4jbCmOlxeu8z28LCyhOkWAsuNCFnZQTSQAH1Fz0IOp9xhq3dKXMpYL9sQ3nS+dF4ocjsJW+nxlIan/nDhGxD++bvI6sYPQIQ8F39w==</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>jsivTIjfaSnEckICoaP9p+tvOus3OlN15AmTiSP/eTDyM5FGJYL0+RAD+mi3RRO+wtalt9F3o0g6OgJORmt+Aln6h/QP5l8a38GwT3EG5QMKpwjLHGxpgXDqrhXsfWiUm2ug+tVnzz7fbvk8vRhfWqazYibPOnnnP1TjwTJSyQxMWQ+nGckyDz18afeDwHiafg33IkNc3fUwxjSvsvA7ksU5bIyVIzoS9/cVpnvpolkdZvhqweh9rsPFa8j775TfOmuHlErgFKyE5wvIzeSGVyFcs9JZZY94gmypdjvishJiDIm/e+704RxQXVMv3sEjUGtZVOv4AwqUp7v/aR6lNTJkvHwMgmLr3nRHyqY7733K9lRDYuDVj4JwCQnOjEk/JVooPrefWXGeol/wCb91ZRBmkLunUG1fy8rB68byYlfxqXXMIhDjVibb5T/vdIEtUndUE67su2QkPfTwBda6ZTRh5yZB5bxOeHUhEVPs+VNBj480LeeYL3dcbcBjL3u65UPYZZ76nsw/osLAy6XqiA==</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>KnXXcVzZ+77wHLX3q5nGhtG6sBXLPASZSabJomPTXGOyg8J+rT1xhw2Q1c8nBi0zMn8OsOqOtw7dpboVaiSNZz7RsDn9eW+oZMec9lyH4LZZxpl0HzCFsn81oWplAItIUHXwmlCiYfJ2bvObiX499vds+5IftAuVcR+DQkRaUx3fHLynuEw/+gEEc22E0o8rhd2YQb8PzuYY43aRF+8GEYkZEm1W8PB8FSkYQcdP4Fs=</encrypted>]]>

      <![CDATA[<encrypted>i62mLLcrren5YqlIQG51oV2ayiaJYQW4rIlUfLBFJfOaqhH+cV1rxJMNv15amsYxah9p6cBWVY1y5ix+9222OEHa5hvWi738Q3NKWd3H6sDUvYXLf7s3TH7wuDXwJBtF6e5+qtp/VSfC0JvAOPMomqlGn9LyKgbtl+McqysMqg92l6erFjnt1OG+STWmhGQk25dyLEQilUrlUN2zG+pgkjtJ/xEbusA/a2H0ouqI1jpp7CWs2K59WdswxBusDeDmLSLVVt1iXLQ0JFrhSMRi8Ry5s5CBYF/fcC1uZ3xTWcCUaHxab4gOR8K8itxytsJLfkj2R98dBnZFMrz9RUtCS0wOhqXcOdlBIs/4IFcuQZUQnCoAtRQkRyHFjMcIEAePmhm5YOZTOboZ7nW8hit4myojeFBafwHOLfTRcHEJLEDZBrSf+BC7qBjCGyiZYpxC6Gc1VKuI2F9bmXv8v3x2GA==</encrypted>]]>

      <![CDATA[<encrypted>v1mcdMOMviRdgI07lhNNtZAi6r89u4Esb32okLcszZPbBl/+xpWXZfECB07Z8wGYcuaoLrVKx+evRIQO0aWjuMLXpfjd7VwTVJTFlAyigl/6weZxNJca6eXaKKJu3jPDbXLLYkk/VGiwuk3hYCVGHvsgwGJ90kBI8QmroRMQ3a1N3nZmt1KDXVpgfv6YgZgTUcdb4TvLo9G4yXzbD8gHaA==</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0SVG/ZIFBAaT8lyFwW2eU1YEm9B/nkodjj/qIJ+aRz+i</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>51WGH7wdlO+Aqs5B65VQDw1ynZI9c+T4S18FeIdk2MbFcyNsnmnqXmob54x2b/EweU61tGa++Gfa4jeTvJEmKLR/m05DY23Topz0YHPiSEnB4jSnYpG6dFaH1T8cWcUpMXrXLn1oUYJAVWU/EaIMgTwSkRcDeB/mqxdR9sFAbhJCILIYbSF8LPOKdqog8A9k/0+G8yIYFspCgk83Bif9aJset5GPmDVldcq1rORZ8c635XjldCRhQDzKcEisoK7GvqIVrhKXNPXAUGL0xWteWHd4FZWrfyCXtHzKizxJHkLB3KY5BRWBdl5Xa+QD8EqzIYU2rhsuJkEiTkFrTXM784GRFyBsb7GyT8ZNrNTvu8R0770ByUhgExsqtPWKQWJplOFCtD7s48WGiIR4R5+Icf0g69dJ6/riAorWnrH5gm753VW9+fgan3jX4uplIHiEoLsKOI0qHUONexeTBr8Qa2ILrBoHnRuEiPmMpg7pJq/zfSFn0RtD1sg3J7zYfiiwj+m4auXWdv8EKIBB6pZB2CF33s1jS8wtkf8gtttG4dKqgxrj/FhU5blvML1JKO/qqIJd/nVu2zWdPa2OR9G3Xa8F+KgaJbRnN+iyw0ol8c6jVFRCK1BWA4HNj3qMsp7QhdPdrjDImwf9+0WaZ8hALlBaQLvCRDIYUXZK28iQVb0drkdi+LUzAYT10Bo/MO14Q2SKcogy0+1G+R1eIG1cw59RKpH+4pmcHa3nDNRMtqcO0tBmJVJ1/HVx4/rgT7rnVgipNZQkRj6JqKKksDRjMc70qSZGlP+V5IQgqBEpJAA9p8EDFNohafYGxGQQdcYwOOdiegJhlBlDSxj/XjmjJR38SycdFBpmqQj2UWD5MToirV9NfsO1/Bdn9zn94UuzQ+V+MPdJPMFXbe3rW4RNOabpqFa2McJfE83iC4Wd2e+D5qunAiOYN/tlmKYlCDVcFNp5HSx1j5hGBGGDBRl3M+P2AHRcYI3eplcjSJ1s+VQ3j0HWS0+R2Lfo0Zvq7cNNCnIL/ve3dM1Ekr0MYkgpisH7k18KpzByDnkLFtvUCLwhvqOv35sjvbSJ1xenjBhiY504IKI5vR3TYSjvx1x5UprD4aSsOs9Okk5fWXCahCyAREFeyD27I4xK6lK9UW099N4Jb92fzPOlt95jDKyE0CMAtoBadA9ldY8bLhOjaXGSMalZozG82jxd1E1PI02jm21Kf4mcZC5bE8ZAGOFVdEbKM+wtcIG84kF+4YthhMYGniD4ZWV6C9oghE9DELQaAorNDNDhvvApiHODoMgSXJy4t9PsTjRLtg8w5ER7Tdqv0zapxk3m/tNB4riacEwXZg/1aZpebYb9mJknDxYqew==</encrypted>]]>
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
        <![CDATA[<encrypted>weEluKohQMMbLbgNAuJI9tT9zqfEV5k1pTXBiugA5SI3Usbco2CNOev27G61wE74xjDVkNFet3wEdYeK7nQ/STST59n3QNDLT7FnqNdqgWOuV6LownC26kfNvjtM1m445NrZPXSJDnJcd04ID2YA5rUc1WUddMjqe2jKXpZETE7KPjpt27L6v6xyEnZnvbtx/jQenlbfeZ93sTbZXAFrMU3GqF3RuGq8kFF8xeTpxzvTDmsjt5i0dm3zRhscO5vNa/wZOvsCVBEExJZSTWT+ncmBD6uWlpgC7kQlwOTAW+syli5sQ1tZRQIyhvBZvpFN</encrypted>]]>
      </text>
    </action>

    <action id="CreditAccount">
      <text>
        <![CDATA[<encrypted>lbl1/awQvH7NpAjXBsCQKMtRQvMedxdLhsY6V+JqvwYr874i6LoZ8wMYomsiWBSOMqTsjSNQRUUD+x1dowV3QuQl7bSdO57HymiA3Omtdbi5QFihLLm0ueuiQOXg7fePgtfKYZlb8X1/MB7UlbjMgw==</encrypted>]]>
      </text>
    </action>
<action id="CreateEinvoice">
      <text>
        <![CDATA[<encrypted>dy7CmQH9Ga7NlhbP1Elb2sqpdRYqzrJiSbmvFVxAt86jVPKoHyGgffNsTRjMEytm053ScZy7Eq3LZi92poKWdqq5TYZ5pXIdZqRk9KpJ9lXRuFotEyAsyddBRG2WWfc+lCJ+aYS4Fax9pY/haJVyzF2k9Pv+On1KaN7somNnwZREdfVUTli+h+XNqrqDVZ0ncmCqOaXWzy3Pz4asLjGZZ9gi/DmUf/zhhcY+Fk0t+7NYthcQUuHzod4lkVnisNbD8/QsitKoDnhRZ7hAwSGhlblW5M14wJ+fIyGrXgqOEaQb6uEtzY7127ZqU1x/xY76r9LoLV2rKEySHB5Q1nhvxsp+NY26huws1bZLTTv2c1ed5/0z+L0Az7QJXORc/8tKnSXux51E2HBQi1F4/5cvMwOOgPMROL4RTPhOOp3gUGI=</encrypted>]]>
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
	<action id="CheckApi">
      <text>
        <![CDATA[<encrypted>QqpwE5zwdMO+LGqrNS6e0V2Ky4P7kCIqMuKJ9ggGX3wvUItF2OenZy9tVNWqKo3O2LikHmPPQgj8hCTJCQH5k4OmiYABuKwdPt85RpVB+gx0Ts2nXQShzcuJv/qKnwrZMrCCFjmFrFZbFJoAUNv8M8eS2vUeWJG9zqOs0IpH1qJVA4WU5C+XZr0ekkp3jbTikwsJ6ky+jAM4XVlCX6RsTfI/v9RVSsvP2X823Ef2rs3OJnATFPUrEg47uhcKHHF7bo2Zrv2t61w69iyzzGmw0fU9PH0gxt7L2R6STX5ZduA=</encrypted>]]>
      </text>
    </action>	

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;

  </response>

</dir>
