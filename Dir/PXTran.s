<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
	<!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
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
	<!ENTITY UpdateCurrentStock SYSTEM "..\Include\Command\UpdateCurrentStock.txt">
	<!ENTITY DeleteCurrentStock SYSTEM "..\Include\Command\DeleteCurrentStock.txt">
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">
	<!ENTITY CheckGeneralInputVATCondition " and @outvat_yn = 0">
	<!ENTITY CommandCheckGeneralInputVATInvoiceBeginTag SYSTEM "..\Include\Command\CheckGeneralInputVATInvoiceBeginTag.txt">
	<!ENTITY CommandCheckGeneralInputVATInvoiceSelect "select @verify$InputVAT$Field = 'so_ct', @verify$InputVAT$Invoice = ltrim(@so_ct), @verify$InputVAT$Date = @ngay_ct, @verify$InputVAT$Code = ma_so_thue, @verify$InputVAT$Serial = @so_seri from dmkh where ma_kh = @ma_kh">
	<!ENTITY CommandCheckGeneralInputVATInvoiceEndTag SYSTEM "..\Include\Command\CheckGeneralInputVATInvoiceEndTag.txt">
	<!ENTITY InsertHistoryVoucher SYSTEM "..\Include\Command\InsertHistoryVoucher.txt">

	<!ENTITY CommandCheckGeneralInputVATInvoice "
    &CommandCheckGeneralInputVATInvoiceBeginTag;
    &CommandCheckGeneralInputVATInvoiceSelect;
    &CommandCheckGeneralInputVATInvoiceEndTag;">

	<!ENTITY DefaultReportForm "3">

	<!ENTITY DetailVariable "@d26">
	<!ENTITY DeclarePost "declare @post bit, @vat int
select @post = case when @status = 0 then 0 else 1 end
select @vat = case when @outvat_yn = 0 then 1 else 2 end">

	<!ENTITY f ", @taxRate as thue_suat, @taxType as thue_cn">
	<!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, 'i26$000000', 'm26$000000', 'd26$000000', 'stt_rec', @stt_rec, @@operation

