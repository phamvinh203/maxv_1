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
declare @item varchar(128), @dFrom smalldatetime, @dTo smalldatetime, @unit varchar(8000), @site varchar(128), @form varchar(32), @data varchar(1), @type varchar(1)
declare @ton_dau numeric(16,4), @du_dau numeric(16,4), @du_dau_nt numeric(16,4), @sl_nhap numeric(16,4), @tien_nhap numeric(16,4), @tien_nt_n numeric(16,4), @sl_xuat numeric(16,4), @tien_xuat numeric(16,4), @tien_nt_x numeric(16,4), @ton_cuoi numeric(16,4), @du_cuoi numeric(16,4), @du_cuoi_nt numeric(16,4)

select @item = replace(data, @d, '''') from #t where id = 1
select @dFrom = data from #t where id = 2
select @dTo = data from #t where id = 3
select @unit = replace(data, @d, '''') from #t where id = 4
select @site = replace(data, @d, '''') from #t where id = 5
select @form = data from #t where id = 6
select @data = data from #t where id = 7
select @type = data from #t where id = 8
select @ton_dau = data from #t where id = 9
select @du_dau_nt = data from #t where id = 10
select @du_dau = data from #t where id = 11
select @sl_nhap = data from #t where id = 12
select @tien_nt_n = data from #t where id = 13
select @tien_nhap = data from #t where id = 14
select @sl_xuat = data from #t where id = 15
select @tien_nt_x = data from #t where id = 16
select @tien_xuat = data from #t where id = 17
select @ton_cuoi = data from #t where id = 18
select @du_cuoi_nt = data from #t where id = 19
select @du_cuoi = data from #t where id = 20

drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết nhập xuất vật tư trong kỳ" e="Stock Movement"></title>
  <subTitle v="Vật tư: %c - %s. Từ ngày %d1 đến ngày %d2..." e="Item: %c - %s. Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90">
      <header v="Ngày hạch toán" e="VC. Date"></header>
    </field>
    <field name="ma_ct" width="50" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="90" align="right">
      <header v="Số chứng từ" e="Voucher No."></header>
    </field>
	
	<field name="dien_giai" width="280">
      <header v="Diễn giải" e="Description"></header>
    </field>
	
    <field name="tk_du" width="100">
      <header v="Tài khoản" e="Account"></header>
    </field>
	<field name="ma_nx" width="100" hidden="true">
      <header v="" e=""></header>
    </field>
	
    <field name="ma_kho" width="100">
      <header v="Kho hàng" e="Site"></header>
    </field>
    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat">
      <header v="SL nhập" e="Received Q'ty"></header>
    </field>
    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat">
      <header v="SL xuất" e="Issued Q'ty"></header>
    </field>

     <field name="sl_td2" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aliasName="a">
      <header v="Tồn cuối" e="Issued Q'ty"></header>
    </field>
     <field name="sl_td3" type="Decimal" width="100" dataFormatString="@baseCurrencyAmountViewFormat" aliasName="a">
      <header v="Dư cuối" e="Issued Amount"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
      <header v="Giá nt" e="FC Price"></header>
    </field>
    <field name="tien_nt_n" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền nhập nt" e="FC Receive Amt."></header>
    </field>
    <field name="tien_nt_x" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền xuất nt" e="FC Issued Amt."></header>
    </field>

    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat">
      <header v="Giá" e="Price"></header>
    </field>
    <field name="tien_nhap" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Tiền nhập" e="Receive Amt."></header>
    </field>
    <field name="tien_xuat" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Tiền xuất" e="Issued Amt."></header>
    </field>
   
    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã khách" e="Customer"></header>
    </field>
    <field name="ten_kh%l" width="300" aliasName="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>

    <field name="ma_vv" width="100">
      <header v="Dự án" e="Project"></header>
    </field>
	<field name="ma_lo" width="100">
      <header v="Mã lô" e="Lot nbr"></header>
    </field>
	<field name="ma_hd" width="100">
      <header v="Hợp đồng" e="Contract"></header>
    </field>
	<field name="ma_bp" width="100">
      <header v="Phòng ban" e="Dept"></header>
    </field>
	<field name="ma_phi" width="100">
      <header v="Mã phí" e="Fee code"></header>
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
	  <field name="ma_ct"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
	  <field name="dien_giai"/>
	  
      <field name="gia"/>
      

      <field name="sl_nhap"/>
	  <field name="tien_nt_n"/>
	  <field name="tien_nhap"/>
	  
      <field name="sl_xuat"/>
	  <field name="tien_nt_x"/>
	  <field name="tien_xuat"/>
	  
      <field name="sl_td2"/>  
	  <field name="sl_td3"/> 
      <field name="gia_nt"/>
      
      <field name="ma_kho"/>
	  <field name="tk_du"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>

      <field name="ma_vv"/>
	  <field name="ma_lo"/>
	  <field name="ma_hd"/>
	  <field name="ma_bp"/>
	  <field name="ma_phi"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
	  <field name="ma_nx"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>DZdNczswdDOSj8KzbhDu9Crrqt4MlBCpUsG6XyuHG698i+5hVX+rjDRF5cwSfipw08UmksubdQ1Ope43OL8oAmlTOF6L+n+ZNl5wUuYCRO3s/xw6g/Iwia4tywv8Df/utCRB4fwR6gKFaLwrKwJiVt9kE8DL2STJQbpJCJYLChURDnqj96Dnf2kVngn9d1wkO6ZgfMBu13r/65Bfo+aYQAKRe4qjL2VbqGcqgl2ikfDSJmCtJfoRXcPRBd80IRx/R7yOmBl3EpEYvx7q7ZTWEd6mmPvgYAWhP4ZdY/qL/M7TAVyzHssTsyq0rnTZd+IpJKMMAKSZZyu5/9wydpwHVQ==</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>y45YRsvP75xhX7pfbvoTZvePH4Mq+i6DFPQlmWQ+LpkuUZln/sTkc1VICf/sUo5OgQuDkMjefz3iev2zAWbR9pA85+utWeSlzj414uF6iciCDWuvj2VVOYVP0ix7+mjo9c5RRuCCr33QrUzAJTf0axlXMwPgRVvQ82WM73UYuDaDR0AuBjsJm5HOp4b9aoNR8mD9LD6cT3ILCzf/njpvF9PHo0e4Ulaa3xBX2Hzz+e7GTVlA9QDZ1Ul9ngt4IyO2fX7nRSHp4cWF+rTgkDZ4Ccb9D6x2fJ+yJGjStGo+Wyey8VZ8/fqOXvlh2tTDPNqghZOlwPalyFHh4wrz/KqDy0fFUPQffoFUssrgAKC+9FPf7kaKHaQ4ytGYYz3z3X2faY5Sry3k+n2d2tNKiEw5cKOZ+A6WqBS9SlzemGD+szTpfwRLhlEDHenl/igykKq0g6ndpOg/wx6mJoyQVjXuoMs1qTSmc6hwydP4z9Qe9MGitCE558FRD7BIGmQ77ikxz0+QUlyVWs6rwNDd+xQOJw==</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>raq6IMenbX/uvMFrnZQ+oGq6AeIcIPIOf8TV+qZVQko5Upra5eN9gQvPVse0xUaBKBwmnAeIesawqUwHS7jGt+ZCnETNp7gInPdaeE4c80YBzdogBHnJEEtYOqogJSBTfHJXFpeQo3rFv59xJG73mWFbnaiVnxjZepF75AZTukc8oYO7yyPEA1d+jl+g27gcUYjkbUgAnIyiklL1HJ9FwQiEnPkKFMfKshR3Ac5Xt/JCELD1VhzOdnc1m08OuVVGTA7L6ZgF6QQsjaSOLBaqGHQeazbYntDrfjOaLnauezRgY+MPi5HmXUKIKKOm/IwimFSZMxlpXRRJVnhbPbBvRW+ETNvybyw0ivr0dK4yqGYO9Pch7NBuOfenQbAZfyimQq50ts/szis4zer7p/omeyc83e4YhwchI5WsNGBwARub9sMb9PCxUgikYqE68jrWVcBiHlpjWEoSGxlPKp9tIfhSp004PP8L+f6FayY6f+nGbYgpRoTRZmPLoCDHvCoLjeTJ9IPittESSiiv5/FGOwUsv4kP0B0S6zqF6YUNB9P9sBZsrtqgD03etkeqfTJ8y2wiM4B6jZ0unXX0fdjNdfkMcgIFYWTnZsO4XKDG1pxJEOrpSCLA76CXoMwhyK4icnZ0vPi2iNCokyad6088oUfSLPjUedgN1PKG5kxddR+6ZMktLxWwhV/MQ/suComB</encrypted>]]>
    </text>
  </script>
   <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FNRmb1GUljl7TT5kwkkjIrSfG1w+hCXYzHWvvqZs0ZqPN/yDMNpe/idlHa6yONnxkk=</encrypted>]]>
    </text>
  </css> 
  &XMLStandardQueryToolbar;
</grid>
