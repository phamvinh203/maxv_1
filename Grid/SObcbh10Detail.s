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

declare @item varchar(128), @dFrom smalldatetime, @dTo smalldatetime, @rType varchar(1), @rPeriod varchar(128), @Count int
declare @ma_vt varchar(128), @ngay_ct1 smalldatetime, @ngay_ct2 smalldatetime, @so_ct1 varchar(8000), @so_ct2 varchar(8000),
  @mau_bc varchar(32), @loai_du_lieu varchar(1), @tinh_ps varchar(1), @ma_dvcs varchar(8000), @maxLength int, @ma_kho varchar(128),
  @ma_kh varchar(128), @tk_vt varchar(128), @ma_nx varchar(128), @ma_vv varchar(128), @ds_ma_ct varchar(1024), @ma_gd varchar(1024),
  @ma_bp varchar(128), @ma_hd varchar(128), @tk_dt varchar(128), @ma_nvbh varchar(128)
  
select @ma_vt = replace(data, @d, '''') from #t where id = 1
select @dFrom = data from #t where id = 2
select @rType = data from #t where id = 3
select @rPeriod = data from #t where id = 4
select @so_ct1 = data from #t where id = 5
select @so_ct2 = data from #t where id = 6
select @maxLength = data from #t where id = 7

select @ma_kh = replace(data, @d, '''') from #t where id = 8
select @ma_kho = replace(data, @d, '''') from #t where id = 9
select @tk_vt = replace(data, @d, '''') from #t where id = 10
select @ma_nx = replace(data, @d, '''') from #t where id = 11
select @ma_vv = replace(data, @d, '''') from #t where id = 12
select @ma_bp = replace(data, @d, '''') from #t where id = 13
select @ma_hd = replace(data, @d, '''') from #t where id = 14

select @ma_dvcs = replace(data, @d, '''') from #t where id = 15
select @mau_bc = data from #t where id = 16
select @loai_du_lieu = data from #t where id = 17
select @ma_gd = replace(data, @d, '''') from #t where id = 18
select @ds_ma_ct = data from #t where id = 19
select @tk_dt = replace(data, @d, '''') from #t where id = 20
select @ma_nvbh = replace(data, @d, '''') from #t where id = 21

set @Count = convert(int, @rPeriod)
select @dTo = dateadd(day, -1, case
			when @rType = 1 then dateadd(day, 1 * @Count, @dFrom)
			when @rType = 2 then dateadd(day, 7 * @Count, @dFrom)
			when @rType = 3 then dateadd(month, 1 * @Count, @dFrom)
			when @rType = 4 then dateadd(month, 3 * @Count, @dFrom)
			when @rType = 5 then dateadd(month, 6 * @Count, @dFrom)
			when @rType = 6 then dateadd(month, 12 * @Count, @dFrom) end)
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết vật tư" e="Item Detail"></title>
  <subTitle v="Vật tư: %c - %s. %t, %d2, từ ngày: %d1..." e="Item: %c - %s. %t, %d2, Date from: %d1..."></subTitle>
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
    <field name="ma_kh" width="100" aliasName="a">
      <header v="Khách hàng" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="280" external="true" aliasName="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>

    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="gia_nt2" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
      <header v="Giá bán nt" e="FC Price"></header>
    </field>
    <field name="tien_nt2" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Doanh thu nt" e="FC Turnover"></header>
    </field>
    <field name="ck_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Chiết khấu nt" e="FC Discount"></header>
    </field>
    <field name="pt_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat" aliasName="(a.tien_nt2 + a.thue_nt - a.ck_nt)">
      <header v="Phải thu nt" e="FC Receivable Amount"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
      <header v="Giá vốn nt" e="FC Cogs"></header>
    </field>
    <field name="tien_nt_x" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền vốn nt" e="FC Cogs Amount"></header>
    </field>

    <field name="ma_nt" width="100">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="gia2" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat">
      <header v="Giá bán" e="Price"></header>
    </field>
    <field name="tien2" type="Decimal" width="100" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Doanh thu" e="Turnover"></header>
    </field>
    <field name="ck" type="Decimal" width="100" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Chiết khấu" e="Discount"></header>
    </field>
    <field name="pt" type="Decimal" width="100" dataFormatString="@baseCurrencyAmountViewFormat" aliasName="(a.tien2 + a.thue - a.ck)">
      <header v="Phải thu" e="Receivable Amount"></header>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat">
      <header v="Giá vốn" e="Cogs"></header>
    </field>
    <field name="tien_xuat" type="Decimal" width="100" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Tiền vốn" e="Cogs Amount"></header>
    </field>

    <field name="ma_kho" width="100" aliasName="a">
      <header v="Kho" e="Site"></header>
    </field>
    <field name="ma_nx" width="100" aliasName="a" hidden="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="tk_du" width="100" aliasName="a">
      <header v="Tài khoản" e="Account"></header>
    </field>
	<field name="ma_vv" width="100" aliasName="a">
      <header v="Dự án" e="Project"></header>
    </field>
    <field name="ma_bp" width="100" aliasName="a">
      <header v="Phòng ban" e="Department"></header>
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
	  <field name="ma_ct"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>

      <field name="ma_kh"/>
      <field name="ten_kh%l"/>

      <field name="sl_xuat"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="ck_nt"/>
      <field name="pt_nt"/>
      <field name="gia_nt"/>
      <field name="tien_nt_x"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia2"/>
      <field name="tien2"/>
      <field name="ck"/>
      <field name="pt"/>
      <field name="gia"/>
      <field name="tien_xuat"/>

      <field name="ma_kho"/>
	  <field name="tk_du"/>
      <field name="ma_nx"/>
	  <field name="ma_vv"/>
      <field name="ma_bp"/>
      <field name="dien_giai"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>DZdNczswdDOSj8KzbhDu9Crrqt4MlBCpUsG6XyuHG698i+5hVX+rjDRF5cwSfipwY0wcq1TYg12kqA3z7yLxgAkAWJmGRCv1zhHsjpQQSGm4MP7Wy2WORGZtcOsabncSuJYXLdN19QPhdG7i7f3T2JIpcL7+xzLVPPFo36H3sndQrxS0gzqdP2SQQMmMfY/boq3Huv3gjgiOvMIw4DvOwFGfyNyQvHiT0OhndQd6N8PTpEc3L83685+YmNTodP1jfwJKbwcmclNuNjBkW1xCHPFqmeucxGvUZCleqUbueSQK8rH1OoWLvceUqTuZypElUE6H/Q7okidky8ZPA0ZmhQ==</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>QFd1hNw2GRKUGQf7FW6NuF9TqfV4XY+JrbNg1U04e9fwUJC3yOO5949fL3+7QgrOfgvE3Gx7v7MThDGgzoKOHqmxyGtlHQiK+KzkSrM+od2L3tYHiPf0IyFvYenMvGtq+VuHaSuv49zM06DTKvGibhti2u0gcUwP3ucvqXf9UNiVBDjpY+YBHolSDm+Flm15MvWm12WDrFL6t5NHnGIwJ8wkaihBVYN99srziONPeRVyEdBgsfM+m23gx8RPpcCQhcX3oqKzkXJxsoqZJNth9X1mOkwWx/em/u5OJpthsGD+WInQgUVWE08YL5euCot7Bq1cQ1LB72BTKjZedwLXDaqi1kpa/D4G0PO3C4CHRC+ubSkXwz/8MaT8xjcg49BxZxqSOlYHX/aF18ta3mQ8bbyi+xjl116SJ3KsE6fcTTxbxDp0zoeUaCtxOyoLCyWYuScJk/tD4mlvU1okOqFGXjePI7+c0HT1+l9JcOP0mxi2nqi2XFfpDE5cqZZZTksaWe8MQPrv6r19f1rxbALbCSPai4OkSUFcK26qEGG+KhC95zNdZMhL8ov2bwvJI9CQgeIXyPf8utvFjp7hk8RxALpE7D1DLds0zGluH8cWzzwHVmqz7tgae4fDJTIqjOMCxkaYi4FTQ1qPwW4zLBMA43X3pFyWiQ11GyDXBTV/5fKkUUITvWRAi2UyLqhn5Jpz3GuW6zY5mQy+pz+mABiJFw==</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>b6wgQ8PlVBI/FPz8PvMHLfF2KFq8Vg49Q6dmnGL3w/xHEsFbjoAPej5BZmxJ5inR8j799zdokT6BNRdr2hqcL1lT9CkkUuOVDlmt9PyodE5GdsygA0syV2ODHjQJxPsV8ZCD/xJaTWdTbJcbpXJ0ZU4ypXSfrDgk1iTFv4zv2QP6VIrkWzWAQqWuiTrWyyQx0nEeQCG21tsXf3HT+rDFswapSO9sNyL0MB9OtSksHGLuL8Mf6lteKd1wEkV8imJz0IEugVGiTPpKDRL2aGl1U40MC13ChRdDM+adiqK5AkDkF88e+YxSpuhrwvuido2ZqfsBjXsczaPwUJQikpmoM79VYnuVB9PAgBoPIzD/ZsjzyO4jzyxGRVnQ9ZdGQHXQChdve5/ohBjf3TEVfcW2Dz4/3YIlcWuT3snwW5p/u/ySTk7qkIXQhkA073UEyqouiqxzr9lpXdl114mv8p27kLaGn23GschxWpAHjyE8fPyyrsSWkhoCqy3u8ll0WSY9/mtH9bMFKtXGw2sTJ746AvZ9F53PDPLc3154KhL6dEx0hwEMP9BrIptdUa/1WSj3Y3u10e22EASkkv67qIMrc6rOzg4uNjWlEAyzJ2Nj9EnFQp2qe/0/ww17C6VnekYU/ZVT/WCpWT25/WhdtTIX/Hy7TBpBl1G6RdtJrNhtSYAXj31fox7/dJNX4p3qrqZL</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
