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
declare @xDetail nvarchar(128), @groupby varchar(128), @dateFrom smalldatetime, @dateTo smalldatetime, @reportBy varchar(128)
	, @groupby_yn varchar(3), @type varchar(1), @unit varchar(8000), @form varchar(32), @dataType varchar(1), @voucher varchar(128), @revenueAcc varchar(33)

select @xDetail = replace(data, @d, '''') from #t where id = 1
select @groupby = replace(data, @d, '''') from #t where id = 2
select @dateFrom = data from #t where id = 3
select @dateTo = data from #t where id = 4
select @reportBy = data from #t where id = 5
select @groupby_yn = data from #t where id = 6
select @type = data from #t where id = 7
select @unit = replace(data, @d, '''') from #t where id = 8
select @form = data from #t where id = 9
select @dataType = data from #t where id = 10
select @voucher = replace(data, @d, '''') from #t where id = 11
select @revenueAcc = replace(data, @d, '''') from #t where id = 12
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết bán hàng" e="Detail Sales"></title>
  <subTitle v="%s: %c, Từ ngày %d1 đến %d2..." e="%s: %c, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80">
      <header v="Ngày ct" e="VC. Date"></header>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="80" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã khách" e="Customer"></header>
    </field>
    <field name="ten_kh%l" width="300" aliasName="c">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="ma_vt" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ma_kho" width="100" aliasName="a">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ma_nx" width="100" hidden="true">
      <header v="Mã nx" e="Reason"></header>
    </field>
    <field name="tk_du" width="100">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_nvbh" width="100" aliasName="a">
      <header v="Nv bán hàng" e="Sales Employee"></header>
    </field>
    <field name="ma_nt" width="100">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="tien2" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="tien_nt2" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
    <field name="ck" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Chiết khấu" e="Discount"></header>
    </field>
    <field name="ck_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Chiết khấu nt" e="FC Discount"></header>
    </field>
    <field name="ma_bp" width="100">
      <header v="Phòng ban" e="Department"></header>
    </field>
    <field name="nh_vt1" width="100">
      <header v="Nhóm vt 1" e="Item Group 1"></header>
    </field>
    <field name="nh_vt2" width="100">
      <header v="Nhóm vt 2" e="Item Group 2"></header>
    </field>
    <field name="nh_vt3" width="100">
      <header v="Nhóm vt 3" e="Item Group 3"></header>
    </field>

    <field name="nh_kh1" width="100">
      <header v="Nhóm kh 1" e="Customer Group 1"></header>
    </field>
    <field name="nh_kh2" width="100">
      <header v="Nhóm kh 2" e="Customer Group 2"></header>
    </field>
    <field name="nh_kh3" width="100">
      <header v="Nhóm kh 3" e="Customer Group 3"></header>
    </field>

    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="ma_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="ma_vt"/>
      <field name="ma_kho"/>
      <field name="ma_nx"/>
	  <field name="tk_du"/>
      <field name="ma_nvbh"/>
      <field name="ma_nt"/>
      <field name="tien2"/>
      <field name="tien_nt2"/>
      <field name="ck"/>
      <field name="ck_nt"/>
      <field name="ma_bp"/>
      <field name="nh_vt1"/>
      <field name="nh_vt2"/>
      <field name="nh_vt3"/>
      <field name="nh_kh1"/>
      <field name="nh_kh2"/>
      <field name="nh_kh3"/>
      <field name="dien_giai"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>P26K/I8lvrzgyALfukIexseZ4en5idkO2t/UNczDfu4WkYbyTLghNu1GxKDIIjKn8U4Wjg9BtOSAx6cpZ7g+/EA/t5ND7ik2MtDFDb3XwGXSVbKQsVcYkSIW6u6u9brK81nReZCocBE/vUnOT5b3lhH0F9QJmENeRv57wzTg/9O5SiNmjqzxZmE2786OnWutSYWKP42iFNhVGbm6pLzI+BgIQ1Y3UicUMkR6n/FkX/Ad7t8vF67MMEnaqeMcVvDms+VokP40Ojc5VVycbqBQExnI+nCyt/LO79yDX6t+XnDYY730oXBR23tUA2RR6WoqLwT+h3+cpscRx27S3KtSSuauxDq3hgQMKP9vuY4d3utpuDNlNXMcc5wYryf721Hbh4GVirDiOYv/iGOtiN/MVWpm/dbPaW9Ulqb2XWe64zSOBeETysFVnTVGP5MjnQm8Ydf46fbd2CUSpVzMFtwbbJ0Z5qo74Hn19juEz23JzCg5fa8np/3G6MNI9sJkfTeoVNYL2/MXqtk12GC9cLqZdCvCJEkYFxR/oCREMbM55V+y+hpnRTSZqdVnh8Mezw5NZbrToPFH0OPvdDaLFk0MNotXnjXMkQxtZ6VciFOMpyMk1DGAi1e4c2O9XQXXyrpM2QOUbi6XH/5+xbYrD99fSA==</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>Ed1h7+KQrUAzyOi/7y4OT6Mr7u4MQ8D4x8tIdULZuSe/OxLI9Ab44f5YmKi3luNoWt6f+eLcIjM62ywkw0bPSbRzqF0Q5zgdr0J7RIq+1dipZ6YCxovbSNH7DbVCa2PDWgNx6lPrwY9S5rpNOQXiw9XR3cKWs3n/++77Nad82xKe2WhhrULuZqc20I8YJS+Z8Y3MQpqjoIyVqVwLhhIjvO9xvqjFCN4puHu57Lx1uCXEANdT/nZdl5jAp8WFRDOUsAgBf+YruLopVAEhljYMZRerUKnLcRYDCQ288TPFsFCY2n1VdWlKtKu4VNy0wmiuTlZPr+J38MLhVspi1K+sMllKAcRgwVLj2riYLrtcamzjwZZ3qlHDhqaltlZ2kMZvUbpAO0G7YtwICfcjQg0goGpCSAZN7cwH8UsgYGtErW7sUwzM0dpXOBJLDCtun14U+5zN6fVjrvEhdFWCqp29WDNqiY0r7tvmsN3ikZSwX9Pxf62zBVvReRRS65Hq222+N8wgZupHGWvl+yw3ao+dUtDhP0Qht/ljuaQrRyH5azu9SaYfCEWZlOj/Wye0YHObrjh3JgGIzQDtEsYLQB3YTqM9pU7u/R+XiUdyzqtN3d92hfAtUfHzeB7Tzsxazv/4Lnlq+IVWaZ1mDYYCiRTyqB3Ff33Kg9bQp/ljz9acyORhp/zTN6Bg2bXEAEWvmwK0ZqimWQoe6mzr4N4vpFEDIb2BwfBQN3R0ee8BCay17Tv8yuM5oaogaUdEA2IlFCmk</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>K4HK3tOEpdC1zIUcWq6yWcbcb7qmYCDMHJCoyCPXCbXEz7tbm7qnIf94m3mvRejyWOUkcLaPHfMB2FJ64eKIlF9MdVviePHWj/lkh0ek2XgQOFBhwQTP1j4Gs81W+Uan+FpV392j7fcV0tdkiOtOecfHevIpPmNuEoetrviRLWABAZRH/tWPVSMwuLtBzilWD6IHPrDSD4FMhnMAMdaUfj6yULD9iuVedFTfgH/8bL/GTV409Wv1Af+kximPzAjOPt748V8BKng6HH8AbONk7majl1woYIouZukkeBnPaB/ZU0ihsWFYXVuYi9bspF9nWqS38rhu+LA/Gow4Mxg33yZTyvJQE0e+qhCoMSAcqDmbhpo+3qMyHJ/QI2W5zu+VQWfxHUmtdBcCWxoeQZuhUf+fwmyKBemEHZRCP6BtrmJyELNFcHCVLwmNA8N15ZjT</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
