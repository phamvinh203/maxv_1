<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY XMLGetTaxRate SYSTEM "..\Include\XML\GetDebitTaxRate.xml">
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
  <!ENTITY CommandGetTaxRate SYSTEM "..\Include\Command\GetDebitTaxRate.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
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
  <!ENTITY ReviseCurrentStock SYSTEM "..\Include\Command\ReviseCurrentStock.txt">
  <!ENTITY DeleteCurrentStock SYSTEM "..\Include\Command\DeleteCurrentStock.txt">
  <!ENTITY BeforeUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\BeforeUpdateCurrentCustomerBalance.txt">
  <!ENTITY AfterUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\AfterUpdateCurrentCustomerBalance.txt">
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">
  <!ENTITY CommandGetEinvoiceInfo SYSTEM "..\Include\Command\GetEinvoiceInfo.txt">
  <!ENTITY CommandCheckEinvoiceBeforeUpdate SYSTEM "..\Include\Command\WhenEinvoiceBeforeEdit.txt">
  <!ENTITY CommandCheckEinvoiceBeforeDelete SYSTEM "..\Include\Command\WhenEinvoiceBeforeDelete.txt">
  <!ENTITY ScriptEinvoiceInfo SYSTEM "..\Include\Javascript\EinvoiceInfo.txt"> 
  
  <!ENTITY CheckGeneralInputVATCondition " and @invat_yn = 1">
  <!ENTITY CommandCheckGeneralInputVATInvoiceBeginTag SYSTEM "..\Include\Command\CheckGeneralInputVATInvoiceBeginTag.txt">
  <!ENTITY CommandCheckGeneralInputVATInvoiceSelect "select @verify$InputVAT$Field = 'so_ct', @verify$InputVAT$Invoice = @so_ct, @verify$InputVAT$Date = @ngay_lct, @verify$InputVAT$Code = @$ma_so_thue, @verify$InputVAT$Serial = @so_seri">
  <!ENTITY CommandCheckGeneralInputVATInvoiceEndTag SYSTEM "..\Include\Command\CheckGeneralInputVATInvoiceEndTag.txt">

  <!ENTITY CommandCheckGeneralInputVATInvoice "
    &CommandCheckGeneralInputVATInvoiceBeginTag;
    &CommandCheckGeneralInputVATInvoiceSelect;
    &CommandCheckGeneralInputVATInvoiceEndTag;">

  <!ENTITY DetailVariable "@d76">
  <!ENTITY DetailTable "d76$$partition$current">
  <!ENTITY StockType "1">
  <!ENTITY DeclareStock "declare @stock int
select @stock = 0">
  <!ENTITY DeclarePost "declare @post bit, @vat int
select @post = case when @status = 0 then 0 else 1 end 
select @vat = case when @invat_yn = 0 then 1 else 2 end">

  <!ENTITY f ", rtrim(ten_kh) as ten_khthue, rtrim(dia_chi) as dia_chithue, rtrim(ma_so_thue) as ma_so_thue, rtrim(@invoiceNumber) as so_ct_hd, rtrim(@invoiceSerial) as so_seri_hd, @invoiceDate as ngay_ct_hd">
  <!ENTITY BeforeVoucherUpdate "if exists(select 1 from @@prime$partition$previous where stt_rec = @stt_rec and stt_rec = @stt_rec and status &lt;&gt; '0') exec MaxvOnline$Voucher$BeforeUpdate$SR @@prime$partition$previous, d76$$partition$previous, @stt_rec, @@action, @@userID">
  <!ENTITY AfterVoucherUpdate "if exists(select 1 from @@prime$partition$current where stt_rec = @stt_rec and status &lt;&gt; '0') exec MaxvOnline$Voucher$AfterUpdate$SR @@prime$partition$current, d76$$partition$current, @stt_rec, @@action, @@userID">

  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd76$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec
exec MaxvOnline$App$Voucher$UpdateGeneral @@id, 'm76$$partition$current', 'd76$$partition$current', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec

