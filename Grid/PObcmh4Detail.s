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

declare @item varchar(128), @dFrom smalldatetime, @dTo smalldatetime, @unit varchar(8000), @site varchar(128), @form varchar(32), @data varchar(1), @type varchar(1),
 @ma_nx varchar(128), @ma_vv varchar(128), @ma_hd varchar(128), @ma_bp varchar(128), @customer varchar(128), @ma_gd varchar(128),
 @account varchar(128), @reporttype varchar(1),  @so_ct1 varchar(128), @so_ct2 varchar(128), @maxLength int, @ds_ma_ct varchar(1024)

select @item = data from #t where id = 1
select @dFrom = data from #t where id = 2
select @dTo = data from #t where id = 3
select @unit = data from #t where id = 4
select @customer = data from #t where id = 5
select @site = data from #t where id = 6
select @account = data from #t where id = 7
select @ma_nx = data from #t where id = 8
select @ma_vv = data from #t where id = 9
select @ma_hd = data from #t where id = 10
select @ma_bp = data from #t where id = 11
select @form = data from #t where id = 12
select @data = data from #t where id = 13
select @type = data from #t where id = 14
select @reporttype = data from #t where id = 15
select @so_ct1 = data from #t where id = 16
select @so_ct2 = data from #t where id = 17
select @maxLength = data from #t where id = 18
select @ds_ma_ct = data from #t where id = 19
select @ma_gd = data from #t where id = 20
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết theo vật tư" e="Detail by Item"></title>
  <subTitle v="Vật tư: %c - %s, từ ngày %d1 đến ngày %d2..." e="Item: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" width="80" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày ct" e="VC. Date"></header>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="80" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>

    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã ncc" e="Supplier"></header>
    </field>
    <field name="ten_kh%l" width="300" aliasName="b">
      <header v="Tên ncc" e="Supplier Name"></header>
    </field>

    <field name="sl_nhap" type="Decimal" dataFormatString="@quantityViewFormat" width="100">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="gia_nt0" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" width="100">
      <header v="Giá mua nt" e="FC Purchase Price"></header>
    </field>
    <field name="tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120">
      <header v="Tiền hàng nt" e="FC Purchase Amount"></header>
    </field>
    <field name="cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120">
      <header v="Chi phí nt" e="FC Fee"></header>
    </field>
    <field name="nk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120">
      <header v="Nhập khẩu nt" e="FC Import"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" width="100">
      <header v="Giá nt" e="FC Price"></header>
    </field>
    <field name="tien_nt_n" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120">
      <header v="Thuế nt" e="FC Tax"></header>
    </field>

    <field name="ma_nt" width="60">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" width="100" type="Decimal" dataFormatString="@exchangeRateViewFormat">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="gia0" type="Decimal" dataFormatString="@baseCurrencyPriceViewFormat" width="100">
      <header v="Giá mua" e="Purchase Price"></header>
    </field>
    <field name="tien0" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120">
      <header v="Tiền hàng" e="Purchase Amount"></header>
    </field>
    <field name="cp" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120">
      <header v="Chi phí" e="Fee"></header>
    </field>
    <field name="nk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120">
      <header v="Nhập khẩu" e="Import"></header>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceViewFormat" width="100">
      <header v="Giá" e="Price"></header>
    </field>
    <field name="tien_nhap" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120">
      <header v="Thuế" e="Tax"></header>
    </field>

    <field name="ma_kho" width="100">
      <header v="Kho hàng" e="Site"></header>
    </field>
    <field name="ma_vv" width="100">
      <header v="Dự án" e="Project"></header>
    </field>
    <field name="tk_du" width="100">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_nx" width="100" hidden="true">
      <header v="" e=""></header>
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

      <field name="sl_nhap"/>
      <field name="gia_nt0"/>
      <field name="tien_nt0"/>
      <field name="cp_nt"/>
      <field name="nk_nt"/>
      <field name="gia_nt"/>
      <field name="tien_nt_n"/>
      <field name="thue_nt"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia0"/>
      <field name="tien0"/>
      <field name="cp"/>
      <field name="nk"/>
      <field name="gia"/>
      <field name="tien_nhap"/>
      <field name="thue"/>

      <field name="ma_kho"/>
      <field name="ma_vv"/>

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
        <![CDATA[<encrypted>DZdNczswdDOSj8KzbhDu9O0GBtQUsE2MuI/GgrPyBI28+m5sKZuApVelKwgLc/L3WIfeB6nVJxpQbz/fkElHYZwSptfSwMYRXtPlxJtIWhAFbzpVg4SK/bYaHQ70JT4McAOYr/PQ1kr1yRzPcPo6kSjCLcx59xyDwqwatDWXjDOqrHfETnIENvNVyYeVtB90Q/kpU7L66ZQ4edQ83es5+cukb2c5jrx5kPGz3LWykQEFmWjOBi2v5OPTMZxWGd7MF5sIoQU85B9tUs7z+fA5r2KevB0ZVS3fAD73AyPgQTTJxZpETUWj5iutSyY6ynJx</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>wpoHVjsC2HQedx9wlpOsVtdLcoCv13t5LVoNjcPJ4kTwFllA1eQMjRc58Mbqoz+7wS5wnPVhMF0kNtOHgrfaGch/yGv1iB6IHy2pEsvEkRSA8bHFypBoFq8LiKnXpRy0MuOir5KQSEGn9jjlRqNAWAMDs6H5uyqtsl+vKwAGOe0E640fhwmZnEoKz2RfAwnecq/8RJf9oE9WLS8LF+n8fF2LYGh0OuppKl3B6vfLItIYZIb+Km93btU1bDUvQShkqrdDZVWwUFZqzrHPU6pQv+8TxEU4p6vVo7BlKHUilQI2BGCwqKKM45T1A4GL6va3zJ3gdsE0GNLAkAgjlehRSkHGJZvVP6Z0e5ZT9IU7U+rJoMLVqSpxtHxM8ZxBbzwUdrH0Pm9H04gx92Dbo+Ys+QssW6ByqRh4ZpB+heVkC1LzkDFi/5LK3HaOCQD5OxTsI91iixJ0ugE5T4086AM3e0M1Wzp8vtQ1+Ztt3GQf9JUZpnKXbrLskw8eqOvHPBC5IzGbArjAnGw7dQIOIg+gPVCX0TVv9qswyaxAFX5K5V+w2H3dricFfNFo5GN5jFIQAxgenPAMLf6EuzHYF1s5UpG2h08xcVEu1pk0wJuoxiN1XvPWjML2D10fvZGceI981ANPhUMCtRPd4FD6GC+THC4tlwYFDRSl9+abkIE5wFN7YIFwgKSR/GmB2nCotEax</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>n/wXN8qoQZlyUIpK5Lqs+1+AowjJYf6Ohj7cemSyhGCl6K3zELVO+dEorRRRcBXhWMNFAymba6LzuaN1a8UEUvflzKWlPX/sH58GHAbBkLB4+FUGRSMSwoxwK4DK06n8w9/TD7C2oLKFWghmeb2xYITqdA0JMWErPyqfp02FYKTzcm/anEZbY0w8vKf0pgbnnSULhPnC1UcCjCZt4D6n7EOnDYCQJ5Bfqo7kSfhAtA+HO2zdjrzEAB4Uejng9lyvBc/SxQfrFHvA5BXcTOyI6HyvdeaN3X6gLn1zagMo/CeQ7hF15r29NBPlxldH48WIXdSAvDt/vCSIWCTVEyR2PN099DYAwscC4IuqYZy8MA1sjtbhpPn5SgpNVQAe/zvFASrY/143Iw8VwOa7CwcOntiKxzUctbX9tvxR8SAWeo0bm6Afz0SkLUTxYwk6G0ivNawZS+XOmk8Ez3j+YKOfghWBinkcTJgtwfKB6Dv5cPPXvH3KROGXsoKQL/hYWa9RI91GvSQz+0rCJ1UqDsFdHQ==</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
