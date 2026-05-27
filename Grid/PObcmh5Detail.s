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

declare @ma_vt varchar(128), @ngay_ct1 smalldatetime, @ngay_ct2 smalldatetime, @so_ct1 varchar(8000), @so_ct2 varchar(8000),
  @mau_bc varchar(32), @loai_du_lieu varchar(1), @tinh_ps varchar(1), @ma_dvcs varchar(8000), @maxLength int, @ma_kho varchar(128),
  @ma_kh varchar(128), @tk_vt varchar(128), @ma_nx varchar(128), @ma_vv varchar(128), @ds_ma_ct varchar(1024), @ma_gd varchar(1024),
  @ma_bp varchar(128), @ma_hd varchar(128)
select @ma_vt = replace(data, @d, '''') from #t where id = 1
select @ngay_ct1 = data from #t where id = 2
select @ngay_ct2 = data from #t where id = 3
select @so_ct1 = data from #t where id = 4
select @so_ct2 = data from #t where id = 5
select @maxLength = data from #t where id = 6

select @ma_kh = replace(data, @d, '''') from #t where id = 7
select @ma_kho = replace(data, @d, '''') from #t where id = 8
select @tk_vt = replace(data, @d, '''') from #t where id = 9
select @ma_nx = replace(data, @d, '''') from #t where id = 10
select @ma_vv = replace(data, @d, '''') from #t where id = 11

select @ma_dvcs = replace(data, @d, '''') from #t where id = 12
select @mau_bc = data from #t where id = 13
select @loai_du_lieu = data from #t where id = 14
select @tinh_ps = data from #t where id = 15
select @ma_gd = replace(data, @d, '''') from #t where id = 16
select @ds_ma_ct = 'HM3' from #t where id = 17
select @ma_bp = replace(data, @d, '''') from #t where id = 18
select @ma_hd = replace(data, @d, '''') from #t where id = 19
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết theo vật tư" e="Detail by Item"></title>
  <subTitle v="Vật tư: %c - %s, từ ngày %d1 đến ngày %d2..." e="Item: %c - %s, Date from %d1 to %d2..."></subTitle>
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
    <field name="ten_kh%l" width="300" external="true" aliasName="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
      <header v="Giá nt" e="FC Price"></header>
    </field>
    <field name="tien_nt_x" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>

    <field name="ma_nt" width="60" aliasName="a">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat">
      <header v="Giá" e="Price"></header>
    </field>
    <field name="tien_xuat" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Tiền" e="Amount"></header>
    </field>

    <field name="ma_kho" width="100" aliasName="a">
      <header v="Kho" e="Site"></header>
    </field>
    <field name="ma_vv" width="100" aliasName="a">
      <header v="Dự án" e="Project"></header>
    </field>
    <field name="ma_nx" width="100" aliasName="a" hidden="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="tk_du" width="100" aliasName="a">
      <header v="Tài khoản" e="Account"></header>
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
      <field name="dien_giai"/>

      <field name="sl_xuat"/>
      <field name="gia_nt"/>
      <field name="tien_nt_x"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia"/>
      <field name="tien_xuat"/>

      <field name="ma_kho"/>
	  <field name="ma_nx"/>
	  <field name="tk_du"/>
      <field name="ma_vv"/>
      
      <field name="stt_rec"/>
      <field name="stt_rec0"/>

    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>DZdNczswdDOSj8KzbhDu9EEY2W9MUsUL/pWgvJ3W8Bh9AuWhesKOlYhy5dt+e7bV2eRZAioSg+nFdGF7pQLLtsAZlIkw+CsRvT7tf3MOhM/NRcKuKP6hQrI6jm9eaoYto/IPBXJyO3ZeMzMJunqvTgegVMXD6gWn/Bro6KGVpdVsWO+EBkEcy62xPIkfJOyvzCEcDdNgWYmg/tbe5kytZmj8Lw3gLAh1BrB3fkaAn6sYtfyUGLemjETkz9QEhXY3RhxmYNh93qazWKwEY2QBIAfv5ILTULCfxukQ3qDDm63EzQz5P7rSzPDC2uDt+Hns</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>wpoHVjsC2HQedx9wlpOsVg36MpjqqINFXr3e9ehIkFXi/H3jScy9QjosIcf4Kns0H6yZTiiwmKUWqQ76gyeudKpwpKt5iKvRw6cBWEM2Et/oGKPkgLoOpvO4LRymsWi1TkbBF7b3ftqxA5X4VE4bWvUODX1U7DoTgaza68utsvdjY6rD1nCKBSmRcn8AIjbkp+z8++5NIi7XgaklmIqumG+HA/kREXmlaS/5uQx7YHlBWrjpNH/IesQCNEPOITk3+V2ZcKX9Q+sZdBQ1H5esP6cQPy1EYS2yPDnA3DJNfKn1q6BRarLbobMDAhqIHaI38Ukmezl/pYIloxNv/fHAXXVS+LgDTSDg7yL8gXUKQ/RWZ8eBXu6AxdGw87uJwY8WXgcYYMT0B16ndHYMDmEZEwH4y2PqUOpLmqs1lwLy7Qv+iPsdSxcmcLkyHoFcaLXoq3w8BRanEwEfU5o9PnqkaSgRjJs9jh5aesqoppv8F2RsB46DdQzG5840Ygj1gaiU2hZ/tHppJKi0thBpa6TuLk/VcR0sTH68iF1dBNa2kNc/qdWdZHi4FQTUQnMzt1WAyIgQF9Mlqn3J36Ezmb1wNPF2OCM8jgfOqNQ1QrZ3JCDNdryFIQg5ZwC9t2kkJFCknBqUMHkjUyAaiIQsvcoC8xslXnne7Yjr4YJTfaw4Us7zPORJO5SjE+7gfs2pT/9uif4NzSvtGiCBMt7toyaVng==</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>ZrzwCUm+wTPWd/a2IlE3uwsywjvwb5w5KPQmP4YNJl4/FVmKA7Vtc4VGttQTH6ybpwA9vJ1gI2o+VVZvaoScOK9V3aKAVgnXIPx6Vlp/Px60+wAnLZMGGeBpb35DX2G6c/ZaDWBu7Ill7TMk38nn/4Jq5FaCMYTMcNTZKGRD1GcRRXyuljdtOPG0Qff3hRVN3wjXs/qLTvDxthKpJoWYECCbSNKkGo6CcJ3Nzq/ydlCoOFlpsLyZHotecFlHpu5cWwm9liNLirA9pr5JiqnM45nAImhYaHJrCjzq/JlzpzdRN0Lj3Ag0ZF2yu4NdGJdRoSKP6TMd/IfbBDYWK7RWDMLz96RISIBXck0orTj6Cc+AWrc+0oTwejpXk6cazu+S</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>
