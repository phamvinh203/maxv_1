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

declare @type char(1), @ngay_ct1 smalldatetime, @ngay_ct2 smalldatetime, @ma_dvcs varchar(8000), @tk varchar(128), @mau_bc varchar(32)
select @tk = replace(data, @d, '''') from #t where id = 1
select @ngay_ct1 = data from #t where id = 2
select @ngay_ct2 = data from #t where id = 3
select @ma_dvcs = replace(data, @d, '''') from #t where id = 4
select @mau_bc = data from #t where id = 5
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk" type="Inquiry" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết theo tài khoản" e="Detail by Account"></title>
  <subTitle v="Tài khoản: %c - %s, từ ngày %d1 đến ngày %d2..." e="Account: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90">
      <header v="Ngày hạch toán" e="VC Date"></header>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC Code"></header>
    </field>
    <field name="so_ct" width="90" align="right">
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

    <field name="ma_nt" width ="100">
      <header v="Mã nt" e="Currency"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateViewFormat" width ="100">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>

    <field name="ps_no" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Phát sinh nợ" e="Dr. Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Phát sinh có" e="Cr. Amount"></header>
    </field>
    <field name="ma_vv" width="100">
      <header v="Dự án" e="Project"></header>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_dk" width="0" hidden="true">
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
      <field name="dien_giai"/>
      <field name="tk_du"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="ps_no"/>
      <field name="ps_co"/>
      <field name="ma_vv"/>

      <field name="stt_rec"/>
      <field name="line_nbr"/>
      <field name="nh_dk"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>/MzfmTfNYP3xVPB5HJKK/RULu3vD9nId2yV18kehbAsHXLtNxrpAblrUuiiP/zxYGvoM0rkjRqzqYPZz0lIVbuRy/ET9sHmW+rKXxScH8f64i+ddL2cbiYftmHGvkis/FYSsiZhlRKsg0fG9IC3Ezihq4jlVCbpPypUYwKwVF3/aG/4ku5jP4iT8sea9Zv+R1io4LGeflcactm8vWj/mqAHa0BRaGi9j8CtF77LnwPCf5c/hkZDHZ3NSjrIwDkdA/ThIvvNHeXKO37Ta7oarRW5+qapTnD+cigxGfr2rV47GyqlueC2JqslrZpYvy5tGRvgYCUz+/ws5/aYlOACiWA==</encrypted>]]>
      </text>
    </command>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>/JBeKz0JeOb0OC35Vb7Lab98xrO8ENikOCqoHD0jZ9CjOnd/FXcL+0kjJ6XVyRc2X6OXA0EX+cM3KOIPiNTaZKtepIUry1sGOwYfyPPIfX6ZOQyp72T7JA0D65/qhSH7LpA9LMN0/+p+gMwVpd3x1/lbMZ5aJpyM2/0hJCuVfi1HIfhdF9j/iwQdhqcKEmmzQmHIcQ09jwue+sVupkJPeuY3jvt1U6I5IGRUyf8BLcp/2gtkhJlXKb4Gbirzruu7JOIwNvVAV2fzoXa7ej+hrtj8U4ol4Qp8JZpxsi0BUHN28wy2VLuYRxnp4EGWKZ16NNSmRRgwi4TbRqIQMJrx+HSqlhCNDlSICw1lXU0KeRG9rAYsONEVP+FuYUv6UbqZ</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>agdcC2BZM+qqSDVaPDgcNS2BV56nP3RWg7suBUmVvj/kk6F8nUmt/GrYunAjoYuY5nohbwgP+SnjEnQdbJApKFmm8yCAZCk/+I0i6KZiwnrY8SUXLx2WFqiXxzvDiLjSFCkwlN7or3LKRX+/A047gxLuSZZQesJMrrOX5XV4pUxgNQUqmKHrsZKOC12GmIUczgf8IcP5VPIS76cl2sHJrHjoZVvjCIMc7a67VaxJcDxAtsJ2FZ0VdAixuQZn+n6PhsIcS86EgdRqtLyPxBi3qz+lz+wUlAVSl9STtsJm2F9KsOJzDDVe2WXy+tBKHYYHyheE+OKwk/QWmaNMyN8FdbRqbN3Rj/9W/bUdZYO4g+Y=</encrypted>]]>
    </text>
  </script>
  &XMLStandardQueryToolbar;
</grid>
