<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
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
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckClosingDate.txt">
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
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">
  
  <!ENTITY ListIndex "5">
  <!ENTITY ListWidth "869">
  <!ENTITY ListControlerName "SOTran">
  <!ENTITY ListField SYSTEM "..\Include\XML\ListField.txt">
  <!ENTITY ListView SYSTEM "..\Include\XML\ListView.xml">
  <!ENTITY ListCategory SYSTEM "..\Include\XML\ListCategory.xml">
  <!ENTITY ListShowing SYSTEM "..\Include\XML\ListVoucherShowing.xml">
  <!ENTITY ListWarning SYSTEM "..\Include\Command\ListWarningMessage.txt">
  <!ENTITY ListCommand SYSTEM "..\Include\Command\ListCommand.txt">
  <!ENTITY ListScript SYSTEM "..\Include\Javascript\ListScript.txt">
  <!ENTITY ListTicket SYSTEM "..\Include\XML\ListGetTicket.xml">
   <!ENTITY ListDeclare "declare @invoke nvarchar(2000), @script nvarchar(1000), @fileTicket nvarchar(256)
  select @invoke = '', @script = '', @fileTicket = ''">
  <!ENTITY ListQuery "select '' as message, '' as field, @invoke as invoke, @script as script">
  
  <!ENTITY f ", rtrim(ten_kh) as khach_hang, rtrim(dia_chi) as dia_chi, rtrim(dien_thoai) as dien_thoai, rtrim(fax) as fax">

  <!ENTITY DetailVariable "@d64">
  <!ENTITY StockType "2">
  <!ENTITY DeclareStock "declare @stock int
select @stock = -1">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @loai_ct = '3' and @status &lt;&gt; '0' then 1 else 0 end">

  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd64$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable2 @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec
exec MaxvOnline$App$Voucher$UpdateGeneral @@id, 'm64$$partition$current', 'd64$$partition$current', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec
declare @allocateKey varchar(128)
select @allocateKey = 'stt_rec = ''' + @stt_rec + ''''
exec MaxvOnline$App$Allocate$Charge 'r60$$partition$current', 'd64$$partition$current', @allocateKey, 'tien2'
">
  <!ENTITY Post "
if @loai_ct = '2' begin
  update d64$$partition$current set stt_rec_hd = '', stt_rec0hd = '', stt_rec_bg = '', stt_rec0bg = '' where stt_rec = @stt_rec and stt_rec_hd &lt;&gt; ''
end

">
  <!ENTITY Delete "


">
  <!ENTITY CheckCredit "
if @status = '1' and @loai_ct = '1' and @ma_tt &lt;&gt; '' and exists(select 1 from dmtt where ma_tt = @ma_tt and han_tt &lt;&gt; 0) begin
  declare @credit tinyint, @idSalesOrder varchar(13)
  select @idSalesOrder = case when @@action = 'New' then '' else @stt_rec end
  exec MaxvOnline$Voucher$SalesOrder$CheckCredit @idSalesOrder, @ma_kh, @ma_tt, @t_tt, @ngay_ct, @credit output
  if @credit = 0 set @status = '2'
end">
]>

<dir table="m64$000000" code="stt_rec" order="ngay_ct, so_ct" id="SO1" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="đơn đặt hàng" e="Sales Order"></title>
  <partition table="c64$000000" prime="m64$" inquiry="i64$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
  
    <field name="ma_kh" allowNulls="false">
      <header v="Khách hàng *" e="Customer *"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBZCjY1pO6/p+NqFQ3l3vjFmZ+SRkeDTSpB/rMZvVpuSg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_tt" categoryIndex="-1">
      <header v="Mã thanh toán" e="Credit Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai" allowNulls="false">
      <header v="Diễn giải *" e="Description *"></header>
    </field>
    <field name="dia_diem_giao">
      <header v="Địa điểm giao" e="Delivery Location"></header>
    </field>
    <field name="ma_nvbh" defaultValue="''">
      <header v="Nv bán hàng" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1=1" information="ma_nv$dmnhanvien.ten_nv%l"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="5">
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
      <header v="Số đơn hàng/HĐ *" e="Order Number *"></header>
      <items style="Mask"/>
    </field>

    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày đơn hàng/HĐ *" e="Order Date *"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBGGptSZAg0ISnyAth4ueJXHEK8TNviRiWDvX2/1qN5Ag==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" inactivate="true" allowContain="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
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
          <text v="0. Lập đơn hàng/HĐ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Duyệt" e="1. Open"/>
        </item>
        <item value="2">
          <text v="2. Treo" e="2. Hold"/>
        </item>
        <item value="3">
          <text v="3. Đang xuất" e="3. Issuing"/>
        </item>
        <item value="4">
          <text v="4. Hoàn thành" e="4. Completed"/>
        </item>
        <item value="5">
          <text v="5. Đóng" e="5. Close"/>
        </item>
      </items>
    </field>
    <field name="statusname%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    
    <field name="d64" external="true" clientDefault="0" defaultValue="0" rows="158" allowNulls="false" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="SODetail" row="1">
        <item value="ForeignKey">
          <text v="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r60" external="true" clientDefault="0" defaultValue="0" rows="158" allowNulls="true" categoryIndex="3">
      <header v="" e=""></header>
      <label v="Chi phí" e="Charges"></label >
      <items style="Grid" controller="SOCharges" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="khach_hang" external="true" defaultValue="''" disabled="true" maxLength="-106" allowContain="true" categoryIndex="4">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dia_chi" external="true" defaultValue="''" disabled="true" maxLength="-106" allowContain="true" categoryIndex="4">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="dien_thoai" external="true" defaultValue="''" disabled="true" categoryIndex="4">
      <header v="Điện thoại" e="Telephone"></header>
    </field>
    <field name="fax" external="true" defaultValue="''" disabled="true" categoryIndex="4">
      <header v="Fax" e="Fax Number"></header>
    </field>    

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Chiết khấu" e="Discount Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Chi phí" e="Charges"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_cp" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    &XMLUserDefinedMasterFields;
    <field name="ma_dvcs" hidden="true" readOnly="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" clientDefault="Default">
      <header v="" e=""></header>
    </field>
	&ListField;
  </fields>

  <views>
    <view id="Dir" height="208" anchor="10" split="10">
      <item value="100, 30, 70, 121, 8, 58, 42, 8, 100, 0, 8, 58, 42, 8, 100, 0"/>
      <item value="1101000000-10011: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="1100000000-10011: [dien_giai].Label, [dien_giai],[ngay_lct].Label, [ngay_lct],[ngay_ct]"/>
      <item value="1100000000-11011: [dia_diem_giao].Label, [dia_diem_giao], [ty_gia].Label, [ma_nt], [ty_gia], [loai_ct]"/>
      <item value="1101000000-1100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l], [status].Label, [status]"/>


      <item value="1: [d64]"/>

      <item value="1: [r60]"/>

      <item value="110000000: [khach_hang].Label, [khach_hang]"/>
      <item value="110000000: [dia_chi].Label, [dia_chi]"/>
      <item value="110000000: [dien_thoai].Label, [dien_thoai]"/>
      <item value="110000000: [fax].Label, [fax]"/>

      <item value="110100-1-1-10-1: [ma_tt].Label, [ma_tt], [ten_tt%l],[t_tien_nt2].Label, [t_so_luong], [t_tien_nt2], [t_tien2]"/>
	  <item value="111------1-10-1: [cookie], [stt_rec], [ma_dvcs], [t_ck_nt].Label, [t_ck_nt], [t_ck]"/>
	  <item value="---------1-10-1: [t_cp_nt].Label, [t_cp_nt], [t_cp]"/>
	  
      <item value="---------1-10-1: [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="---------1-10-1: [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>
	  &ListView;
      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="3" columns="769" anchor="1">
          <header v="Chi phí" e="Charges"/>
        </category>
        <category index="4" columns="100, 30, 70, 121, 8, 58, 42, 8, 100, 8, 58, 42, 8, 100" anchor="2">
          <header v="Thông tin khách hàng" e="Customer Information"/>
        </category>
        &ListCategory;
        <category index="-1" columns="100, 8, 30, 70, 8, 100, 13, 100, 8, 100, 8, 58, 42, 8, 100" anchor="7">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenVoucherInit;
    &ListShowing;
    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX+h8+/zDkfxNKEkuCaDXg5D5afWvPREV8SxT+4cgS4spA==</encrypted>]]>&CommandQueryVoucherNumber;
        <![CDATA[<encrypted>Prfg37kMJ8WBqoB5CvJCKf7bGLn7xzhd/qTwELa/vRyx2yQIA2RHENHp4ogjvxpOgLuPugRZg31KNe08ByME5w==</encrypted>]]>
        &CommandGetTaxRate;
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
        &CommandExternalFieldDeclare;<![CDATA[<encrypted>gJoFmK0sS0RHBg6WicanqfW8GRTAxWMtvLxF2lGmq4D9yxB1X3jhBLQzLTc9OuN10JzFUa6pc6HbE5c5ZH5anK1s0i0xsnx05EGA/1++BZX6i8yLKdFXtIOf8mVCuXzF/oulpSNUAjtVCjYk/LJCLA==</encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<encrypted>gJoFmK0sS0RHBg6WicanqdURDJsh2H0jnh9j9+Pc6/lwEoOi6IpHIuUBs9BxDlxpqKOxJNU0VtOsoZrqIV+1M/sYSpxax4pnKpgHUj/ytfKwOTQyeffubIsXLtyuv7pS</encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<encrypted>xFaENuddWI35V7U5ucUf80q0ZpGByOl7L3QOjlZaSfqydgWEpTJt9RKAqU0nuOkf68GF+s9dlfjY5smXfctmZBDBPmqOK3VosVzMfajNq9sKQaxDeJfOlmUA15cH48lL1cVNsyCR0dmY04jivnbGu1xgzfCUysdj7JNARU8VJH8hDQLkG4qAk/DDsEP3BNIkUiLBxnReHAJBGyh1J9QgabYuW5qiJ2AtdPNSqd/fFVbnpn3a0QD04fiXOowe1vJlmAvSaRg1Tit1XO5Gs2DnjY+0vpIlkS3TRkFpHTq+LWVPDzm2UCOgk8Rossqz0xrcNtXwVWLNzbiqqZ/40sHpaA8ftGOzEK+AMdrUmQDqKO1J9yMwurMdLXyHSb7vpbOTRwIXWGBjj0T0Xj26QAWDTirR0cKZbEMmVvoera6M+/lTMQg5EM1g1avAsYQ/JQVWKVxUdw6uCrmHwizmnHTAtw==</encrypted>]]>
        &CommandExternalFieldQuery;&f;<![CDATA[<encrypted>LShulveQMeWQ3P4ZyXMGELVvInascRTLJxR2tGzEEDTJYbPFXj8yQmYbLLskyB266Q3j2CIgWFATOVyKydcAHv48j0l0WPqz/Jf4GMZnLvQ=</encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        &CheckCredit;
        <![CDATA[<encrypted>GzFNGEXGc/IEKGRE0x/4uRXBMTHF5Iz071+PchYo8bYv96hisvYoRy3eDkJs2wAk7u32zFfanTq6XCA+le7pyILJJbaRaxZY35y0L/l6mXrsWxhF7EW1fW56rnZq6dZaZI3n2KN9g1hGrA1WiZg3MKHT2W3tGMKwfIjCt8p+nEgh/eVIG1EtofcY9FMDpVt7Bbn2Yz12YCZXComp3H0xxPxat5TTH/SUpL4nd/wZ6K4qR214SpRLS/CzHlzgfif0FU99J+c5bWGRXZt+p5/rHw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>0MQetWC86yuLcf25hnj3USQ7mG6PCf+3MiYYtPotd5S84uk/MEGEssfJ2ne2t/DLlE3MBniYxCBcuRPMxeUMfD7gioRjl/6tf7ofUzR8bXWF9cev/+nBnbqCtlY3xT92XCJ1tCjsWefmHPV0qQgb+nHWWMl6BTwV6sHe2Xniip4vb9JnzN1ns7rIzqBIVY/JWcGxGZ7ihnQW+g13MW8h9sdP2TScaHeZMXELKjI2F0P59ZsDXv/W8+NfUmamSnhmcmPPXQAZaopY7vo3P60pL1aV8+sws1gVpP5I1+32XXdf4m6DRngLKORW6XBkpD6PXlVSFk2uN2AemZaFM+U9Ajc3WkSC6KQugCr8hJcy4AhN4/WshGMITLLCoGL23FcnUx1MF04dXhFHP7PW8P8PKJ1NcxRpdUlq0/xVvoJZMhj3xmfX9u+nEMDWv7+GCt3e</encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        &UpdateCurrentStock;
        &Post;
        &ListDeclare;
        <![CDATA[<encrypted>2amLsoM8sVWDKTzMGBJtZ0560xZu1AvdmtsapJ+T1Cc8mxg35Nv4kGtUeLvJ0h5N4ICto0/9UQMdbmXCN/AbtXitqzH9kdYPNni1ET2V9eZuGROjOEchfEAd7hSEP8SQhiU3mzAI/EHHgKLl0MZthvEdaJfxLqrAHCh2KEQBuy7chzokfm9q1YAufrrjpfsvSUMGCh3oaiKtzNch9apMclrRUZTpEuYEleUGM1H+03pxOx+l4CEUzRREGcWDiDAT/gswVnfXhdLYTeLRczPItTaQFhJoiS+adbz6xaJQcWWBCkkyDvrNOm6cWGIu60o9KgoevO3uH8ONEuWUhVguAsfnNnimZdh7v7PpvLjrnzpCwx5jWNf0aWlCVCb1FNkDjeCFwIp07F5Jbe5sPXTY+hEefvJmZ/su9/VN1syg/n4TPZYThhaBpxV+iRBZ272YoPePogkH51ldEXIqhlTbT7UwmRySPKlU6SfNtSeNFY7VuuFjcqncpOPViqEbIm5n</encrypted>]]>
        <![CDATA[<encrypted>MCiiHOhG6tLJlCo+XvfPC4IVSsWtMKKPQfMWmcyIZcdW9j62yGgFR5UooafJY6QFE+dBCk1IT/y5pCZelpPJgBjUH8hcQMs7hk+uuxqRO19Jil+7bigmG4gdVGaRFqT3</encrypted>]]>&CommandShowWarningMessage;<![CDATA[<encrypted>FTgzG0Ebn58SWQYsf65nyjIIGuY/GZ6oxX0a/PwjGKzpjGG7ekBF7RjOYypD+HoQQOEBa4roGH+3X7Qbvt3UIOffH5vbescyrmAL7C7hWNgxJZEnPpChNXMag/l8ZyBM</encrypted>]]>

      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
      
        &CheckCredit;
        <![CDATA[<encrypted>u8+GsQNK/nCUGZJnXpeg7D8Z5WGU8vuOb/zRyGE35wmdiHzVu1eptXKhpQgUpUiDPHxPC9s0sQF7W6in5YEXo2gVlgzmo9SdN32wVMmwqzQ0enAXYQVR2T99RyHLRbV/pi7sbm11abCrdKoSRdManjA+POLkcC5tzGFgQLOG97D9GEt1cxTjjvShBsy+mQxHdln41z+hOEzlRerYJihyJilg7LcbXnIiZhdXMCylFEiVoJH1s4yobS7USzN1A1DmIYLZgJlq2DxaR02Q0aOWQhyBhzZHKuZWwzKz2j2ub1ttza8+3D8m+mzdnZqIIXkNNNiFVA8q5Zy6QFZy7wBISaZUoLE4Ld61WR2wVYzy6yrARQF23oo74ryP+a21C0h/pcpsWWfIq/TTJJ8LlB0IghJskPplWeuLr4n0Ay/W1Gx+mIznrGZ/WE50Lm3XPqpwolJ8W2hPDXf3b35sCldryvETE4XJOI9jIeSQI+Qpoco=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>Y6MdTW2b/5VZpt2FeKVCOx/v/kHNWnzedG+VwgSkTGvsHHyVk07h42XsNx3B8Yobugz1JNC3x1C7rn5L2vjmMJ1a2nC/E7PmSAb33kI62H1Oe4p+NT/fz6apY6AMPJtC5rNsuzIJLSypmQp4VZbhns2FCsuiTS8xk5HkTVnzS3sdOWCfJB+ahJdh9R6x5SPEuKzd97lj9MoyOwPgRMNXIvUFVbqs1ZuFBAs29EzLw0a8zLntjy/LmOSVzD/SDdgBnqeCMmCLA/pfrUhZ+jATC70cV157y7puS6gkf1g1Q0C3mshusoP1QFrtaJbEhWvc</encrypted>]]>

        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        &UpdateCurrentStock;
        &Delete;
        &Post;
  &ListDeclare;
        <![CDATA[<encrypted>NBlF1WS7M4Cb0n6sxajne4lSddRqnyhnXrbe2geAub0eGAGO4MWW039K76a9DH4DFE5iop6ChDg9rKrQAHxF3EgliYUdJ86UPWpi0CR8ZBY5cYVv8K2W8XHkd9YoDTTISqLBuaKCTHTI9A3wcUl9YAwHugD11cMBaPM9u4h8rK4A64efFBddwGKkFkIZ1xSZ39qbT7dtTHMmoJRYNMeiyTyYo0XbpGX3fusKevV77WOYDFTwC7VRuxON3oJ+VoZB6B5guckiRfCWxI+KWzTQyMtuE4WUjDQ8BLInD168cv0ZBBs7v72JW4MWLKH5qApaJA1dkrFyCH9UypmvVdOVOk2+fy+ZMfBIIicMJswa24pk7AUcsjEREalSJWlpLW4jImLZk1Lll/gop9VNpB+b83C8joaLiyLdrC8vOowI3TIzyPpexNqb2NuYgYHGSM0AMxurxI04b8nb71S+Xdt/4Rvgwvcp9Os4LyPISi9dC85lBhyKxHOOfJIP3hqSHbXf</encrypted>]]>
  
        &CommandShowWarningMessage;<![CDATA[<encrypted>DncLzZZlWNaB3FTS+tEBWB6UGR/NLzVYFUvEfTG0Wxmck2ZAB1XT2XyK1hCPrYAKj4wz1WW+TFm6iOlhzF9Q5g==</encrypted>]]>

      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX+h8+/zDkfxNKEkuCaDXg5D5afWvPREV8SxT+4cgS4spA==</encrypted>]]>
     
        <![CDATA[<encrypted>EEf3VIkJvYCPgghCNRC9mBlGh7bJKp5nnopOLV3nV+KaC7/mSR/J7vDAq1Wc6/qGOemkggd9zE891lTH6l2FeKP0J+RafgU0u6yWQPK55kRh1zqNUMDWK0K+WHP8D6Dc2e8w/q/74s8upuMOiX+1qkaNQRBzHILDrkOmqQlXO1vbBpxNBPeOKPQS0DEbnLceOvKBeP2e3KCgwfyEasHWhchfB2Er+FWaOPuiqqkTEaZ98Xp0T9C1dnbZHA6P9YisYTNpkQIB7ppI3GRLVRx0vub44rAHF7jjcw2k0g6F4sCMWCj4vjDq2lmzL/OHfgURWeb5NQFtZQYv9cKiElMLVsqI0+ipqkMNEu//5qlDECZ+nui6Y3WGjr+kChgubUWl</encrypted>]]>
        &DeclareStock;
        &DeleteCurrentStock;
        &Delete;
      </text>
    </command>
    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/60p+9D44JxoiNnP3Ok579ocKyktQKcG3dLbLqQmo16R9IwDysVaafsa2dCnqZsFM1r64Sh+rOVC7LI2FKE8LGrKuFw+xbjJVfknpu9aqOQhNmjMjEogYqG2JBEzeeJ+6uA==</encrypted>]]>&ListControlerName;<![CDATA[<encrypted>ogtjI+VorJsU9e18utHRgs7RT9zt4A7ePc1tNNKmaJVyjYH/kweunlomGIT77VoRH8+FVbT7gJOIusF38suYZu5/JCXM5EDQ66xsZSTzPwv9Oo8KPLC5ZQ49rpjvfXRA</encrypted>]]>
<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Rea68YeMiR0r30qe2eTLt2sRq1tPih93yq16ho7ObyA</encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>7q7DTdqO7KFd8dlsd42e1urxZ8HQudu/hMb2mmMXHEIS7ABOjBc8GOOCErmfQyHMioQzOLBSY5w3EI3M23bvg+tCHrpFh2tZRp5MzI1NQeF2k9yRnlo9AMc/5z0z4bH/KUivDTPIekCAPjBZMYzw/Rb1xQ+ENNPw1X07G6SQ7j/4w8D0OshE+qCn572hKOg2kvPJYXLexK0KKe/IF47331vPLpCJxgoFuJcO50D0Es0J174znANETxmnACOvRzmP0to4v7leiosTUGFahzfXKNX4bqQLayqUj2wa2imxuxtG9mSjMJi9AnGHSF+3qTUYNuejqz+foZLwkXCgBHPWzwB5kp8BILtnw4x4+0sSoFfzov2FKGA3GuYvd12SPNPqdNMdlxhRGe4DHItMAkGh2wSfrjkYnxZKZg/7NSU4tMZ7qZX8wZKDaIk+3pHZ9bpAj6UuFobgzOUNqFnDRrUEy7Nr/PoqVjNAybBJtR5oiZCY/MeVUrVJQsXuZHLUcMTgS6xl1qsZMe2NB49Y6pO/Lpc+B3t/ebJLkJRUeXRrjx4+DGRV2eSITCn6CNEfVavkJ5Pl197yG/mmbulxInROJEdsXWD7bHBQ1a/S6shMRK51EPKD23Gh4A8cGtGXB2F+QunNaLBE9UL09TCqkXHBj9xsvWfrWh30l51Mf7Cdy6tWnGwvOcfDSVrbA9Be+yFzeE8MPCw3tz23fiwqGHfEr/hkmqeugYBEowZfzMpcZlAcPqFCoZpW5DKsBkY1roArWbPG3280ry9sL64XtwJ8CB8TRGSrgy9vQ1WxL/G/1AKudL5wvT4K3Rl4i27qQg8AmzzRe4cAl6GTAp4+bg/zu+rr+PhbnhQz5ECyLI4azb5KixQ1XMKM8gkLq8BOYozYXRaeZCc6y+0MoMtnzUAVxQCM7nF28OsK6pyhmfEj0x2+6XNndE0CMHxdKTwDWH7kL0bknN0+6WbY9FzOQFNpPi/zin9HroaoWrX0rWiwHwTWpAaDzcPbL/qpbHDU/qokplscy7HrpM7QZ9kg8aowd1MuRm5pRyF8x0aXBaKuAuCTEqY9g6BqqbGTwF2SNLuhwjjCJyefQpCLyaZ6jvgwMgI7oC76CGhTJyxfDhuShT9qq5mNyav+mBFGNFsTFApmkHqgv8yfNE6H2bLu2rz6X4WNg+4Zngwm4hnDfhaVLvg4G1ozPCz5ZF2Bh7IXn/c0FvT0S/2Jxfahz28S1D+3JTA5E9+h32n8G9KlQVW5xdSmOs38lotFbRFzUNU2b3QDWrTGuhly9vS4h9XuskM76VCK/vFhloVzkb5hNsBCsEiXXrxWHWVSjXRNkvUyaT7eei6+ZptLH6rpInz8W6PQHidIG/q/5L4z++GX+2U7aMJIPoH+nAKBGFkJDa9dZBAAf3JOxwfS0NX0sLr9Un4NDuguCqLbEp+NO7yRYXIqvgL7GX67DJkSo07+vDsRqRBorVKlFVM8AM7ExS0l6ebeeIw/LY6nP3I+cFHQ+X+IdedR+wWUbsFALLyk3AKRhL0kTK/xdnYjT2e5ZGAoEOXiO0VgZIZRSDWW4ggBxawAP4ws0dxNQk8VnAyvyTgRWbtXfjxHiu8e835Ba0Vjc4aQU2pLfMZeuWZbacyXoRnEQ1i+TAld44oAS5JJRto2/X0z</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS8He/YTJqKoLuExIY2LqND6uoifVxYx8rZC1e2ajzGgtJQhHK0R4cuNXPz7F2kahlF</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>3Vc/2ftwlG4LdUIq6hnSJd7VrZDr8lwPgUGawhuggHfYKEiox+rNu7dLGfkj1J3oNxKOhsPw5Ga/arNnrswIHkliWAK4C5IpKda5kOm5RZA5rBIA81rrFkHHQx2hZB+WvoMTU1+v54SBMsE0xeo7qlydA0BGkM3OWrFqwy/b95Q4NvLkmgVmvu7AKEVrp/r3clmAdr/S86beVorpC3E1DiAb9z+chPgTS04s+yk92+U=</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>NvOY7ITRQY0SBizfS6nQmSgPMWdwmy8Zluvrl6UAZNoKKxyvfOuZiHXcxtkUSc8Vudv9vPb0QfE3M66Wfo7mrCHechuQ7YQAfABLeCS6BQY=</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>kkYXobn8+N1dZZ6TwkanS0lvOk/iFvtT5CvELm8EuAsEt7O68+GjWC7PB/mW1VuM/t7/oBI6uuPZeVTm08BGssruv9nhaW/s7AGNRU2mqU7IoHLXM9sjUb/GUkwOtbtMkxBgyz7zjmwzpq56n7J6eT8MWtV2CpqiELy1grPsfOPoAAiXqQw1SfgGtDn+o4CGAOB4X3v5SxuTjG/Q/9fmhcXZKQ3yT85+3FYg5atsYbWEs+iDBB+X/s4tX0LZkdPLzC6+DjETgMgPrrCvSfcodOzwX1kVftu8K9WsavzjO6I6kLjm5LvLTkD6SQf+D7irmNZu2azdR/qTgUFV8YpqJullGzYBjFPJPrD0ZIloQ0g3H7uztWeyEAGTWK/348HaGAuZPUNlqqMIoPN1ijeU0TxHwlzYEP3Jf0eIlViLYVMJiwg+oKDSwQzzsWbd+WhwH9keXo7HjJFSiih4yMBoQWGg9RDDj44IEREJrj/Pq9SNdwpnLiIUwr+C2sOR8c4D4kr9PJ/TYvt4/MEcnIKcZA==</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>WJ8sPIdWpQvHe6MkaDRWldnFRoSK/G2vWFZ5TZ0nPNjrLMZVZNJbry9V1E8YVkfMzdRj3xHFu6ookDtTY/3Dm/71f5T0WbMnlXSG1SO25j22HtE8O6Yb6OH0Q63bcZ9oPoZSCFjnA4AKPxOUHuwjHcH39YZX+Qy7fqzRSE2h8uSstnnn8OcSDhXn30cMpbdnJGvnYQ9f/Sgbu4TTu3iXQi7v5b66x1+DjL19jxJeJPhyo80S3aOp1322/DZa21559tF9yuKSM0Z9wudFM9tFkfobJKaQ/ladnWdHlPjQQ19lftX9Lw29IQ28h6a3ATYqheiI/ssCb240q3LyPAm8iTj5dn76hFzts9eygGaskqd+Fm6fChT/kzM1Mr+vG/+OWTE3hD2GtBkKCjzHY/j82Q94JAkZ+ZWqaXszZxXrH8AH/E70Pa0Gv2FCvkJYXiKZLptYDaOr37qnhI8Auc7tT30/WFTH08Or+xNMzeR10BAyzp8D4/XIiaXvw1HI5F+1hOostlWahmZw5/xh9gyyHo32sUpDDB7NXKgmBI1IeIkWqrf3Q6UxlNBigyex7G1ln+eWMjyJA/Pmv/WXksn0vea46+seVFG7NmWTo532iic=</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>0Ax9PktqYRd//VnndHQ325TJNBPgboxAg6v6yS+19gZgX34dfzlRFOnUSWO17nW58bJ2ikXDwGmRelfUlQC1YmB3G5cvXD0jEaEN1B3PPU6oJAqQAXjFufKe2fOljaXjEwFaWtEvQst6U0xKrHCI2K8pn78xDfpTV/Ub07rcTIALrl4dKduNOUM4cxOepQVuRcAM5SMZQhuBCb4BZq6T43OnFzq3iKCa9eQ+wwe7tvk=</encrypted>]]>

      <![CDATA[<encrypted>sAr6Gij1qh5HumFaYZg7s/ExX0r8PNKJanLEfel0fPf6ZxljjYC2k9k6GZdwY1+b48b7Vcancg+S6aNgW2e2BbLegG8g5SJnSk1dca3adGDWlw6Qg/G1dW8tMZOBr1EhADC3Cu+s+t13zFRAu+v8VLwQvmhT1Eb8WDZ+oO9heRCOUO7Ff4VzFGHgtsY8IRbjyjpa7mcWU9WyI4mKaqhZPpuSlONgHASutE9yftf8Hu72Vy3uvEk9qyG41kO3JiZ4vFQRU5KA1fq64M4AZHlPZT39hNKI2viG/2h3n0DYxpE=</encrypted>]]>

      <![CDATA[<encrypted>UqFTGShUgfw0TUogRkGOXx/WCrJH/vk1nQmoW+5nfH+2KPIrd19wuwobU0OonraUHlmuD79o5YcgkdnZvGMb2TzSzXp/Srkj9UrgxDSmbfSGJirqx0lBMwL3Bn95xkv6RPgRm+VZyNh+I2epjsq0WKGyoz/KVZAckn1mQ6HglE+r8mUjdM5lOvN9giNjKCcajXgnzLT/zRiEnHdve62QWw==</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>103k0VKUiK15AHnoRGDvkpWJw+RF09Wt6QI/EnMvO4MXOLBCz7YTJs+b1FG2j5pIu7WkV8Jwd22/AlzS1gfSsUT8QlOv3liwz6lQ0TBvPnaB43r0RUya4btr6MjnAjm8eci/7Mxa3/xhNcqQgmB4NJn/mEqooh/woMJsPc0frgk=</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;<![CDATA[<encrypted>FawmU4g5+IPxsPuI3JxdZ8YRC18ReUSJV4Q3DDnV+YOyigWYkRzApUCApJUcZhFJ1V+7yX6TRMRQoFfCuc2JJ2z4IXTRXfIpxIyhr4Dk2p5UoUDIq1ZVVFDx4CkIvcQbckngK5gXUgPGA9is6XaaNoCs9kLPi+RiDgi4Q92dEzw5G/+Gc+iZW394PfO9B3JJCzy985mwCvIu6nPcpAbdaIx/S4Vj8102L4L74DRdIAshjSERiU7HTmfErszjSRnsgh7U0lzYXU7AvVh2FbhKiK89SkuJenWyTsLWtsYszIa1GILs+Z+Xmt+NRNiaKd1BftAZkxUGwvRtOgLco3y98WYBl0IxRW5Wj7y10AcjeLsVEYzDd8+g9eZPBAzIoLe2wKde8tvpbwCk0qZMSwecn09w2fV69ITsyK9NLH4u3qoZ6VZggJiYxwzT14G2hylzyiIWb9CLlqL57vHoma5eWkFVFzIHXfFPlFa5+ATZC0bkzbS3+NoibYeZLVe87sfiyyPIEmgsSbyb77mC5Rb6wqCQOaSX11LguNVbost/clTNIoYtc/dk3qF4lpDhIO4zhaFr1kXP+3hdQPGf5/2iW6tgIXNcQr4dStjdzcFsCFX8Tv2X3LvAHUsayd67i5L9ZUT1qkQRUFWYW6IRQGmkhSsGvGDpQFuDZBM0E+eS81ypxuH87vmNstMuYFbr3QwdhuqHGVUsXGmGe6oNtdmzC9Do5an716LLXeWnkO6XDyCt5V20sZeIm0Mql3DA+NEjQw9go8TfHZ+SM4JhJp0LEirwXpW26o1eOvnXl2+1UOhl8LbnvJk4v6SRd1P36MLuOppCgig0ZALGy6E2OM5lVBL+Me9BMSuCk8gS1ELl1MDyqCKHSs/ly6UnhVYkjU1mSvcPEYrReNvjJJZXqLBtNvfGcD53LngD28TFvjR8jN0KKE8LSH5DOIL76DfYMcSh6j2TeIjNwt4NJ6KcUYobo4lYejoV+iiDPryJkrHphhCrOUtnlyOI32f3N8DllODlUomSiccVfuXZ0kh/EaIe1iUYJ9SlzIKJ0+N+i8qlOfI=</encrypted>]]>
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
        <![CDATA[<encrypted>gMi9VLJM1SLrRmbv1C7b1AD1LYiTWfnWNNpLvSgElBNbBRBJcDS9EsPt1JOG92xAk6dfY9Gi+5p8LcS9D40vpyYBjXgw0oC5ZmomDxLvgJukYryADvvRYq7bk6pBuJcj2qN2o16J0bprVjBIdRA92xBjxnTMWRw8C1kceBYXHIi9YJ+gllr3YyGqTA6LNPGQ1+qelpUkO2g79Xm6MqR+uxnIFW7FKQgR8yT8TopxX/M7P4y4Xl+6/MGlMvu7Fttf</encrypted>]]>
      </text>
    </action>
    <action id="Transaction">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7e5YaJDJ7SedNYNYt8yN4E/bUfzFjNmzR4dbXlNss7/4HRJrbR3ZGuhDvfwGAp5HAzxh5VD5lkW08j6gzoQl0l/qNBtOHapQjMJrruUfDa22</encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
	&ListTicket;
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>sNksPaK41fR3hLndWdcwowEx0Kn0F059RnAuXBolQPhjce5Rut83brRX2r1oQpu/jEEU6tagDCGfjQqzYLXtrw==</encrypted>]]>
    </text>
  </css>
</dir>
