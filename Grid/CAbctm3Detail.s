<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardQueryToolbar SYSTEM "..\Include\XML\StandardQueryToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY QueryString "
declare @c char(1), @d char(1)
select @c = char(253), @d = char(252)
select * into #t from dbo.MaxvOnline$Function$System$Split(@@queryString, @c)
update #t set data = replace(data, @d, '''')

declare @ngay varchar(10), @ma_dvcs varchar(8000), @tk varchar(128), @ma_bc varchar(32)
select @ngay = data from #t where id = 1
select @ma_dvcs = data from #t where id = 2
select @tk = data from #t where id = 3
select @ma_bc = data from #t where id = 4
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết phát sinh của tài khoản" e="Detail of Amount"></title>
  <subTitle v="Tài khoản %c, ngày %d ..." e="Account %c, Date %d ..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90">
      <header v="Ngày hạch toán" e="VC Date"></header>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC Code"></header>
    </field>
    <field name="so_ct" width="80" align="right">
      <header v="Số chứng từ" e="Voucher No."></header>
    </field>
    <field name="ma_kh" width="100" aliasName ="a">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" aliasName ="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tk_du" width="100" aliasName ="a">
      <header v="Tk đối ứng" e="Ref. Account"></header>
    </field>
    <field name="ps_no_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Phát sinh nợ nt" e="FC Dr. Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Phát sinh có nt" e="FC Cr. Amount"></header>
    </field>
    <field name="ps_no" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Phát sinh nợ" e="Dr. Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Phát sinh có" e="Cr. Amount"></header>
    </field>
    <field name="ma_vv" width="100">
      <header v="Dự án" e="Job"></header>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_dk" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
	  <field name="ma_ct"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="dien_giai"/>
      <field name="tk_du"/>
      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
      <field name="ma_vv"/>

      <field name="stt_rec"/>
      <field name="nh_dk"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7TcaLI21z46LEaatog0rwiI474/9qeU+OXMdau6OeN9awGHUzTFZhVG/K6ARXIdmKk5ceWI4irdnfsMsVNHNQKfAbkYYjbBd657wD6HbiWrYtq8XUu4LM21qswwZxJhcvg==</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>euCATU87ZFXgYUFhPgleXvr7p6zoOJPO+J1JXsEUwOdchj0QCeRT720Y99NoEXbSK9qhLuoji0ZSi3sJ7KoYfAqQhigHaRGKl0Ozk/mmElCDmglVyISG+sRZdQut+NZ6BhVSdLPn2MrDW+xhSS+oj3dGJVF3cD2J0qmxYAZCrCPOQe7siTQP5v9xBtsQgNnbj7hqD63XSzKw/bIiFQXI1+iin2ev8fAL3Nlyd74sAgU5riBUhk2R4HvB5Gp0ollZPjizHfOOdvVZ8d/FggqfSGLT12ruRSV5BrIpnZz227f4CGvzngahkNKCcHIXWk8viO4NHO+1QScs3qt00CqpwVhMQalF6YF5gxnH0N4tYrs+raJXd+kAWjTbUZK6KoIcQZo+72vJQKJGPYkah7SVPRJBDB8n6kBY4un4l0kMt3M0gBUmf6X3SJ1QBpSV4IIcjAYPICclNuU00uf7xN1r9A==</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>

      &JavascriptReportInit;
      <![CDATA[<encrypted>rHazM6voOIlttZj8byIxhlwcGE3YeVnf4Zo34h8kQgJfDWxUD9dB0H0sZ49WTxIj/+3DAM6jxLMmpC+s4XfDrILeEHJH1k1Wd+OAmN+AfmbTx4Tw0oMnX4bzZmnzvceSMue8QRCrU96fqZMzlcOuSjQpIj7wzhW9L3gTnKEcafFiuJ1LEA2g0U3Hxmpdj8/Z/Uo6qF57aNUhm2GlMbT3ew3UZu+tLT6IyM9DYLoXRTFCP0ADmzwyTXeUJfRaWOEJIDtNM/jmrUu3T/yAgORviV/phCNvsf478JNILMm00AobSykZ3XzLD45oBDO2OSaM</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
