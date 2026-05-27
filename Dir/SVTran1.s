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

  <!ENTITY DetailVariable "@d82">
  <!ENTITY StockType "2">
  <!ENTITY DeclareStock "declare @stock tinyint
select @stock = case when @loai_ct = '2' then 1 else 0 end">
  <!ENTITY DeclareStock4Delete "declare @stock tinyint
select @stock = case when loai_ct = '2' then 1 else 0 end from m82$$partition$previous where stt_rec = @stt_rec">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">

  <!ENTITY f ", rtrim(ten_kh) as ten_khthue, rtrim(dia_chi) as dia_chithue, rtrim(ma_so_thue) as ma_so_thue, @taxRate as thue_suat, @taxType as thue_cn">

  <!ENTITY CommandCheckVoucherFlowBeginTag "exists(select 1 from d82$$partition$current where stt_rec = @stt_rec and sl_xuat &lt;&gt; 0) begin">
  <!ENTITY CommandCheckVoucherFlowEndTag "'$NotAuthorized' as message return end">
  <!ENTITY CommandCheckVoucherFlowBeforeUpdate "if @@view = 0 and @@action = 'Edit' and &CommandCheckVoucherFlowBeginTag; select @message as script, &CommandCheckVoucherFlowEndTag;">
  <!ENTITY CommandCheckVoucherFlowBeforeDelete "if &CommandCheckVoucherFlowBeginTag; select &CommandCheckVoucherFlowEndTag;">

  <!ENTITY BeforeVoucherUpdate "if exists(select 1 from @@prime$partition$previous where stt_rec = @stt_rec and status &lt;&gt; '0') exec MaxvOnline$Voucher$BeforeUpdate$SV @@prime$partition$previous, d82$$partition$previous, @stt_rec, @@action, @@userID">
  <!ENTITY AfterVoucherUpdate "if exists(select 1 from @@prime$partition$current where stt_rec = @stt_rec and status &lt;&gt; '0') exec MaxvOnline$Voucher$AfterUpdate$SV @@prime$partition$current, d82$$partition$current, @stt_rec, @@action, @@userID">

  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd82$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec
exec MaxvOnline$App$Voucher$UpdateGeneral @@id, 'm82$$partition$current', 'd82$$partition$current', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec

