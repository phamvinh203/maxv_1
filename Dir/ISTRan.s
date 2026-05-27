<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenStockCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY XMLGetContactInfo SYSTEM "..\Include\XML\GetContactInfo.xml">
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
  <!ENTITY CheckStockBeforeSaveIssueVoucher SYSTEM "..\Include\Command\CheckStockBeforeSaveIssueVoucher.txt">
  <!ENTITY CheckStockBeforeSaveIssueVoucher2 SYSTEM "..\Include\Command\CheckStockBeforeSaveIssueVoucher2.txt">
  <!ENTITY zCommandShowWarningMessage SYSTEM "..\Include\Command\zShowWarningMessage.txt">
  <!ENTITY InsertHistoryVoucher SYSTEM "..\Include\Command\InsertHistoryVoucher.txt">
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">
  
  <!ENTITY DetailVariable "@d84">
  <!ENTITY StockType "2">
  <!ENTITY DeclareStock "declare @stock tinyint
select @stock = 0">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">

  <!ENTITY BeforeVoucherUpdate "if exists(select 1 from @@prime$partition$previous where stt_rec = @stt_rec and status &lt;&gt; '0') exec MaxvOnline$Voucher$BeforeUpdate$IS @@prime$partition$previous, d84$$partition$previous, @stt_rec, @@action, @@userID">
  <!ENTITY AfterVoucherUpdate "if exists(select 1 from @@prime$partition$current where stt_rec = @stt_rec and status &lt;&gt; '0') exec MaxvOnline$Voucher$AfterUpdate$IS @@prime$partition$current, d84$$partition$current, @stt_rec, @@action, @@userID">

  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd84$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec
exec MaxvOnline$App$Voucher$UpdateGeneral @@id, 'm84$$partition$current', 'd84$$partition$current', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec">

  <!ENTITY Stock "
    exec MaxvOnline$Voucher$Posting$Inventory 'm84$$partition$current', 'd84$$partition$current', 'r70$$partition$current', @stt_rec, @@id, 
    'gia_nt0, tien_nt0, gia0, tien0, gia01, gia_nt01, ct_dc, pn_gia_tb, cp_nt, cp, thue_suat_nk, nk_nt, nk, gia_nt21, gia21, gia_nt2, gia2, tien_nt2, tien2, cp_thue_yn, thue_suat, thue_nt, thue, ck_nt, ck', 
    'so_seri, ma_khon, tk_gv, tk_dt, tk_thue_nk, ma_tt, tk_thue_no, tk_thue_co, tk_ck, so_dh2, so_dh3, ma_nvbh, stt_rec_px, stt_rec0px, stt_rec_dc, so_ct0, so_seri0', 
    'gia_nt1 = b.gia_nt, gia1 = b.gia, tien_nhap = 0, tien_nt_n = 0, tien_xuat = b.tien, tien_nt_x = b.tien_nt', 
    null, @stock, &StockType;">

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
	  insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tien_nt, t_tien, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
	  exec dbo.fs_PostISTran '@@prime$partition$current', 'd84$$partition$current', @glMaster, @glDetail, @stt_rec , @group, 1
	end else begin
    exec dbo.fs_PostISTran '@@prime$partition$current', 'd84$$partition$current', @glMaster, @glDetail, @stt_rec , @group, 2
	  exec fs20_AfterUpdateGL @stt_rec, '@@prime$partition$current', 'd84$$partition$current', @@id, @@userID
    insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec
  end
end">

  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete ct70 where stt_rec = @stt_rec
delete p00$000000 where stt_rec = @stt_rec

if '$partition$current' &lt;&gt; '$partition$previous' begin
	delete r00$$partition$previous where stt_rec = @stt_rec
	delete r70$$partition$previous where stt_rec = @stt_rec