declare @allocateKey varchar(128), @roundInvoice varchar(32)
select @allocateKey = 'stt_rec = ''' + @stt_rec + '''', @roundInvoice = 'm_round_tien_nt'
if exists(select 1 from options where name = 'm_ma_nt0' and val = @ma_nt) select @roundInvoice = 'm_round_tien'
exec MaxvOnline$App$Allocate$Number 'd26$000000', @t_thue_nt, 'thue_nt', @roundInvoice, 'tien_nt', @allocateKey, 'stt_rec0'
exec MaxvOnline$App$Allocate$Number 'd26$000000', @t_thue, 'thue', 'm_round_tien', 'tien', @allocateKey, 'stt_rec0'">

	<!ENTITY Post "
declare @group varchar(128), @glMaster nvarchar(256), @glDetail nvarchar(256)
select @glMaster = rtrim(val) from options where name = 'm_gl_master'
select @glDetail = rtrim(val) from options where name = 'm_gl_detail'
select @group = rtrim(groupby) from @@sysDatabaseName..voucherinfo where ma_ct = @@id

if @status = '1' or @status = '2' begin  
  if @status = '1' begin
	  insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tt_nt, t_tt, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from m26$000000 where stt_rec = @stt_rec
	  exec dbo.fs_PostPXTran 'm26$000000', 'd26$000000', @glMaster, @glDetail, @stt_rec, @group, 1, @vat
	end else begin  
    exec dbo.fs_PostPXTran 'm26$000000', 'd26$000000', @glMaster, @glDetail, @stt_rec, @group, 2, @vat
    exec dbo.fs20_AfterUpdateGL @stt_rec, 'm26$000000', 'd26$000000', @@id, @@userID
    select @q = 'insert into r00$' + convert(char(6), @ngay_ct, 112) + ' select * from ct00 where stt_rec = ''' + replace(@stt_rec, '''', '''''') + ''''
    exec sp_executesql @q
  end
  if @vat = 1 select @q = 'insert into r30$' + convert(char(6), @ngay_ct, 112) + ' select * from ctgt30 where stt_rec = ''' + replace(@stt_rec, '''', '''''') + ''''
    else select @q = 'insert into r20$' + convert(char(6), @ngay_ct, 112) + ' select * from ctgt20 where stt_rec = ''' + replace(@stt_rec, '''', '''''') + ''''
    exec sp_executesql @q
  exec MaxvOnline$Posting$Allocation @@id, '', 'm26$000000', 'd26$000000', 't_tt_nt', 't_tt', 'tt_nt', 'tt', 'cttt60', @stt_rec, ''
end">

	<!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete ctgt20 where stt_rec = @stt_rec
delete ctgt30 where stt_rec = @stt_rec
delete cttt60 where stt_rec = @stt_rec
delete p00$000000 where stt_rec = @stt_rec

select @q = 'delete r00$' + @ext + ' where stt_rec = ''' + replace(@stt_rec, '''', '''''') + ''''
select @q = @q + char(13) + 'delete r20$' + @ext + ' where stt_rec = ''' + replace(@stt_rec, '''', '''''') + ''''
select @q = @q + char(13) + 'delete r30$' + @ext + ' where stt_rec = ''' + replace(@stt_rec, '''', '''''') + ''''
exec sp_executesql @q">
]>

<dir table="m26$000000" code="stt_rec" order="ngay_ct, so_ct" id="HM5" type="Voucher" uniKey="true" navigation="true" name="cookie" check="true" xmlns="urn:schemas-maxv-com:data-dir">
	<title v="hóa đơn dịch vụ trả lại nhà cung cấp" e="Service Return to Supplier"></title>
	<partition table="m26$000000" prime="m26$000000" inquiry="i26$000000" field="ngay_ct" expression="''" increase="{0}" default=""/>
	<fields>
		<field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
			<header v="" e=""></header>
		</field>
		<field name="ma_kh" allowNulls="false">
			<header v="Mã NCC" e="Supplier"></header>
			<items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn = 1 or nv_yn = 1)" check="cc_yn = 1 or nv_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default" row="1"/>
			<clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBZCjY1pO6/p+NqFQ3l3vjFmZ+SRkeDTSpB/rMZvVpuSg==</encrypted>]]></clientScript>
		</field>
		<field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
			<header v="" e=""></header>
		</field>
		<field name="ong_ba">
			<header v="Người nhận" e="Recipient"></header>
		</field>
		<field name="tk" allowNulls="false">
			<header v="Tài khoản nợ" e="Debit Account"></header>
			<items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
		</field>
		<field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
			<header v="" e=""></header>
		</field>
		<field name="dien_giai">
			<header v="Diễn giải" e="Memo"></header>
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
			<header v="Ngày hóa đơn" e="Invoice Date"></header>
		</field>
		<field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
			<header v="Ngày hạch toán" e="Posting Date"></header>
		</field>
		<field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true">
			<header v="Mã nt" e="Currency"></header>
			<items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l" new="Default" row="1"/>
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
					<text v="1. Chuyển KTTH" e="1. Release Later"/>
				</item>
				<item value="2">
					<text v="2. Chuyển sổ cái" e="2. Release"/>
				</item>
			</items>
		</field>

		<field name="d26" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="152" filterSource="Tidy" categoryIndex="1">
			<header v="" e=""></header>
			<label v="Chi tiết" e="Detail"></label >
			<items style="Grid" controller="PXDetail" row="1">
				<item value="ForeignKey">
					<text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
				</item>
			</items>
		</field>

		<field name="mau_bc" categoryIndex="9" defaultValue="&DefaultReportForm;" clientDefault="&DefaultReportForm;">
			<header v="Mẫu báo cáo" e="Report Form"></header>
			<items style="AutoComplete" controller="VATForm" reference="ten_bc%l" information="mau_bc$dmmaubc3.ten_bc%l" row="1"/>
		</field>
		<field name="ten_bc%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" categoryIndex="9">
			<header v="" e=""></header>
		</field>
		<field name="ma_tc" width="80" categoryIndex="9">
			<header v="Mã tính chất" e="Tax Type"></header>
			<items style="AutoComplete" controller="TaxType" reference="ten_tc%l" key="status = '1'" check="1 = 1" information="ma_tc$v20dmtcthue.ten_tc%l" row="1"/>
		</field>
		<field name="ten_tc%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" >
			<header v="" e=""></header>
		</field>

		<field name="ma_thue" categoryIndex="9">
			<header v="Mã thuế" e="Tax Code"></header>
			<items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="status = '1'" information="ma_thue$dmthue.ten_thue%l" row="1"/>
			<clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XC+osNe899TCXUBbukxYa+dRI4dyGueDE9CM5i2MeHJTw==</encrypted>]]></clientScript>
		</field>
		<field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default" categoryIndex="9">
			<header v="" e=""></header>
		</field>
		<field name="tk_thue" categoryIndex="9" clientDefault="Default">
			<header v="Tk thuế nợ" e="Debit Tax Account"></header>
			<label v="Tk thuế" e="Tax Account"></label>
			<items style="AutoComplete" controller="Account" reference="ten_tk_thue%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
			<handle key="[ma_thue] != ''" field="ma_thue"/>
			<clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCRvza43Qf1tfL9ePAorX7wCMrfhaTrC2SByR25B6b6EA==</encrypted>]]></clientScript>
		</field>
		<field name="ten_tk_thue%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="9">
			<header v="" e=""></header>
		</field>
		<field name="thue_suat" type="Decimal" defaultValue="0" categoryIndex="9" disabled="true" hidden="true" readOnly="true" width="0" clientDefault="Default">
			<header v="Thuế suất" e="Tax Rate"></header>
			<items style="Numeric"/>
		</field>
		<field name="ma_kh2" categoryIndex="9" inactivate="true">
			<header v="Cục thuế" e="Tax Authority"></header>
			<items style="AutoComplete" controller="Customer" reference="ten_kh_thue%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default" row="1"/>
		</field>
		<field name="ten_kh_thue%l" readOnly="true" external="true" defaultValue="''" categoryIndex="-1">
			<header v="" e=""></header>
		</field>

		<field name="ten_vt" categoryIndex="-1">
			<header v="Nhóm hàng" e="Item Group"></header>
		</field>
		<field name="ghi_chu" categoryIndex="-1">
			<header v="Ghi chú" e="Note"></header>
		</field>
		<field name="outvat_yn" type="Boolean" defaultValue="cast(0 as bit)" categoryIndex="9">
			<header v="" e=""></header>
			<footer v="Chuyển vào bảng kê thuế đầu ra" e="Post to Output VAT"></footer>
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
		<field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
			<header v="Tiền hàng nt" e="FC Amount"></header>
			<items style="Numeric"/>
		</field>
		<field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
			<header v="Tiền hàng" e="Amount"></header>
			<items style="Numeric"/>
		</field>
		<field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
			<header v="Tổng thanh toán" e="Total Payment"></header>
			<items style="Numeric"/>
		</field>
		<field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
			<header v="" e=""></header>
			<items style="Numeric"/>
		</field>

		<field name="tk_cn" type="Byte" dataFormatString="0" external="true" clientDefault="Default" defaultValue="0" categoryIndex="9" hidden="true" readOnly="true">
			<header v="" e=""></header>
		</field>
    &XMLUserDefinedMasterFields;
		<field name="ma_dvcs" hidden="true" readOnly="true" width="0">
			<header v="" e=""></header>
		</field>
		<field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
			<header v="" e=""></header>
		</field>
	</fields>

	<views>
		<view id="Dir" height="199" anchor="6" split="8">
			<item value="25, 75, 105, 129, 105, 8, 105, 18, 58, 42, 8, 105, 0, 0"/>
			<item value="1011000-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
			<item value="10101-1-100100: [ong_ba].Label, [ong_ba], [cookie], [ma_dvcs], [so_seri].Label, [so_seri]"/>
			<item value="1010000-100100: [dien_giai].Label, [dien_giai], [ngay_lct].Label, [ngay_lct]"/>
			<item value="1011000-100100: [tk].Label, [tk], [ten_tk%l], [ngay_ct].Label, [ngay_ct]"/>
			
			<item value="--------110100:  [ty_gia].Label, [ma_nt], [ty_gia]"/>
			<item value="--------110000:  [status].Label, [status]"/>

			<item value="1: [d26]" />

			<item value="11010000: [mau_bc].Label, [mau_bc], [ten_bc%l]"/>
			<item value="11010000: [ma_tc].Label, [ma_tc], [ten_tc%l]"/>
			<item value="11010000: [ma_thue].Label, [ma_thue], [ten_thue%l]"/>
			<item value="11010000: [tk_thue].Label, [tk_thue], [ten_tk_thue%l]"/>
			<item value="11010000: [ma_kh2].Label, [ma_kh2], [ten_kh_thue%l]"/>
			<item value="-11000-----11: [outvat_yn], [outvat_yn].Description, [thue_suat], [tk_cn]"/>

			<item value="10100----1-10-1: [ten_vt].Label, [ten_vt],[t_tien].Label, [t_tien_nt], [t_tien] "/>
			<item value="10100----1-10-1: [ghi_chu].Label, [ghi_chu],[t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
			<item value="---------1-10-1: [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

			<categories>
				<category index="1" columns="799" anchor="1">
					<header v="Chi tiết" e="Detail"/>
				</category>
				<category index="9" columns="100, 25, 75, 129, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0" anchor="7" >
					<header v="Thuế" e="Tax"/>
				</category>
				<category index="-1" columns="25, 75, 100, 35, 65, 0, 0, 37, 100, 100, 8, 58, 42, 8, 100" anchor="6">
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
				<![CDATA[<encrypted>X7irHior7sJArTyKId1YrMRhpThAs4deUtBbVjafxJ28vrpCsYp700sEQqr03NKVVgsoCq98cw1n6qYlbKnam9KfPy/QUqDRYuTxkVtpYpo7JnBmpSCZyFJMVM9lEv1HlOJNCidUZxUrttpzMio9l4eVf0mnhS7J0REO57vQxF6liURn0gwryIqXc8oobf4CuYKhpj5FANMPodBxUoKdKHJNFM8sOneGhNPhZnUNS0tQKBiJfRZmJgwR9O/RCY/vpUi8EZ79cvWi0BYJ5Y6o8rDR6jnm66TdcBpTTlesa/Y=</encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<encrypted>jsguT1F3i8nGtqLMkxZj7XhNigvsfrjcl+I623V+NqEiLq1pCZUy3ScJRnRuoN+eLkLNzIatj1CAgCgsK1jkI1alCrakHjHe4DiCI6U4lzKKv557eyuVZSN2nQZfrQt+</encrypted>]]><![CDATA[<encrypted>HHUdOgblTl0gGc0+hof9ny1Ol+w+J8bdmyO5uIdjonkfDvy9B2QZxtnpbfuFQ2kf6NGoMomVMxPgut53WLXBPqxHCS193ZndJ+J/IeBabPKNkCcWRlyCQQ0I8qSixgaGmfIxUgzfyBf+lFI5aLoOh93KBw1c13qj9ThvDeA3bMquF8AQSEn3hDloL+l9o38F+0G14Cu2N9t5zdVy83JPBel931aL63Mub0wpyOZhbDCGQ37v/DPwEuIy8x9KLlrx5UQmltZPYLewM3mv/jZttw==</encrypted>]]>&DefaultReportForm;<![CDATA[<encrypted>EKuxz3JD8XcmsO7QtYVs6nfk97lPl4NAi4pqKAuV47bh3pvg9V9elpmqoLmmyPrGdt1VS8TE4CRaQaNi9yowckupBPHjgIvm+o1L72iuGzxoyd0DphCJpzp/plbXDoXXWXEhO7PGoHg0p0vs8hCFap/EEZJIjVgdZva72W71P0KXP6/YGw2RADkf5efi1sUBx+zYDfcgqZyVqi8P6VJuoarLBKCEiMJ4FHC5R8cbC6Szvj6ZcqVbT79xyywv8QH56leH9HbtoOc1TixqcqCHn/fAHFDY/7Y3pAB14asjtVhCJBsILfSUxs4TiAZlyOwdD8uzpT7lhhcGxGpgfhEdhmOA7K3Oln9ITdnrvmCKAQTGXpo5Pary/ds6hTF0sLX6wi+sEHS5V9G40GrRa7waG8B+vtuhXLzauQXcdQrCJ++Gr37eRilj6MZPQFICv9lvkKBmrDcOCXmetNl8RZatHn1pEmOBXacO2SD+rgNJzlZKjPlfIJA97yw52wX2T4BtsZe/4mFi3Jqti+7KggtJAWgmlbTEcHEkwECHlHc398g=</encrypted>]]>
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

		&XMLWhenVoucherNavigating;

		<command event="InitExternalFields">
			<text>
				&CommandExternalFieldDeclare;<![CDATA[<encrypted>6EHGpr5o0PhEjz4DC0YQqWbtlGV3D6g1/HNQwT86L+bxJs5v4JNDhqkYmvWi6+ntAvGkArsi7jTlAAey8RI59j+jEJpbm+mWaCuJR9tb3aFk8J7n5FHPlBc3igDggaz1</encrypted>]]>
				&CommandExternalFieldSelect;<![CDATA[<encrypted>6EHGpr5o0PhEjz4DC0YQqdIv9O/saNHeCC02eyse/uqZIRudNGib/7umg+hfSY5gDmjULwsM2X6RNOuk8C+8RjvvhPV06pdVJP5HFdtFSgVQqJyLTTT/rGUDlZ80t3GI</encrypted>]]>
				&CommandExternalFieldSet;<![CDATA[<encrypted>FNPcyffbeaPiPZGhdxoOSMhvv5xvQlbSwur4HZjMf3dMZlSBMnlpx1JeWKS1qZ+L+OePF09Xak5Sjzsud+nJhm1BlJNNFPNb5jl1NEyYvbja74z1WlPLh4YfPKe5Fc0Mjlu9OCOQByW//ZQeU1RooROrBjGcvTY9dbrEr7V7mk5KOog6Yuu5IQSZwp7+Zaf4MZUlRqTU25APBwIN8zNzHQ==</encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<encrypted>YO9vH39UC9rfBjcWs2k+kdUbj9vKGjQdSORTOH+KTkA=</encrypted>]]>
			</text>
		</command>

		&XMLWhenVoucherClosing;

		<command event="Declare">
			<text>
				<![CDATA[<encrypted>6645KcZcnVyZiAJB/X5iIePkyh1+n75DIrSMtzmvZQtFczwlj4k2yDlTs/5B2BCdpDYjijMF3oljR5JXbkU8R0iVWz2aJPZQVMgbBm2UaDN3vUDkiM9gceraJ8rEza9QMXCu0zCcNxTW7VxDypfoaYXl7kuujM8r1/yglQiL8tTrTQAzUxHhW+aIVKvo4rYNaxx2i7VX9gYu+sddLGcctXjehcWHbeg+2JjpSMhQqt6amy0aq5zkDb/P6Ee7kCnDHJdS0N8cqdYFXbDzO5sdeOeNQS6ZYy+Iv8NYv6rG4wFBH8b4oLz+w/REmKHK91WtYmjiRH/NcddEZWoQJa9Sk8O4DotySJZVy65AfgmHVoQ=</encrypted>]]>
			</text>
		</command>

		<command event="Inserting">
			<text>
				&CommandCheckLockedDate;
				&CommandCheckVoucherHandleBeforeSave;
				&CommandCheckVoucherNumber;
				&CommandCheckGeneralInputVATInvoice;
				&CommandGetIdentityNumber;
				<![CDATA[<encrypted>kxTX7rvGGClO5C2kEV35StzUdtrse25hwlMrSgxfIU5+TtabpC5rUbhtcyX+dC4dV5uA9LMUVbX+FrE2Zk2lTL2LxWrduzUv1WfxA2QsCcVdorDKht/XzXyMmj5XPjz0vMxRievml8nywWTKRE/bg2hc6g0OTa8Yls/kTE6O1bHBwLRbKsOf09jYMkxwj2hrFmY5pBP6QGlZb5ifI1zstpA7yCQCI/LBv2+l9akCIEo=</encrypted>]]>
			</text>
		</command>

		<command event="Inserted">
			<text>
				<![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPp6npchWBbERgQXgHr177YpETV1xb8WgULSeYo5xlmFjdzMSOdD+Ki091E0mIdGaaA==</encrypted>]]>
				&AfterUpdate;
				&DeclarePost;
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
				&CommandCheckGeneralInputVATInvoice;
				<![CDATA[<encrypted>gQ3QQJzcJEnFFRg4go49FQRIx+PTy9fiiOnQVDMKjiW5uVHE3pjrzDjkJ3D4cyr+OZMn15zgmGc7Tm1ydXIEQR/fiqWxIO03DwGK99/2dFnXgwPx+HjX4559OeICANKzZ0OPR2Y0G62rsrsEsBgFe5Oodwna6SSW5T+/VaUsoRq5xB6tps3DggZGtd+cnvc54RjqUqFMr9rIFWtXSHFxS1c7ISSvhDvN5KLEDx9ohJBXx4s5SyRfG3j5wuOBEGU8UKRmniNHkwKPgw7HO7QgZmOzzqrDksxevziBJv0CmrAoKVUmWmbLUozg1UiD4frNDv3DDlfv8M+cQYoEeeHpceqVxlasRfqjHMLBqImkIZs=</encrypted>]]>
			</text>
		</command>

		<command event="Updated">
			<text>
				<![CDATA[<encrypted>0o/szwrtJAPpw/gJMR7R8BgeGA3a6c399cRRzih8nqN3hWxTqnR17Ssb+BoY8sjLlactqIAP3nrBatNI3YzKMJ5MM9ADL6IpnbY/vrxNcbGABKr6avTKjqa91tBgKC8aRYxO7X2dBOEhBgytF5seJMYGumaBNRIu/iPgd8SMyP6ej4/IO8B5aopaZz+mwQWJ0XHvti5sguwU6JFK1CDerQ==</encrypted>]]>
				&AfterUpdate;
				&DeclarePost;
				&Delete;
				&Post;
				&CommandShowWarningMessage;
			</text>
		</command>

		<command event="Deleting">
			<text>
				&CommandCheckVoucherHandleBeforeDelete;
				&CommandWhenVoucherBeforeDelete;
				<![CDATA[<encrypted>59k3NO3CYnzut4coKaDZkfX4wgM8dAXwJfxbg2kh+VYK8o5t3OraRXENA6EqU+rLLvD9kAfiKE6MF0rv9M6Cw7osi6C2rMisMVEvHh1mWf0YWg1kOn3F7HYxKZYS0ktxC3eP/53u3O26NAmndTnkmQaaaEhd3F7mBHG5OJR0sfm7Q4GbEXE3jfoCcWeVdhFHglIC38fOU0lAhLq3nm5Hj7Yvy7qRqven6yrzWwirJ4GKT1IGX4LBawL9N84SJZnsSTbrZA09gIuk+k7IQamMBQ==</encrypted>]]>
				&Delete;
			</text>
		</command>

		<command event="Checking">
			<text>
				<![CDATA[<encrypted>wl5PCtsYB6g4thLxGYDjHMWn6mNbhB3Rm7jmosC9ynQr0JgVeuOXivaPcaBu1bHEzIPQH72RBkyumlK3+3s5tlCOo8aade+g0eB1ddFzZvmtWskBaNt9VSfH/tWXfGYf56G4bKu1UaoYNrUA+6pg9UdyWDu+qguopgPnM4d7qhwBNXpGi1qlasm4/OGF3NhdFvb7j4htS3fkZuMAhsa+hyLqb07mFzrdd4WnF/eys8NYE8pCfj9vDxkzXmVzyK+BeKSvaNza3gQln4dBhTkG7jNz6g9T0TgbfzRnSj2ZB9zOrH685viF93GB2tEuYqnito6Co+cNFJsfmysMz4WQq4/Q6AjrLtyBDNx4QCXz0ZYaNrgRRDpn6MphwSFjFS6QI/7cFCWSMsxwlFrD9URUeVQWahvlpM0ziC+qDEtJBOQNxNLEMH7W9g7vENLhOLOF9HX1cIhOmJ7yVL98AFf8qpjct4IY1nzsNkyWv8tVduUwtMhk1ILy5L02gYE0NisPZkP4KgDceR3/A6bvn2Su/r2bJdw+1udg59lhX4ycIEHxrPaPTqEKxdOqF9zChVjSdB9nO3kqikzOABe/IR8Vjghjyo8hxxlUsYCpCNt7x8A=</encrypted>]]>
			</text>
		</command>

	</commands>

	<script>
		<text>
			&ScriptVoucherInit;
			<![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS8p9nsRRanAtEXKcI5YLfU2LTEPj7kP/stj6JSHsKnX2e8zxSujBYhoW8apCbsnZ78SqxqkCDWz9QCczSKWrVejA==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>klH21CizDNRDnjCdNSdiMEqv1AQ3WsndL3MLJqb3byAjANyRJrtkKjTzaK90/M7r5EXSQyDDRqboLjvQYa/2Vyv4BP8FD9idEVzBhv6VcMqAf6jYh2gIwxZS2cojUcjE81/Dc9ZnwHCu894Zg9dbMooQZMKtV45hp9GSRj9S/4yDXLZsiTqatsV68+JBG/RU</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>j5BOqU8S3ZKXmvpa69uLKR327MC46bS1fEISOelI3X04o7eUWjL7kgTtQhRb9SuVC65WLx/f3by6Bo5oIkiNGtfdDemD6xFrLRc3g1VkcD4=</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>7a64QCu0asIWD2C0EEFwxRy/U0wHUtwhJgbpNwgQqRU9gpweMBWW73qchDi2ZvgQ/3Pxd3nvOeqUgj7bGtSvHhfTf+2g86rsjReuGyDkrpAFK+Ymm/uz9uctoYX52yu4Ui0cG+sG6sWn4LsDtn5/1tNrmzUvUD5FEq1Sx6mfmLjBncYUtTwif34GC/jJDxgANdGMZShyELB2UhZs3GpESfsBRAXxeXg6wf73ksZK8UFeqiGjOkpjX0FHbj/n7aQqV6/K4Odjyx1LfIO+fAxC/0+OlV2pnBacXpeeC2gHM7tzO5iqJxgnGmP+SFcZYWgdF/1V2xnOdJbx6Bm1ma3kkrmyZGU8aJ7Wa3J+FrqXBxDaL2b4SU7P+Z4/uEy0jPUeslaQGWu4dG6XhvvSwFXbH5rkyyzDZMUSLNuDntr7Y261GkVKDRdneaPELiHFl0Wl4qVAiRsj5+mkv/W3+9TNkCd++M2mGkXt/3P6Q6GVQf6qhjxwh5n6JlgEV6bZFW94QZqM7ouowYPMfCXJ2EUdb2sYcFAK8qPqWzASgppCq0Msauf0lNOlyqzSOjPBfU1tFGPKDEncqYcLoDJxDKdWQQ==</encrypted>]]>
			&ScriptVoucherNumber;
			<![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>5nakqmn/WFy40YEbkPa2IVvAZ291Szs6aqwZ+AqJ4aOklfO6p7Hbk8dtcOFVbD01chfxAIxibqigwbqvwoBiAyzpv2ZrEkb7AMqHEHcHw08esmxi/5oO3mo//+V2LO22c0aQyfPhEpheSrOmcejzqHZGcQcOMkG1OTtBZAqxpSoiji9rOhn18J94yLlIB80CCV2mwULzC4MzKqkp4+pxOhJX8ZVurfHCIysk17lxvKp5AfLBNZrw3xw8eeaX/ep6J+D8AKaK3xGdOuXo82hH1bYHcsmJZdCwg3vXgaqG4E7XK4uYZgJe1oOnN/2oCmWItj+nmLQfPS+pLSc/qFcYNi4nktcIavvv9R3QfiF9Dn0PIXwZuUy1i8neVCxxMNbZ1OUvwlqh3DPLQ6qsSXGDe3J0yllDrty4EUnBDZfF+pfBPad2C16p5B+n2m/flk2/n9M//mjQNhSbflaAzXsa6qWn8ofnoM7tglszMKOG1hXsuzeHyPLaFUolyzYCq0fNGfP+8unrwOEqmFRaSmCEbb07TuNyUxVro03WoNc3tRa78J3TFyXppzUS3pEGgOAZZaaH/+1Jn2l/CraoOmsDWQ==</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>dBimHqLT7vaa2Jzn9Er8J6d2bPYXT6mb5AAOPOGVIGpfYFmTIpiV1GDPbf7Qcrvdvx7HQk2+SiThhr15y36lb6kLoS+afLxyBLf5zU0apyJ+224oViYYw6AAihDvwCFNrU0AY2yu20Y1kiRfTJTyQYcfsJtRhwF9IYqx6njIYIkZjcerDlba2jSuXbGE1WdFme4DvSs2jgnjG5BnCHuKj9NA3JaqNK5PErir+u4NWkqmTwlboM6C5IhwgEQd/0R0WXdLds2moMbPGkyQkmAusZMiNveb8pzW5GKhKrka88w5t63AtTSRxDCRKsAI0IZr5fa3WqI0TOQRTJEKZmCjqB2l26zclTbIeWphDF7fThhQkqp1NYtzlP/CLwDYQllpax/8TlfzbrfRU6DCoFXlLUGcSutJBRFY+Btyya9oPDDunmXh+wmxHfM2BS5gb9Ff86oMaPmUuQrTMesUoVcaYOw9f96nRwYfI8wOSX4n5tK5wHpeTPkDxGJ02VWzneODp9Y3sMaEGeUZwLeMNlXZNuZyHzkWVXXkpAF19QIhRra5a1sXwp9u9vDyFRWZnqJQanp+VA7TSKAnTiZkQPcCHYdMuikj/Wtc+Pnve79YoKg=</encrypted>]]>
			&VoucherNumberLoading;<![CDATA[<encrypted>MTdyUV3UMgY3IyGlghiU0i7aXo5Qow9zAZ4XF0iDXLoXHqewFQz6i24ZPKF6tZiMmqZwpwWAc3w5nXequMTNkuPLjMXPconOQllnC89hfBLzTvi3q3x6vALDkoX/rA09</encrypted>]]>
			&VoucherNumberScattering;<![CDATA[<encrypted>MTdyUV3UMgY3IyGlghiU0i7aXo5Qow9zAZ4XF0iDXLoXHqewFQz6i24ZPKF6tZiMMRFVCdIv5irDYs4Qy4vLLg==</encrypted>]]>
			&VoucherNumberReading;
			&CurrencyResponse;
			<![CDATA[<encrypted>orxDsgkuVPAjWM9HeDE2C2H7fP9gQKhMlEtFVw9xSYHuG9ksgHHikmohT8tR+8Sab8njfEUCRr3Sx++ANJRvqaeFjJvrApv5kPlinpxql4nZAKNL4Mf8Sr7/YNLumqH2a8kXZBORSJQiaH3etE7WraDI/NC2LSmjyvE0Rfpt2ePOYunPLlcQNnhpyiYewnsnbgikdOJONryrGOMiCoU+eWf0oehue7J0AnNzmP2Tz7oIh08pslOzl/uJsZVNrPR2IcdYlqCpm9+kLaTHSgvg/R22GG+f/N7FNv2/VlrdDnSyhIijFlsJAiQc2mHBpSbiMqPmQPd11I77luJhY5Xjx2tWV+hRy3oLYRna+QB3lsSjddE8yixIJHKKMf6wO4Mo8/d5ud4cfJAd8tVhQDPOiV9eJRpygkNr5NsgeVQRw4pBPBE3oWOo2yfa31U5/nngHpTCWuGS0jm6CJNVzigT1WRKbaiRkADW7dmfzi1fTyp2CmY/U2iU69CSbtcq7ZJRhOEWOarOhSRh/lKZPzEqKPv6L0ilBnJwkb+xHVE2xS4haxED2UkwdlNgnV947dEFJy+zB3k3KxYlbUNVw8th26EP8fNuWFygEUGM9ZAuZI/MRbQR6qQ73ZQ+yjdNCKtsD6aPT7RD9Nhw3kBzYmgx4K2zV+Wiekl4RtX5Hw6L49qTa/ylevVTrhQQ/bNKo13wTebXH/3DezEvKNYSlsEyjM0wxm1tRSHgaZuJLkl2xIcvdJmU/5iV79X7RHzqg1ZKFUkpj6rNgoR8InQvTT5Zrg==</encrypted>]]>

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
				<![CDATA[<encrypted>96kDPLYK8YDCzmklu5JcU2b/xEbgxKtYruv/85FPtJRSMMxam5ANODxByktiPsM/Jfu2X3XUmPbfBTev8PNszvwp0x4Pyo9P62349Et7avum/jhc32w8W3Okq9MjTu37oSyp4anq/OIdDKUHvb91mw6OUY2ew5tRswpUF7bqwW0emU/36v3yhyVy6fY26gniZsdksG32reKsTxBiP/6mrCy++UKgDPSkj6Y+JQQADmA=</encrypted>]]>
			</text>
		</action>

		<action id="TaxCode">
			<text>
				<![CDATA[<encrypted>R7ZX3QsG3TlS70KUMaU5DF9eV0BiAGUXK6+nk7vOju2Y4OR9Ulzoid685ZhzsUxoUYo9iWf149MMSY5l5OZqgo4tnIyJzXdI1vLN/lfyCXmqOPuNLpeg3gzlzlDFmWyJqgi92Wh1yhO+Zf1Lz0SXhfWkm2gk85Sve+PGLIZULlLK4ahMfkqSkphxpvz5llBOQC5opAbG73lw5KemYOVbOpma82JwScOoCI4psESdhhEdnSuNGIH98f3WfZgiljAu</encrypted>]]>
			</text>
		</action>

		<action id="TaxAccount">
			<text>
				<![CDATA[<encrypted>fzaFi+yneMQc4B5tUV0FMOxdTnIfz9+Sc31M6PkKc49oLqXYDA+W5k6QmwwJlvYk0v0/Iq/z9DqX8VtPNJjO0S+60dClIGxytip662aNlMnl6kzOgV6WAp+UH88OquQZkOAz35BPwJdnbbA/c9dHRIa6t1pjoCawYf8ywvVjfOc=</encrypted>]]>
			</text>
		</action>

		&XMLGetVoucherNumber;
		&XMLGetExchangeRate;
	</response>
</dir>