declare @allocateKey varchar(128)
select @allocateKey = 'stt_rec = ''' + @stt_rec + ''' and km_yn = 0'


exec MaxvOnline$App$Allocate$Number 'd82$$partition$current', @t_km_nt, 'cp_bh_nt', 'm_round_tien_nt', 'tien_nt2', @allocateKey, 'stt_rec0'
exec MaxvOnline$App$Allocate$Number 'd82$$partition$current', @t_km, 'cp_bh', 'm_round_tien', 'tien2', @allocateKey, 'stt_rec0'
update @@prime$partition$current set t_tc_thue_nt = @t_thue_nt, t_tc_thue = @t_thue where stt_rec = @stt_rec">

  <!ENTITY Post "
declare @group varchar(128), @glMaster nvarchar(256), @glDetail nvarchar(256)
select @group = groupby from @@sysDatabaseName..voucherinfo where ma_ct = @@id
select @glMaster = rtrim(val) from options where name = 'm_gl_master'
select @glDetail = rtrim(val) from options where name = 'm_gl_detail'

if @loai_ct = '2' begin
  update d82$$partition$current set stt_rec_dh = '', stt_rec0dh = '' where stt_rec = @stt_rec and stt_rec_px &lt;&gt; ''
  update d82$$partition$current set stt_rec_px = '', stt_rec0px = '', px_so = '', px_ln = 0 where stt_rec = @stt_rec
end

if @status &lt;&gt; '0' begin
  exec MaxvOnline$Voucher$Posting$Inventory 'm82$$partition$current', 'd82$$partition$current', 'r70$$partition$current', @stt_rec, @@id, 
    'pn_gia_tb, ct_dc, gia_nt01, gia01, gia_nt0, gia0, tien_nt0, tien0, cp_thue_yn', 
    'so_seri, ma_khon, ma_vi_trin, so_dh2, so_dh3, ma_nv, stt_rec_px, stt_rec0px, stt_rec_dc, so_seri0', 
    'tk_du = c.tk, ma_nx = c.tk, gia_nt1 = b.gia_nt, gia_nt21 = b.gia_nt2, gia1 = b.gia, gia21 = b.gia2, tien_nhap = 0, tien_nt_n = 0, tien_xuat = b.tien, tien_nt_x = b.tien_nt', 
    'update #in set ma_nx = b.ma_nx from #in a join dmnx b on a.ma_nx = b.tk where b.ma_nx is not null',
    @stock, &StockType;
  
  if @status = '1' begin
    insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tt_nt, t_tt, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
    exec fs_PostSVTran1 'm82$$partition$current', 'd82$$partition$current', @glMaster, @glDetail, @stt_rec, @group, 1
  end else begin
    exec fs_PostSVTran1 'm82$$partition$current', 'd82$$partition$current', @glMaster, @glDetail, @stt_rec, @group, 2
    exec fs20_AfterUpdateGL @stt_rec, '@@prime$partition$current', 'd82$$partition$current', @@id, @@userID
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
	SELECT * INTO #d82tmp FROM @d82
	SELECT TOP 0 a.ma_kho, a.ma_vt, a.sl_xuat AS so_luong, a.tien_xuat AS tien, a.tien_nt_x AS tien_nt, a.gia, a.gia_nt INTO #giatmp FROM wrkin a
	
	INSERT INTO #giatmp EXEC MaxvOnline$Voucher$UpdatePriceStock @ngay_ct, '#d82tmp', @stt_rec, @@action, @@unit, @@userID, @@admin
	IF @m_gia_vt = 2
	BEGIN
		UPDATE @d82 SET gia = ISNULL(b.gia,0), gia_nt = ISNULL(b.gia_nt,0) FROM @d82 a
			LEFT JOIN #giatmp b ON a.ma_vt = b.ma_vt AND a.ma_kho = b.ma_kho
			LEFT JOIN dmvt c ON a.ma_vt = c.ma_vt
		WHERE (c.gia_ton = 1 or c.gia_ton=4) AND a.px_gia_dd=0
	
		UPDATE d82$$partition$current SET gia = ISNULL(b.gia,0), gia_nt = ISNULL(b.gia_nt,0) FROM d82$$partition$current a
			LEFT JOIN #giatmp b ON a.ma_vt = b.ma_vt AND a.ma_kho = b.ma_kho
			LEFT JOIN dmvt c ON a.ma_vt = c.ma_vt
		WHERE (c.gia_ton = 1 or c.gia_ton=4) AND a.px_gia_dd=0
	END
	IF @m_gia_vt = 1
	BEGIN
		UPDATE @d82 SET gia = ISNULL(b.gia,0), gia_nt = ISNULL(b.gia_nt,0) FROM @d82 a
			LEFT JOIN #giatmp b ON a.ma_vt = b.ma_vt
			LEFT JOIN dmvt c ON a.ma_vt = c.ma_vt
		WHERE (c.gia_ton = 1 or c.gia_ton=4) AND a.px_gia_dd=0
	
		UPDATE d82$$partition$current SET gia = ISNULL(b.gia,0), gia_nt = ISNULL(b.gia_nt,0) FROM d82$$partition$current a
			LEFT JOIN #giatmp b ON a.ma_vt = b.ma_vt
			LEFT JOIN dmvt c ON a.ma_vt = c.ma_vt
		WHERE (c.gia_ton = 1 or c.gia_ton=4) AND a.px_gia_dd=0
	END
	
	UPDATE @d82 SET tien = isnull(round(so_luong * gia, @m_round_tien),0), tien_nt = isnull(round(so_luong * gia_nt, @m_round_tien_nt),0) WHERE px_gia_dd=0
	UPDATE d82$$partition$current SET tien = isnull(round(so_luong * gia, @m_round_tien),0), tien_nt = isnull(round(so_luong * gia_nt, @m_round_tien_nt),0) WHERE px_gia_dd=0
	
	IF @ma_nt = @m_ma_nt_ht UPDATE d82$$partition$current SET gia_nt = isnull(gia,0), tien_nt = isnull(tien,0) WHERE px_gia_dd=0
	IF @ma_nt = @m_ma_nt_ht UPDATE @d82 SET gia_nt = isnull(gia,0), tien_nt = isnull(tien,0) WHERE px_gia_dd=0
	
	SELECT @t_tien_px = sum(tien), @t_tien_px_nt=sum(tien_nt) FROM @d82
	UPDATE m82$$partition$current SET t_tien = isnull(@t_tien_px,0), t_tien_nt = case when ma_nt=@m_ma_nt_ht then isnull(@t_tien_px,0) else isnull(@t_tien_px_nt,0) end
END
">

]>

<dir table="m82$000000" code="stt_rec" order="ngay_ct, so_ct" id="HB9" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="hóa đơn" e="Invoice"></title>
  <partition table="c82$000000" prime="m82$" inquiry="i82$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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

    <field name="d82" external="true" clientDefault="0" defaultValue="0" rows="118" categoryIndex="1" allowNulls="false">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="SVDetail1" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

 
    <field name="tk_thue_no" allowNulls="false" categoryIndex="-1">
      <header v="Tk thuế nợ" e="Debit Tax Account"></header>
      <label v="Tk thuế" e="Tax Account"></label>
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

	  
      <item value="1: [d82]"/>

      <item value="--------11100-1 : [t_so_luong].Label, [t_so_luong], [t_tien_nt2], [t_tien2]"/>
      <item value="110------1-10-1: [tk_thue_no].Label, [tk_thue_no], [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>

      <item value="11011----1-10-1: [ma_kh2].Label, [ma_kh2], [ten_kh_thue%l], [thue_cn], [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>
			  
	  <item value="110100000-1100-: [ma_tt].Label,[ma_tt], [ten_tt%l], [fcode1], [fcode2].Description"/>
	  
      <item value="110000000-1-10-1: [ten_khthue].Label, [ten_khthue],[t_tien_nt].Label, [t_tien_nt], [t_tien]"/>
      <item value="110000000-1-10-1: [dia_chithue].Label, [dia_chithue],[t_tc_tien_nt2].Label, [t_tc_tien_nt2], [t_tc_tien2]"/>
      <item value="110000000-1-10-1: [ma_so_thue].Label, [ma_so_thue],[t_ck_nt].Label, [t_ck_nt], [t_ck]"/>
      <item value="110000000-1-10-1: [ten_vtthue].Label, [ten_vtthue], [t_km_nt].Label, [t_km_nt], [t_km]"/>
      <item value="110000000----11-: [ghi_chuthue].Label, [ghi_chuthue], [ma_dvcs], [cookie]"/>

	
      <categories>
        <category index="1" columns="789" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
		
        <category index="9" columns="100, 50, 70, 100, 65, 40, 80, 37, 20, 30, 100, 0, 60, 60, 8, 120" anchor="6" split="10">
          <header v="Khác" e="Other"/>
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
        &CommandExternalFieldDeclare;<![CDATA[<encrypted>gJoFmK0sS0RHBg6WicanqfW8GRTAxWMtvLxF2lGmq4CwE3dKd8FHC0tDYOh9hXw3vpZAdr7kTN8gLqv1BOARGs2dy6k3EsRZtV4tlBEjsXjCIKX1KllrGR3O0USOAPUr</encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<encrypted>gJoFmK0sS0RHBg6WicanqdURDJsh2H0jnh9j9+Pc6/lwEoOi6IpHIuUBs9BxDlxpqKOxJNU0VtOsoZrqIV+1M/sYSpxax4pnKpgHUj/ytfKwOTQyeffubIsXLtyuv7pS</encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<encrypted>LYsQP+xHunF0V4kGFNFbsPhVXR4W1f/upA5we2o9Fqk7WWTwWH4sM65obt786grD87C0yHi7ICleBL3vjScNg/GbmY+Z6s/nV8wrR9+OmkA=</encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<encrypted>LShulveQMeWQ3P4ZyXMGEEhB2OPFCAmGFBZmph8U+bUJDM3mRL2mVM2Ppp75ZeP+rhnRrZ+vWzpYv5maj5oltQ==</encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<encrypted>LShulveQMeWQ3P4ZyXMGELVvInascRTLJxR2tGzEEDTJYbPFXj8yQmYbLLskyB266Q3j2CIgWFATOVyKydcAHv48j0l0WPqz/Jf4GMZnLvQ=</encrypted>]]>
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
        <![CDATA[<encrypted>wHv5ATNVEvTnCVOVuFMOSCqHtGksvgq9kKmQc4TjHuGKLAEE4qDs/GhejeaAQtmwvZbppebVJMW9ZdUJLRrLwigBnd9g/KRlXT4HsvzFEQshUn+AQgeFeOasqNLQ7b0nfr1uaU3cYOZhaZd+AsrBtRnNqg1iGM17uEnk8M1IbPUbmAry3Mi9g4k/z8HT8QJzSQs7af1Zuf8uRgOCAYvwyw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>FqSiSR1SqAnqNH7h7G2JQ6jiHRroRTn2i43ZM22ajTbPVrKuP9e9nCq5Rtm6jiIGiDtLgKrMpXYmvyOv99duZUQm7nTL7XFFNqPMReePYOxml8hxfvfqjxczl37mlTYEsTW/X7ZE/p3HrQQfK17KdpN4IQ5oWtxAbCKLKF1Twm00yCTIwkvEBKdF6gRdCO4yck1qu48z9uJqsJKSBLuplw==</encrypted>]]>
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
        <![CDATA[<encrypted>aRHOPduaPOHwS3jrxJxIprvvCAGbCJkYz1mQM6ZfhXUsIp3qpPTJhXRQfhgbGEXohYHbtToiMs5NOsPigj0S+cJ2fKAUdG6Ra6/Nwrja5oXuKppihlQZLhF6lAXCrlbS6ktgez7g0nMsq5vpNxsrAKrR2DwBfTeuQFONCu7AYUtIz7KsAocCznifoNiWAsCfr3isjj8Xbafhv3iNWgJdTi2L3Od1aH/1+4yeP71jfGukACe7cUOKwFWTwCOlggdrqPaFK2euJnPrQhxVilp+vrpBywa/2Gd8q55jn95VZWfQk8zZoTJZ6dTlioIfE7RERJGx4T+g+vmFpNf0LM7HOg==</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>BLgSt7xnstVAr8i/XeC1ZClOhjUAlxNmJMrrb8GUvSR/E7bHxNQLH2TNujW+rUbfMNNCPeDV28Yz9QiWmQCnkyfIhIoFAb/u0ewSxDWV+oFLjo9QWUggpbZPZqDgYXMPpwPudB7MJWFCZItmcORPIqujkHVXwchCZnOvPo3sGk6H3TwFVZ8Nz+WuK1pzKCML5lQw93NAJzCo9D6iSHO2414qqvMWdR1dMzcn/icdZQ7bo5LyJHbSaasVib/yFPjmmB3leWRCVNEUUVa0zibxBBJgU8MV6W5j7EE8BwW/zyw=</encrypted>]]>
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
        <![CDATA[<encrypted>N48N8EMXpHnLcQdkuCcKw+867PysvgQOHJKLPSZ0Aak2hM5p7SwTSeX4fuJ78MjAttRtkI0an1sFVNTUSPYm1MaRPREKv9QYYBCd+Ixr33Fb0aMbAYr6PiBLolDsNxYPkhZRB5J/TksQdlNFx+CAxzO01DV2Tmd49jTVH3H527g=</encrypted>]]>
        &DeclareStock4Delete;
        &DeleteCurrentStock;
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>mGGC2lKnWZ4X0oqe2uLItQ8M13Q1t54Xtk9eB9JmNFh9BS5gNGmi0h1BVac7i0F9GiDlthdWkVeLtQ62G3p5vfD8rfkkKQCRtSqyTkBcjdXk8JsHmbfuWKI2dajBIKPvI0w2XmRvNmvNsCNHCY9OE9eHM6eeyFuafL0jTllgKrMVD86jr+vbj9xbzW31HqDNzH6ZtUPxYuh97SDzOHczUAxKBq/7i2Ko/iOfvNvIDtxDSNfcAoyWDY9wwVEsl73tG6yjHo04w7iW5DsKOQzG24Db/ze7nxl4u5yd7fG7azhm05I3Yh4mL6h0cKu4wr9R3W4lGiL2jV17WfA5Yngr2L9uHPUvj9mTzyuuSoCZdaPqt3Sw7SXVfo3fFBe64vaAqRListLDRy2GCNfiL7usquCnZpM/jQCzjZVM/z/kx0eS+HV0zef5PFnf+SE67Tn6mQhWvDbUETEBwZiL4Dwbys5JsZv98dRqyXz84eaytoyO7cjYlsL23/Y4PXleBTzg9yMyMb1scg64JhreMc+WusaQd/YgyBVdnFMNAdqZA/j4Z+HQQM4sp4CX/YpuNP0QcDX11dWYyzoYxRt74hEDw+8MgSZ7Tyox32yDdy7szZGXjEijrVp5XzGizG852puJGyyj50YPRlKKCEbd/dNj4NI//0aVSUWYCJx9ccI9BByMmX2EDoeYCM/QBF/fHpHVQ7YYe768BjDekAunbMqMUTdF9CB42QdubACyy389BmMC4kFAZlGZcAtDn5Uo3u0LAEi1KdkCZKa9ZCSQq3u22+FWvtXcGtiXj46EnUfddIyOrhC/MxiN7YsLUAkLeC6w3BXrEPWqSiemdEGaxzxHD3IcQu1Yyo/wzAZD8H/e2SYXWFhnWiKWeB6LHYNyjRaldML9G4YfexnIfUR6gQDELEXbmGVNKt9hsy/FHVLWe80JP3Brr27WMOdOwA4NUlK/yfApSGITRNVddBa1nWBo6lqrnO1USuk2Aj2I9n5gUShNN86a3fS0g9nrK2pehuiSIgWINeSGZzEZ42752QS1xg==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS86MfU2bvIdHD+hArj7qQd5Rjgo2Er5/TJhH0k3Bi80yJLatxlBaLEKe/PBvL326Utw8zBlj6j+r1dWFgLy7rU+w==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>u1BM9OIysz0WBdlqYKYcNcekNWIAjtX0Gbk0b1KkGxme+gsCfhZ3SMGzRKCC6O2HWXjY4fHRYawAR7dOT84tvMzuAzI6H7MSqLpcdYIGcRyQ7ZBpRVuMEwL67u4mVWr9zcM/WhF1vgyr/uMiXheg7KZoAdIdLGQz2EiUzKmOKw0AG2YhIHv2NUUnDw7Dw1rmbSBhhdSApv+PbP0BTr6t+cydYS1Df2+yWR6OEuk1IrCBJNcGYUHctuR0ZmD4DzlA</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>GlNezHyxcs72OQckj4rk/CnyiwbAodnUcUKG555cxJIDn8MiB00oX7rX78SOvDk3Zu7hL9FOP+doXIzJW2pCl60fZITUIVbg3miiCmm8wOqgIMciv9jBcAn2/I29d0QwRMOu+DGrenytc0teE7lih7hU+VokpK1HJpOkROIKIcY=</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>tnlkDzDm6NZ1Xbr2dA1GVE8D/FmGj5LO9rI+vpYZcJ9s6ms2PrNlYwzYfTOZofwf7YcyfSpsyQNYjMrvWDOP/RKnyG79Y+4A1j8yyiEaO9IzaKlgmXtJx8Z034PoEAcaKVSUBDGo4L1JrNg1QA5xrHZxeuBYpY78jYiCw23SRJL2BoDIqBkdTqQmbTfjrWNNAw7UkhlOUCgkGObe1XWwQSeQJ5khyUBviykkI7bqTNJAPo+Da32bOC1d4ofm/T1gebEZ6p9tqYeI3gDUXdek5HuXc/XEXgVJxdBvxIIryHRYI3WE0oP2vUlEFog8n2Q3R5LioOR8S6ptpvoUwo4Yiv2S1xQ+XBBIDtWd7nyASS0bEUQiqpVHWeWeh6XDf9i8xdSACSQ45Kpox8gzJXVXA1lWZICEQjr27peh9VeEZSYJW6vYtAtldcab14yuYF6+</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>f81vgyh7Ja8aneF5ICmt0jR66JhVV1pBjtdknqiWo0vVotMrEYOQ5EaF4Z8dBEpvf/RxwuWPpOawCz84rnEQmd4erl9o+S31LePv6NUrw4vGh96Fjg0jNfrjl+R6dSGEc1BCWC5tI5imHVe2YlpnYwiFXGvEL+vsRqUqvZyo3heFNWYfN6wnD1JZhTBs5W+IClYLDKTtZpSdM1xJczp81bQ4zpzvIAR2SQmYeavsoQuPWR4xeNBAebZHzmiQg2W/HFWnCWUwRVi/ECsUjfMdIa0c7TNbWiKW5smh42BnPgCUDwpBIzkBUiL7XQKhlxpWuT6N8aCu5hP+M1LIK30gguZHjCcVwk/05S9xOgH/ibE6d4xKYu1iObPSMyZUFqq439TxPFuFEIa4HVzpSCDdsKtZIkVzYn3eksCsqKT4BNdfLDQLFsG3WdjzyKAAFyMkAN8ZmhxPhYKaqOGJLlEg7Hq0ah7HzgET1j5yyN1+lbhBDUZUFMOdk6ykQ8QOxTofYf1cyxNdhU0MIopXsExcjUa48E25GaC4p0OYm2Xp/ErZLMSm5qmx0iy3GNqyySfnM8NDLt7WHiBE1Oq+sGM2mBp1QifYujjzFZWeAdQ0lE/TDmhbYlTl/ArLRsaqCzKCdr7bxhjyhwVZ+isCPFJjSQ==</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>dZuKR/jq1Bazi7Oxu3xsAT3lWEynW2/DAASDrVZIAEo7fXWbpABYSu7M2onTVGVr/l5OqWU5+UFkr/t2ka4A/mjGk/zmjdHn4BizN3EYy3KxvnPgKqeHDhuaY/BQl4FF9nZUb2vcS/z2xlmWOrJ58nPLkcBAv42LB76gNFxHYtYQ2SDpRQ2pd2f78Y+9+7rxKUuF8LwbOD3zY4vWaCnuyQ==</encrypted>]]>
      <![CDATA[<encrypted>XOZT0+zVEmeP7U9U62uBWVNdldtin1qj6AoyL3irTg4wp95XSXY1qRAObH+UXT4asgK8XSz9LxThD+awOB6TWLYTKOv+GxzTq4ymYD5BkqszIKyyNd+tbVheY97eubJgJt7eCarPT38GRLirbR9Y0NM3Pb3y+Yy23DKPYR0lqT4oTNoEXIB/F/Z2w7HByl+RKLBMW0V7YrdWLCEmwlqqQ7fCXv1WdZSd3yYwenOHVXHic+ZsQsCi9nIKi4qSdKPRTtSZqWTXHGjz/NMBCH/zlpBIFS/6sqCW6d/4L8aQ3FBA9eHMocRDKUtcJmHMucc8O+uFaXeh8UXarr5EPkJq0kooCGNiO4ztgyMHhRfXxpFoNwC8hnFJCpSXKU2RlbuxZDJBKkSz36zt7yHa4c5zlLGejFAiInYWgnrsZOgEW9RWrDxghts2ss0YvLXorBZnlQ5ricmYzURoeXy8NFzsJewsmZ2h/D/ftvYMztDWwd8M7w3eJz614cc/e/mhKde6</encrypted>]]>

      <![CDATA[<encrypted>v1mcdMOMviRdgI07lhNNtZAi6r89u4Esb32okLcszZPbBl/+xpWXZfECB07Z8wGYcuaoLrVKx+evRIQO0aWjuMLXpfjd7VwTVJTFlAyigl/6weZxNJca6eXaKKJu3jPDbXLLYkk/VGiwuk3hYCVGHvsgwGJ90kBI8QmroRMQ3a1N3nZmt1KDXVpgfv6YgZgTUcdb4TvLo9G4yXzbD8gHaA==</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>MTdyUV3UMgY3IyGlghiU0i7aXo5Qow9zAZ4XF0iDXLoXHqewFQz6i24ZPKF6tZiMmqZwpwWAc3w5nXequMTNkuPLjMXPconOQllnC89hfBLzTvi3q3x6vALDkoX/rA09</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>MTdyUV3UMgY3IyGlghiU0i7aXo5Qow9zAZ4XF0iDXLoXHqewFQz6i24ZPKF6tZiMNyxhIJQ9RKBNil2a7oF0TQ==</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>VEz0hueMcsPbEBbgzsLW/EhrtfDpUma5ekmnT7T09H9dCdsLMT6HqdADB2Hx/A2heLBFuEep9fWMem09Mqfqc/EsmVc9AYKUsgnkJbspUltiK/mL8+cAg8lC4dWer2zdX4thPlFh/hZbtc/CTLoddaAUfDtLhopgue0RgkVAdV4wc2Wk9dNaXv6YmBA8pOIghmpNQ0EdUav6egNwR2MteHUQ4+87TpBPy0V+iiI8krm2BN6+BUL+e0hZTsKoKkUHLIwSBM3y0j8ve0TPoLcA2ytz2fJq/NjqoqjlZWbCUuQhmZd/05UMWXx5YOuFgj/sykZlfAeN5+VPLff3Bu2vKSyFGz++PxS7XtTjQAdIJLjRdZ8YII6dhBehulNi2nVFhyQgTl37+DxHZRHzgbMglQloMb2nxHMPC0zzVDS8EnjDIUdUeZTtscaGx+Dx4u10rztykmIJXYD9JQALlxM42jKyQoF34rbmHCLRTbClcfnVdurp0e/yqA8oSGm+K0PzHIuP3l85W983kQdmE44r8NnkeZ5vXQuT5teoJX1gs/1WzCCg4fo2qOfVK5dVJAr3HuwZiP4aRRhuvY+B0c2oPaVsff9MC2wm/LDNI4ovklz0X6Ln9XlSYZ2sGk9C3COO36vSMAF1Tvpn28Oi3R/TPC7keufG2BPEtnUUNaHhTeuJuWjwKXWU8hE+cb0u2ceCgmizImmMU7WQC/H7qu7VeFFU40aCM6wqHzjUXtqQUx6kD8GKmYux3rZ8ANlrWFPCG3AR/1RKktHwIjC8AVXxMRAvL25yMWPaHnncE+yh2P7ULLvzll8ZTWVqwjGUKwfyso+H0Vu/qOJR4tifT00+26KDsHxGzqnaz/nWPgRgpx6hLTYypIaRTsGi/nhEXRqzw1a1+ZnUwlEMMO9jZdRzFRqKH0EMbMc36WQCg3Uzo8VUPLAWJkxpzllLk/2R/EMdSFxx/RTcBE+Dt1sHlKpOyksJTrJlMQGdrOOTNJ5tP2G+hYukzlaSJlJ8hvlPauz2</encrypted>]]>
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
        <![CDATA[<encrypted>siqaZ5Z8SmfP07jHRljjRvLyWFSH/xJxcfRnJjMzik5cyHKYwz+BXaW+RAjBOTKZf8p9MEXg1G8Tp9YeY3MDuEpWsCzog+rhyvH2OlH5BmCsuR4PDXSaHcFNW9cfde7L65i2dAWCg4INBANPoVaWZINr/cTMuP1tIjHwALxnDS0w9r5fwlybm0RJIIpeg2iPSGBvGvoat5XUiQUDISU5epP7Cz5IoIWRJi03VqVit/IvLkxAasAG/8SEZQMp3K7Y+vQ8kSS/nSDc8ZFgAjJhJjptl1mWCyzvRB1C24nFwq35hr6C50QnvZbdI4SPzgM1THY95Px5mwiNBFWSAs39s7CvQqkxM4NQvr5210FX4bA=</encrypted>]]>
      </text>
    </action>
  <action id="CreatePT">
      <text>
        <![CDATA[<encrypted>n7avbHe0IAYXeScDxLRKhpiG/gIwBRe6++EuP8mtDPLmWRQFv8aj7DAl8Ife2ltxMkDckXYUbro3owHV/Z4xtPNTpp6Jl5J/4VyRM7qc1Vu44b717vZyB2uCbdFgsSar15FXCRu9EO6pcnkIH3oswH+cktkKr9R5a7x8EJNEZ3AHEF0+bVUZ/6/ujT4hsxdiT3qwzQm1l8PwFVNXmGpaEvG8DocDFUyBQs47ei94rd6UufRjsu0x7D6yyCG+VzlpCXShHeN0lGC/SyL/NmI1rk/V4EUkYWZD2DBlW80sY+Zn01Qs6v8Zog9kYito+pRzTtlhvV/pWeBsfJQjUvAfe6d9I6qIf3ClerYGUa8rZdaVoTMTxKwdDuYUXboTOjlVJZgEdtGlD3WcP2HVcAavpvSn+J1PndQmbMfe6y/gEBpvb/AHbBUH5j7tDyeEewuw</encrypted>]]>
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
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Rhj+g7IgJdvxGxW3ZOV+kD+vDDSt6HF+9SncAKOzHSQusARmA1Dr0HMQJAZS2+dZeug6KOWPgdkUW6Hsx/Isox+pNMpQiSRQuRbgW4pLIOzWJ14z0GdXHvEE/7qVrvJfQ==</encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &XMLGetTaxRate;

  </response>

</dir>