end else begin
	delete r00$$partition$current where stt_rec = @stt_rec
	delete r70$$partition$current where stt_rec = @stt_rec
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
	SELECT * INTO #d84tmp FROM @d84
	SELECT TOP 0 a.ma_kho, a.ma_vt, a.sl_xuat AS so_luong, a.tien_xuat AS tien, a.tien_nt_x AS tien_nt, a.gia, a.gia_nt INTO #giatmp FROM wrkin a
	
	INSERT INTO #giatmp EXEC MaxvOnline$Voucher$UpdatePriceStock @ngay_ct, '#d84tmp', @stt_rec, @@action, @@unit, @@userID, @@admin
	IF @m_gia_vt = 2
	BEGIN
		UPDATE @d84 SET gia = ISNULL(b.gia,0), gia_nt = ISNULL(b.gia_nt,0) FROM @d84 a
			LEFT JOIN #giatmp b ON a.ma_vt = b.ma_vt AND a.ma_kho = b.ma_kho
			LEFT JOIN dmvt c ON a.ma_vt = c.ma_vt
		WHERE (c.gia_ton = 1 or c.gia_ton=4) AND a.px_gia_dd=0
	
		UPDATE d84$$partition$current SET gia = ISNULL(b.gia,0), gia_nt = ISNULL(b.gia_nt,0) FROM d84$$partition$current a
			LEFT JOIN #giatmp b ON a.ma_vt = b.ma_vt AND a.ma_kho = b.ma_kho
			LEFT JOIN dmvt c ON a.ma_vt = c.ma_vt
		WHERE (c.gia_ton = 1 or c.gia_ton=4) AND a.px_gia_dd=0
	END
	IF @m_gia_vt = 1
	BEGIN
		UPDATE @d84 SET gia = ISNULL(b.gia,0), gia_nt = ISNULL(b.gia_nt,0) FROM @d84 a
			LEFT JOIN #giatmp b ON a.ma_vt = b.ma_vt
			LEFT JOIN dmvt c ON a.ma_vt = c.ma_vt
		WHERE (c.gia_ton = 1 or c.gia_ton=4) AND a.px_gia_dd=0
	
		UPDATE d84$$partition$current SET gia = ISNULL(b.gia,0), gia_nt = ISNULL(b.gia_nt,0) FROM d84$$partition$current a
			LEFT JOIN #giatmp b ON a.ma_vt = b.ma_vt
			LEFT JOIN dmvt c ON a.ma_vt = c.ma_vt
		WHERE (c.gia_ton = 1 or c.gia_ton=4) AND a.px_gia_dd=0
	END
	
	UPDATE @d84 SET tien = round(so_luong * gia, @m_round_tien), tien_nt = round(so_luong * gia_nt, @m_round_tien_nt) WHERE px_gia_dd=0
	UPDATE d84$$partition$current SET tien = round(so_luong * gia, @m_round_tien), tien_nt = round(so_luong * gia_nt, @m_round_tien_nt) WHERE px_gia_dd=0
	
	IF @ma_nt = @m_ma_nt_ht UPDATE d84$$partition$current SET gia_nt = gia, tien_nt = tien WHERE px_gia_dd=0
	IF @ma_nt = @m_ma_nt_ht UPDATE @d84 SET gia_nt = gia, tien_nt = tien WHERE px_gia_dd=0
	
	SELECT @t_tien_px = sum(tien), @t_tien_px_nt=sum(tien_nt) FROM @d84
	UPDATE m84$$partition$current SET t_tien = @t_tien_px, t_tien_nt = case when ma_nt=@m_ma_nt_ht then @t_tien_px else @t_tien_px_nt end
	
END
">
]>

