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
  
  <!ENTITY f ", rtrim(ten_kh) as ten_khthue, rtrim(dia_chi) as dia_chithue, rtrim(ma_so_thue) as ma_so_thue">
  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd23$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec">

  <!ENTITY Post "
declare @group varchar(128)
select @group = rtrim(groupby) from @@sysDatabaseName..voucherinfo where ma_ct = @@id
if @status &lt;&gt; '0' begin
  if @status = '1' begin
	  insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tt_nt, t_tt, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
	  exec fs_PostGRTran '@@prime$partition$current', 'd23$$partition$current', @stt_rec, @group, @$ten_khthue, @$dia_chithue, @$ma_so_thue, 1
	end else begin
    exec fs_PostGRTran '@@prime$partition$current', 'd23$$partition$current', @stt_rec, @group, @$ten_khthue, @$dia_chithue, @$ma_so_thue, 2
	  exec fs20_AfterUpdateGL @stt_rec, '@@prime$partition$current', 'd23$$partition$current', @@id, @@userID
    insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec
  end
  insert into r20$$partition$current select * from ctgt20 where stt_rec = @stt_rec
  exec MaxvOnline$Posting$Allocation @@id, '', 'm23$$partition$current', 'd23$$partition$current', 't_tt_nt', 't_tt', 'tt_nt', 'tt', 'cttt50', @stt_rec, ''
end">

  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete ctgt20 where stt_rec = @stt_rec
delete cttt20 where stt_rec = @stt_rec
delete cttt50 where stt_rec = @stt_rec
delete p00$000000 where stt_rec = @stt_rec

if '$partition$current' &lt;&gt; '$partition$previous' begin
  delete r00$$partition$previous where stt_rec = @stt_rec
  delete r20$$partition$previous where stt_rec = @stt_rec
end else begin
  delete r00$$partition$current where stt_rec = @stt_rec
  delete r20$$partition$current where stt_rec = @stt_rec
end">
]>

