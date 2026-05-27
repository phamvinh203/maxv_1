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
declare @item varchar(128), @lot varchar(128), @dFrom smalldatetime, @dTo smalldatetime, @unit varchar(8000), @site varchar(128), 
@data varchar(1), @form varchar(32), @type varchar(1), @reportBy varchar(1);
select @item = replace(data, @d, '''') from #t where id = 1
select @lot = replace(data, @d, '''') from #t where id = 2
select @dFrom = data from #t where id = 3
select @dTo = data from #t where id = 4
select @site = replace(data, @d, '''') from #t where id = 5
select @unit = replace(data, @d, '''') from #t where id = 6
select @data = data from #t where id = 7
select @type = data from #t where id = 8
select @form = data from #t where id = 9
select @reportBy = data from #t where id = 10
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết phát sinh" e="Detail of Amount Incurred"></title>
  <subTitle v="%s1, từ ngày %d1 đến ngày %d2..." e="%s2, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90">
      <header v="Ngày hạch toán" e="VC. Date"></header>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="90" align="right">
      <header v="Số chứng từ" e="Voucher No."></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ma_nx" width="100" hidden="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="tk_du" width="100">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_kho" width="100">
      <header v="Kho hàng" e="Site"></header>
    </field>

    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
      <header v="Giá nt" e="FC Price"></header>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat">
      <header v="Giá" e="Price"></header>
    </field>
    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aliasName="a">
      <header v="SL nhập" e="Received Quantity"></header>
    </field>
    <field name="tien_nt_n" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền nhập nt" e="FC Receive Amount"></header>
    </field>
    <field name="tien_nhap" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Tiền nhập" e="Receive Amount"></header>
    </field>
    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aliasName="a">
      <header v="SL xuất" e="Issued Quantity"></header>
    </field>
    <field name="tien_nt_x" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền xuất nt" e="FC Issued Amount"></header>
    </field>
    <field name="tien_xuat" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Tiền xuất" e="Issued Amount"></header>
    </field>

    <field name="ma_vv" width="100">
      <header v="Dự án" e="Project"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã khách" e="Customer"></header>
    </field>
    <field name="ten_kh%l" width="250" aliasName="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
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

      <field name="sl_nhap"/>
      <field name="sl_xuat"/>

      <field name="gia_nt"/>
      <field name="tien_nt_n"/>
      <field name="tien_nt_x"/>

      <field name="gia"/>
      <field name="tien_nhap"/>
      <field name="tien_xuat"/>
      
      <field name="ma_kho"/>
	  <field name="ma_nx"/>
	  <field name="tk_du"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="ma_vv"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>XxSUAcdJSsGC3/LUv6iMSUIEwouEFOpfG/9Lz1yH4XbatWRU57+NekN2C44WufLqfTWKKCEJjJ3/wBRhE5ZInqifQu6Xi+8iVGE16bbVD+ozVDuKDJ8iUsHqaudWNloBOfitENBoIiVIbwH8r3fznzJsOLfn3ehacNEA6ccrd50ekD2yNzKdjTmMO40vJns1</encrypted>]]>
      </text>
    </command>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;

  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>l/YcAq2/CWGXhu3Kr5cvVcROrMYsE0ckg1o4lH4ZeGOTMDrNIdp1xOctBatxrT9gq297buWpJtjL7TLVaLIgxdP031qW7IXaHt2x1sSg7hdJgLaHs2i2ofGKBIKvba+f4aF5/QzJ1bIopO0rLkSto4Hnn3j1IS8YhDxt4L/RuZBQHIb1GJAgQDjIJzDFfIqwifDWJ74Zip29HaFxZfmDNFJz46qSveL3Y05f+VnyMdScq+1Q2h161fZCo0Qx0zMwocvodUev52S/tEyFkuX3lHdJKcx1d+9o7C5VGRCCny5xlIEm0wz/AFrnFlGwEKeeML3GW1taS/DnI8u2/r0qTdjxTIXrgkLqmeNeTgw7aSlyjKA3onaGDnrkrxhwcBJeH6eV9l7z8pbwwB82vPoKifv13fC1QG7fMLHHSEL+/laot6N6WQencp62rH5qqy7BN31xFUOJdxTU9ny33kGr+E7YUEaDeSo1yFhN6LL5Uc4=</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>5kQhlNJFOgewzJahDIEBlMC+POoOk7Kk9grfzSALUhR0bT6dGIyo+AUvDCMRoHU0CKS17JlumDfTlnNZ5dZO/EZGNqU7ZPGolTpol7mA6dBThBxFYwqQqfQY91NDdFMwxBYytn/UBfwx4zvCmoGAbmZymPIuJ/1G/z41+TfZgr7JNMQ6CiVUq/veMhNy4ocsY2fKlX03MvGXnTxPxJkFTNP8Zp1SEE9OhxEHo8UctbLPhbQi0HBlNHAV8nsNOvKeUDVqMHKiFQmsa9FkYrO2NMDBZEghdM4VSVEJjeAibUoSiiLhWMeuUGyz6ZQSxRzypkP8CW6aNtACgh0Qu0uVBo3A0BY8GFerN+WDBXC6iXdKyu0NwOCBZcEokzwqaRLlA7Yu5pR8gG9U6l6qpIc6Lga/1+xq2QyO3psaIPPSjZbtln2n7OuAx1xl9tVM/lo5tnUD6Q004EuLajPksbNavIa8dk1kaD/LZoDkD8wRLU9G67Uqx8x8uWoiJJDu/gEg</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
