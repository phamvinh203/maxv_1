<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenStockCopying.xml">
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
  <!ENTITY BeforeUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\BeforeUpdateCurrentCustomerBalance.txt">
  <!ENTITY AfterUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\AfterUpdateCurrentCustomerBalance.txt">
  <!ENTITY InsertHistoryVoucher SYSTEM "..\Include\Command\InsertHistoryVoucher.txt">
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">
  <!ENTITY CommandGetEinvoiceInfo SYSTEM "..\Include\Command\GetEinvoiceInfo.txt">
  <!ENTITY CommandCheckEinvoiceBeforeUpdate SYSTEM "..\Include\Command\WhenEinvoiceBeforeEdit.txt">
  <!ENTITY CommandCheckEinvoiceBeforeDelete SYSTEM "..\Include\Command\WhenEinvoiceBeforeDelete.txt">
  <!ENTITY ScriptEinvoiceInfo SYSTEM "..\Include\Javascript\EinvoiceInfo.txt">  
  
  
  <!ENTITY DetailVariable "@d25">
  <!ENTITY StockType "2">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">
  <!ENTITY f ", rtrim(ten_kh) as ten_khthue, rtrim(dia_chi) as dia_chithue, rtrim(ma_so_thue) as ma_so_thue, @taxRate as thue_suat, @taxType as thue_cn, rtrim(@invoiceNumber) as so_hd_goc, rtrim(@invoiceSerial) as so_seri_goc, @invoiceDate as ngay_hd_goc">
  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd25$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec
exec MaxvOnline$App$Voucher$UpdateGeneral @@id, 'm25$$partition$current', 'd25$$partition$current', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec

declare @allocateKey varchar(128), @roundInvoice varchar(32)
select @allocateKey = 'stt_rec = ''' + @stt_rec + '''', @roundInvoice = 'm_round_tien_nt'
if exists(select 1 from options where name = 'm_ma_nt0' and val = @ma_nt) select @roundInvoice = 'm_round_tien'

">

  <!ENTITY Post "
declare @group varchar(128), @glMaster nvarchar(256), @glDetail nvarchar(256), @updateFileds nvarchar(4000)
select @group = groupby from @@sysDatabaseName..voucherinfo where ma_ct = @@id
select @glMaster = rtrim(val) from options where name = 'm_gl_master'
select @glDetail = rtrim(val) from options where name = 'm_gl_detail'

select @updateFileds = 'tk_du = c.tk, ma_nx = c.tk, tk_dt = b.tk_du, px_gia_dd = 1, gia_nt1 = 0, gia_nt21 = 0, gia1 = 0, gia21 = 0, tien_nhap = 0, tien_nt_n = 0, tien_xuat = 0, tien_nt_x = 0, '
select @updateFileds = @updateFileds + replace('tien_nt2 = $b.tien_nt2, tien2 = $b.tien2, thue_nt = $b.thue_nt, thue = $b.thue', '$', case when @loai_ct = '1' then '-' else '' end)

if @status &lt;&gt; '0' begin
  exec MaxvOnline$Voucher$Posting$Inventory 'm25$$partition$current', 'd25$$partition$current', 'r70$$partition$current', @stt_rec, @@id, 
    'pn_gia_tb, ct_dc, sl_xuat1, sl_xuat, gia_nt01, gia01, gia_nt0, gia0, tien_nt0, tien0, cp_vc_nt, cp_vc, cp_bh_nt, cp_bh, cp_khac_nt, cp_khac, cp_nt, cp, cp_thue_yn, ck_nt, ck, nam, ky',
    'so_seri, so_lo, ma_khon, ma_vi_trin, so_dh2, so_dh3, ma_nvbh, ma_nv, tk_gv, tk_thue_co, tk_ck, stt_rec_pn, stt_rec0pn, stt_rec_px, stt_rec0px, stt_rec_dc, so_seri0',
    @updateFileds,
    'update #in set ma_nx = b.ma_nx from #in a join dmnx b on a.ma_nx = b.tk where b.ma_nx is not null',
    0, &StockType;
  
  if @status = '1' begin
    insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tt_nt, t_tt, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
    exec fs_PostSPTran 'm25$$partition$current', 'd25$$partition$current', @stt_rec, @group, @$ten_khthue, @$dia_chithue, @$ma_so_thue, 1    
  end else if @status = '2' begin
    exec fs_PostSPTran 'm25$$partition$current', 'd25$$partition$current', @stt_rec, @group, @$ten_khthue, @$dia_chithue, @$ma_so_thue, 2
    exec fs20_AfterUpdateGL @stt_rec, '@@prime$partition$current', 'd25$$partition$current', @@id, @@userID
    insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec
  end  
  if @loai_ct = '1' exec MaxvOnline$Posting$Allocation @@id, @loai_ct, 'm25$$partition$current', 'd25$$partition$current', 't_tt_nt', 't_tt', 'tt_nt', 'tt', 'cttt50', @stt_rec, ''
  insert into r20$$partition$current select * from ctgt20 where stt_rec = @stt_rec  
end
">

  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete ct70 where stt_rec = @stt_rec
delete ctgt20 where stt_rec = @stt_rec
delete cttt20 where stt_rec = @stt_rec
delete cttt50 where stt_rec = @stt_rec
delete p00$000000 where stt_rec = @stt_rec

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

<dir table="m25$000000" code="a.stt_rec" order="ngay_ct, so_ct" id="HB4" type="Voucher" uniKey="true" navigation="true" name="cookie" check="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="hóa đơn" e="Invoice"></title>
  <partition table="c25$000000" prime="m25$" inquiry="i25$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    </field>

    <field name="tk" allowNulls="false">
      <header v="Tk công nợ" e="AR-AP Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XDnISO+TyyTWM5SdTXjZ+pFaUnTXDH2IIQlglKnHMFrNA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <!--clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCC5XZ1IDPpaDqirJElpwGphj7k0IfLUu5dBXM9DEqppA==</encrypted>]]></clientScript>-->
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" width="0" clientDefault="Default">
      <header v="" e=""></header>
    </field>

    <field name="ma_tt" categoryIndex="-1">
      <header v="Mã thanh toán" e="Credit Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="-1">
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
    <field name="so_seri" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right" >
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

    <field name="d25" external="true" clientDefault="0" defaultValue="0" rows="125" allowNulls="false" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="SPDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
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
    <field name="ghi_chuthue" clientDefault="Default" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
    </field>


    <field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1"  disabled="true">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBcp/bKP2DZnJhAsiU6WGcBuWg4d7uM2rB8a1HLAvIN88igSk6co7YaUvb7YN2PPNA=</encrypted>]]></clientScript>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1"  disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCNUNtMqObqtxkecqasiNYn7NX3LbIryUdxTX3Ee9dL93fI5mgBh5BRT3/lKecBrMI=</encrypted>]]></clientScript>
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
    <field name="stt_rec_hd" hidden="true" categoryIndex="10" readonly ="true">
      <header v="" e=""></header>
    </field>
	<field name="so_hd_goc" dataFormatString="@upperCaseFormat" align="right" external="true" defaultValue="''" allowContain="false" disabled="true" categoryIndex="10">
      <header v="Số HĐ gốc" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri_goc" dataFormatString="@upperCaseFormat" align="right" external="true" defaultValue="''" allowContain="false" disabled="true" categoryIndex="10">
      <header v="Ký hiệu HĐ gốc" e="Invoice Serial No."></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_hd_goc" type="DateTime" dataFormatString="@datetimeFormat" align="left" external="true" defaultValue="''" allowContain="false" disabled="true" categoryIndex="10">
      <header v="Ngày HĐ gốc" e="Invoice Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="180" anchor="6" split="10">
      <item value="100, 30, 75, 35, 65, 0, 0, 37, 100, 100, 18, 58, 55, 100, 0"/>
      <item value="110100000011011: [ma_gd].Label, [ma_gd], [ten_gd%l], [stt_rec], [so_ct].Label, [so_ct], [ma_nk]"/>
	  <item value="1101000000-101-: [ma_kh].Label, [ma_kh],[ten_kh%l], [so_seri].Label, [so_seri]"/>
	  <item value="1100000000-101-: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct]"/>
      <item value="1100000000-101-: [dien_giai].Label, [dien_giai], [ngay_ct].Label, [ngay_ct]"/>
      <item value="1101000000-111-: [tk].Label, [tk], [ten_tk%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
     
      <item value="-----------1101: [status].Label, [status], [loai_ct]"/>

      <item value="1: [d25]"/>

      <item value="1100000000--: [ten_khthue].Label, [ten_khthue]"/>
      <item value="1100000000--: [dia_chithue].Label, [dia_chithue]"/>
      <item value="1100000000--: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="1100000000----1--: [ten_vtthue].Label, [ten_vtthue], [ma_dvcs]"/>
      <item value="1100000000----1-: [ghi_chuthue].Label, [ghi_chuthue], [cookie]"/>

      <item value="11010000-1-10-1: [ma_tt].Label, [ma_tt], [ten_tt%l],[t_tien2].Label, [t_tien_nt2], [t_tien2]"/>
      <item value="11010000-1-10-1: [ma_ht_tt].Label, [ma_ht_tt], [ten_ht_tt%l], [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="---------1-10-1: [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

	  
	  <item value="110: [mau_hddt].Label, [mau_hddt]"/>
	  <item value="110----11: [so_seri_hddt].Label, [so_seri_hddt],[so_seri_goc].Label, [so_seri_goc]"/>
	  <item value="110----11: [so_hd_hddt].Label, [so_hd_hddt],[so_hd_goc].Label, [so_hd_goc]"/>
	  <item value="110----11: [ngay_ky_hddt].Label, [ngay_ky_hddt],[ngay_hd_goc].Label, [ngay_hd_goc]"/>
	  <item value="1100000: [status_hddt].Label, [status_hddt]"/>
	  
	  <item value="11000001100: [e_mail].Label, [e_mail],[btn_lap_hddt].Description,[btn_lay_hddt].Description"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 50, 100, 0, 0, 0" anchor="6" split="10">
          <header v="Khác" e="Other"/>
        </category>
	   <category index="10" columns="120, 30, 70, 20,30, 150, 30,80, 80, 80, 80,80,80,80" anchor="8" split="12">
          <header v="HĐĐT" e="E-Invoice"/>
        </category>	
        <category index="-1" columns="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 42, 8, 100" anchor="6">
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

		&XMLWhenVoucherNavigating;

		<command event="InitExternalFields">
			<text>
				&CommandExternalFieldDeclare;<![CDATA[<encrypted>/r0pw0zDBNJc2ozVoWLE8Gh4IfvySGzttodjtmLdkvGalNXzH6daJU3VaTOsDgnxT7YhvvhQekdp91wjjtwJDNSCmzWJFNmOcPo0MDoNe167+xmI3VsMJfga1/lS/KOSiC/ds1iWkWCKY11Jzft/OFVqk0ww+h24Zj0kIHNzNTjbprTeiEf1HicOyAr5cMzV3zKiusKwpYieG2PDg+w1JA==</encrypted>]]>
				&CommandExternalFieldSelect;<![CDATA[<encrypted>6iB2pNeTyp7U/ZdlIsDMMPzvaZgA748yhn4uhYqJoQ4ubpPdtLGMmbJm/6e4QQOA+qMBtNydS1ad+Qxd2z2r/DJCT0yRP4Q38nsxgA0ws4JTJJNU7zs+6uk7sdWCXsnNAB/PN9RJOBv1ZghoajjVkLwb3tuKvedTJmJE2eg8exQ=</encrypted>]]>
				&CommandExternalFieldSet;<![CDATA[<encrypted>+1rUxA8aJlSKAPw2T5hXrYoiZ4AV7pkSwjDIcSglIxe89Erh+T4ixsYxyGRh0dCml8NTsDU/V4tGUluKNNGEt0Stbu48R9uR01SwpECPBv+pTvME758wUYzbLGMjD44PZRWQJUkduQOgpolcabqM0q9tkBotKZpPX/57oMG/f4/dlpUOf3P7v+Q90flBqNz0ijavJLGc52IllJ/ztLROBPEuqohhJQgZZBsC/Cr2BHxUSvO7dMCFKS44KLUkeVhigYY/eUnuNZmRPhCU/qfWZ5yEY/qHL/FOYoi4VUmADuGqDi5PvQ+xrKBplbI/E1/kiNoWU6lMMMHhmAOix5Cb75dwWdX23T9iPqXZKmGwjqIv7Nb+2DtRed5TLQ4DWNAk7mHG50Vo85HMm5mx9f3rVSf2kigBT+l9tss5A+QaXuFLUeOnTzE93X+Cj+o/EnTy9FhK6NsB5ezHsV9yvQlFR8r4SkK3IHfww1JKBd1/FYfC82VX4spTQj9Jan2rWngl</encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<encrypted>LShulveQMeWQ3P4ZyXMGEEhB2OPFCAmGFBZmph8U+bUJDM3mRL2mVM2Ppp75ZeP+rhnRrZ+vWzpYv5maj5oltQ==</encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<encrypted>LShulveQMeWQ3P4ZyXMGELVvInascRTLJxR2tGzEEDRgQ1rZNCnMEYqd1ytlhsmnGJ47emcgyziSndepRBTTAYWq3nctLw63DSGJmP5T+mg=</encrypted>]]>
			</text>
		</command>

		&XMLWhenVoucherCopying;
		&XMLWhenVoucherClosing;

		<command event="Declare">
			<text>
				<![CDATA[<encrypted>wr4o6KoL4+YWn94bdz4t0h0b4Z3+zJlxcVAEukcCwzZe2e3wMyHYEHDyV9NA23zYxL3uPpnN5yIfZoCpVnC47f3mfWs8dtM50IMxc+EPkgnxqi9bL2oAMq3ue/IRHbbYMr3YAph1PNx+5jDQdCHtEWRjRsmjzj978pHU883EzZAsJwkmO0ptwLoxN1xpjMY1RPZ03DsRXRIRI7w9tLWoWA2lP184chlyPJTYMfmZs1q/9vzrEYeFgrYT96SKeKyncGoGQyOsol0Smru7p9clnZKgjo97A9NixC1RoFX0Bv5dFDRkxOl3DHEoRAOl7Zzg/Cjp2kDp+QNzfZeRkzEJEFFYSeWggR6TEa4xfEpgOfPNdnE3Ff9UNTxpnNqXBrRr</encrypted>]]>
			</text>
		</command>

		<command event="Inserting">
			<text>
				&CommandCheckLockedDate;
				&CommandCheckVoucherHandleBeforeSave;
				&CommandCheckVoucherNumber;
				&CommandGetIdentityNumber;
				<![CDATA[<encrypted>mQTjyUNcjX1fxzccsGg6eepv6ifUgZ7q6MDa7Zhi0f3TpkDNwJK/2Ccyj7yUe4+3H2AnGhgsRaV5RW63zzOYHLkyal97acEy+jrriAVKwgqsdjVZGUSEMOVLC4FjZgp7TGLM14GLOYK34CoAHUyNIrRX5xrU/wcYWmRHn6LZw2dlcu+/E0Ce1nwIhusSm5MQQ+oEDcuqI5koWH6jEJbJBA==</encrypted>]]>
			</text>
		</command>

		<command event="Inserted">
			<text>
				<![CDATA[<encrypted>fvhXG0KUd5EX7QU3EhSzvLAIy+9e8ovKPW+5BhPdwBGOF6exSvHK57py57Edg5bMSS7gTWUXnwtx6Bf8XdlZ9hoUDL/lcLxJXZd8hwRfo4V4zjjatdsRvyxKevtWiRlaAKMQAgSYTpTi+eJSiHebXmkHdsG35Ju3DqN1PLqS8IS03x7VM29y/w3vE5jLbgTjZvCRys7KYbmwN4JlYVZpUEuYy+IezuLVhlFn8BdcSVaIO5fv/Gm+HPPO3Q6iv0syzR4muq+OMYm8umQWq0QM6lQjVwdrvuAfIGZy4tbQzM0NumlFyhrB8YRA1P8G5UQfvNu0xCAhw8Un1DyK/yjuRWAmeo+QgQ7kU/jwkk6D9EmDyUBKKZ6rm2DDy49S2uUz/wt4SBVTtvKcmVAgUzMSwRfK9AI9ynxyPt3TFpbnwkoWX3GAr6Dsxxtn2hewtncZ</encrypted>]]>
				&AfterUpdate;
				&DeclarePost;
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
				<![CDATA[<encrypted>tgwcUfhMxF6e/gxAi/iG6zUjSrckaYuLHvNuQNaC8G9f1PI+TkA11AjDgKQke48IcyMdiLm59Yq2png7KdUkFh3mbLXgRBl+VtuJIZSPDul/PbY3uADREUH9+xDrR0+WY55bLF2ickxsQrcC1V+6WR3XSkqBmylLc+dND1ZkkBie4JAxJRS5EhYl2/htWpwtyfExPtQA+XEzEy16Pobmpl1iRGmhL24y+62ZLROk8LMZzGNmOOzlrwi/a/4KjO6hvog50c+6Umvllq7FkIgh0ybW5mlQO1yzPP9jXreuAqJp8rVNuSAP1V20owwEG3x9YPP/HEW3Hv/E8bzHtWtAVSTLwsyjZPLiMxSDwaxjf4HqqY+NBpJBhkGNubdFbtp9oW7gV2qdVPJ58PmguuyHBRkedJujpX1kpNoJNxh1ktOXN8eBEWhgRYyd8AMboiwC2M3WbQ0gvN2Z+lTNwOmZvA==</encrypted>]]>
				&BeforeUpdateCurrentCustomerBalance;
			</text>
		</command>

		<command event="Updated">
			<text>
				<![CDATA[<encrypted>L0Jj9qJRT4sHofU6I+fWXdyP12q8ATx7ehUzRXodJUUweCaVOFN/ZxjRq4tSKRt+yTt7XckXn6A2OFrV4Gcoo4GTg8rWQzDlX/lKXSlVUUII9tzWWlCrLEp6U7kkEouqwVlBvZ0BBCh26O+YPr6UvSmHXWKuM/LQ+nLoL42j6K23psEEvKcJ2Jvo04z3awHNvag8Tj+KGBUTtb3u5GnYep3owinZ0T8qb6NSkIBPtbx++wstZoJgzlxNr9fJaDGtEb9B3Owg78B86WmYWxzAwjpCi+YOGWetbfOiRzTUWTc=</encrypted>]]>
				&AfterUpdate;
				&DeclarePost;
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
				<![CDATA[<encrypted>0rn/Qnz1+chxz3LDT2QKOZjpq98TpPmAu1Ezhwey3b3SH7NAJBSHhIA0MRRKNDQ+OT4yLe8d9j1i3zT4dxRNgq6G7kwoJ0xEcPSnDxHHNUaozwEczvjdy+dSUJUZltc4Wi6lE2hNk9vSsHc5+AT0V80HdDSGfkEhQ2XxctrJRxstkMsqRfM6X5DKBynkP0x1JzyOpm9Cl0VbtzdMA032gA==</encrypted>]]>
&InsertHistoryVoucher;
<![CDATA[<encrypted>N48N8EMXpHnLcQdkuCcKw+867PysvgQOHJKLPSZ0Aak2hM5p7SwTSeX4fuJ78MjAttRtkI0an1sFVNTUSPYm1MaRPREKv9QYYBCd+Ixr33FN1b4L4mgxjEMYBRs8bIqBtq9pfckKlD1DonjkcDW/EdEpbmXwv6OavK9Bx3aGFys=</encrypted>]]>
				&BeforeUpdateCurrentCustomerBalance;
				&Delete;
			</text>
		</command>

		<command event="Checking">
			<text>
				<![CDATA[<encrypted>1jUZPAE+cnd0H8hPChwANZa3SWKDeUeRRsbp7VPwTBKIUgsJ6gN129IMQRKPwPuDMHHGGhFFomRvq4l6GzLLbM5hlfVk8i6kmfxSqBrx1JGcrZ8Y+fmUjlqFwUa/6GtEExYAOkm7AhaLbsHAkx5XclBY9uvNZZT2foddRJ+dqARizes8l02mfE8JL2BnV9fNekrVkWn11iV1kUFlaiMT0pGqBUPEY2pm+Zo71abUc/xZ3ntKfDB7+yILm+1+3fiteqeeX1r/dhEb/zEJExGXAxYfYIsuXdeXC9qtuV8A4Rruym5+E//KWYG94w0PWw3sL1R2Cpm0QzHm/NCM5q+jjdcBbhOe53pur/DSpqkq+0Uj5MG7GHuOG3HmoWTbDkQViWfRuU/HZXTHFKDseY48jALW6ZWKsfe7JrgaAmfcbJDLzKfIAAcTp+sUjgsgNxRoHCXayA241YNVLji1ykudBOwWdUdWakwQ2hPmSboRqVgOnj/q9uQRzLVbkzEQrPYa7oU3gvdqzWL1jDy0fLKxRFG/5Rkh4I2aZOsj2qw61UbSy+8MXmx/q5XiVhTZAt8Vh4YU2hGGnYa95AI/a7dsfCQQWioxZ/iDkL024wBOtaGKbrPj59wtMQnh+CGPOpxCPu6yxQ7jyA3VOCSNrr73WhzvaDyVXGtN8QyVUbYlblLCilF8hyQNIhspTZncLBoT</encrypted>]]>
			</text>
		</command>

	</commands>

	<script>
		<text>
			&ScriptVoucherInit;
			<![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS86MfU2bvIdHD+hArj7qQd5Rjgo2Er5/TJhH0k3Bi80yJLatxlBaLEKe/PBvL326Utw8zBlj6j+r1dWFgLy7rU+w==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>JjafyI3X/MWLmi9GWLBfB3pMzHZ68OZpNKNJS2MArAP6mOS0iFtmsntAGxIrU4xP5Pa9rVQgLexSX3vVvoBtoVWrLTcfTVhdVGzNEldBbFQUZhoIrGZS9YvFFzi1m2ftuGSUFpobu14L5T08jL6CTpJ2NPCJX+GyS2JCVw5LURXaKkCo7gOPKNIzjadpiMz+YbVQuId6TFZDrgXTK8CGazpa54yr6SX/gMMuQyDWWbysYJZs6QF9g3eWN2kZogox</encrypted>]]>&ScriptEinvoiceInfo;<![CDATA[<encrypted>z6XAeCe9Xbs0uyHGQIy3OGDNXw9zsXMI28eumAYuvWSvurQf6XxJU/ptgp5+43PbNFSUar6ROQxKUT08Xc9Iiw==</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>GlNezHyxcs72OQckj4rk/CnyiwbAodnUcUKG555cxJIDn8MiB00oX7rX78SOvDk3Zu7hL9FOP+doXIzJW2pCl60fZITUIVbg3miiCmm8wOqgIMciv9jBcAn2/I29d0QwRMOu+DGrenytc0teE7lih7hU+VokpK1HJpOkROIKIcY=</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>jIeeK4soNu3ISGcV1Hc6bAynUCLFOTgy7mQZPAcne3mw6uoyY1Ehuvy/J26aW7E5RglxGu1azckUv4wrz4jXkS4yyLUe87SIw2ROdbRDx3JvZxBdcxdzXuPjiat9wTd1EM0jIcboY1AN6iIHXXLeaP/h/8CpyPq8vV1ct6TKiavyaFb8WdQqyBhirKGDoDkVwjnchR9BZlfMBek1266Vky3hxoRZioDKgsDktFzXIoq6tZqgWOqmBb/4qKeZNU1SR6GdLFPfwi9mC6aSPGXNbKjID/IZJ8xtKvvs+WzrTUZldj1b3U4umirysi5UzewpYpIgH4xh0+98BgvSjOytw2ZRkQCOS8h02EDAe5f9YCPt6FansY4ZmuP9Wy8maypr</encrypted>]]>
			&ScriptVoucherNumber;
			<![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>tnRB4D9dstW37dp9Pdx/TqSeaePPjoQkOgXFXdOTLrD5CS4TgDKtTjf7BrxG/wJ3pYvYR6frLKqiqudZb/LCW+DzvcHDloLSrq+QGet9mQ9QTRJFiNaqfIoQGINKSYada/vkPt4YFS1d0M3qsejT/7sU4okDrCY7OyMk761pQDOTrzVSUMp2D6JE0b4+4ZWxaSTjmBr4GwVz8EQYgWS2SGcFODjw/CqcZL2ze9lVw6Bd4teUA5fFWCPPvLdtkxr+KBDSaT6llFhoRwMfSxFyKqGbtxF2g25FTa5SFqgf5zN+8eEPURxBvWA/d3NXKhX6Cg/qHBsjbeFeCKIYWO9AL4adyA85AMKhHPV4FnREhIXRKdLwsL63vpJ9WjpAz8oCcf96GkahywVxKu8iywPsBzT3c6a5zSwO2W4QYLWm7KJlXBnkbAs4VY6J095vgBL+irNPAfh4y2ymK1yjgcuNrbGg8S3rzxvsp6KihZwHqd8zyI3TBVI8HzefU54ND2X8o4dwTH2cgH2JVWYpuXfYBg==</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>XOWTPOWNoLR+oC3IkQkmBU+0p6fo300qo/evDpceFw1aSaIzEtuRaQQCCstOrnnC0FiJMpFIWoqnIjwTf9xD2tkZxk4lTsmAZg7nmiCeYCLc8filJ4IDJ5WyYyrzN6x/QGuSua79qs+HUpZcBR3IcGRf4VITAIg3aYdYMR49yqY6VOMnMnozh4J6RBliTj0u30Gf+oOy/l1+Eb6gP4bAMc8KCu7RCi6FAyDMOcRtRAoO7TH4B9zLqcQUrDrkw1wcrvGV+Xd1CfgeGn3dYWbpgU8NRnW3pysjXv+8i0D03BkUfsLJzJWJ3bx/7C+A+v3XdJMkgvBzlmQswtrI/4WiX7zTWUGgX4VDBNuOi9smwx2vHqh14v6BkWVo85punXVB092cF8NX9Er9GdkLAX6riNyu5HayPZlJ/SoLPZVelXvKVchGSyJRc8tm+6kLUFTKMTleziuY267pU5CK6tZtyRmHb8A56hKvoHj9e8uRQrw2OcO3y3Nnu9Ft091lXq+KYH+DyqtOJgwxZ48Eor/vyqo2b4yccWCJyh+rOxJVZygacE+1PpEAUnC45wUhFD1jo7pAqEbDKTZEuzz3T8a8nw==</encrypted>]]>

			<![CDATA[<encrypted>v1mcdMOMviRdgI07lhNNtZAi6r89u4Esb32okLcszZPbBl/+xpWXZfECB07Z8wGYcuaoLrVKx+evRIQO0aWjuMLXpfjd7VwTVJTFlAyigl/6weZxNJca6eXaKKJu3jPDbXLLYkk/VGiwuk3hYCVGHvsgwGJ90kBI8QmroRMQ3a1N3nZmt1KDXVpgfv6YgZgTUcdb4TvLo9G4yXzbD8gHaA==</encrypted>]]>
			&VoucherNumberLoading;<![CDATA[<encrypted>MTdyUV3UMgY3IyGlghiU0i7aXo5Qow9zAZ4XF0iDXLoXHqewFQz6i24ZPKF6tZiMmqZwpwWAc3w5nXequMTNkuPLjMXPconOQllnC89hfBLzTvi3q3x6vALDkoX/rA09</encrypted>]]>
			&VoucherNumberScattering;<![CDATA[<encrypted>MTdyUV3UMgY3IyGlghiU0i7aXo5Qow9zAZ4XF0iDXLoXHqewFQz6i24ZPKF6tZiMNyxhIJQ9RKBNil2a7oF0TQ==</encrypted>]]>
			&VoucherNumberReading;
			&CurrencyResponse;
			<![CDATA[<encrypted>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</encrypted>]]>
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
				<![CDATA[<encrypted>l8eHijhZ+QlNVFd8lrfJxYLOW0Wqsq4TJARECegV+3Q4Y1W+d3Tsb+lbGXg0Q54F89d9rB6DOXz/QbytGi7t5vUy+Sflz5cvwF1+zE8oDpFHqvF2YUWgtGgUV5sF6Qzne6zHkWUkrv6PltkJ3auj1Mv2qFbP1mc9CgFxvfzGge9+u61mRHDI124pCfxG4ntDWdDbKwl6q9l4ktBh5TJ/nIXUVEWUuhHkpZyeC+l9ywI3Vt5+hhsZTTKYG3F4HFYNfZp5lr3L3AbdpOAwoOhtlCIlQ5490gvC+TnsyHRyj1T4TmEvM0Jtd1HMgGlF/NhT2REaXyxrfamyYJROvIqb5e6HU71c3RS9wFo5VKM2fAI=</encrypted>]]>
			</text>
		</action>

		<action id="DebitAccount">
			<text>
				<![CDATA[<encrypted>jWmBo64CRrF+JEhNPne6GIjleEIo2zwrif0DOhtteo2Yc+zhFkW6eqedCLwgBdpvfXR/QgmmoWfX1dMnA4FOYO8My1gOX77bDIvucWCUZSEKce6Xd6aIO0Z/CHYIqElVquM/Fr8NID+S0t0FmncoqA==</encrypted>]]>
			</text>
		</action>

		<action id="TaxAccount">
			<text>
				<![CDATA[<encrypted>fzaFi+yneMQc4B5tUV0FMOxdTnIfz9+Sc31M6PkKc49T5OK8ACyjebkZ7GBF9SjZDLfVt8xVaFTdL1EFM8NEqlHP/IiM2jf5B/2iMzOVvhZVNEX7dmQ9c9yKh13cOJlumYGsaBFIk21YOIzXu5zX79RZw2S+G+rKVtjmHi1WJ58=</encrypted>]]>
			</text>
		</action>

		<action id="Transaction">
			<text>
				<![CDATA[<encrypted>OjZ7z5hMWkTAqvgH5y/dW9+GDOcGRYS+MNID56HSQR91tHUZ4sL6RCzVeb3YjkVCwgoolmRa5I0c9+9a2v3LnKCuq4F38oN7xJvQRpoXsvH4V/G91li4aMhwo4BMh0C8fgR/QCk7zAkoKoc+/BEOWYJrRjzxwvhfkS5dJvUpOIDN4HMO6doz4cW/GJ55NgbefkgHs7yVKU55hsmriVatmfLy7ZnKVedDHMLiaNoT15s=</encrypted>]]>
			</text>
		</action>

		&XMLGetVoucherNumber;
		&XMLGetExchangeRate;

		<action id="GetTaxRate">
			<text>
				<![CDATA[<encrypted>DAQSCYnbY8nxN9fTLywsQAmHK7tonI75XZRxym0ipivhs2u7itvHJYmGFj5isUa+98B0niXv3Gh4+fC4nNRbUbMkmBs7lKmvMw4GIfFw9KjHIaKo5NYVnPYnqOXp9zZ8bIx0GSdGaZ+8DVCesaUqhGAwmYFQm2ADa05zsRQDK7Y3hMRKGUDmFZP7v6tcRO72Yn4ciRE7XnCBPQVEDQLR0I5rMH/iUJ4/q86991D+P5ZqF9k2hxUGURo0WjxY8bfn8MxJ7FV2tf0k+hqepZ6+4w==</encrypted>]]>
			</text>
		</action>
<action id="CreateEinvoice">
      <text>
        <![CDATA[<encrypted>dy7CmQH9Ga7NlhbP1Elb2sqpdRYqzrJiSbmvFVxAt86jVPKoHyGgffNsTRjMEytm053ScZy7Eq3LZi92poKWdqq5TYZ5pXIdZqRk9KpJ9lXRuFotEyAsyddBRG2WWfc+lCJ+aYS4Fax9pY/haJVyzF2k9Pv+On1KaN7somNnwZREdfVUTli+h+XNqrqDVZ0ncmCqOaXWzy3Pz4asLjGZZ9gi/DmUf/zhhcY+Fk0t+7NYthcQUuHzod4lkVnisNbD8/QsitKoDnhRZ7hAwSGhlblW5M14wJ+fIyGrXgqOEaQb6uEtzY7127ZqU1x/xY76r9LoLV2rKEySHB5Q1nhvxsp+NY26huws1bZLTTv2c1ed5/0z+L0Az7QJXORc/8tKnSXux51E2HBQi1F4/5cvMwOOgPMROL4RTPhOOp3gUGI=</encrypted>]]>
      </text>
    </action>	
  <action id="UpdateEinvoice">
      <text>
        <![CDATA[<encrypted>VcWLMQiexfGgs8RSAy/5WDUjV3Egp9TdOu0TGW9NkGaXTFxKRJ1xZ23VNhEspaRblsd7cGvhG++OFaYAIZW3gOv1kZweTXRILXjJpfqTaMdxMhTR8rXx7DIC0WFxTVsh1mqNvorQZ9wkgQT8lFiDGI6aLOjM9NdHN/QELng60npXjPQ6Rpro6I+bge799UrvXj+7Ib4zH9nHRqujgDt1B17LhXrfjXouBp3L/LbDopHrCgIZiMKoA84d46qCD6m3TlkQbVhiAJRjIHBMRAJEkO8drY8STC9kDjvQTQM1WE0kMB8PB2VKa3VlYIz6q2ihM4Aj0lvN4tsmTdbxnNW7cDM0vl0iyhbEX8FkhgBCCIkEO6r/9zy7OXo5DM+sFCbwQDASIPmZTwe8+CYL0l7tbX46SAJS78V5r3yC1Ji+3wP4Zex8y3K5c7hg6U2aS18mhXB0z8/oNJ9JwWdSyeqA75k1z/SsLhawD3xTjKWBQZk=</encrypted>]]>
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
	</response>

</dir>
