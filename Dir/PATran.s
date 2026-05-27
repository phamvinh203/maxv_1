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

	<!ENTITY CommandCheckDetailInputVATInvoice SYSTEM "..\Include\Command\CheckDetailInputVATInvoice.txt">

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
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">
	<!ENTITY ScriptVerifyInputVATInvoiceNumber SYSTEM "..\Include\Javascript\VerifyInputVATInvoiceNumber.txt">
	<!ENTITY InsertHistoryVoucher SYSTEM "..\Include\Command\InsertHistoryVoucher.txt">

	<!ENTITY f ", @supplier as ten_ncc, @address as dia_chi, @taxID as ma_so_thue">
	<!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, 'i83$000000', 'm83$000000', 'd83$000000', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGeneral @@id, 'm83$000000', 'd83$000000', 'i83$000000', 'm83$000000', @stt_rec

declare @allocateKey varchar(128), @roundInvoice varchar(32)
select @allocateKey = 'stt_rec = ''' + @stt_rec + '''', @roundInvoice = 'm_round_tien_nt'
if exists(select 1 from options where name = 'm_ma_nt0' and val = @ma_nt) select @roundInvoice = 'm_round_tien'
exec MaxvOnline$App$Allocate$Number 'd83$000000', @t_thue_nt, 'thue_nt', @roundInvoice, 'tien_nt', @allocateKey, 'stt_rec0'
exec MaxvOnline$App$Allocate$Number 'd83$000000', @t_thue, 'thue', 'm_round_tien', 'tien', @allocateKey, 'stt_rec0'">

	<!ENTITY Post "
declare @group varchar(1024), @glMaster nvarchar(256) , @glDetail nvarchar(256)
select @glMaster = rtrim(val) from options where name = 'm_gl_master'
select @glDetail = rtrim(val) from options where name = 'm_gl_detail'
select @group = rtrim(groupby) from @@sysDatabaseName..voucherinfo where ma_ct = @@id

if @status &lt;&gt; '0' begin  
  insert into ctgt30 select * from #r30
  
  declare @external varchar(4000), @statement varchar(4000), @variable varchar(32)
  select @external = 'tk_du = c.tk, ma_nx = c.tk, stt_rec_pn = b.stt_rec_hd, stt_rec0pn = b.stt_rec0hd, ' + replace('tien_nhap = $b.tien, tien_nt_n = $b.tien_nt, thue = $b.thue, thue_nt = $b.thue_nt', '$', case when @loai_ct = '1' then '-' else '' end)
  select @statement = 'update #in set ma_nx = b.ma_nx from #in a join dmnx b on a.ma_nx = b.tk where b.ma_nx is not null; delete #in where tien_nt_n + tien_nhap = 0'
  select @variable = 'r70$' + convert(char(6), @ngay_ct, 112)
  
  exec MaxvOnline$Voucher$Posting$Inventory 'm83$000000', 'd83$000000', @variable, @stt_rec, @@id,
    'pn_gia_tb, ct_dc, px_gia_dd, gia_nt21, gia21, gia_nt2, gia2, tien_nt2, tien2, cp_thue_yn, ck_nt, ck, sl_nhap, sl_xuat, sl_nhap1, sl_xuat1, gia_nt0, gia0, tien_nt0, tien0, gia_nt1, gia1, tien_nt_x, tien_xuat, gia_nt01, gia01, cp_vc_nt, cp_vc, cp_bh_nt, cp_bh, cp_khac_nt, cp_khac, cp_nt, cp, thue_suat_nk, nk_nt, nk, thue_suat_ttdb, ttdb_nt, ttdb, thue_suat',
    'so_seri, ma_khon, ma_vi_trin, tk_gv, tk_dt, tk_ck, so_dh2, so_dh3, ma_nvbh, ma_nv, stt_rec_px, stt_rec0px, stt_rec_dc, so_seri0, tk_thue_nk, tk_thue_ttdb',
    @external, @statement, '0'

  if @loai_ct = '1' exec MaxvOnline$Posting$Allocation @@id, @loai_ct, 'm83$000000', 'd83$000000', 't_tt_nt', 't_tt', 'tt_nt', 'tt', 'cttt60', @stt_rec, ''  
  if @status = '1' begin
    insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tt_nt, t_tt, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from m83$000000 where stt_rec = @stt_rec
    exec fs_PostPATran 'm83$000000', 'd83$000000', @glMaster, @glDetail, @stt_rec, @group, 1
  end else begin
    exec fs_PostPATran 'm83$000000', 'd83$000000', @glMaster, @glDetail, @stt_rec, @group, 2
    exec fs20_AfterUpdateGL @stt_rec, 'm83$000000', 'd83$000000', @@id, @@userID
    select @q = 'insert into r00$' + convert(char(6), @ngay_ct, 112) + ' select * from ct00 where stt_rec = ''' + replace(@stt_rec, '''', '''''') + ''''
    exec sp_executesql @q
  end
end">

	<!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete ct70 where stt_rec = @stt_rec
delete ctgt30 where stt_rec = @stt_rec
delete cttt30 where left(stt_rec, 10) = left(@stt_rec, 10)
delete cttt60 where left(stt_rec, 10) = left(@stt_rec, 10)
delete p00$000000 where stt_rec = @stt_rec

select @q = 'delete r00$' + @ext + ' where stt_rec = ''' + replace(@stt_rec, '''', '''''') + ''''
select @q = @q + char(13) + 'delete r70$' + @ext + ' where stt_rec = ''' + replace(@stt_rec, '''', '''''') + ''''
exec sp_executesql @q">
]>
<dir table="m83$000000" code="stt_rec" order="ngay_ct, so_ct" id="HM4" type="Voucher" uniKey="true" navigation="true" name="cookie" check="true" xmlns="urn:schemas-maxv-com:data-dir">
	<title v="phiếu nhập điều chỉnh giá hàng mua" e="Purchase Adjustment Transaction"></title>
	<partition table="m83$000000" prime="m83$000000" inquiry="i83$000000" field="ngay_ct" expression="''" increase="{0}" default=""/>
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
			<clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCC5XZ1IDPpaDqirJElpwGphj7k0IfLUu5dBXM9DEqppA==</encrypted>]]></clientScript>
		</field>
		<field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
			<header v="" e=""></header>
		</field>
		<field name="tk" allowNulls="false">
			<header v="Tk công nợ" e="AR-AP Account"></header>
			<items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and tk_cn = 1 and status = '1'" check="loai_tk = 1 and tk_cn = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
		</field>
		<field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
			<header v="" e=""></header>
		</field>
		<field name="dien_giai">
			<header v="Diễn giải" e="Memo"></header>
		</field>

		<field name="so_ct0" dataFormatString="@upperCaseFormat" align="right" hidden="true" readOnly="true">
			<header v="" e=""></header>
			<items style="Mask"/>
		</field>
		<field name="so_seri0" dataFormatString="@upperCaseFormat" align="right" hidden="true" readOnly="true">
			<header v="&lt;div style=&quot;text-align:right&quot;&gt;Ký hiệu&lt;/div&gt;" e="&lt;div style=&quot;text-align:right&quot;&gt;Serial Number&lt;/div&gt;"></header>
			<items style="Mask"/>
		</field>
		<field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" hidden="true" readOnly="true">
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

		<field name="d83" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="162" filterSource="Tidy" categoryIndex="1">
			<header v="" e=""></header>
			<label v="Chi tiết" e="Detail"></label >
			<items style="Grid" controller="PADetail" row="1">
				<item value="ForeignKey">
					<text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
				</item>
			</items>
		</field>

		<field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="162" filterSource="Tidy" categoryIndex="3">
			<header v="" e=""></header>
			<label v="Thuế" e="Tax"></label >
			<items style="Grid" controller="PATax" row="1">
				<item value="ForeignKey">
					<text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
				</item>
			</items>
		</field>

		<field name="ma_tt" categoryIndex="-1">
			<header v="Mã thanh toán" e="Debit Term"></header>
			<footer v="Mã th&lt;u&gt;a&lt;/u&gt;nh toán" e="Debit &lt;u&gt;T&lt;/u&gt;erm"></footer>
			<items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
		</field>
		<field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="-1">
			<header v="" e=""></header>
		</field>

		<field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
			<header v="Tiền hàng" e="Amount"></header>
			<items style="Numeric"/>
		</field>
		<field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
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
		<field name="loai_ct" hidden="true" width="0" clientDefault="Default">
			<header v="" e=""></header>
		</field>
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
		<view id="Dir" height="208" anchor="8" split="9">
			<item value="100, 30, 75, 129, 105, 8, 105, 0, 18, 58, 42, 8, 105, 0, 0"/>
			<item value="11010000-100111: [ma_gd].Label, [ma_gd], [ten_gd%l], [so_ct].Label, [so_ct], [ma_nk], [stt_rec]"/>
			<item value="11010000-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [ngay_lct].Label, [ngay_lct], [ma_dvcs], [cookie]"/>
			<item value="11000000-1001-1: [ong_ba].Label, [ong_ba], [ngay_ct].Label, [ngay_ct], [loai_ct]"/>
			<item value="11000000-1101--: [dien_giai].Label, [dien_giai], [ty_gia].Label, [ma_nt], [ty_gia]"/>
			<item value="11010000-1100--: [tk].Label, [tk], [ten_tk%l], [status].Label, [status]"/>
		
			<item value="111111: [so_ct0],[so_seri0],[ngay_ct0], [ten_ncc], [dia_chi], [ma_so_thue]"/>

			<item value="1: [d83]"/>
			<item value="1: [r30]"/>

			<item value="------1--10-1--: [t_tien_nt].Label, [t_tien_nt], [t_tien]"/>
			<item value="------1--10-1--: [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
			<item value="11010-1--10-1--: [ma_tt].Footer, [ma_tt], [ten_tt%l], [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

			<categories>
				<category index="1" columns="769" anchor="1">
					<header v="Chi tiết" e="Detail"/>
				</category>
				<category index="3" columns="769" anchor="1">
					<header v="Thuế" e="Tax"/>
				</category>
				<category index="-1" columns="100, 30, 70, 129, 100, 8, 100, 1, 7, 58, 42, 8, 100, 0, 0" anchor="5">
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

		&XMLWhenVoucherNavigating;

		<command event="InitExternalFields">
			<text>
				&CommandExternalFieldDeclare;<![CDATA[<encrypted>gJoFmK0sS0RHBg6WicanqfW8GRTAxWMtvLxF2lGmq4BENPIaanQyi9CsVwpvZMAfwkZzbejXMAVbSkF0y5wRqb9+I5FC2Dh0CssoSkJ72MA=</encrypted>]]>
				&CommandExternalFieldSelect;<![CDATA[<encrypted>KpEwZedeV8pJENVGkMP2dCCGui8xgoEfG12f7ZSA/UxsEBa8YYkZ6Jx6fE+31tOKWuhEiPgydG04vtaNUeMIsdY18zEGnljYvSR328gvcMicpEhzAInJ3Wp173skszXgWY9ziefBOVNRpVTlysSSUalgLQaC0vtelBF8BNKo+7NM80Ht82ATgW3Up1sZ3sbf</encrypted>]]>
				&CommandExternalFieldSet;
				&CommandExternalFieldQuery;&f;
			</text>
		</command>

		&XMLWhenVoucherClosing;

		<command event="Declare">
			<text>
				<![CDATA[<encrypted>8pn+CSU3c5AtOCkgLOdWSDDMlgVX5Uk1M83jBiOeetoLy4vG/rW4CoGgewSMEpLV/qQKPpgIvThZsb3JVjfPk2seI4KfU6Nc/kvdiAxrfnFPswWf3dHnpXS0bY8Ije7hMMxa0LYBEiKL3fYsIZR32uITFm3UAKOnYDOFt5xA/fPmWBapV9yzUvvZnUKx8jZvHna1Nzey0YT4Y+84kTZf0aUW/PFk7DabbqUKHjv75kYeh7W6KTUupKP38pZWArGP+HAQFllmpMbAbh1H0eGF365L7K8DKJeWYXI7qN72vNKWuTPuM+gQYd5kACZO2MhnJnbhu8CpZFP5oZfcZ41GGKQtEBIlSphFfLzb9xJOZCfSOZXaACuLmGymxFiTY/P1</encrypted>]]>
			</text>
		</command>

		<command event="Inserting">
			<text>
				&CommandCheckLockedDate;
				&CommandCheckVoucherHandleBeforeSave;
				&CommandCheckVoucherNumber;
				&CommandCheckDetailInputVATInvoice;
				&CommandGetIdentityNumber;
				<![CDATA[<encrypted>UeGxsZdygZFANNclhv8or9iRKszmGsD9CCRWgR4ZORzVsyqhrWOTCfJ+gQpbWVVT3WVrs5IsgP5+HSRA1BPqYO0G+DR0MDb0Xq8NSSa+yq+MYkeBfqh1Xxm+o0IEOxBQE7AScmDT/jg2O+TiwX3SmV0Uba1YQWHNkZh7WGu5RU41jdG+FRPFNd/DVzfFJdAEu1lnX5cneL+vtNbrc3u4JRSB3nN8O5EvzmHg0tPkL/mEMcRlTnFrlkHcZGfdp2FCBCfdZ11y3nhJV1Oeb69xRMMtq6ReA039z1ZIvoo7HkhuijN9v45Lzfh8OMFRDsTRvbeeFJuTTCqgY3tEC4hpClqgwHq6aZlxyoOP682BTTk=</encrypted>]]>
			</text>
		</command>

		<command event="Inserted">
			<text>
				<![CDATA[<encrypted>CrB8SVgPBx+XZ2QOnoDcRtvMGFUZG3m3hqANx3JIGwsoMT9A9mZFILMoEtvfNr2lde2SNXvZZ8lbNsmpRCWGKkicCv6i3VanudK/git8ix27nvv3HGtUkmEB+UDsSuo5wy9iW1HeXYKJ5aiBplp+uKGPf/oeg+Z2ZnQwQm7ECYJXzFt9k2pwGjDNQ4IvjelufKyVjdZMgJkckNjIO2sstpv8l2ETFpPMHI1L2oOaaTc=</encrypted>]]>
				&AfterUpdate;
				&Post;
				<![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjNM5DJ9nuOA785bKXqt9ViKX0KXllerWVcqK//gDH6sU6+cB0/Cg4zCuf5+pR5ZL0MVtL01/SSgXvIIkjPEpj2YQwNY1asZaw+EZzQ28ctVS</encrypted>]]>&CommandShowWarningMessage;<![CDATA[<encrypted>FTgzG0Ebn58SWQYsf65nyjIIGuY/GZ6oxX0a/PwjGKzviKX5u9uIEUIVQbbNJofhdxu3S4ep6ls4RjJCLKh4YlshfeCbWblD3/5LcHM/Og0=</encrypted>]]>
			</text>
		</command>

		<command event="Updating">
			<text>
				<![CDATA[<encrypted>9+ERTiSCU+F4WmQgxlpWqu4gZSJQkMtl0vrrkIQQUILuv1YKcWDDAFuH12G8YjYwBcDeX7Gm4TWUbHUBAIfV4Y253If8py6nw4rlrr+ppqb0O1sg9osbR4arQ732r2/X2+GRgEoYO2WMt13VVngpmjB4UlBolQtycPENNmJhmMVaQX5+pUlE5R4aKAxEQyWyHA7Hx5WS52GR9ixqKAMFmooIePyuYW/FHXGAbSpQUlTApt1riYURPTHORYxtrxFVEvlGpkBWifInyiLP4z7TuNE7QQzwiXs3LfufpV3SPTflMu5CyqHJ/hFsHZtf+azn/ri/ZHCrHlyroQnLWYjKP9RB0Z3UoljHsepRYUK1QM0kObnvNxls1/dVIkbrVe6yHv0QPrMAgoUyle9WIfY7F33d0SLpUuHDpymcZs/BvO9uiAmESITn33W+JbYq86jZ1wf3CyNN1V94NXNfpS6rWg==</encrypted>]]>
				&CommandCheckVoucherHandleBeforeSave;
				&CommandCheckLockedDate;
				&CommandCheckVoucherNumber;
				<![CDATA[<encrypted>RGNHpM2GmhSSE4LwgrxiO1v89RfhFSgoYVaYmaQMzhlKTUZpMB+NQmrndxAz8NHKtSP0kELnA4CTsJmpew+vyA==</encrypted>]]>&CommandCheckDetailInputVATInvoice;<![CDATA[<encrypted>ozTrJyUsWtty/9gwaz9/UXLRJvF5lDC/C/FqfcjzdEOddxfJo0Y24JdAGZgaMMcEuW1OrGCSbMgyGi+n3kCpJ89Coi9qAs97dqOi8mZR9znpAtHjSHTAJ7ejuB6UAophljhoRbuAXLhIwcEbGKW/JQRP+nWog0DMm7YGVFvC9p9ufGmKOKb443cLp534C7gYXJkC0L7OLHNFAN4/7w9+8GRVTmzpixfoVGj5ogNggmYlInUlf6XH1HjIDWfw3A8bqM3jwDoVNAqA5wmuusT5XtoakyYRL6Mx18EjjeornFNAlhioUbVJzrnsXLWMw+kZMj3ZSi/M5MWUXTiSVrgHU0c+a/B1FuNOpqurHty+nTjQvpMJP3Hccf/AgpWT/C5szYyOjD7bkftGEJxgDGr5G5gJPOAlAytxihnzifqFCee8fLzptrhiTwa2hF2shZOZG0xgGDqsmJ6xlnbwT/qu4GxFeSbXUYy4DwoAhRNaeCNlN5ooBCq/3tsqxfa0YqYrQAkvadpvx3rnF8EQDCIRScT1jqiTCWMSdQtVQU0ywk9s4gP1WjiOdRInpA2x0fwrcAjzNboO4qoUWmwbygK3Dpyhc5J0EeUhpXCWAPEb0pbu+jjOTHz0YyL8V5iP4xtU0OOEmlC/Y5EI47bKdcwhbYvtssRrrjnzGWclnd8hhn5SgHBqoimnLwv3T5Zv5Eymsu+t22cSUX4sf/orXUE6sWmelyQHXQ+A57YoS4YyjnI=</encrypted>]]>
			</text>
		</command>

		<command event="Updated">
			<text>
				<![CDATA[<encrypted>brOPioFYi1PoBXxqvXfqx8RVeGMVXcKNnEF+X8og3VT6l6xW5+PVssGFpwbF/i6GpSDhis1QO6EnDEMVlM8yZ5lx8u7ikTHUJG+sjcFmomiO8SetmdwKc0OcXkc/bgz0636remSPGtQbhL+WsawjF4KdRcuFUGJVvYk1PODpWjSwikFRSfb+wFh+aDaBUEJDG1MZWBbjU2geC9UkvP8QuAlpLLE/bGd6n/XjLP0y3Y0lyswV98CPBI2cnzJuWXI54HGDulElLTu2Rho9MmeZ/k2/qIf0IPYnhzTREkCIlKnSECMkyINgl1oOhSYDuFSih6zfSJqlBCnVM1kqnC2zjkFYbeW4HfZSU7kxn5dKic24IIl1K1MVQ58AkOzlipmt4wMrO8gs73A8JVIInQw0o2qh9gM5PucEvIjh8fScn50=</encrypted>]]>
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
				<![CDATA[<encrypted>FkJO4sxCFrOH85dBHl0avj1XJiQ2FhnoWLvIaPmAb3mBOaGzJQOAQvKehE30Q3AM26vdeXe5pDKa3OfWPZY76azrDOrM0xdefiAkTm0q04S2EQnuJv27LE7G6ltGt4Fr57koqtS1C92LEvVFCuoXt/YHtXg/YB6xzc7erbL5zOp8Ii9AfaRXzkwVDgrn53ksRlDVEjiiE5shX57oQtKirGqb8HzxO3qLKd/VS98UF3JHBqtDl31RXKFuKgXRWwHUREnAN5EF0cxn64/aciA/jGXFl88FzXq9weO9RKXwTVylZjC9qnAdlm0IiZp0OSv2n0+1MikzOF/B1JeEfMMx+XJs1Cd9BLw4HCkl6FF0zFM=</encrypted>]]>
				&Delete;
			</text>
		</command>

		<command event="Checking">
			<text>
				<![CDATA[<encrypted>Nfeocs8LdHZeEVs+G24FAs+frN+k9inznmVRzHRKtxUfZs6RzrdNRRLy8gNcFIHhvLv9WC50IXZqYD41lvA10oU+pJsCVUmS2hfEsCIA5aVAh84MtwtFOG6auxoSaIMSEdcspbSo7E6kyt4ps32XHkyhxh5KuwexxmYYBsxKx0BlIfIyT/5Tm9dXFNs/2lAfY+ytMRvUyXAgtSQJSSukrq86q4um9Rt40kLwJyLbjpQ2WJlWhh7axhFLe+2FFWZQeQQH6IvhOaEnMZpMmS1lpVxhVuphG/lRP2HnV33mVD8EZEv10IV0F3e0vWfTF50f1v20SSMNP+R6zJePdO/pPRnnO45tVRgRbxk9IZ3YBqN7Q6cctQIWtPdGP0vXGn9t6V7+EG2Xh5lJuTtPoTLCBtGegiZh8vu8tEMCVfB/PZQawElPrRKCCNE9f9nuLXmYVi4VvW8n/8uSXTI2G7ipjMN72i3d61DAgw7WX8S2GlaecaLCJnuumRoJcoj11qjuY4zqweNRfCGdv1Ey0Q3eGHz43MDRlWky3TykhMFVlvADuyHzz4sCtGthSLXPmYiPwNnCZPm3Q5oI1Tt+yOGHIwXPqM3ssYLyiU50/dG6gXpeKN+M+BuF5ejka2VXQVwB0eSL5mdv1UkFvjtf1NcabTtFub4SijgMlQl06q+GXnbTznJ8YnOWyrQ43iim9I/I</encrypted>]]>
			</text>
		</command>

	</commands>

	<script>
		<text>
			&ScriptVoucherInit;
			<![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS86MfU2bvIdHD+hArj7qQd5Rjgo2Er5/TJhH0k3Bi80yJLatxlBaLEKe/PBvL326Utw8zBlj6j+r1dWFgLy7rU+w==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>0hgwjzJi+TIUMzmBy9E9EOww5+l6QPEeC6CXwZza7eWpPLVhgO+5aHBj5i0gtquQ4uYBz/fDrbt7HuKpVZXG+HjLvCXiUhjCbHWn1nyjj9EAsRz3VRDjiJ0m/BIl1FVembEXCgBEEP5sOMejD1O1frrFXaCZZgYHFzBpSF5WJx/p+htQN/pvWJ7pdnaggTuvS9jW77DEL51wBs9L1t5NGQa+Yvb+peh00OIb/bYRd2RLSviGYRTrvDQJe2S4xvGE</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>i5hEbEZqrtmrI2CNst9i2ob0suwa3w9ZzpArEnzgAUQKF1SWLGgF0s2cGEf8Ww7MCRkmCi5WppAxocHI+F2T+stEl8OGpLNQvNXMXTsd8jfoYgRJd9qGjl9zenDSZikzdSxgmXl1a3WDuZoWTarDzck6FC6mbX5w/1MlLExAqXw2hbEEFzudVBN1cxM+998X</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>SUco7hur+dO4XBAIc7uZmvUQ4VPT2wJxNKk1iKHs7zi6h74zrGexEWooM/FvlSZ3JcWNAYHTASSV17rzvJG678+NSwbEHIyO68mmRouB8B420bfSCAKdwCzzKgVpaKuvZusID0V2S+G96rNBTEMRWNygU/F8Ldqovx/AOzZhJlxKinL1TB+54cF3TrZ/DK92ZY3txk1n40pSe57hOh1tGfVc3i4VE47RCo5Zj2mVg+tnJjBLriHoiPjcv0Er3U/uqfrEcScSfas+cb5/T4C+Tsn07iVA4MV34JP2zpLCfjD7sBsV2qzVm9L/yvXp0pCaPVn53cLB/M6MF30WB5FTqYR6jiN/fsPwAps/ZUft6Gw9IkAjZJ8Uvd2MAlNPB1Z+X5dCcWAKf3umvAJha5LJYA==</encrypted>]]>
			&ScriptVoucherNumber;
			<![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>T3wK0l7KUzFw/eQ7wf6diN6jG2BdmhekE2CL5uwvhnutFeWKvF3j4alOaqgVbwHX28KGLwObKN0xVbOZgkf5znvwHLhenaZ+4J3+C9Fb5m2GUinvxyFza+JMZk0mpqIVkh6YBl+D3Ouak+Cj//71ncdipfwBx8xR4VgLHOZjyC0BeXQf4sJYXtydUPpsNPPmvltD9CbypkRZoXUUlclgCT4oUB2sVKt3oYd/UMxee/gsqos0h9w9HK8GmzGErbP3UrPVedkk06myGkrIVIkuzW+xAJJFlRKbLZoQursRHvqk7MgzRiYRDno6KmMRDfsp8eAFpn5EFvQnncnEhyQkaFdC3sFu+GH7TRXz+ySnpBMczM9ym0VRpOHF8sLABZX5j1JehtASV7cKeG2ETrS55zWTwqqzTuErtfB6zDFV63FwzMv9uaE/t4ECsrTL1Idg0JjKhV5nqprDM72r5Es18tQ7SUG/N3FqAD1iiCD+dFu2PL1nl6nb/mWPlkm1TimHaZfAmG6/ARjyvbDceAZkD88dkmSVzRta1Dsw/8ZEXCHgwl5jElVD7fLRX2JsJQTB</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>TjoRrUlAcjNhL+7HIhvZCQn9Rbyazg3DnVPihtoWo92VdT0bx/qsEK605dhDLtBuk2pejp6cIoVGq7Km7DChfX/kyEnfH2N+puCqoJT3Xb2W0md0KWSdwSylyZ7gs7W38ysutF9LMNc9t4fe5dPLCAjYzhFmDQ1OYA2bUasepQUKOwgnhvrAPz3WP60GK7qD7AGR0EkxbzFEaSRjLiBAsQ==</encrypted>]]>

			<![CDATA[<encrypted>OTuPSNzRWR1txHmA5Keq6QkhN2EuHElvE9lmVCiSNhUVNsupOtjw3KX+PJnfC92Rec4x0KOa+8CajAy3CXUcFhE8QR7RTf3gVT3zrDAoMPFQjn1kpeXSdDJbwDQwAUOE1+CbTsZ/XJHstTe6vS5NUaL5lDxTodfPwO0GeGGGkXxjMlxHrMK9DdZaHZhpWX1eIM9OiOZlxLRToV2I/Fp3MRbkmJjMCvfgWoW0XuEXFNiA3Vgukr5AXqV+HQHCwxBiuPLQaQQYFhZj4jsPFtsCqstsLk4qnNLVq4t8q0IY8i6OPi6Jfr83vKo6TG/iCw6TUnXfLuYul+vZnTwCYykgdGYe7dABU8h4q81Wn9KHWg0=</encrypted>]]>
			&VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
			&VoucherNumberScattering;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0SVG/ZIFBAaT8lyFwW2eU1YEm9B/nkodjj/qIJ+aRz+i</encrypted>]]>
			&VoucherNumberReading;
			&CurrencyResponse;
			<![CDATA[<encrypted>N4dj+JyjPHsrrBQgaSsVHO+bGOE0h60DJ9SPXWEPvp3ff8UT3iroLNxA7iGi7vchZEZ2ipoMKX7Pq9j0E85yEsd5cBZsYj1Zu6wRftbiP5RbEYSimDURORALe2L2hdyUvZ8HEDnl7dncl4YYkLSzMFvUyTimbuTtQ8t4EH9T5nlus2e96VLFHR4xIqJLhovXW/RHOjK63mN85ppISEpAi3xNrYJWhT7djXKSOPXdMXG6Z4PVEzU83Ee2sAk2FoXorFhRmOtLRGD4Yoeo1C+ilNRgSywvBWXl0BMt9/TGStZ6TxKFAtng2KzyOP0eZ1jGTNFi7DHvXIVD+MICgDjAoWNjHXlhD+igQSQGbUpd++NvMaoERMcjnJvEZZvwINJ4VJYS46PQdwjEknxdkEBEi+KG8C5Q7aupL123Lsc9ZB+GYaNJIZTm8ZIw1/+w35d8W3QDjZaHi4hhyQGUPOr+TSRlt8GTlmdSTyGVnDref0j6qxvdeH5656/E3urLOvWCvdR/v97jcbThMRLGDkRkXH8nr0OfE0XJumfVTxj/RVpT9TC+WXU3GCO3NgtzmcIcq2t165im2i7Pu2ijrNwbhvSBIbBMkTQXzHu5upbXaWot7JSOFIqiLZLOmUaYZnm8</encrypted>]]>
			&ScriptVerifyInputVATInvoiceNumber;
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
				<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Rhj+g7IgJdvxGxW3ZOV+kD+vDDSt6HF+9SncAKOzHSQusARmA1Dr0HMQJAZS2+dZTZADYl7+wDeD5oXPx8iSzgKdWYnDS/hezn0k9qU+GbPn4Vvt2Ar0vF8OCBZjS+log==</encrypted>]]>
			</text>
		</action>

		&XMLGetVoucherNumber;
		&XMLGetExchangeRate;
	</response>
</dir>
