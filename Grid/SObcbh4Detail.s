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

declare @item varchar(128), @dFrom smalldatetime, @dTo smalldatetime, @unit varchar(8000), @form varchar(32), @data varchar(1),
 @type varchar(1), @ma_nx varchar(128), @ma_vv varchar(128), @ma_hd varchar(128), @ma_bp varchar(128),
 @ma_nvbh varchar(128), @ma_kh varchar(128), @ma_kho varchar(128), @tk_dt varchar(128), @tk_vt varchar(128),
 @so_ct1 varchar(128), @so_ct2 varchar(128), @maxLength int, @ds_ma_ct varchar(1024), @ma_gd varchar(1024)

select @item = data from #t where id = 1
select @dFrom = data from #t where id = 2
select @dTo = data from #t where id = 3
select @so_ct1 = data from #t where id = 4
select @so_ct2 = data from #t where id = 5
select @ma_nvbh = data from #t where id = 6
select @ma_kh = data from #t where id = 7
select @ma_kho = data from #t where id = 8
select @tk_dt = data from #t where id = 9
select @tk_vt = data from #t where id = 10
select @unit = data from #t where id = 11
select @ma_nx = data from #t where id = 12
select @ma_vv = data from #t where id = 13
select @ma_hd = data from #t where id = 14
select @ma_bp = data from #t where id = 15
select @form = data from #t where id = 16
select @data = data from #t where id = 17

select @maxLength = data from #t where id = 18
select @ds_ma_ct = data from #t where id = 19
select @ma_gd = data from #t where id = 20
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết theo vật tư" e="Detail by Item"></title>
  <subTitle v="Vật tư: %c - %s, từ ngày %d1 đến ngày %d2..." e="Item: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" width="90" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hạch toán" e="VC. Date"></header>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="90" align="right">
      <header v="Số chứng từ" e="Voucher No."></header>
    </field>

    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã khách" e="Customer"></header>
    </field>
    <field name="ten_kh%l" width="300" aliasName="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>

    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="gia_nt2" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
      <header v="Giá bán nt" e="FC Price"></header>
    </field>
    <field name="tien_nt2" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Doanh thu nt" e="FC Turnover"></header>
    </field>
    <field name="thue_nt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Thuế nt" e="FC Tax Amount"></header>
    </field>
    <field name="pt_nt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" aliasName="a.tien_nt2 + a.thue_nt - a.ck_nt">
      <header v="Phải thu nt" e="FC Receivable Amount"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
      <header v="Giá vốn nt" e="FC Cogs"></header>
    </field>
    <field name="tien_nt_x" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền vốn nt" e="FC Cogs Amount"></header>
    </field>

    <field name="ma_nt" width="60">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="gia2" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat">
      <header v="Giá bán" e="Price"></header>
    </field>
    <field name="tien2" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Doanh thu" e="Turnover"></header>
    </field>
    <field name="thue" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Thuế" e="Tax Amount"></header>
    </field>
    <field name="pt" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" aliasName="a.tien2 + a.thue - a.ck">
      <header v="Phải thu" e="Receivable Amount"></header>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat">
      <header v="Giá vốn" e="Cogs"></header>
    </field>
    <field name="tien_xuat" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Tiền vốn" e="Cogs Amount"></header>
    </field>

    <field name="ma_kho" width="100">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ma_nx" width="100" hidden="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="tk_du" width="100">
      <header v="Tài khoản" e="Account"></header>
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
      <field name="thue_nt"/>
      <field name="pt_nt"/>
      <field name="gia_nt"/>
      <field name="tien_nt_x"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>
      
      <field name="gia2"/>
      <field name="tien2"/>
      <field name="thue"/>
      <field name="pt"/>
      <field name="gia"/>
      <field name="tien_xuat"/>

      <field name="ma_kho"/>
      <field name="ma_nx"/>
	  <field name="tk_du"/>
      <field name="dien_giai"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>DZdNczswdDOSj8KzbhDu9Crrqt4MlBCpUsG6XyuHG6/EL4khsZoafve3RjzM4F7lVodDcJmZ2YBc4qVwsgOwUPHvDI7S0z6h9B2XmzFjQ/YD08EM+3dcS9PlN0mlWU8/NwW4zn+uQ8+ZEW0exYE3KC/7h/46nQsBtFdscVyTynfblkB4Zh5P2WpTA7yMO7YDwl10klE0Z5ooFD8ZrNQQNlCKwN4YxcvxyzWILmN9cG6+BVZl7XJyUmYgZ0+dFC4RCFm06Filim3EJgpia1kipQraR/YMtdg0X5VipcnJHiSf1vhobSV8JMCzVND1bnNA</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>tGkxZIMTUhHq3ooncss13ssnoat009IP7rBvYfG4U4SdWpntynF9G5GDG/z/HB9pWgVGzhP+hk54lcbUgLnqO/vGGbBpxBmA+FhN7hFAXEAyjZz0YmTCgXStFROyY86OuiEU8I+4lvhBgnZQE2ai9vR1RhA6au1icybEPBmMxlwzzgP/3C/MZn5qlU7qmbZ+vGyfwqaOnIKzCiqsjz8jyBe/xiexmVR3TVuHrSIOzHa+UfIIe+2qQy4rWPFm6b1awGZP541MBgNcbG/rqvyhKpBPemkeyKMX+gu9+gjftDRYcTTtWe44aOp4DNEue3KwJ4uspXik1n3I+DhUatd+b1boPs4xmpoHMVH6Y7tM/oZq0P7BBqup9xnNoOEsCAcESS6og3QtKWAzx4QPvo2xAh5mCCB+bnhb5iKuZ/IKzROiSzkqoCGtT20DNEgnigMaezMAEfjvPUrNKvy6IqfvY6ZP2sOn8Kgzd+q3BIyg5tsuzrP+lHQSK1Ia4UzpQ0MZ8OND32yJBLSA83iMz+dedcD30AKRmuStpv+AxT8011FBYWhR+tSNa7F3t0KPAkFwC4uMleC/gOoET6ZOZ47YAtuAVr4pohsgJGENcNrp46kAjrcBY2ejLEIu6Xp148ZrvPxrcQRkCtW7Agikt3aQPsPBMsucP4jbws7e4qZV7o5u3Vb2Hz9Im6buANyPn3/3</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>0yH65H5mH4Ezet8KK+KLrJ6UW+guUPBCE4kNg+NJ8qn4DOJhGQjitYfILBeq2JPh0/5hl8sHFxULrgpnM6n9Epv0WsI3FR36usrXOlndSRZSd9mGEBhNG+t2OFwcRT9O30kTjPH6F0TVkSKiVajXEGuS7+ROrGkf4QUQn4VkSocaZ/jA5EIdGB81Q+WrNB7QKyAAUwD/htkJ//wcveR/vVdLIcnaMgJPLO4kxXpgx2AZPM38qwnDB/bCPTZAhXgb4AxTfoSV7SyXJ5nd08DhhkdyKg8MCiYYaS8rEpzOdNmIdkPJ1WQ2Rj4r73PohMxOr8Z3M0Jh8dNDq7aRQVX2Uoqq96Xav/lM97Qmmhe1xirmwCe+3oN3A1Kd2SM24tsx11+CzIXZUyDvvetHuCRywA==</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