declare @allocateKey varchar(128), @roundInvoice varchar(32)
select @allocateKey = 'stt_rec = ''' + @stt_rec + ''' and km_yn = 0', @roundInvoice = 'm_round_tien_nt'
if exists(select 1 from options where name = 'm_ma_nt0' and val = @ma_nt) select @roundInvoice = 'm_round_tien'

exec MaxvOnline$App$Allocate$Number 'd76$$partition$current', @t_tien_km_nt, 'cp_bh_nt', @roundInvoice, 'tien_nt2', @allocateKey, 'stt_rec0'
exec MaxvOnline$App$Allocate$Number 'd76$$partition$current', @t_tien_km, 'cp_bh', 'm_round_tien', 'tien2', @allocateKey, 'stt_rec0'">

  <!ENTITY Stock "
exec MaxvOnline$Voucher$Posting$Inventory 'm76$$partition$current', 'd76$$partition$current', 'r70$$partition$current', @stt_rec, @@id, 
  'px_gia_dd, ct_dc, gia_nt01, gia01, gia_nt0, gia0, tien_nt0, tien0, cp_thue_yn', 
  'ma_khon, ma_vi_trin, so_dh2, so_dh3, ma_nv, stt_rec_pn, stt_rec0pn, stt_rec_dc, so_seri0', 
  'tk_du = c.tk, ma_nx = c.tk, stt_rec_px = b.stt_rec_hd, stt_rec0px = b.stt_rec0hd, gia_nt1 = b.gia_nt, gia_nt21 = b.gia_nt2, gia1 = b.gia, gia21 = b.gia2, tien_xuat = 0, tien_nt_x = 0, tien_nhap = b.tien, tien_nt_n = b.tien_nt', 
  'update #in set ma_nx = b.ma_nx from #in a join dmnx b on a.ma_nx = b.tk where b.ma_nx is not null',
  @stock, &StockType;">

  <!ENTITY Post "
declare @group varchar(128), @glMaster nvarchar(256), @glDetail nvarchar(256)
select @group = groupby from @@sysDatabaseName..voucherinfo where ma_ct = @@id
select @glMaster = rtrim(val) from options where name = 'm_gl_master'
select @glDetail = rtrim(val) from options where name = 'm_gl_detail'

if @status = '1' begin
  &Stock;
end

if @status = '2' or @status = '3' begin
  &Stock;
  if @status = '2' begin
	  insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tt_nt, t_tt, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
	  exec dbo.fs_PostSRTran '@@prime$partition$current', 'd76$$partition$current', @glMaster, @glDetail, @stt_rec , @group, 1, @vat
	end else begin
    exec dbo.fs_PostSRTran '@@prime$partition$current', 'd76$$partition$current', @glMaster, @glDetail, @stt_rec , @group, 2, @vat
	  exec fs20_AfterUpdateGL @stt_rec, '@@prime$partition$current', 'd76$$partition$current', @@id, @@userID
  	insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec 
  end
	if @vat = 1 insert into r20$$partition$current select * from ctgt20 where stt_rec = @stt_rec
    else insert into r30$$partition$current select * from ctgt30 where stt_rec = @stt_rec
  exec MaxvOnline$Posting$Allocation @@id, '', 'm76$$partition$current', 'd76$$partition$current', 't_tt_nt', 't_tt', 'tt_nt', 'tt', 'cttt50', @stt_rec, ''
end">

  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete ct70 where stt_rec = @stt_rec
delete ctgt20 where stt_rec = @stt_rec
delete ctgt30 where stt_rec = @stt_rec
delete cttt50 where stt_rec = @stt_rec
delete p00$000000 where stt_rec = @stt_rec

if '$partition$current' &lt;&gt; '$partition$previous' begin
	delete r00$$partition$previous where stt_rec = @stt_rec
	delete r70$$partition$previous where stt_rec = @stt_rec
	delete r20$$partition$previous where stt_rec = @stt_rec
  delete r30$$partition$previous where stt_rec = @stt_rec
end else begin
	delete r00$$partition$current where stt_rec = @stt_rec
	delete r70$$partition$current where stt_rec = @stt_rec
	delete r20$$partition$current where stt_rec = @stt_rec
  delete r30$$partition$current where stt_rec = @stt_rec
end">
]>

<dir table="m76$000000" code="stt_rec" order="ngay_ct, so_ct" id="HB3" type="Voucher" uniKey="true" navigation="true" name="cookie" check="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="phiếu nhập hàng bán bị trả lại" e="Sales Return"></title>
  <partition table="c76$000000" prime="m76$" inquiry="i76$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
      <header v="Người giao hàng" e="Delivered by"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XAGERfv6WGGKi3cVG98eiH2XPA6Y37WxSS4XLq3drcYfRgNFpos0rQwGk9+s5Q6WM4=</encrypted>]]></clientScript>
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

    <field name="ma_nk" clientDefault="Default" inactivate="true">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_nk%l" key="status = '1' and ma_nk in (select ma_nk from v20dmctnk where ma_ct = @@id and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') > 0))" check="1=1" information="ma_nk$v20dmnk.ten_nk%l"/>
      <handle reference="so_ct"/>
    </field>
    <field name="ten_nk%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số hóa đơn" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>

    <field name="so_seri" dataFormatString="@upperCaseFormat" align="right">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày hạch toán" e="Posting Date"></header>
    </field>

    <field name="ma_mau_ct" clientDefault="Default" inactivate="true">
      <header v="Mẫu hóa đơn" e="Invoice Form"></header>
      <items style="AutoComplete" controller="VoucherTemplate" reference="ten_mau_ct%l" key="status = '1'" check="1=1" information="ma_mau_ct$dmmauct.ten_mau_ct%l"/>
    </field>
    <field name="ten_mau_ct%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" hidden="true" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1" allowNulls="false">
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
          <text v="1. Nhập kho" e="1. Receipt"/>
        </item>
        <item value="2">
          <text v="2. Chuyển KTTH" e="2. Release Later"/>
        </item>
        <item value="3">
          <text v="3. Chuyển sổ cái" e="3. Release"/>
        </item>
      </items>
    </field>

    <field name="d76" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="148" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="SRDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>


    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBcp/bKP2DZnJhAsiU6WGcBuWg4d7uM2rB8a1HLAvIN88igSk6co7YaUvb7YN2PPNA=</encrypted>]]></clientScript>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1">
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
    <field name="invat_yn" type="Boolean" defaultValue="cast(0 as bit)" categoryIndex="9">
      <header v="" e=""></header>
      <footer v="Chuyển vào bảng kê thuế đầu vào" e="Post to Input VAT"></footer>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA1xjPdslTPu+4XAdjRgH5aU4kdrLdhcr7supVdOZUqTFLn0qmSt4UVjJqmdC4bWpVcg==</encrypted>]]></clientScript>
    </field>
    <field name="mau_bc" defaultValue="3" categoryIndex="9">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="AutoComplete" controller="VATForm" reference="ten_bc%l" key="status = '1'" check="1=1" information="mau_bc$dmmaubc3.ten_bc%l"/>
    </field>
    <field name="ten_bc%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_tc" clientDefault="Default" categoryIndex="9">
      <header v="Mã tính chất" e="Tax Type"></header>
      <items style="AutoComplete" controller="TaxType" reference="ten_tc%l" key="status = '1'" check="1=1" information="ma_tc$v20dmtcthue.ten_tc%l"/>
    </field>
    <field name="ten_tc%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="9" disabled="true">
      <header v="Tổng tiền vốn" e="Total COGS Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tc_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="9" disabled="true">
      <header v="Tổng tiền hàng" e="Total Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tc_tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="9" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_km_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="9" disabled="true">
      <header v="Tổng khuyến mãi" e="Promotion Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_km" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="9" disabled="true">
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
	<field name="ngay_ky_hddt" type="DateTime" dataFormatString="@datetimeFormat" external="true" disabled="true" categoryIndex="10" defaultValue="''">
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
    <view id="Dir" height="198" anchor="10" split="10">
      <item value="25, 75, 110, 29, 71, 29, 100, 8, 100, 0, 10, 58, 45, 15, 110, 0, 0"/>
      <item value="1011000000-100111: [ma_gd].Label, [ma_gd], [ten_gd%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
	  <item value="1011000000-1001--: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_seri].Label, [so_seri]"/>
	  <item value="1010000000-1001--: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct]"/>
	  <item value="1010000000-1001--: [dien_giai].Label, [dien_giai], [ngay_ct].Label, [ngay_ct]"/>
	  <item value="1011000000-1101--: [tk].Label, [tk], [ten_tk%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
	  <item value="-----------110011: [status].Label, [status],[cookie],[ma_dvcs]"/>
	  

      <item value="1: [d76]"/>

      <item value="1011001-1-10-1--: [ma_ht_tt].Label, [ma_ht_tt], [ten_ht_tt%l],[t_so_luong].Label, [t_so_luong], [t_tien_nt2], [t_tien2]"/>
	  
      <item value="--------1-10-1: [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="--------1-10-1: [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>
     
      <item value="110000000-1-10--1: [ten_khthue].Label, [ten_khthue], [mau_bc].Label, [mau_bc], [ten_bc%l]"/>
      <item value="110000000-1-10--1: [dia_chithue].Label, [dia_chithue], [ma_tc].Label, [ma_tc], [ten_tc%l]"/>
      <item value="110000000-1-10-1-: [ma_so_thue].Label, [ma_so_thue], [t_tien_nt].Label, [t_tien_nt], [t_tien]"/>
      <item value="110000000-1-10-1-: [ten_vtthue].Label, [ten_vtthue], [t_tc_tien_nt2].Label, [t_tc_tien_nt2], [t_tc_tien2]"/>
      <item value="110000000-1-10-1-: [ghi_chuthue].Label, [ghi_chuthue], [t_tien_km_nt].Label, [t_tien_km_nt], [t_tien_km]"/>
      <item value="-1100000000000000: [invat_yn], [invat_yn].Description"/>

	  <item value="110: [mau_hddt].Label, [mau_hddt]"/>
	  <item value="110----11: [so_seri_hddt].Label, [so_seri_hddt], [so_seri_hd].Label, [so_seri_hd]"/>
	  <item value="110----11: [so_hd_hddt].Label, [so_hd_hddt], [so_ct_hd].Label, [so_ct_hd]"/>
	  <item value="110----11: [ngay_ky_hddt].Label, [ngay_ky_hddt], [ngay_ct_hd].Label, [ngay_ct_hd]"/>
	  <item value="1100000----1: [status_hddt].Label, [status_hddt],[stt_rec_hd]"/>
	   <item value="11000001100: [e_mail].Label, [e_mail],[btn_lap_hddt].Description,[btn_lay_hddt].Description"/>
	  
      <categories>
        <category index="1" columns="796" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        <category index="9" columns="100, 25, 75, 35, 65, 0, 0, 37, 92, 8, 108, 0, 58, 42, 8, 100, 0" anchor="6" split="10">
          <header v="Khác" e="Other"/>
        </category>
	   <category index="10" columns="120, 30, 70, 20,30, 150, 30,80, 100, 80, 80,80,80,80" anchor="8" split="12">
          <header v="HĐĐT" e="E-Invoice"/>
        </category>
        <category index="-1" columns="25, 75, 100, 29, 71, 29, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0" anchor="6">
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
        <![CDATA[<encrypted>whQ/M93jSwe8hzlsmhntmaxtcf5eCyTw1i9q5uOlOZiEMubI1asf4B38JuhMOnHucZedTPZaHnGA1clsDsyEobrDKEV6HU0iMp1xNjNxWcZGmIcjJygEYt/xJs3vLP0kUB5ByasnLCesC3dSYenrSNmieu5aEijShuLAWcBHsEGewQARFuGqFBUj2BQCLilcxPYGrhFb84Cos0rFSrXUlfdvQGGvt/NNKYfBtJMnASG/29EgatfZHhGTc0XzIl5HEOgAqxA1ZWNSFpKSRRYIzBG04Igbi7Fu5cGgtDowmvm3/Z0FCbwOtCo9XHjeaLYdezhzQEkfqVIMRD0vJJ8T/JDCbsCu7wRySxomSx4kXAQ=</encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<encrypted>jsguT1F3i8nGtqLMkxZj7ZjsMf3K5//Yl1RLjzQxedefFs+x7iV+t964cA4c9QJcTVgFHW564yHJnAqDAaMq1Df1BEBSVD5/uz1DFSeyPkhD/enfQIgiI6CQNRdCzmavW1pAKH4Twn2SF1xkha/Eyad1sfr4BB6z3vOkDBt+QmJLMFC/ptVk2qR2uN6tMthL</encrypted>]]>
        &CommandGetTaxRate;
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
        &CommandExternalFieldDeclare;<![CDATA[<encrypted>5HR1CrAmiNFhqCwFfpleh/x1aEyu5/d3o5payL+QUisyWoyDLrir05f/MbNwPJ7LKhKjbZGGWp2OyCcR/2UIFLly1nqUq/nCnvvaFZFh9oifq6gC7gyqHuKr20KrKBzyNX/N2YllDG3RdiBpONX/tHj4+erWl9YHOeXJxIiKgf29pLgaMBzLPVSWCZAaq8UIwUXiBBTih35K1OBpFSy0TlhplwZ+lZeqe6PE4vozu9o=</encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<encrypted>X1QnpQJhaQe6Wtfw5yF8/qjSUbPKirjFhROcWLoXSu9y1kn0kqqrnX4M+YuLVaEK0vPhPDc/C/z0v68Bxifif3EbYF/pu1Rw+JLkeiHhzphM62sNPDOcMRPvYYE8jpypEzJ4K0eKA9oOSb6InPjnpw==</encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<encrypted>Ib6BMbER9qDr4pAFYnFBViEiIj8zX0eE84tmSTkLFdBRPOck1/ojSjQkzW4Q1oYI5w/nsc8Cb/u5IOQR0fsALZWXlq8gC45U2AvtdEEN6+aYdlaxFS78aQoDXu8RGQoB6OwfIAW7o+cuz9cxa0pxcONByxG5poCPtwG1ofD6gvklwyRAmW4kcolPNLEosSSkP3wpO/GOfpPtI7jVLbUfMZzmzXXYprwEvnvUIAMei9kWyzuNJcEL+v+monzCf1MNoOM1CC4dzSvXfz+Nww4lFUmZaMSFDe632840HpMyFZjpz4Zk2wGz0agy9e5tfGiYL9+sbDR9uF2YHjTwynWJTfXg3uXw1AUOwGIMe1y4I/ZtCbMsjfVdrmB4wOTWURcwdf8nD5Tmn/E/bWDdKuWpM4XQ+n7xWOHwMkydOO4GjiY=</encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<encrypted>LShulveQMeWQ3P4ZyXMGEEhB2OPFCAmGFBZmph8U+bUJDM3mRL2mVM2Ppp75ZeP+rhnRrZ+vWzpYv5maj5oltQ==</encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<encrypted>LShulveQMeWQ3P4ZyXMGELVvInascRTLJxR2tGzEEDTJYbPFXj8yQmYbLLskyB266Q3j2CIgWFATOVyKydcAHv48j0l0WPqz/Jf4GMZnLvQ=</encrypted>]]>
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
        &CommandCheckGeneralInputVATInvoice;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>j/Dm/6vHzU+noc/DNng5HihwMZyu1U8yvA51tUnuwyc6f8aFMhrauMA1sD15/3soEfndWaHAXNfJQVExVY9pyvsXy4a0/cnJpKU1qX2OmMs74eFAgCGDpLNkSRF0CHgYIC6jR5fGokN8R2NFK4XOpFOZC2IRTwQ0H21PG6zaIfsqAEQieZSZDJLM4qUVEtOsNAKzi1FrjTNWDIBib4HC5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>KIH0pevLP5KG0M7Mzai/GlYeZrREHvkB2T+76zYJ6BMWrG4HfD3iDBnGsbQZPySh3xSnZalsuXjKR5n+hNKkGpY+xHvES9sr/dj6ZQot383oYGqEzFn8PcWW8qTjEgzAzagAx4zI+5BD6WzLSP0SRr6um2OrT/AajHVrjBaATZPtLsrboidToFNQtOCWZEOuS3/+llVmRdQgYXhkiB/e3PeDl+4u6JyHNOubzXkoFxnS/8xOEeAWomy7HhPPAL68Yx8wIQ/cYdJ13ZE26OHH7PSMaBZKRAVPtGEPzbWm7fuyYsFgm8gIfpCuIaRKD6++jJC8tSPkXqdFOCM6o/HxUsE6c7K15b+/tXGZgnfRxBmHXWlLM85SqSRxaHQ/2azQzwWRsIt98ZweK+hYkA4hV+NDo4r/sVGZAQel8TiNESEXipSs9qijdoGekbwTUJxvY3lJgvjJJFvZqloeik2Shw==</encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        &UpdateCurrentStock;
        &Post;
        &AfterVoucherUpdate;
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
        &CommandCheckGeneralInputVATInvoice;
        <![CDATA[<encrypted>4si6A0Gz+FTpca1qB+9LfMQMXEraQqzndMLddKik+lLQ0JpNjErTwNJpMC42K6jmeP4Svp5wPTvWnIYJXIbAu1xxo83kPKnb21mQFlxnEzdBuG7WSlWEOI6pDwyNvqcGaC6zkmMSdLkPjUlIQ79jhWGBGFwU+zF9UhXwA2TGVvvNn+2AlykKJM0UcDgluKDw</encrypted>]]>
        &BeforeVoucherUpdate;
        <![CDATA[<encrypted>AQQ71/YJpJWeGlw8Ml3y+kORVOTSioBYR34TE+br3z1cTWSix5K1gHjYPPRoEfOrXZpvo0eqnk0NAeveDM11F6IQcUKM+MI1Ug0tlzZu3nVdeOg9tvbviV/WGD16WmFpajmfJ1WxbXXQerme1q7OKmhCmeXbdD7ryWrzdUzQtaT0SyAOS8fIs3m7eSy05iQ2pkYs2JDfsZbGL8yikkvgS11I16QW/gdRWnKumqhdyi5vIM+J9q694tLpxY7eCIYBNWDEWZvHHrd/N24szdrhfqQCaj2WR9cbX54LcsyDZZaocP7e5HghfYbM5q9q3Kd8QbVXm4q+aZWI5tOJkW8GXrKMNmPS0v8mOVFmfOj0w7TJnZech7mQ7N9A33pQt0i6gt0NVofBszzB2CsSpIH+fkYSAogouGpEaByZ7aoa7TvFE5wn4Wa4mYFhUCPZwjn+tsWJZtSKFvG+7b6r7nSTpw==</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>rTnDMYMM7CFjHexFXSTurdVle6F/so9pVqsugmSt0z3Sb3/xYJ5xYL3CPMfoRlDZddtMXxXC04hMgNsMbnLEpGRiP/0BmS3Nlv9lU7izRSKN5iZ3TmCy1JFLcfCxufBpwvxFt2ZHVIWFfjD42zUcdiXecqHzNTn72ojwK6UqCH4eLwDGqirXW9/Y1tBk1fd1MOzfO7yp1KGrppOEY/tOlQhz6v+dMPHJuZua1vpQJ1anxZmm5oAfA/0CwFlRuUgxCJjIgaBkOKIPItx3zM8lSHkkqIbZSdQuQ+gb2wo6KnvhIF4IF/cC2IU+pQvSc/UN</encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        <![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN/u7AYVP5HC8dnvmfqnkurRKTIsEqCGQLJsYiKaoksyLsGmAOtFcpAROJMLWfoQsylHCXuAhZjwLbHN3ixLO7U4=</encrypted>]]>&ReviseCurrentStock;<![CDATA[<encrypted>iZzd+T9L5VmV4PzygBLM/Acau1LNqi3ssl4Pq7DFQOFVoWqcAzuPm5ccQ0giXub/</encrypted>]]>&UpdateCurrentStock;<![CDATA[<encrypted>iZzd+T9L5VmV4PzygBLM/LT9SLXOPq8e+PKr0oTg+as=</encrypted>]]>
        &Delete;
        &Post;
        &AfterVoucherUpdate;
        &AfterUpdateCurrentCustomerBalance;
        &CommandShowWarningMessage;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<encrypted>4si6A0Gz+FTpca1qB+9LfEk57jhELXhufLUdgHxxwlXgxz1f3aEgujGvQcT8Gn0gvei17mQunwBNkwp685hqckbbO8M2WpETvNizp4/fKYv2SoXYY17Y8d2bchjMxgUkbvEBScLo4/qz8xVVHqOqQ1FwiLIt6/P/ckvZ6HDQHs8KsbQgZgCKj6UyruQ9mSJ7</encrypted>]]>
        &BeforeVoucherUpdate;
        <![CDATA[<encrypted>xF9h8/72NHBPJLfFYaTmU9T8pCcD0dkUr5jUPmfsQhYEs9slfzkysu1ivZoTbd479tdrc5wgLiNQglfvQiIlARrseN/tEGOquxZZ8W0nhg8MyHXUiHh6bYLVjgRA1f6OlM7LzeoVqAuYgKSyLJD+3XoIs9FglCGIAkuHb8jAlnDoD7C8d1fcwvrDcQJU6Yy7KokYxF/bKr5ZTJ+X3vareMwlMKuYASUsP+efScSmzRs=</encrypted>]]>
        &DeclareStock;
        &DeleteCurrentStock;
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>nTQ6umavnNf0MgNecn50r3CRSfS2LcmSc0Xl6756cyXO3+B4fnBGoJJ+bE88pW0MiISRnSjQNcwAfDi1SWLH3NVjH54j7tx1ZwFzaAjVXNwKYXjvwfX5WUj0ni9tz+YX3x0GyItdnT0BnZzy+2UI1cfZ7JiNoupRogZvLLhXRj32dXE0AzxyLSd6UFKTcD5IZzctaZNhv6sn9G+Z+NXqetyMgzsg+of/I1auIZX5sOBqIfdQdWaKUvnC7VuGxdAPVMTNIlziH8834/a4o/7G4crn1jIWRFtKhRC2MBAnkxIqN6hNNKy2CCekFNq81slMz7jwnYBF68mCAFBzvU7wzxdNybt/wm8jChQ+WcSAcgiZu/1LhuY0y5fxcVxqhnvci1RB9Xeyo+BZFCckzleWgYWpVWzUWhnRNT+6tHx0TnwWRLIthtnUcecZDc8b4ZxAf1UweKl1v972HyO3/s8UyCi0cvjmZEmR7HENmA0v5HI3O28rdv82Y3tlnlcCyDZ7vUiyL75eSwv3P4eQQ5gg3LMIl1eL21MIaUou+21AhXGF/LzAEvmBDHHFIk4gYMN/pMYl1OcujsYLxUpx40CnSlZJKQoCxUDZdYTbivw0XHJ1tr7Cj6+oUQ9WB8mdGUZrSUi6gHkaSSxcaYo5UHmVBArh/JwjaBidlRmCfJS9dlhJPj9CAlxOarbJCXupphX9yL3iwt0gxXUt7coRAYDI7QZyOVf3QmGxbC5SafsphjhVJCNdMypy74tfyXuG+RqqiJrLT26/bRzC4lj0EXSJUVtdwH9m4RryxyGq5BikZSjPcxxqXGzJrnBWY6uclnLEtKdenG+swQ4qWL8XqT8S8UYGPFIZNWFZr3uaEyxn3zBY83Q80Frh2gL/NwOZR+UGP45sAfBbTZLViJqbd0fWrM+bONGas5SXaM0bB40u7U6a4fk1xHqo6d7eP5hpCuHpRkOhEHrHSVe6pECHyz68n6CXu796B9t2vQQg8Iz9Rj/U4YnLmmLteTxw6M1P0IWxVJpM+9ER5oENOm1UVa9/hD+w52vfpP6Kw8odgK/Wfdk=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS86MfU2bvIdHD+hArj7qQd5YEYJ0+70Bh8DJcI81Q4sVOKIvBITQ1smxn0Yb4froHS25eW51dCwPmCs4gXLR6Ocw==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>CD+pcrxochDwj4UkRLogNqB5wWctvkPmWNsDp8vpZMblbDw6+dq3L+NT57R4ZMGWYbnKcibA4MHcOXXyk9KPiud/NyzDmA11SLzpgqYXxLpg+j3x0Txji3LPvcc35qxdufiQsDI5YNso9DawVxZXrLHycVvwokJfYNGYLqjqXUA+Jf+v3zP47/xYLH4PrZVZvJKGkD/cv0T5Cvz6xXlo7dS6CU9nINUD5I1jgi/8nJFRbzrxBVl9S2AI15PQj5J5pAr0fuIDuP0pmyEzIdfNZA/hRkyDGmJx6LV0bxUxD80=</encrypted>]]>&ScriptEinvoiceInfo;<![CDATA[<encrypted>lgM35MsWe2Oy0KQi6TSvc0zkHFw7YTUgyXDP8elc435uxwfyxWK0m5k5Zhh8QmtGEhRXWQ49TwfXtQogoPSutw==</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>GlNezHyxcs72OQckj4rk/CnyiwbAodnUcUKG555cxJIDn8MiB00oX7rX78SOvDk3Zu7hL9FOP+doXIzJW2pCl60fZITUIVbg3miiCmm8wOqgIMciv9jBcAn2/I29d0QwRMOu+DGrenytc0teE7lih7hU+VokpK1HJpOkROIKIcY=</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>jIeeK4soNu3ISGcV1Hc6bJYOf/RgnNBXUoDaFWdtp4nZBjvW1VZjptrExQtXa8EU3yXXTMufuNnG37Ty4GSzjeKptLCWgX2hrbWNXIm/YkHQs8vaWx6BtOtV9PH8z+NBpktksotjp334rsR3LGEdDohO1OBINlTb357pbdGpA/9qEQZm3GTGSwlM3JE5R38yNNoS1Qgg9TurQU81xzb+LhtOMyvSj3ad1B6wDT/KCn0Jo8clV7a1oc1a9jrpKGP9j2v/qJGNFgTwxYTQDyzdRBlh1XuAKArYRakbs+uCB+760W+cQJpTtvv8XnjdYdwdY9hs2l2jq/fXkw0jSBP66NpA+BZBOKjMlbJxHeqmT12AE/PQt92ciR2YJzGFViu/</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>ZFO2ghm+z6sNXN0aPQ/zPbo87WjrRaxhi36vix4zS2Lihx6OSwUeb/2GosdFkguinGXJo3oO2ktjC53wYDs/jCmLUnSTxup74+XIlSfoth9YOQIGhQZSt8f+xxivWWdA/eK/x0iCj6u72W+F/qdugGdhKiA1FhTBlLptzsARXrQ3wiQAtUbl9g5cEaApC9wAvAXLx+QBYGfp8nq4co/oz2zVD7BK266QsDLOIhhcUt3dRytb7nkefVM4rVBC5UiRVqRSbgvFNXX2c7bPeVm1tEeI2U/7v0timwI5XWsdp1SFpkoJDdYGTNCN8ihVmuLIiTIgnlTjSsvjbwFBiK53u9pKhZUHpUHwnovyTnLLV84LN+Xpcvxzh47pkZJmfw+6KwOJi0vh/tHKMuq5td6WtSS329YibNeimjykIVHnZ4dlfXW0QqUAtV2RwY6+jp14pBLFkP7xsN2anOufhNcpXnMyOSvktia2C1KehWozlccI0Ss8x2vZu2CBiHz+Q0QFoBtRVn//OaN53aTOl/sk6Pt8cDgU+mAAvw3N0sZOk6fh7hKa64j+WFXdxuCm3GOEwNsFuNxiaXlWTKhXwz8pp3dmYTPtOEeVVS7rMIcUDOI=</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>kN8ac6SBBC5ZA+5MD7KBzAueVAs0Z5Au5xGt4tElBIfLa5kBGsGSGwiM8WaIRY/wJ9I2igRdMsnnzJfW1lN/3H7mcn6oNk5iOWutFu6Ui0+slhahwD7p4Zib02nTaZwWVgQJ6xI1wyjjq1uWGxA5UXgAbmBmowr6BMnbbx8ni7/b4wmh2yh9yea4bHxVPkwTpH1vGrJN7Qe/Gaf5OLITdg==</encrypted>]]>

      <![CDATA[<encrypted>UxPC2XoqSOX9gQJz5M+eN4AY1UOXx76AYeYAikOniNhSOUQxMZR0qc2QbEBQlTHZzHsvpMbLJIJf0viac27h5t713rv8k/xgO+Bx2Yp6vcGydv9aeGXaST1LCj7QBmC2n2VGDZgUr/GLQXZuxIBYx9SINOxvoxVrkoHZ84gXGih2CA2PPq9Xwa7QTDtcshkdMfnWxsNOC0A7O/RNyjY4nKGWQiHzI9sPkamYQqEe2QdZuzlo0HcGSc28p1SoKdjDy/l5olMcZMLZYCPu9CamyVdu1J1nnbH7JDlIsJq2Lz7x9Zyma2wwYYXGncvu7Y/hNDyzfrtFVqo0vLdxac7WBWGJI7iuSgD/Yd+DuJIV2IRpGGRl59XcJStZv5Pat94cX6ngb3VhiN4k8Ltmydl08SGMXgLy+Tn8kJlpY5Wew33nTgfA5IdeAgWDdvM5pcRO</encrypted>]]>

      <![CDATA[<encrypted>v1mcdMOMviRdgI07lhNNtZAi6r89u4Esb32okLcszZPbBl/+xpWXZfECB07Z8wGYcuaoLrVKx+evRIQO0aWjuMLXpfjd7VwTVJTFlAyigl/6weZxNJca6eXaKKJu3jPDbXLLYkk/VGiwuk3hYCVGHvsgwGJ90kBI8QmroRMQ3a1N3nZmt1KDXVpgfv6YgZgTUcdb4TvLo9G4yXzbD8gHaA==</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>Otbv8IFI/iEQ2L4z17PXH3fL49uP/P732S37Bmoqbex85EaAo8v5LKwMMNaXROVaJnGIdg1Udj5Op4Gt7jZ13a8oT8JbZDtqKJqp7GQKvWDZO2SWmHxPw8y/YeOjrq9d</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>MTdyUV3UMgY3IyGlghiU0i7aXo5Qow9zAZ4XF0iDXLplF3GQ2flFp4kMtId93tXfK+2TZVSPvJ38VTp0rzjV8ndm6PLkb2udH30wAQLIZZA=</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>cZN60GBX4jlUNpgGKmEShwj3MGyrSPouW7MRIf6fhUbuVab7f6yz95hCyYhGK/MJ9gNDztu8IdYSb5H2xi00gndLUdFAV6QauJR7p1pMBf0tv8j6pp6dqjXo+02aRsE4G6V5OzO5H3cKPHMbrFlQphoJVZxcqUX6omkl1dKjYK8fN9ZdvCVQmvxtjNikU1IKDgIAPLv42sJDXh/VB7OQrKUYufCt7/CVu8qhC4BfKFs+34FuIAaHAeFlXRhdFIrBChizbhmufazwwG+y9YAx/fSBxoSXE3qXliDm0Bgqi/ixO8iPAmBu06T4LUb9znfeKDzeJE0AvFQYpYgBS2jR6DYTnTzdkdWSGsxynOdNnHzR6HJCO/EdKnvfKs5KEnyEehTMhpDPQpbL+1BAgtobQi/nazODUfNG+lKXrB04wO49PlJ5paZSfIuCm655aHIu2iz1JCgKwMVxA9bQiuEnuNdHZ0IyBQh73voapm16M0QZwVlhfUvVz0+OkIgSDRO8iTeIo3IzegRvvBuLRNYk6cDPFxknKc6avwAUq8cMRLglo6CgfcUqPDI7NBa52FI39/LPUqjlxmGFBh+F4ChOamqFb7Biy50WnO/n+MgMnOOHhSJ19UkU9wvUZZLVFZ+PHQ5hwKsMhVGEeGlWv+ThUcuRgxrz7uENG/2tXnFUcyju8F/BFsmg1p3FpuYws6P5BSo3b4p9sfH0F6tMg80BG9eh+jyd9Ad54jXralOgcUj+HB2asZK6wolCaxGZ+9UEHGRV+mcUDDODZBNwvNYyXK5OhKy83Psgp1+lrMp46ZSup5iFkoIgVjx+BpkVQhk4uaw6iBYcKMuQa0rN4FqlUnktEpvxKFmtdBMrXyj77WsC0wcDQHe1fx18ZRMURW+McWpmW6flsdBfu2OdP977No0DAr05MxFUF1rKGLJEFTF+2fj8TuI3UtAvOUkxme4R46bz4slEDtTzFvesdHrc7ZHAwKXwr7nZHiUYKoUE2YA3DRWZ9tRSLsA3JS2O0X2yChqjJ6MqFmoI7iZiNlPWL/65DR2/HGeVxTmJxTXB6lFuc15vf6lWBV3ky/OP6waWb3f8h2heaVjS8WttjnihsO3HD4LIte1snqcCsSsfjkWuFNL82XkdhyMgSdVwmD3iCPeZqI1DGYHXlEjWuNJE36se5iSkux/sLFdbbJ3mjnDZUPwHJvvzzTJCQqb5rCTUYIMc+aMwmj8Dyg2zhQK71lpdVnhMCTzg6kxVvDKTENigc9MlsvVqVm++eIFrSWwuoM2cGE8fFfjLYcHlkYbFXsq7a/all0yNIMUo/ZcY5FL8IkP1BHUsAa/v8lNekHJhUEVU/rZ53H448vVPB0KhcXDiAtGabITsFJj+RwY2kNo2rJNflRr2LflcyXEknkWWYWuJS75Zmuwa9uAtiXB4L9W1OGRDLODBUXXlJaePBri1f0wMlc3I5Fsmur+CytsnW0DEhyacttMS1/0XpNPgeJzG02hCtq/g56BHj7jsO8LOThQh3esZzAML7PSVMBoQV3ekjQB/ugri0hcAPy+nhXjirZ1U/tUlIC/aY/5yBaTqKCb1rZ5VYpsD5i3Oawjp+DO16bSgidbFYWaxEi05Cy5x2bzxtKo7RjhW+lJ8hb6qCSr03CdFsWlo88wAIQc33egieyRgNqCNKovGB9HhgnMMKB75Dpk0In4xl0yC2Zy2arBa86JqGCO6wogp7bCj7m9mwyWsVNOhR/ZJqUXmkMpNg29+JF4vfISbRBDUpvVQJhcw+20eMH2uARY3LLGfRC9VmTEjNlIBRzYW/5Qp7uBqJyt7rUymSRumz6eRWfht80U0VY1nfKEfonI8jl6FXTY48U8IN+tuPk6/K2Awib9j6QgSp51dLpSk1xkPERFzrKIFZ5jy3vvAk5V2bwhE</encrypted>]]>
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
        <![CDATA[<encrypted>Z1RcK5TLY2+AjRTsR6NY7fpVpz24GkBe3R/J6GlqcHi7yqfqPQasfuSoHaPRiD5TiiKWFEWfiK3M5ruM0c+Fwf7jxHlSoRE8C4ejzsuURCVivdU0ocFlp95vk4ifKIcerxeFMwPhAiOmMFykU7oH7O1kKCPRQ+CWGgTf0/jKGzQvCeN/MobJ3Ij74sGUBsL7QZVedIHRFF5wtTRg0MINKEyt1GDGJGlcFC8faJeyURwHcQcMUGGqnE/0JbtyMjnA2qWdbS0wu83J+6zhKKxwhhaKhAwm6TFl9OfSs3llW4s=</encrypted>]]>
      </text>
    </action>

    <action id="CreditAccount">
      <text>
        <![CDATA[<encrypted>lbl1/awQvH7NpAjXBsCQKMtRQvMedxdLhsY6V+JqvwYr874i6LoZ8wMYomsiWBSOMqTsjSNQRUUD+x1dowV3QuQl7bSdO57HymiA3Omtdbi5QFihLLm0ueuiQOXg7fePgtfKYZlb8X1/MB7UlbjMgw==</encrypted>]]>
      </text>
    </action>

    <action id="TaxAccount">
      <text>
        <![CDATA[<encrypted>c8i/oCKpgExDcy5nqxYxQouzu2RqHYl2FPyUcq/gad1oVQi1AuPv8H8NiKp7aNpREuVz3cNAK7Uo/BEFpBgSq41I4JxO65bcJ023M8TYWJiqurl6/1JYUlTaZgzXK/2YAGKpb8EPeME6U05g1heI57oCahqeDgsv5yp2fmoVI3w=</encrypted>]]>
      </text>
    </action>
<action id="CreateEinvoice">
      <text>
        <![CDATA[<encrypted>MFc0D4RP4jXGklZMIvfymXYTUACCw+xiI2XphkFxPyM2bNAY7JP8JzJDck3VHxekreJjK2WJoesXYtn2w4VYMipUAT/Jzsb4hKe+Sj9xDfvDsdQJe7AC03QaMsD7914greI6dteHmOZ2tmGW7EJrawnRny9VqAc+xI0SHlxGJkRQ/KGlBbkk/2SUdCGhvxxmAqkxs5bN0TPHsI1mUen978p73bDwI/1nEdhlhj/Gn6O46rsJ7fgt8eDqZrrLIVqjwExWNbsj6LpwCIFiSndsktqsmn4mffRrBBVjMGtr3fpPHYUVP5zJPoEHe1gWYoB5xLjBJ0d97r/eJUm9uGr2pkhT6pDEvnPMmSgZ6uj9eeKSXOB59WFZiaMEhUfp4+Vs6ingKHNrW62GFhM3rhALdTkIiQ2UnkzNxs1h7Pr+ZF3o1MJ1LwDNAqHQ1oE4vcftbvZXEV67PwKNKqqd5VWMXH27bxhHHPylCDblKb6X+ynuEdNM62tAH9Dl470uiwlr2cpPC4lhpFxI9kfsDc4Ew0XHHe7rU5eHcxyy0oSG5nkQJItiwKZTF3TiJBv+c5F0</encrypted>]]>
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
        <![CDATA[<encrypted>VDgSB6G4/gSM9hBeeZJcOKyE2mlIdhtiAV1XIbwm60f/zUPiyYBba6thMLW3PLAIOWMMh6ygHArJBiWzuJu6VBd4yme7ow60qGPNZOKNYZeb9ksTcP5zXJFTMGrlNzVChUe3zZoa+RdSv5AVuHExVSt2eveV0wvYjxUjtCSkmJzjm30Qg8kNoGrNJJjAMlLzWMLyIvOVvRNF17CkMvGp89mLw130MO2mnwycGxzONiQe8L6Zv3CQX5yNuCdR50ZZAVTamEL1NG3I32JHxYaE0A==</encrypted>]]>
      </text>
    </action>	
    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &XMLGetTaxRate;

  </response>

</dir>