<dir table="m23$000000" code="stt_rec" order="ngay_ct, so_ct" id="HB5" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="hóa đơn" e="Invoice"></title>
  <partition table="c23$000000" prime="m23$" inquiry="i23$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XAGERfv6WGGKi3cVG98eiH2XPA6Y37WxSS4XLq3drcYfRgNFpos0rQwGk9+s5Q6WM4=</encrypted>]]></clientScript>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left" inactivate="false">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>
    <field name="ma_mau_ct" clientDefault="Default" inactivate="true">
      <header v="Mẫu hóa đơn" e="Invoice Form"></header>
      <items style="AutoComplete" controller="VoucherTemplate" reference="ten_mau_ct%l" key="status = '1'" check="1=1" information="ma_mau_ct$dmmauct.ten_mau_ct%l"/>
    </field>
    <field name="ten_mau_ct%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="so_seri" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
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

    <field name="status" inactivate="true" clientDefault="0">
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

    <field name="d23" allowNulls="false" external="true" clientDefault="0" defaultValue="0"  rows="146" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="GRDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="tk_thue_no" allowNulls="false" categoryIndex="-1">
      <header v="Tk đối ứng thuế" e="Corr.Tax Account"></header>
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
  </fields>

  <views>
    <view id="Dir" height="196" anchor="10" split="10">
      <item value="25, 75, 110, 29, 71, 29, 100, 8, 100, 0, 16, 58, 42, 8, 110, 0, 0"/>
      <item value="1011000000-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="1010000000-1001--: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct]"/>
      <item value="1010000000-1001--: [dien_giai].Label, [dien_giai], [ngay_ct].Label, [ngay_ct]"/>
	  <item value="1011000000-1101--: [tk].Label, [tk], [ten_tk%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
	  
      <item value="101---101--1001-1: [so_ct0].Label, [so_ct0], [so_seri].Label, [so_seri], [status].Label, [status], [ma_dvcs]"/>
	  <item value="101--------------: [ngay_ct0].Label, [ngay_ct0]"/>


      <item value="1: [d23]" />

      <item value="11--: [ten_khthue].Label, [ten_khthue]"/>
      <item value="11--: [dia_chithue].Label, [dia_chithue]"/>
      <item value="11--: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="11-1: [ten_vtthue].Label, [ten_vtthue], [cookie]"/>
      <item value="11--: [ghi_chu].Label, [ghi_chu]"/>

      <item value="------1-10-1-: [t_tien2].Label, [t_tien_nt2], [t_tien2]"/>
      <item value="---11-1-10-11: [tk_thue_no].Label, [tk_thue_no], [t_thue_nt].Label, [t_thue_nt], [t_thue], [ten_tk_thue_no%l]"/>
      <item value="------1-10-1-: [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="100, 437, 216, 0" anchor="2">
          <header v="Khác" e="Other"/>
        </category>
        <category index="-1" columns="100, 100, 9, 120,	100, 8, 100, 8, 58, 42, 8, 100, 0" anchor="2">
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
        <![CDATA[<encrypted>GIgBxTt69qolgfZVl0H8+VxR59378lz0L9s6RtA4bSjNQqn+gVevj9T0/YBDDKISCR5FuEAVl7EnPgm808XxOpy+y4sTWmYBdNHnBcVIyg3kcUlB8Qk9pRurVy5+gEWOn58/6ShsTE4yNuWOTD/bW7wldz4RiAkGTbAlnUOT2V5A1SwKoHp/bwX+GPD9z+ovRx5a0pK7DViVlifChN8/5lrSbg+FE2/zIwfrEIYFeQQvRVWeUB75hIrG+EeGvelrw+zSfShEZ9NqQN+H84YhfowMvauKdqQg76pP//JirAQjdMOAg/FRf3wYALpLkEgf</encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<encrypted>jsguT1F3i8nGtqLMkxZj7ZjsMf3K5//Yl1RLjzQxedefFs+x7iV+t964cA4c9QJcTVgFHW564yHJnAqDAaMq1Df1BEBSVD5/uz1DFSeyPkgx+KmMWLxTMCNVU8jFsfNUVMzyz6v3OQDgCHpZp5iZZBpLZdtkjySfLOQp22AuAWs=</encrypted>]]>
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
        &CommandExternalFieldDeclare;<![CDATA[<encrypted>gJoFmK0sS0RHBg6WicanqfW8GRTAxWMtvLxF2lGmq4CMOS4FWgB7/l9+y3GU1Khy</encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<encrypted>gJoFmK0sS0RHBg6WicanqdURDJsh2H0jnh9j9+Pc6/lwEoOi6IpHIuUBs9BxDlxpqKOxJNU0VtOsoZrqIV+1M/sYSpxax4pnKpgHUj/ytfKwOTQyeffubIsXLtyuv7pS</encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<encrypted>LYsQP+xHunF0V4kGFNFbsPhVXR4W1f/upA5we2o9Fqk7WWTwWH4sM65obt786grD87C0yHi7ICleBL3vjScNg/GbmY+Z6s/nV8wrR9+OmkA=</encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<encrypted>LShulveQMeWQ3P4ZyXMGEEhB2OPFCAmGFBZmph8U+bUJDM3mRL2mVM2Ppp75ZeP+rhnRrZ+vWzpYv5maj5oltQ==</encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<encrypted>LShulveQMeWQ3P4ZyXMGELVvInascRTLJxR2tGzEEDTJYbPFXj8yQmYbLLskyB266Q3j2CIgWFATOVyKydcAHv48j0l0WPqz/Jf4GMZnLvQ=</encrypted>]]>
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
        <![CDATA[<encrypted>j/Dm/6vHzU+noc/DNng5HmmBvjn2lFJXd45/IsSoFluhmfVGmMhY1T6R1Gqo5bs2dmdxJlOeL0QoKD4EWjwcBly7Pv5kZiqMqHndDNAklTRksOj0GDPQp0sUrnwOo8Wgqvi9kC150SPAu4ptvV2jXiwIWDMcfu6diAU2WdrtEurnSWON+rJBZb19TVytIlrmQV/zeJ1eXm79S/XfYzny0A==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>5brbCndavpBKicthgsRcUQJwGjRy9Fqz08Ojy5QfB7TJTySJHPbpUB/KakxoJHSkOaZuWztGNKoM90IYEXz1TlC6Uq/9AWPNc8W6lxpyHUK1oPBA8r36nyloXGsa5P8t27iJsjWqKEoNmGpL6Bept2ai9TK3FXWXQn7sf7lYTyqYEWlQIz6js2iOiJPSEdSwNCK0XNDYHqx6Hgr+RoxI0Q==</encrypted>]]>
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
        <![CDATA[<encrypted>bJ/GFjKvZ5gwWqJ2qEK3CS8jFgDP7abtPlfEyE5yXYZim8gRNVIT3bXG50ohtrW51Wslp3t+8ZQQ27gFpiGzWFZQV/c82afbeDRLVH5s38lWiYtdcfZXGjmiZgiUz/V50hI6+BI/FaoP0t0B3W/PaF/DanXPwtgowYxqQUrxt4uZ5L8EoobqE8ws86jwQwdQjPRwdD/19owYXgtV0MJCS38636+iF8NMxMLqIANgrRHgeEDgEe00qtz5+9ZnvwO+yJZuyP3WhfkWLdUzn4uHRy+APtPNT3Aekq7vGoxEvEkXQxOq6ZzlLsdG4G1rmLIoKicPduSf1xbuFGeLTab9R9xOy5UQgskeuICOMQHWfUDSLLn44+dvrBEKtAkSlpd8jRHXCoYC3Jd2Hqc0S0PvPqtQL64qR7ERVtHfQZTPot61oTVPq0AabuquraWjNoc6</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>lsMmcsNtrJQteDrjffK+ezf2dptPWoYhYYvWb5BJfNieTwsZYl842tt36Zy4z2DmqtSHaqyA22VKbg/uR3k+cyF43KEo2h7YtQFa0SFzNr0cyZBO+FeCWiE0CWZ5RaxdUMmAuVogZ5cVeAzNlNe39DcNhklfWw/INdwIznt0XrYfZzDvtG7qmnPlGXfYdP+UFAI+/txDj+K9CnYZj4kf0rxrpk86OnGuCK9f4B5S9qaz8IsRX0m4IPTtqMSan6zNrj7prD5W+caNcG3Xx42FLyuGMbf96QmILAmrahjOvaE=</encrypted>]]>
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
        <![CDATA[<encrypted>wvP8kPoxChIOOFLBiJDa30vHXzWuzalzqPwnKktelETmbLl8+QvLLaN2+U7/XLALrNY0M9iK8TFAFnsdnDLS+AOwD1JiDNNBDgMICQkYbujBoAbyChoyaHmlva4TNeIwm6Qc7UtmwqAGjiAWAKJd6f7Of0mFuHgxFz87vHVFk/Mp2b8m/IMFL7819siBBV7t</encrypted>]]>
	&InsertHistoryVoucher;
<![CDATA[<encrypted>N48N8EMXpHnLcQdkuCcKw+867PysvgQOHJKLPSZ0Aak2hM5p7SwTSeX4fuJ78MjAttRtkI0an1sFVNTUSPYm1MaRPREKv9QYYBCd+Ixr33EyqqoPp41zwTqZsqrqBfK51fGpyrCTKS3gnJNyHU64fcrEaBWZn5fIqZUg0NMZgW0=</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS8p9nsRRanAtEXKcI5YLfU2LTEPj7kP/stj6JSHsKnX2e8zxSujBYhoW8apCbsnZ78SqxqkCDWz9QCczSKWrVejA==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>dtQO5sOz6A1wBxH6N2epUlhPd8XnxjcgfZCrLhYiWunNQcAq43WZY59RlENjAWfJai6xDnwWX56X6RSInrV8vyvFEwqBV9HKTlqJu5hTG5v8F5eQoc2OAARxRbRP5zl6PUvLNwivqIj5q4XtQaqJaPSBVf8VIjiQYU2zdM8UWulm52QlAA7EmXNb2JL/cN/XUjv44KBj+3s2xX+v5gnoGmS/X4/3Qm6pq62+zaPc2IAaA+Z32myS0Zx1IOrYNa/q</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>S306XDTuzLrc8Jzckjo4t2f/Xq9LDTc0WntjEANcc86IifqIULcqQpmLhBsN4K7TiaGjBkYeTj/Tm/Z+PeBCPQ==</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>jIeeK4soNu3ISGcV1Hc6bP+Rx4ALjkO26v97Fioy2LQLTO2FAKm4jnCkiCbKnE+yauqrVIcmunUtcd8et1b6pI7cmTA+eVPeyDtsyEwJ9rvpvXTXMtJr0DvlbikBNJoMJJzfDNMCVJsQXB7/2GVVSnpRUWH/FbdiKi8YN9uw3ILfe92tysR+3Udvm4reEHzJJLH2UibmTUju7jT3Z5z99Pi5md0lSpOire+Nm0St5t2oMX2lBVYLEr9DiuEQYC4alpNoSlNg/wLokXrNoiHGCW3sIRInRQY6jHHgnTmtzj22qzBnzmwOyBZQDSSAxygDNwHaYO4iXBo8mixKNUpDKMgIdDXAuMbJ7aVQHYfGbNvCyfmfYCqVuTt0cd9vkmZN</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>dmdZfFqOJ2tLvSu+nQkvjBeD0mxCxx4yKOX+7tERRXZay0aBL1DSpDHDC/NSO70Wtm0ejA6Z5Y61sCNAHpJKaC6XEBeJ0zapz0yQfUVOPQAWjRHX6F+GF20vu0FrH8tTYlNzY2JyClo2bCYhhMwxybVSFSksh4KU2c279wbJGifdgMb528ckhamQxoSPhDpxNHfi3yfI7QXZe//eC+aYp1ofpdFJpyZmjyBitbVv29K7eGTgMt7/KsqjIKQnIAtEJvWo23DJnlOI68gsgr89KnZdZrEYJLP8B1FzteEeEUY7ui5s2iioPXif7Lztm25R+UZBgS32GuuAHYfNYQgtOTwM4DNQU5jGM497OavzDVMYAb2GIGWHLRRM9H9RUtitt1dwSGBpwN3KXM8Yam4Nce7t6ShXyiia7FDmLKN2X6LlRhdu4nL8NSlcpV0COStWPZW2uyFPm8xeWkcmSCd3FvskKLjsBE8vB/0jecXPIBkd6Z79uiMX+L7Y+e4MIeJe</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>kN8ac6SBBC5ZA+5MD7KBzGIF7qlWeA5+HasvcjuXg/PEkxEYZ4zjLz2CtTR7aEqygRwyXi5ghW6Y4HYYHfmY7SROuMJWXLIScPlojVyodyJLoepVrJJoXk920jDxA6i1aWioqRCIBorYS/kuVvrnf821DBeFc1HYmdhaPXVNYwkHwGW22l98iU8kaZZtwzYTRFHfSUjEnE7QCzvmAI47Gg==</encrypted>]]>

      <![CDATA[<encrypted>TjuyLqlaXdbO9RyvV6FU4evz49pjcHYomwm9pr1o2vjLCbek9ciwOEgmHI9uJl5HGNq+GoJfFAgD13eFJPK83ZJ5ICjS7p2wWxDKbjg/ijnjMHbdKxfBSoKUTzvxc+12ALSpKCcEpWDgtJ9DRy1HjBHQw2d2M9WMsmlFIECAKDwumq02tbwuwbtm7ZBuWfl/0AwWjcMf/mABe4f66cI+RkOhixbZPEcz8KKxvkxNhk81mUn2MfS+oxusDme1++A0LwQF/CgHdpkq2L4mFjOrebYRtHr2UXBdqrkiBEJopoW6EoXSkMdLgH2U4BjWw+E4+iJxPyXJfXEI9tHFxv3OoEkXY4ZE6leYvMkdi+xnzow2EB5TurSJWRrTVP4D0CAOL9TqEXQ/cPyAeMrFJ5d2tqOnE1OHBMDY/10KcAtajPj/yDPuyqkffVoDtAWCm/jS</encrypted>]]>

      <![CDATA[<encrypted>v1mcdMOMviRdgI07lhNNtZAi6r89u4Esb32okLcszZPbBl/+xpWXZfECB07Z8wGYcuaoLrVKx+evRIQO0aWjuMLXpfjd7VwTVJTFlAyigl/6weZxNJca6eXaKKJu3jPDbXLLYkk/VGiwuk3hYCVGHvsgwGJ90kBI8QmroRMQ3a1N3nZmt1KDXVpgfv6YgZgTUcdb4TvLo9G4yXzbD8gHaA==</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0SVG/ZIFBAaT8lyFwW2eU1YEm9B/nkodjj/qIJ+aRz+i</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>AXQ6yO6pZi36aOIPzuClQXRlSuZt0X5O8lw22qjKs5Z8jTUZ2dYbTjKM54dsFZFoIOHysRFomrMlR1mV2jSOmSuFAmEmpDLi24VNdwDxNPIQ/J4KJx5yR6tYLaOqSXVAgRcnbn/blH+XTF+MImRqSBshmmw5zyztfwU6Xp2Z4IdcXst1cQpa7qSrB+BGyuX8Ybj6nuQzp5PszOq501RPG2XrCK1d0X45I6L21C4qdxa3iaza3Sm8JrAppSkZmaeTEEmub01bctskDWeANExknPhl5oQnrPs7xZdJgkts0TfBYsQ2ChBBUI48sRZW8QGb</encrypted>]]>
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
        <![CDATA[<encrypted>/N6TzF7CTAilwYaIw/16PCkokmEInnKgvvnDSh21jR8U21c4qUSxv57U+uxGk4P6Nzl6YmrknVOTG4Nb4KXzHZ0Ns7QgGt2WBYF3yjMGnjRjw6yS0IHjeGYiFSmB3k5MaoNmToUjIbUFU2ZksyFZdjykZzu7QvyJVmmcISQ8Nqen4KT/9Mz9eGptA2LetnJVGv3vApTNZ0Jqd10gpzLAKtQ2T4wfQEq9fpmH0XJGJu8Negm6K5JvqjzWuJgfpcacz+clW4EesxQVcU8OFrppCt6Bfb9gwRcjw688ktHmB0Xcv6DeFJMwX/8bZLQsrbLs</encrypted>]]>
      </text>
    </action>

    <action id="CreditAccount">
      <text>
        <![CDATA[<encrypted>lbl1/awQvH7NpAjXBsCQKMtRQvMedxdLhsY6V+JqvwYr874i6LoZ8wMYomsiWBSOMqTsjSNQRUUD+x1dowV3QuQl7bSdO57HymiA3Omtdbi5QFihLLm0ueuiQOXg7fePgtfKYZlb8X1/MB7UlbjMgw==</encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;

  </response>

</dir>