<dir table="m84$000000" code="stt_rec" order="ngay_ct, so_ct" id="PX1" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="phiếu xuất" e="Issue"></title>
  <partition table="c84$000000" prime="m84$" inquiry="i84$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBZCjY1pO6/p+NqFQ3l3vjFmZ+SRkeDTSpB/rMZvVpuSg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người nhận" e="Recipient"></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
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
      <header v="Số phiếu xuất" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
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
          <text v="1. Xuất kho" e="1. Issue"/>
        </item>
        <item value="2">
          <text v="2. Chuyển KTTH" e="2. Release Later"/>
        </item>
        <item value="3">
          <text v="3. Chuyển sổ cái" e="3. Release"/>
        </item>
      </items>
    </field>

    <field name="d84" allowNulls="false" external="true" clientDefault="0" defaultValue="0"  rows="198" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="ISDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    &XMLUserDefinedMasterFields;
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="260" anchor="6" split="10">
      <item value="100, 105,9, 120, 100, 0, 0, 8, 100, 28, 58, 48, 8, 105, 0"/>
      <item value="111000000-10011: [ma_gd].Label, [ma_gd], [ten_gd%l], [so_ct].Label, [so_ct], [ma_nk]"/>
	  <item value="111000000-10011: [ma_kh].Label, [ma_kh], [ten_kh%l], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
      <item value="110000000-1001-: [ong_ba].Label, [ong_ba],[ngay_ct].Label, [ngay_ct]"/>
      
      <item value="110000000-11011: [dien_giai].Label, [dien_giai],[ty_gia].Label, [ma_nt], [ty_gia], [cookie]"/>
      <item value="----------11001: [status].Label, [status],[ma_dvcs]"/>

      <item value="1: [d84]" />

      <item value="----1---1-10-1-: [t_tien].Label, [t_so_luong], [t_tien_nt], [t_tien]"/>

      <categories>
        <category index="1" columns="799" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        <category index="-1" columns="100, 100,9, 120, 100, 0, 0, 8, 100, 8, 58, 42, 8, 100, 0" anchor="3">
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
        &CommandExternalFieldDeclare;
        &CommandExternalFieldSelect;<![CDATA[<encrypted>LShulveQMeWQ3P4ZyXMGEDEWpeDuiokdzyGnMoPcwLySWqTS15Z4ehvPndDZpEiWN/JK0qK8UQraui47JwdsMxEKM+wY5x0EuF0FyoYJFKE=</encrypted>]]>
        &CommandExternalFieldSet;
        &CommandExternalFieldQuery;
        <![CDATA[<encrypted>YO9vH39UC9rfBjcWs2k+kdUbj9vKGjQdSORTOH+KTkA=</encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CheckStockBeforeSaveIssueVoucher2;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>j/Dm/6vHzU+noc/DNng5HhGakuja336O7l4ERSxRUDPKOvkuMYqwEyi9WKTIUekzIaMd0jJ9LnFZ8/uh4LK9HFnF4PJQGwlAstd8haomaxIa3Fi16tSPT8MtEdbDagT90NzkeTkdlwKo+Zcim3ENZRAUY0gu85xgnP64xl6e+89WMWxi2UbTwERA+4wPsnq/ThKWxsAToviIUwaOb37jVw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPmn/GkW3qa9Gxu3PUYNW6eWp6Aiqhpk7wwfdKHV46vYHOTi6atPdpUBRQvAsuupPWncehbaI4So4XWmjxdLWUvE=</encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
		&UpdatePriceStock;
        &UpdateCurrentStock;
        &Post;
        &AfterVoucherUpdate;
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
        &BeforeVoucherUpdate;
        <![CDATA[<encrypted>aRHOPduaPOHwS3jrxJxIpsT4bwbybWwzRT7ActjtTw/lXpFq2uEpdbFoFC83vL4ze5/0AsaCBXBOQsJ/G6xipdu1qZLit1sz9JJu2HfgGmGy0mthnbeOMKsYzMnyYJnBLhwl7kLM/u+/w5OaYs8ozUCVMZp+a9JYERUyCEQf51T3n6q0vHCk9ioVEBsSYWdJeBg4Ggm4PhPewjqbbJRl24OtY0euW/3xjRMv3P9z2nl82Sub7heuCv5pzCC78j2DHeuTfZFfEjWIBcGzt2XvMsm7VFjBNFsCBOO7Rbdv3TgshbQq0MJZtYVHm5p5NpEanx7Nkrd7KQB1gbEIIc4utg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>klH21CizDNRDnjCdNSdiMJPoeNfunIK5/XcalX/FXU4u0AdaXnUVdkDcrq6A4vDUedb9q4JHJ9qvspiRtMELudgh5Z/CRAUF7qSj2HpsW8PIIsjWMlOQtXnb8vAQ207ai7XwNeHdIAWTIdkIsplPMMbs5kraaAVZjkrObhy2uZ4O32WI1f8xTUmHmcAcw/uWlpKd1AFVVe3El1ZrBK0QxQ==</encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
		&UpdatePriceStock;
        &UpdateCurrentStock;
        &Delete;
        &Post;
        &AfterVoucherUpdate;
<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fNyBfOnaRg8XJQtLal7zNSpSTlBMqy4q6mdvtpOaQkr69q16wnockYzPQpN+gbxbPiCNQqA2nH+kIkh3UX4E7fhYxkeHfrFn0E7KVuYRj4cqmD2ejciHsrsaexkJ3ZA8sKqABeWkPFj4a4GJGz74z3y8=</encrypted>]]>


      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &BeforeVoucherUpdate;
		&InsertHistoryVoucher;
        <![CDATA[<encrypted>N48N8EMXpHnLcQdkuCcKwxgkBaYFtCzGAY23lynNsSxuMgF9S938tDZ5iFfjyYOEXu5hGtm5egMzXiIqY+IHcUZjelriYm5nnIPfBd1NWuIrpx5xIc/rD4+Pt0BgN/1B</encrypted>]]>
        &DeclareStock;
        &DeleteCurrentStock;
        &Delete;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS86MfU2bvIdHD+hArj7qQd5YEYJ0+70Bh8DJcI81Q4sVOKIvBITQ1smxn0Yb4froHS25eW51dCwPmCs4gXLR6Ocw==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>c2Uxkhp8dnFad+svGg+TCAPMENSeuKt6ihA+vm4Vr0/G+tGZ2ihdzamIfDjDKUKw8HOoVkSPE3oo6BYivqLiPtRQVFVShsJeSrdIqwoCkiVisY0k0x0OLSp5zl12n1AT</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>S306XDTuzLrc8Jzckjo4t2f/Xq9LDTc0WntjEANcc86IifqIULcqQpmLhBsN4K7TiaGjBkYeTj/Tm/Z+PeBCPQ==</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>/6Pq5JBiSWMm7sZA6oKL3HLWt5QSOclE8jcvpmR0CK5R21ObotZEpjsIevc+tXzXid3NdNeLCHGxpwA2NbNn0qqntAScxf02jcfBqGQzHyyryhV6t0W8fja3lJk1NolefVofaMNIM7xjeJJtZAZZZ7rm7nW4kv+T/KuDozduBPtSRlEM3O/gqAOCb1iOIBFIbGQvios6PPQ6rKaFl/6LdslyRBZ17xDTVUxn5GR9+cw6xPlEae2gIZFKiodJkrjVW8nkZiEwwSDfdu+Od8SKmvRHaNMWXZWX82IzzMktvcph+W+FVPNjUsT71jNPTvcZ</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>K9z5ct2O3FsXBzBIMGlYA6AbZsLDhDvNBvKTbmrX48GgGve0Y68AqRammofjHl3A5jXKlRTHlEdsjgc7gOaojJsh5x1xv6GNHDFRCZDT70+R6vmzguJzsmQf4Ej/PuAkQtZOVHGNBo1A16JzK7s1pZpBece6kWn9VRRolhsqbz4betTWU+crkEOICii76ONLHWoDzsiS7FBw9V/7RbLeSHFRu/0iY3hkLb2ZOWTZ9EAkdh4YpzFHOEFolNHo2xZbS5/k0/PE7+LNZJkjWhvDP4AFHdz8TEgJf+iau/ZygZ4k2rAZ8hn4mBM0jcWiEmTf4A2v0WIcP4ysNZJPiQno8yiOI54YhMyhlkol2PfZYVWrnJ37CqotJ6takmflwz2S2z7cjH+3b2hVJgKRQabZBSjTe0hU+3nogAKi1/3pnWI=</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>qkcFnOyPONoEtzTELZg8WJNe5e2nOxMvdBPOO1jFp1xp8hqzas/obqljRzxRnFF5YwmUAhrTqXkEIqZZUo33ERT/0BLEkq82mNUsLtszwSLw28oDWOgZ1OD0FCEyzvyq8H1d9EDGhQe3yu1fHUlN9IbqB7FK4dL9E4W4q0XCAlBDK042PHM51PQh0v3S/v1G</encrypted>]]>

      <![CDATA[<encrypted>SYAWEr/8WVXMnmYyGrPsj9FJaUf2TjrIYRNyJTdJDcVxFL6cKJCkrw3T/Wmsb4aqAQ+h/rXG8IEnEbensDrLMfkH/q4JRaO0yDOwjIPUbVwknlCJyZPyfi9203HjVkiPs6ABzvB7NIYXTWDnZ5+SboIESXjJcfDY77WbB6V9zk9lBG/bT2OnIljhEGUQAN1PNuaI3fnz3aoQOSwEhB+JMkU7Hk3Py3FAKrcha9p94FfyaMnczVRX/aVlRWN5e5iAnXp0RzpOzuhdwqOFTT4u+g==</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0SVG/ZIFBAaT8lyFwW2eU1YEm9B/nkodjj/qIJ+aRz+i</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>caJ9xGcQXQPL1KzUCzPry3uno485BLnV/puszkIsXoq+WpJK1LkMBXmsyKZf88Wz8h+vfT7by8jt/2PJfYrLfe8DxP4wKnyaLUqRhntE667guPFj1+98E4zlNqXfEGtGPw6a/1QSPJib4886W5ot1mH6+//VhvB/bagDGHNNYjQV6t398/aV4p34gbuOSk2bUtHxG7cqD2MOvEkK6mWsQzs2CwsWyww7x9tQf6v0crhZMneLiShS7s2mXyWiEhxEW2p6Uj1KqzrbUx47u3X5+Q==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    &XMLGetContactInfo;
    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
  </response>

</dir>
