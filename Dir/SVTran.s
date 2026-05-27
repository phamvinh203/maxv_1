<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenStockCopying.xml">
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
  <!ENTITY CommandGetTaxRate SYSTEM "..\Include\Command\GetCreditTaxRate.txt">
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
  <!ENTITY BeforeUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\BeforeUpdateCurrentCustomerBalance.txt">
  <!ENTITY AfterUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\AfterUpdateCurrentCustomerBalance.txt">
  <!ENTITY CheckStockBeforeSaveIssueVoucher SYSTEM "..\Include\Command\CheckStockBeforeSaveIssueVoucher.txt">
  <!ENTITY CheckStockBeforeSaveIssueVoucher2 SYSTEM "..\Include\Command\CheckStockBeforeSaveIssueVoucher2.txt">
  <!ENTITY zCommandShowWarningMessage SYSTEM "..\Include\Command\zShowWarningMessage.txt">
  <!ENTITY InsertHistoryVoucher SYSTEM "..\Include\Command\InsertHistoryVoucher.txt">
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">
  
  <!ENTITY CommandGetEinvoiceInfo SYSTEM "..\Include\Command\GetEinvoiceInfo.txt">
  <!ENTITY CommandCheckEinvoiceBeforeUpdate SYSTEM "..\Include\Command\WhenEinvoiceBeforeEdit.txt">
  <!ENTITY CommandCheckEinvoiceBeforeDelete SYSTEM "..\Include\Command\WhenEinvoiceBeforeDelete.txt">
  <!ENTITY ScriptEinvoiceInfo SYSTEM "..\Include\Javascript\EinvoiceInfo.txt">

  <!ENTITY DetailVariable "@d81">
  <!ENTITY StockType "2">
  <!ENTITY DeclareStock "declare @stock tinyint
select @stock = case when @loai_ct = '2' then 1 else 0 end">
  <!ENTITY DeclareStock4Delete "declare @stock tinyint
select @stock = case when loai_ct = '2' then 1 else 0 end from m81$$partition$previous where stt_rec = @stt_rec">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">

  <!ENTITY f ", rtrim(ten_kh) as ten_khthue, rtrim(dia_chi) as dia_chithue, rtrim(ma_so_thue) as ma_so_thue, @taxRate as thue_suat, @taxType as thue_cn">

  <!ENTITY CommandCheckVoucherFlowBeginTag "exists(select 1 from d81$$partition$current where stt_rec = @stt_rec and sl_xuat &lt;&gt; 0) begin">
  <!ENTITY CommandCheckVoucherFlowEndTag "'$NotAuthorized' as message return end">
  <!ENTITY CommandCheckVoucherFlowBeforeUpdate "if @@view = 0 and @@action = 'Edit' and &CommandCheckVoucherFlowBeginTag; select @message as script, &CommandCheckVoucherFlowEndTag;">
  <!ENTITY CommandCheckVoucherFlowBeforeDelete "if &CommandCheckVoucherFlowBeginTag; select &CommandCheckVoucherFlowEndTag;">

  <!ENTITY BeforeVoucherUpdate "if exists(select 1 from @@prime$partition$previous where stt_rec = @stt_rec and status &lt;&gt; '0') exec MaxvOnline$Voucher$BeforeUpdate$SV @@prime$partition$previous, d81$$partition$previous, @stt_rec, @@action, @@userID">
  <!ENTITY AfterVoucherUpdate "if exists(select 1 from @@prime$partition$current where stt_rec = @stt_rec and status &lt;&gt; '0') exec MaxvOnline$Voucher$AfterUpdate$SV @@prime$partition$current, d81$$partition$current, @stt_rec, @@action, @@userID">

  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd81$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec
exec MaxvOnline$App$Voucher$UpdateGeneral @@id, 'm81$$partition$current', 'd81$$partition$current', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec

declare @allocateKey varchar(128)
select @allocateKey = 'stt_rec = ''' + @stt_rec + ''' and km_yn = 0'


exec MaxvOnline$App$Allocate$Number 'd81$$partition$current', @t_km_nt, 'cp_bh_nt', 'm_round_tien_nt', 'tien_nt2', @allocateKey, 'stt_rec0'
exec MaxvOnline$App$Allocate$Number 'd81$$partition$current', @t_km, 'cp_bh', 'm_round_tien', 'tien2', @allocateKey, 'stt_rec0'
update @@prime$partition$current set t_tc_thue_nt = @t_thue_nt, t_tc_thue = @t_thue where stt_rec = @stt_rec">

  <!ENTITY Post "
declare @group varchar(128), @glMaster nvarchar(256), @glDetail nvarchar(256)
select @group = groupby from @@sysDatabaseName..voucherinfo where ma_ct = @@id
select @glMaster = rtrim(val) from options where name = 'm_gl_master'
select @glDetail = rtrim(val) from options where name = 'm_gl_detail'

if @loai_ct = '2' begin
  update d81$$partition$current set stt_rec_dh = '', stt_rec0dh = '' where stt_rec = @stt_rec and stt_rec_px &lt;&gt; ''
  update d81$$partition$current set stt_rec_px = '', stt_rec0px = '', px_so = '', px_ln = 0 where stt_rec = @stt_rec
end

if @status &lt;&gt; '0' begin
  exec MaxvOnline$Voucher$Posting$Inventory 'm81$$partition$current', 'd81$$partition$current', 'r70$$partition$current', @stt_rec, @@id, 
    'pn_gia_tb, ct_dc, gia_nt01, gia01, gia_nt0, gia0, tien_nt0, tien0, cp_thue_yn', 
    'so_seri, ma_khon, ma_vi_trin, so_dh2, so_dh3, ma_nv, stt_rec_px, stt_rec0px, stt_rec_dc, so_seri0', 
    'tk_du = c.tk, ma_nx = c.tk, gia_nt1 = b.gia_nt, gia_nt21 = b.gia_nt2, gia1 = b.gia, gia21 = b.gia2, tien_nhap = 0, tien_nt_n = 0, tien_xuat = b.tien, tien_nt_x = b.tien_nt', 
    'update #in set ma_nx = b.ma_nx from #in a join dmnx b on a.ma_nx = b.tk where b.ma_nx is not null',
    @stock, &StockType;
  
  if @status = '1' begin
    insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tt_nt, t_tt, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
    exec fs_PostSVTran 'm81$$partition$current', 'd81$$partition$current', @glMaster, @glDetail, @stt_rec, @group, 1
  end else begin
    exec fs_PostSVTran 'm81$$partition$current', 'd81$$partition$current', @glMaster, @glDetail, @stt_rec, @group, 2
    exec fs20_AfterUpdateGL @stt_rec, '@@prime$partition$current', 'd81$$partition$current', @@id, @@userID
    insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec
  end
  
  insert into r20$$partition$current select * from ctgt20 where stt_rec = @stt_rec
  if @Stock = 1 insert into r90$$partition$current select * from ct90 where stt_rec = @stt_rec
end">

  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete ct70 where stt_rec = @stt_rec
delete ct90 where stt_rec = @stt_rec
delete ctgt20 where stt_rec = @stt_rec
delete cttt20 where stt_rec = @stt_rec
delete p00$000000 where stt_rec = @stt_rec

if '$partition$current' &lt;&gt; '$partition$previous' begin
	delete r00$$partition$previous where stt_rec = @stt_rec
	delete r70$$partition$previous where stt_rec = @stt_rec
	delete r20$$partition$previous where stt_rec = @stt_rec
	delete r90$$partition$previous where stt_rec = @stt_rec
end else begin
	delete r00$$partition$current where stt_rec = @stt_rec
	delete r70$$partition$current where stt_rec = @stt_rec
	delete r20$$partition$current where stt_rec = @stt_rec
	delete r90$$partition$current where stt_rec = @stt_rec
end">

<!ENTITY UpdatePriceStock "
	DECLARE @m_ma_nt_ht VARCHAR(10), @m_round_tien INT, @m_round_tien_nt INT, @m_gia_vt INT, @m_gia1 INT, @m_ngay_ap_gia DATETIME, @t_tien_px NUMERIC(18,4), @t_tien_px_nt NUMERIC(18,4)
	SELECT @m_ma_nt_ht = val FROM options WHERE upper(name)='M_MA_NT0'
	SELECT @m_round_tien = val FROM options WHERE upper(name) ='M_ROUND_TIEN'
	SELECT @m_round_tien_nt = val FROM options WHERE upper(name) ='M_ROUND_TIEN_NT'
	SELECT @m_gia_vt = val FROM options WHERE upper(name)='M_GIA_VT'
	SELECT @m_gia1 = val FROM options WHERE upper(name)='M_GIA1'
	SELECT @m_ngay_ap_gia = val FROM options WHERE upper(name) = 'M_NGAY_AP_GIA'
	
IF @m_gia1 = 1 AND @ngay_ct >= @m_ngay_ap_gia
BEGIN
	SELECT * INTO #d81tmp FROM @d81
	SELECT TOP 0 a.ma_kho, a.ma_vt, a.sl_xuat AS so_luong, a.tien_xuat AS tien, a.tien_nt_x AS tien_nt, a.gia, a.gia_nt INTO #giatmp FROM wrkin a
	
	INSERT INTO #giatmp EXEC MaxvOnline$Voucher$UpdatePriceStock @ngay_ct, '#d81tmp', @stt_rec, @@action, @@unit, @@userID, @@admin
	IF @m_gia_vt = 2
	BEGIN
		UPDATE @d81 SET gia = ISNULL(b.gia,0), gia_nt = ISNULL(b.gia_nt,0) FROM @d81 a
			LEFT JOIN #giatmp b ON a.ma_vt = b.ma_vt AND a.ma_kho = b.ma_kho
			LEFT JOIN dmvt c ON a.ma_vt = c.ma_vt
		WHERE (c.gia_ton = 1 or c.gia_ton=4) AND a.px_gia_dd=0
	
		UPDATE d81$$partition$current SET gia = ISNULL(b.gia,0), gia_nt = ISNULL(b.gia_nt,0) FROM d81$$partition$current a
			LEFT JOIN #giatmp b ON a.ma_vt = b.ma_vt AND a.ma_kho = b.ma_kho
			LEFT JOIN dmvt c ON a.ma_vt = c.ma_vt
		WHERE (c.gia_ton = 1 or c.gia_ton=4) AND a.px_gia_dd=0
	END
	IF @m_gia_vt = 1
	BEGIN
		UPDATE @d81 SET gia = ISNULL(b.gia,0), gia_nt = ISNULL(b.gia_nt,0) FROM @d81 a
			LEFT JOIN #giatmp b ON a.ma_vt = b.ma_vt
			LEFT JOIN dmvt c ON a.ma_vt = c.ma_vt
		WHERE (c.gia_ton = 1 or c.gia_ton=4) AND a.px_gia_dd=0
	
		UPDATE d81$$partition$current SET gia = ISNULL(b.gia,0), gia_nt = ISNULL(b.gia_nt,0) FROM d81$$partition$current a
			LEFT JOIN #giatmp b ON a.ma_vt = b.ma_vt
			LEFT JOIN dmvt c ON a.ma_vt = c.ma_vt
		WHERE (c.gia_ton = 1 or c.gia_ton=4) AND a.px_gia_dd=0
	END
	
	UPDATE @d81 SET tien = isnull(round(so_luong * gia, @m_round_tien),0), tien_nt = isnull(round(so_luong * gia_nt, @m_round_tien_nt),0) WHERE px_gia_dd=0
	UPDATE d81$$partition$current SET tien = isnull(round(so_luong * gia, @m_round_tien),0), tien_nt = isnull(round(so_luong * gia_nt, @m_round_tien_nt),0) WHERE px_gia_dd=0
	
	IF @ma_nt = @m_ma_nt_ht UPDATE d81$$partition$current SET gia_nt = isnull(gia,0), tien_nt = isnull(tien,0) WHERE px_gia_dd=0
	IF @ma_nt = @m_ma_nt_ht UPDATE @d81 SET gia_nt = isnull(gia,0), tien_nt = isnull(tien,0) WHERE px_gia_dd=0
	
	SELECT @t_tien_px = sum(tien), @t_tien_px_nt=sum(tien_nt) FROM @d81
	UPDATE m81$$partition$current SET t_tien = isnull(@t_tien_px,0), t_tien_nt = case when ma_nt=@m_ma_nt_ht then isnull(@t_tien_px,0) else isnull(@t_tien_px_nt,0) end
END
">

]>

<dir table="m81$000000" code="stt_rec" order="ngay_ct, so_ct" id="HB1" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="hóa đơn" e="Invoice"></title>
  <partition table="c81$000000" prime="m81$" inquiry="i81$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCC5XZ1IDPpaDqirJElpwGphj7k0IfLUu5dBXM9DEqppA==</encrypted>]]></clientScript>
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

    <field name="d81" external="true" clientDefault="0" defaultValue="0" rows="118" categoryIndex="1" allowNulls="false">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="SVDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

 
    <field name="tk_thue_no" allowNulls="false" categoryIndex="-1">
      <header v="Tk thuế nợ" e="Debit Tax Account"></header>
      <label v="Tk thuế nợ" e="Tax Account"></label>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
    </field>
    <field name="ten_tk_thue_no%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="tk_thue_co" clientDefault="Default" allowNulls="false" categoryIndex="-1">
      <header v="Tk thuế có" e="Credit Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_co%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCRvza43Qf1tfL9ePAorX7wCMrfhaTrC2SByR25B6b6EA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_thue_co%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>

    <field name="thue_cn" type="Byte" dataFormatString="0" external="true" clientDefault="Default" defaultValue="0" categoryIndex="-1" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh2" clientDefault="Default" categoryIndex="-1" inactivate="true">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_thue%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default" row="1"/>
    </field>
    <field name="ten_kh_thue%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Amount"></header>
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

    <field name="ma_nvbh" >
      <header v="NV bán hàng" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1 = 1" information="ma_nvbh$dmnvbh.ten_nvbh%l"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" defaultValue="''">
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
    <field name="ghi_chuthue" clientDefault="Default" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="9" disabled="true">
      <header v="Tổng tiền vốn" e="COGS Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="9" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tc_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="9" disabled="true">
      <header v="Tổng doanh thu" e="Revenue Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tc_tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="9" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="9" disabled="true">
      <header v="Tổng chiết khấu" e="Discount Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="9" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_km_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="9" disabled="true">
      <header v="Tổng khuyến mãi" e="Promotion Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_km" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="9" disabled="true">
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
	<field name="fcode1" hidden="true" readOnly="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
	
	<field name="fcode2" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
	  <footer v="&lt;button type='button' class='btn-inform' onclick='set$Voucher$CreateCashReceipt();' span style='color:#0000ff;' &gt;Tạo Phiếu thu&lt;/button&gt; " e="&lt;button type='button' class='btn-inform' onclick='set$Voucher$CreateCashReceipt();'&gt;Create Cash Receipt&lt;/button&gt;"></footer>
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
	
    <field name="so_hdxk" categoryIndex="12">
      <header v="Invoice" e="Invoice"></header>
    </field>	
	<field name="so_van_don" categoryIndex="12">
      <header v="Số vận đơn" e="Bill of lading"></header>
    </field>
    <field name="dia_diem_gh" categoryIndex="12">
      <header v="Địa điểm giao hàng" e="Place Delivery"></header>
    </field>
    <field name="dia_diem_nh" categoryIndex="12">
      <header v="Địa điểm nhận hàng" e="Place Receive"></header>
    </field>
    <field name="don_vi_vc" categoryIndex="12">
      <header v="Đơn vị vận chuyển" e="Shipping"></header>
    </field>
    <field name="ghi_chu_xk" categoryIndex="12">
      <header v="Ghi chú" e="Note"></header>
    </field>

		
  </fields>

  <views>
    <view id="Dir" height="174" anchor="6" split="10">
      <item value="100, 35, 75, 35, 65, 0, 0, 37, 100, 100, 15, 62, 55, 100, 0"/>
      <item value="110100000011011: [ma_gd].Label, [ma_gd], [ten_gd%l], [stt_rec], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="1101000000-101-: [ma_kh].Label, [ma_kh],[ten_kh%l], [so_seri].Label, [so_seri]"/>
	  
      <item value="1100000000-101-: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct]"/>
	 
      <item value="1100000000-101-: [dien_giai].Label, [dien_giai], [ngay_ct].Label, [ngay_ct]"/>
	  
      <item value="1101000000-111-: [tk].Label, [tk], [ten_tk%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="1101000000-1101: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l], [status].Label, [status], [loai_ct]"/>

	  
      <item value="1: [d81]"/>

      <item value="1101000-11100-1 : [ma_ht_tt].Label,[ma_ht_tt], [ten_ht_tt%l], [t_so_luong].Label, [t_so_luong], [t_tien_nt2], [t_tien2]"/>
      <item value="110------1-10-1: [tk_thue_no].Label, [tk_thue_no], [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>

      <item value="11011----1-10-1: [ma_kh2].Label, [ma_kh2], [ten_kh_thue%l], [thue_cn], [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>
			  
	  <item value="110100000-1100-: [ma_tt].Label,[ma_tt], [ten_tt%l], [fcode1], [fcode2].Description"/>
	  
      <item value="110000000-1-10-1: [ten_khthue].Label, [ten_khthue],[t_tien_nt].Label, [t_tien_nt], [t_tien]"/>
      <item value="110000000-1-10-1: [dia_chithue].Label, [dia_chithue],[t_tc_tien_nt2].Label, [t_tc_tien_nt2], [t_tc_tien2]"/>
      <item value="110000000-1-10-1: [ma_so_thue].Label, [ma_so_thue],[t_ck_nt].Label, [t_ck_nt], [t_ck]"/>
      <item value="110000000-1-10-1: [ten_vtthue].Label, [ten_vtthue], [t_km_nt].Label, [t_km_nt], [t_km]"/>
      <item value="110000000----11-: [ghi_chuthue].Label, [ghi_chuthue], [ma_dvcs], [cookie]"/>

	  <item value="110----: [mau_hddt].Label, [mau_hddt]"/>
	  <item value="110---: [so_seri_hddt].Label, [so_seri_hddt]"/>
	  <item value="110---: [so_hd_hddt].Label, [so_hd_hddt]"/>
	  <item value="110---: [ngay_ky_hddt].Label, [ngay_ky_hddt]"/>
	  <item value="1100000: [status_hddt].Label, [status_hddt]"/>
	  
	  <item value="11000001100: [e_mail].Label, [e_mail],[btn_lap_hddt].Description,[btn_lay_hddt].Description"/>
	  
	  <item value="110: [so_hdxk].Label, [so_hdxk]"/>
	  <item value="110: [so_van_don].Label, [so_van_don]"/>
	  <item value="1100000000: [dia_diem_gh].Label, [dia_diem_gh]"/>
	  <item value="1100000000: [dia_diem_nh].Label, [dia_diem_nh]"/>
	  <item value="1100000000: [don_vi_vc].Label, [don_vi_vc]"/>
	  <item value="1100000000: [ghi_chu_xk].Label, [ghi_chu_xk]"/>
	  
      <categories>
        <category index="1" columns="789" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="100, 50, 70, 100, 25, 20, 80, 0, 0, 0, 100, 20, 50, 50, 8, 100" anchor="6" split="10">
          <header v="Khác" e="Other"/>
        </category>	
	   <category index="12" columns="120, 30, 90, 20,30, 150, 30,80, 80, 80, 80,80,80,80" anchor="8" split="16">
          <header v="Xuất khẩu" e="Export"/>
        </category>	
	   <category index="10" columns="120, 30, 70, 20,30, 150, 50,80, 30, 30, 50,120,180,180" anchor="8" split="12">
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
        &CommandGetTaxRate;
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandCheckVoucherFlowBeforeUpdate;
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
        &CommandCheckVoucherFlowBeforeUpdate;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<encrypted>gJoFmK0sS0RHBg6WicanqfW8GRTAxWMtvLxF2lGmq4CwE3dKd8FHC0tDYOh9hXw3vpZAdr7kTN8gLqv1BOARGs2dy6k3EsRZtV4tlBEjsXgMyHKnehcPbRxTATDFclFdVlZIAovzTIhxWtHmR4XWw0e6d0QIFSCxHwAf0MoPJLyS8m9gBmd1COU9L7SO7Cs6</encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<encrypted>gJoFmK0sS0RHBg6WicanqdURDJsh2H0jnh9j9+Pc6/lwEoOi6IpHIuUBs9BxDlxpqKOxJNU0VtOsoZrqIV+1M/sYSpxax4pnKpgHUj/ytfKwOTQyeffubIsXLtyuv7pS</encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<encrypted>1CMDZy4XU0afqFY1wQlKEWJCV07kxG++ttNdFWIsUqJSoha2XwwBYat8kJ88SDVBKUgcoLjoVCawD3iOUUZRfhuqYKSmxCtQU7eK+uTsksGGUENV2+Ai8+EJVnhLmz1N0Oaga031PDltiySNOOZwSypYDpl+7PXO5WT1KFzEgbyqnZ6dlPrl2bLhhEAzBmY6BNV6G/TrOOKhL3fUGuGmLKmQW9YUbGqpDQ+G9MJhN1I9WiS/1zcAgsvMch9wZkNPdhacZrKtXAEtT4WcyQcUlGrOvmrmVQ0fL9rBdEJ+8OB74/vRnFrR3Y/Lf+6hmT4uKRm/SAYkR18E/FzBDsQKuw==</encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<encrypted>LShulveQMeWQ3P4ZyXMGEEhB2OPFCAmGFBZmph8U+bUJDM3mRL2mVM2Ppp75ZeP+rhnRrZ+vWzpYv5maj5oltQ==</encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<encrypted>LShulveQMeWQ3P4ZyXMGELVvInascRTLJxR2tGzEEDTJYbPFXj8yQmYbLLskyB266Q3j2CIgWFATOVyKydcAHv48j0l0WPqz/Jf4GMZnLvQ=</encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>gw+XAHIzw+iJmFdFQc2yI5T3vOxiOhbap3uyUXpOg8eoyQuPwYlbkAOT5JuOK10LKQTcMrS4sPNIwJVfKgaMfERS7vCOaBJ+FXaBrdENkkZ53jXqV4KTWVcAC5M5AIfrNXdU7mrNjWkC9byWh4cGIeSpHajIdDkIFgC0InjThihfi+tiugr0Fus3jynC/5HS5D/eX2qDmK9Beh05M+Bn91Zg0Fjprcd9gX4iEJy2YS/oqFM9TewsVOu30fO289X1JFX+cHqvLMIXSA7LsKaBSVV5fxKknZ/czCimvm4wsQqKYr+jwffp/RRU0PfOUsSMldMw4ZDUqtOA/wPn8vfnD+GIqj/OIBmLE2aIqqVHknv6R8jBwUWelCXlWazxS88Eig+RNBVBh0TNe3gP3BkQRyzzdaAEJHh63o91m91MUI0=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CheckStockBeforeSaveIssueVoucher2;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>PgHK5RqSLEOh+6nrblCIToN2pPDVe507G0e+vTgSg12f41h1thxvUGmfoysv+apMadTLB1KDuEox9FFiGDIK/LUL8+HJWb4nC56bBpjVE5B5Gp9Qy0z/H1s9hIHxuhpMQjIuuLkkX+wBJHMrDiunu2SwLS5YEXmLgG7Es6PJONp4rksVZ/aceNSSQzJgdGLzIkEI7s+RhiaiJNBNu5do1w==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>FqSiSR1SqAnqNH7h7G2JQ0cgs3y9U7+eUWjOmWRBnM7e4q4GehClXY8EGP4FZMsUtcDxktQjUX5q5OnyYD+BDLrirPXsPt3YCjYtVU9Y4PT28cAnJOQCpHVUA6ARXlhbmRHiK8BEG18zaMZ0KyM5vmvK//yxIGDuyjMbb3UixCI0b+DBJV1G/HDLfpMQ2mBZ8z+xYfLZB8/klI+AVrZLvg==</encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
		&UpdatePriceStock;
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
		&CheckStockBeforeSaveIssueVoucher2;
        <![CDATA[<encrypted>gbsxB/dz4dyxKyGnhy8tzewpryMF5wFcsTOaHJJ/zojgy2w080cFVaDmI+FPF15sVh+6LGcRQ2f6ZHI7ezo8dMfABINDv/B930uf5YEDTFkByaEiWHDpvSvVtgmJn8NrTxTqmvgb9gJ+m8jTufFyKYOUpcLjEA2BQUtegPq0LuE=</encrypted>]]>
        &BeforeVoucherUpdate;
        <![CDATA[<encrypted>aRHOPduaPOHwS3jrxJxIpia2j5IZI4o+XUUhM25soNQBl1xxRCIfArndKKcY7dQkZbrCWbWJdFDmlG6vFa2vSt5hXgt6sGtwPy1l53QBUo+h2dgIHvgOjcpQkHRS1AO8MrfMOuNw4ppjTWfvIaNAKfWKKrNf71LiB2IWCNkSzc80UNNo4PJ0lPAtMxKnVK6DvvvEA1PvGikkLdLQIuCI48Qt2DgG3TgwnF5GznUqHXFhm2aV83ENM9VqOlCI1qxEimoRWZ7aV5LnA4o/OjYkstUIQ2CR5RESWRV/D6kozC1nKUvuA8+6sFro5VaGOcMv8t62GmUQ5tHwZ1BsS45ikw==</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>s3fgwg1KlH4vfLxMnRyE8qYO3YFan5mzt80xnFxnodstCZlsVQCTQOvdx68yyr2R43xwLl/aNxx9YpJT8X3mqm2Eb3IYSqEKNhRDAENAaATabH0T88LVqn9LVBU6gdTRXCe8dnnNa2BQ+CaDiGWgL+xx6kc5ggAke9e2dtgkBTMhyxot7sGOmKvOCHTxUn3ZFBcXsnBSHzdbunlOt5OOu00kdaIZcuopKjcBMSsWgw4saFDzMVmrDRqmuyoz8RJcPT7Yr2JDq1Qa14tkuUpSyZW6T3VO5WCO+pKGituPrDw=</encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
		&UpdatePriceStock;
        &UpdateCurrentStock;
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
        &CommandCheckVoucherFlowBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<encrypted>0Uwf7eyRyHmbr85TV5ncQ1GlxQLQiAUxT5iGMLQkTrxFlZXhp3V88KGzYVwIfRMQ1cOSIzw1+4kRW3/mkCrYH8uj7NwazHyZDYSGgEsKNMGDOlNK7jzHlrCKEhGEgioBZsR5GrlDEctDJjUZ3ZJFHxI7GywLD1XbFaQ9aSB7xuw=</encrypted>]]>
        &BeforeVoucherUpdate;
		&InsertHistoryVoucher;
        <![CDATA[<encrypted>gf1kCmGzopQeffAMFVthPHHmfe8Wj4iI6CovYn6vXIXzRQ+HwaTSVXinKKm0hmGy9mP2aZLRHWYO9hKYjEFxnReYpeP8lFV6y7OL3YZm7+bomOUCh7CPLcPEa/MpIbrgj0mGa8XuVKgj84lTp/16pg+HD+6AUYbydCk0X1jH7xXnnYZUiIEKZrezPLVQZVV2B0c/7+dIoTR+Lf+d/hOewzEYs85T83s/fMX1m6NQoxQ=</encrypted>]]>
        &DeclareStock4Delete;
        &DeleteCurrentStock;
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>mGGC2lKnWZ4X0oqe2uLItXL8nfXfzainz294/7BH1BDUmrE1eHcODhoohCeFF+ZnpMSWpcXAE9+WWpYnHCiH7Qg5eU7gzuHj58rMvtt4SOgqrMWgjES0odfaqvGGGUxO3dCrJQd8/WXa/Jbfn9lS82EtlIGDGCQi5upLRHXVOOyFB71c/iyKD57z6yIRZ6d4px98V7AVUXn5yr3vr565HBh9dIw+To7VaV0ZpDaF3d1p0TtVYZXTt3bAPgCT4xvZv9pCeoe2bOvuAqtywQlmBur0GH/8TKNz1hGE52ap1e7Me8si78qsi8B77NFZBUucFPufzbR2R7DiB/n32dYcvgsQBg6f8QmDUcaFZJHUBu4my7468t0zglL82HmToiEYEnhKOFi5aLU6ChUqzYtO5zX0O8atdzy8gO0uj2Rm4yTk1fnG499KYr/JlWefWHQLnQAsZjEzCu2Bpx1pP3CS1RA+8nqweFeU6VhFOWtdRVUzrtdUQTy+5MdWRwxSMcS3B/hjRT2Qa1tbNAzIsosPoeAdW1U9ZsBppu+b4bfhyT2B8PeKmKzGTv0IfnzhXgph6YdddS3XR8RTr6f2+O/qobZfCepmHjmjYNnxJJgKHerDP6iWFOjxTNvEqJeBhiqjgRtyejX9wIRsSUUTtcbwwaQsN3jUCIBW/vP+kNNUaHcpVSVdsCFtqdDOJaJXiZP50uYo1/UeOC19xm2yhrZ3Pbv1cAwkI7maMhCg++nGqlDMfgT5JVlZqwEsCOZoifsHF4Hn1wHR1m9Ooh9asYRB7+IBVJm8VdNepS/dwlUjcaNClUrdL1/Cgn4k1T0V+54etIJrdnTb4wItDgBnZZiGq4Go7z0A4gAqutHIXP2l8/6HA0inshSYtssvcP4LYtzjzI1pnIq2bqOiFZzUuaz/fX8WT7HD0tK/qxEBxlAaiLfZ8gXMjbawxbOUnm0E0vsQOIr5Mf0mv50d4Qo74y9hPIWrtlPyHEGFgGjaZWuMWUF4nG0rNV0HHGIghHrqpistoJrCevSkGpJTNmso6U/tPA==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS86MfU2bvIdHD+hArj7qQd5Rjgo2Er5/TJhH0k3Bi80yJLatxlBaLEKe/PBvL326Utw8zBlj6j+r1dWFgLy7rU+w==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>uhrlcb6HDys5Ngs60yFcJo9Va/eizbJd0xlyuWA48x+AkKb3OSkPI2ruHGbQNgFgf3LT4vFlNH+CdEmGgWP7YGkj8oUc0t6YjT4PeKIg2MZ8GlTg1/CxIxksqwug/DpTyDnrMWWSFfZfcur4YVofYJg/WScScdfAh3L/AGAtuiCp1Do7rt3UtBf8GwzaoXenuk3IfSxNLXRIzi5VXW9P9t8Mch0spM3Sw/jdzeW1I8Q=</encrypted>]]>&ScriptEinvoiceInfo;<![CDATA[<encrypted>z6XAeCe9Xbs0uyHGQIy3OGDNXw9zsXMI28eumAYuvWSvurQf6XxJU/ptgp5+43PbNFSUar6ROQxKUT08Xc9Iiw==</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>GlNezHyxcs72OQckj4rk/CnyiwbAodnUcUKG555cxJIDn8MiB00oX7rX78SOvDk3Zu7hL9FOP+doXIzJW2pCl60fZITUIVbg3miiCmm8wOqgIMciv9jBcAn2/I29d0QwRMOu+DGrenytc0teE7lih7hU+VokpK1HJpOkROIKIcY=</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>tnlkDzDm6NZ1Xbr2dA1GVGj3hLFU6npJhCYZuNfOvXRVhmz9GR1onNafx6SudaLIR4ivsVWmKSH1waf8Bthf0Htb3y+/aqfkOjacMwIiI6ZJAyYqtK4KJftbROJigiq1PzPkJ8dJaXs24qKKFp8KgyadzJAN+bVwGrCLGX7cKSJo4dOhZkQD0s3q2ozjM2Bn5VN1iq7SMu96ZvtEpoNuqbWvFxNE1v7PIVcgmt7klHj1s/G9evF+cPG9ZJ7SxRK9e3uFaPF89QY1UEmoFX5POBwN0aq+UeUewq9xBrR47Uy5uQRBgvOyPixk0gpDLTVLRc7EQ+jSVKxd95gZJB19CP8o7rqEpp1mIbGVwQg0/2pfjgw8c8MyZXlwGVd9cVR3GApm4JrARUQhT87PUTZw5IUBEcuiewk1R9hpS1daKH7V0/cCnZIi910XRibDjiPn</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>dt+cIaOLYb9Ie4e9SUKOxUFKpMj+ZfA+Pg3xEKAULjBdsBqQErsnNRBi6OeOqBE72/paUrtsPPEHCdT6uVR+XB1Kpqr4J+Dp1NPJ4JSTHltZy8XYfDxmJjMM9+a3QcLIf8a+ZQbeWL0A68Dljgs+afAJOzaRs916l6uxle7S9OK5+06ThgU1v04Vqi/rUxPP98xUNrT5s1/DsTJXHcnuM68OxbaV0TvUrOsRQYtrvCifmt2qXUubhredHn/BLjaAB2gmPBr193KYThUzRWLZssNp8SQ1ZJHoMoA96vq/KoNIT8/TiY9as05vvJ/lje9dvl2dHeJ0HUyhyllnfj0sVMkgL7Ou1zKOUJKQO0qPEzKE2tnHKr6EvXp9Q6DRVTx6sN9L1YbZ16jIPjYaSAYmeep9dC/1KIZ2TNMxrBX4/hK9dXITKWd2nF3n0mq/FVdX4+4892hpxo3/m5/FPFfKnwguq0Bqdk+dFUlm4bZWjKYi2pMeNK+EbEbwAFC7A0yb2f3Q1tyGyioZNI/E1+cfaiRr9hUv719QD8e1Nch9rpCWVVjBYEQMHbNycyShSEPdWL5tkcAC3+WeI6XH4pMMlez79NRXkd/huXFcRjgJP93Zl8FT+3yQ0hHyCmOEc+vgRIQa+J4RqntWbRqV1SAvUQ==</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>dZuKR/jq1Bazi7Oxu3xsAS81FITgWbB6JAQfC2wmwKSYO27iBqKiicZEp0/ZGCgty9GB0bZEfOAe7r7okZWp/BYEdqzcy97qu+8vj/+rwb0WwwDrxAJynqdScZ7FMcvBoX+zATvOhD8a/1dAiherBAxWVRuc3YLw0HDNnj7RpicjVemEwEi7tzs0u7OexAR1s7AbMTCRy5FAs2tZCVXp/g==</encrypted>]]>
      <![CDATA[<encrypted>xG3pRVKrax+rDV9DbnJGwVOs5ZL7bLIPx8wJUfO/HajgG5FXkA5RXRqYpzUBOxIOhhkFDECIuVyHYqrHfTdOUUAiUnMlO7eU5qtbzauzBPIs6S7ilXg8LhuU/dU2BJd8G4cD/fAH1dfCOSHyx6V+6JN1wIKvllt5eytg2K3y9Z8TbwKaCs1/HHkPnvlhTMfuWEEZEuO8z5rixIKGuPjpCEsJlOd3vsj8Wn2cffbuvGIwIEay0Pr3u+qKHMpW7DPi65yI0fXnzGyDIjDeOk2afjMqICH3rU8G5ex6eiLBZu6OUwF7u8vvQQdcs9SJi5RSFQGy933sS61/eaJAeoTrfzmTyPOpBhjeBjrEvZ+BlFAE7t+pHj3/XHD2zt1QS04NDNMn7TWHeDuFbgy5kkRSeLN2roEMe4Ux02FQNLAFCdvOKwBMjGE50xfofA0p8t56PB57DIrHa/UuX5tlWEdmm+her/7NH+7B8+B2EakP0ciU/xYOd/M56GqSqjravyxfU0CmYXACqxUrtdYC64t/KQ==</encrypted>]]>

      <![CDATA[<encrypted>v1mcdMOMviRdgI07lhNNtZAi6r89u4Esb32okLcszZPbBl/+xpWXZfECB07Z8wGYcuaoLrVKx+evRIQO0aWjuMLXpfjd7VwTVJTFlAyigl/6weZxNJca6eXaKKJu3jPDbXLLYkk/VGiwuk3hYCVGHvsgwGJ90kBI8QmroRMQ3a1N3nZmt1KDXVpgfv6YgZgTUcdb4TvLo9G4yXzbD8gHaA==</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>MTdyUV3UMgY3IyGlghiU0i7aXo5Qow9zAZ4XF0iDXLoXHqewFQz6i24ZPKF6tZiMmqZwpwWAc3w5nXequMTNkuPLjMXPconOQllnC89hfBLzTvi3q3x6vALDkoX/rA09</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>MTdyUV3UMgY3IyGlghiU0i7aXo5Qow9zAZ4XF0iDXLoXHqewFQz6i24ZPKF6tZiMNyxhIJQ9RKBNil2a7oF0TQ==</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>S2IH6inuN/ATN2fzyAmYHeNuyZI/HDaV/gsgP/d2nJE1PuSANVnf5p0SNLisJfGI10SwgYPb15RnnKMaCCquUM2Jt7NFyze4BuPglEVyGw784rXkGKvJmC8kqAQ2ZVZJO9Vo23jKfuC9C6AtUFcD2YmOTQ25ET99Mu3HmJ86nUYq+Tr6gd7O+ofagSZP3xD8Hm25ZAU1Xq99m2qUtgoH8x0y+KXhtLHz1Ix4lA9hz5/myCXoQs5RWGk4KixI3KXpdU9r7Fn56usY148dZ2AbEmZhrEUGc+m3Q7QCixsteonb+SKdO+jlsSY9lRzyAYhiDAgODHOY0/6Tv7UUCKGZrowFHYaUoqJemedooRomxgqwkvKhtFZPOs4xGXpbFKruhuJ6kOh0O481snNlh2goqEMN7aMl29McEtTqUkl0/lO0RLR9iV8aeAiMLFeG2ExhrooucIOPfWo9GSmKP2yqKJ6VXNkEx+0xJ6tdeo6env2fEksvpVwVUUhTuFo2kOEhQ04fuWKGvNLR3vDh+X8R5dN9iUe2mPRjDJrr6kIVprf2mj61wkYnF8DiPJzK0LDR+znlM1E//5ZxFMprlp80SgS4GJs2on4gk5sLPLb4AxoGWk2UTT1fDyJBiYXpP2UwMWt0YwiDwZFqeVq0g89zv8nw2SlKa8WMRVukdkxUNOGOFVxMN/sGzlXRaRx+x8CwknIuW0+Omg7H6wPJVHcd0HW1XxIIur6e2J0Haml6dmlVEgcpM1yssOhHG73BvsGCVu0oatyYqymDHz2ZvPaBlIl06vUcvLBY5TgCdxCOsR+HkE9FYAsvMA8NLfS5LG2Iu0cJRJbsTIkcldP0lCYtwJFVWlLq9mpAZQd4dH1Sj+B32H0uuSs+BMFqTJO7sNV+4EO/pL/ImuYiLn1FCythyBUBI1DAZ5NxANOTWQob1svXvoWuAws6NcsDFcaBKOBPNhXn5/Cg52FlYC6WY+VoeBxSIMoBOzH+QIQgGNbRLCnr/tS4VCFuIzpuDYcGH9xsobeAQ1AJkU+RLDN/G57hXVmKDUaVLK4QLVyo3UkdLr18fTItDCpM2hpOE2CGtNOzFe9E/rwa4D9hc0iOI3cl6Ysb5FmKXDxR4I4KuCFwtK/iRDJwNBXsMVe11hzu4JVvWOYZEeEjdwDHyJC3EVOAPY7dfFVvILksKx7BSlCn1YU1CHA1KsGj0uHjIDyr22uj7sOPnZT70pTi6ompRL9HrJLpHPOnc90CExrXwBXTdXBY6bJgtFA5NrSbZSUHGXvyErxfFfVLjzq6hmGTIMOEMOMK+MxTadowGqZ3TVOEReXjphdZewuSGNs2s/R/Gvyip32drWh9d3UtlFRXvaZVfC1ziWEAljWlHhfj1TIwzL/KVzZoPOcpG8MYgiBHJowAQCTuGxN9PDN0EKsxnl3P7RVb4tKblDzPIcis+/BcUIYPdbYB5hktM7AmiKBWpoh+YxrXCT945EtkH2+86E8+rT/1SHtXx8qIa4EBse+tNFhA3Uvh+u/8l+jNs8a4zdli9k4CfAC9QZYoaiCVUeKpJ92T89U60Vn0xTUnsQVCczcZqV6CpKf+1WIaDxpT1Vr/SgMa98uZadwLVZs9P3itk6YK8bbIfKDyistdnbrp1+6dQkOFEt2TWVi3VaFLofp2XAXZNkgwvU7BrDjywropVUn1053VI/I2pguQJca4XwVC31t0+au/Hkz9oFC3b8p2kCYIjpeUfJXFIZiCBEZwVy14e5tl6DwwUd2pEIzoNGte4TY2G5rCzn5Uj8iwhYCfwWvRVSPHOUnFiXxMLBr5zNCJLpaoxOYk/CVWijYVuhFMnUVE+pR+HlLTw4+poyWQyIz2o/9tqPR8/mnz6DCKmDYgLOEUAiVfTXcTOM/WFUrtrJN9JkhebTJa3Kov9UJEMmWVJj7aSogOCOKN7x9Xbk17H7QSqGvWlrxgu/Ix13c=</encrypted>]]>
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
        <![CDATA[<encrypted>jcbaPdLtqUJz8NI077zpXVfVVvlyupPoH3SPbpU4dXzlQKrqEf9j+L0WVBCCkp6TSAYqO2v+ypeMMID+U+MLOORYv60U5+uy1RGbXdAtG6s4Uprm6nQgJ13/OM80zTm6HtFeZG6OejWzV4C/nNlLZ9DApDqsTCqyURtCBi0VMHZnExuK6MWAc+E/LaatAYwiw9PUVrwHP6+sM9G8Ac0itTSQMENjsBbyNDw2I308c+w/hYF5OPQ4/ACUCU27bzKzqnQa1ELN21t1jXXc8NgAgJUzUxb2RFLgYxVzAGVcGKMLaXjGQKgft45CRsIO8elnYN3/xn1AZ4htQ8esXUhDNQ==</encrypted>]]>
      </text>
    </action>
  <action id="CreatePT">
      <text>
        <![CDATA[<encrypted>tqgBxTt6XxmNOZ7IRyUEEgGj5HRmjfOybI1HkxQgVDioVhXr42VlidWhsj8nCuhrhxKDKf4qedKwkHfDoY4pyFqtI/2AX1YWko0dKcgS3N+eIxwAoQoPQSh+RgQyoDLjE7WRKq8kg8PFpRZkxiWzOYHFBnLDBx2fv+2L5HLs9ESkuY7lvusZzgPTihC7FyddYqgdzDn2n12OdJkoMeynGIzZp5tHXT8eZJRJ2p6iI3JHbDx8FAbQk5Lpd6rXMz5tKLTsA/hYQSLqc0Hh+DC/JjQuLWTt488WU+Y5dI4E4jwJB30YShvPkkdME8TPQSXvqU69+LCAjCx36yqAVkEPfY/cYH4fsGIpXLgsswx5wYEJJtavpYSZLKGYJCCAwZBc5/7k/GtojExRr1e/x8y9nefLMG9bjg7319mSPvDvT0cMIvsB45fRej9PWaY+zzD9</encrypted>]]>
      </text>
    </action>	
  <action id="CreateEinvoice">
      <text>
        <![CDATA[<encrypted>J/G05y0PcLd2VWWI0ubVLX+wMWRKUyrUOXASpAMyUys1nBV8XN+eoPlu7pHFvMkSGReu970T/Y/sS49EMbdoP/8hTJyMlwYAuZqPB2ofrRsOMppENeWhevwsKrhjbM2LPnETmDCf/XC5tqzohrtPVPQMeeEBTcxFQkVNodLAznRQEKmCCG8inpJf4GwI6oiDVNAfCEul5wC+aPYVUvxIlGHMequOkOwWyvB31GMNA23UyhmNholvmHCsTg4ndthQvSnswwRW210T7q5vjjkZNtwognDl6A5zN4RWlJYkjV1gyoASmuAjMVO11ECecG79d4pljdExVgoX4XcMGfvWreXYtcX9bgHNXBEYGjcBj8QCmw6bLk7PymTlVPG3DNEFh67S8iKsLbZWAdM4r2FVvQ==</encrypted>]]>
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
    <action id="DebitAccount">
      <text>
        <![CDATA[<encrypted>jWmBo64CRrF+JEhNPne6GIjleEIo2zwrif0DOhtteo2Yc+zhFkW6eqedCLwgBdpvfXR/QgmmoWfX1dMnA4FOYO8My1gOX77bDIvucWCUZSEKce6Xd6aIO0Z/CHYIqElVquM/Fr8NID+S0t0FmncoqA==</encrypted>]]>
      </text>
    </action>

    <action id="TaxAccount">
      <text>
        <![CDATA[<encrypted>N7LiRJ7cNOD8wE6tofodigwlMuYIdmfPuIgSNdFljSRNADb7l4rI39r5cBioAsyY+AruYotOcs5QHKMCjZenSVHXbEaQ5Od+j1YZYfPSvEFQwfEXjk6I5HRPz6yEjwgbR0Gwk8Dq/jShOP8pseaLrdQ+4S41CQncWPKtyB8ftfM=</encrypted>]]>
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Rhj+g7IgJdvxGxW3ZOV+kD+vDDSt6HF+9SncAKOzHSQusARmA1Dr0HMQJAZS2+dZZcDSIFhEX0pOwiFxWsmYGbmXtGGgJzAyUcVhMn6hGHoIaVOUGvSZLBeQlXSHbx+NA==</encrypted>]]>
      </text>
    </action>
    <action id="So_ct_hd">
      <text>
        <![CDATA[<encrypted>+Liw2wz5bmdGeUOihFLM81JhqZzXWCVNwgBHTwkdqh0abtRQ+SWShyasScX+NPShS4whNHId97rtLnz3D4nqvGrEHuM5ExrEye3nYSlhsKjIm2klN1jGMnmBuKPUS8xdlwHI4duo8dxQi2dn/Bno1geVv8RDxVQhDCYZC+7hB6o=</encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &XMLGetTaxRate;

  </response>

</dir>
