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

declare @ma varchar(128), @ngay_ct1 smalldatetime, @ngay_ct2 smalldatetime, @so_ct1 varchar(8000), @so_ct2 varchar(8000),
  @mau_bc varchar(32), @loai_du_lieu varchar(1), @tinh_ps varchar(1), @ma_dvcs varchar(8000), @maxLength int, @ma_kho varchar(128), 
  @ma_vt varchar(128), @tk_vt varchar(128), @ma_nx varchar(128), @ma_vv varchar(128), @ct_theo varchar(128), @ma_nvbh varchar(128),
  @ds_ma_ct varchar(1024), @nh_theo varchar(128), @ma2 varchar(128), @ma_kh varchar(128), @nh_kh1 varchar(128), @ma_bp varchar(128), @ma_hd varchar(128), 
  @nh_kh2 varchar(128), @nh_kh3 varchar(128), @ma_loai_vt varchar(128), @nh_vt1 varchar(128), @nh_vt2 varchar(128), @nh_vt3 varchar(128)

select @ma = replace(data, @d, '''') from #t where id = 1
select @ma2 = replace(data, @d, '''') from #t where id = 2
select @ngay_ct1 = data from #t where id = 3
select @ngay_ct2 = data from #t where id = 4
select @so_ct1 = data from #t where id = 5
select @so_ct2 = data from #t where id = 6
select @maxLength = data from #t where id = 7

select @ma_kho = replace(data, @d, '''') from #t where id = 8
select @ma_vt = replace(data, @d, '''') from #t where id = 9
select @tk_vt = replace(data, @d, '''') from #t where id = 10
select @ma_nx = data from #t where id = 11
select @ma_vv = data from #t where id = 12

select @ma_dvcs = replace(data, @d, '''') from #t where id = 13
select @mau_bc = data from #t where id = 14
select @loai_du_lieu = data from #t where id = 15
select @tinh_ps = data from #t where id = 16
select @ct_theo = data from #t where id = 17
select @ds_ma_ct = data from #t where id = 18
select @nh_theo = data from #t where id = 19
select @ma_kh = replace(data, @d, '''') from #t where id = 20
select @nh_kh1 = replace(data, @d, '''') from #t where id = 21
select @nh_kh2 = replace(data, @d, '''') from #t where id = 22
select @nh_kh3 = replace(data, @d, '''') from #t where id = 23
select @ma_loai_vt = replace(data, @d, '''') from #t where id = 24
select @nh_vt1 = replace(data, @d, '''') from #t where id = 25
select @nh_vt2 = replace(data, @d, '''') from #t where id = 26
select @nh_vt3 = replace(data, @d, '''') from #t where id = 27
select @ma_bp = replace(data, @d, '''') from #t where id = 28
select @ma_hd = replace(data, @d, '''') from #t where id = 29
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết theo đối tượng" e="Detail by Object"></title>
  <subTitle v="Đối tượng: %c - %s, từ ngày %d1 đến ngày %d2..." e="Object: %c - %s, Date from %d1 to %d2..."></subTitle>
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
      <header v="Mã khách" e="Supplier ID"></header>
    </field>
    <field name="ma_vt" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
    </field>

    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
      <header v="Giá nt" e="FC Cogs"></header>
    </field>
    <field name="tien_nt_x" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền nt" e="FC Cogs Amount"></header>
    </field>

    <field name="ma_nt" width="60" aliasName="a">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat">
      <header v="Giá" e="Cogs"></header>
    </field>
    <field name="tien_xuat" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Tiền" e="Cogs Amount"></header>
    </field>

    <field name="ten_kh%l" width="250" external="true" aliasName="c">
      <header v="Tên ncc" e="Supplier Name"></header>
    </field>
    <field name="ten_vt%l" width="250" external="true" aliasName="b">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>

    <field name="ma_kho" width="100" aliasName="a">
      <header v="Kho" e="Site"></header>
    </field>
    <field name="tk_du" width="100" aliasName="a">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_vv" width="100" aliasName="a">
      <header v="Dự án" e="Project"></header>
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
      <field name="ma_vt"/>

      <field name="sl_xuat"/>
      <field name="gia_nt"/>
      <field name="tien_nt_x"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia"/>
      <field name="tien_xuat"/>
	  <field name="ma_kho"/>
	  <field name="dien_giai"/>
      <field name="ten_kh%l"/>
      <field name="ten_vt%l"/>

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
        <![CDATA[<encrypted>4CPwiDyq9r00dpapYy0/jYsbJq5i56n3BgcP/ilzxjAfSNSfrrej3r3PwzrzuYq+WN4HnhvMZH7JGg2jF9CRmG8mu0K0ffjfXExG8/Xmy1pNTF2Hm92WAZzYGbxDL9t67C6tgp95buaCDGmf0Hdj4eptVLuNvTMHZs4QOfj6LJHoy7KSrJaj4Yf/46quiGpMoHAIlpU1UD4pzWSVXZI9mjiGdx7SOc3pnwtu2TpR5hXtsiRjr2gy4hpdfSBDtnwpE+UVTdkavsh/eaZgMwrw0at6g6yZfRHyJNoSGbkcOpwMEZvSTcdn7ADkx6dHWQO/+hBQtvSggAwbolZJyvdIH+T4XIL574WuObB9oRG/48j+1Z8LJ8GBC2tjUKmJUYeiwqVQ/cmCHylJbq8KpVTxS3HH5JTMO5mZbTad9HATYqqtT0hB1sJIZvtoC9LYgehNcyFayQw/+uf/wrChLKIfYQ==</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>XKkQgboIl7E/QxlJ+aTdOfjyD3MmKOcfoNp/wlobiGljgj0zJy/6VMBqWrZyBZLCctEpk/qJwVJRKbfyykrQWaG2FFb4HdknhM1KMCEig9cg8KHtmNYPmRDJxxKlp7vYxdkKf0JT5f46zkRSNu+BtYGYz0NVK2EV6NGo+tlqWpH+8jwdU3t5RGMxQjLHe3PYyyIZm7aGqD99UEBnQCpVAHcc4lrJpzod/3uAkBLBQlMkOKV2ocI/0wO+pdELPMXnmUDlXyHiXu5aNK8N5/1xBYeb8lL/A5zLPTklRMKdi2Gp1HZF6oaLkYsuCpilERd/D0eQjhNdNTAclnZxj2mp+ajqrLq7kBm+ZszkFSfELcNd6bs1F6F1rrezWRP4CEG6u3eSOvHT0gc2Zllo9uTU3JQqoO+4aA9hnNUugylph3ClUqoLdS1Ka8zfCCC1Ut1VvScCn+fWyFAD5nSZ/b8dtj5H6jJOiSpO5l2cZiuw93d1maj05cMLGnJP411KVH43hVtpbs7WZCqnFbBGIr50j3GXTeGw7/cQMXcJu9/f093py1B1dcw96yzDM0YObLDhkRetuNOCcbl8PpE7T+juYS7dNr1HzVvoywWPbkdcBEM5nfT+KRzTWE/taQ2vcI7YyfCZCpK2tSPDTMEVzTpX/RUYRe5SwxbWl/xZO2A5dQbYdDpuA4Bmku8Vhi1dl4BZk9wiKNUWhNn9bLki2iddp4XwdERD+ajCGlAUs9JM0QkiwC40aEB6YFqiLMTFssTlLdXNa4StpYAgL1BBzt/qQY38J6kw68pJYg+qm5ljadTwCq522SOstmJk6uagzHqLS35e4ZH2Yeg9a/VL3XZThxuSCQuwfl+K9NPN0LE26vo=</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>agdcC2BZM+qqSDVaPDgcNamlSFf7Bia2iAA7CyicZD+oikHdpVB+5A1/LZA7/ndhlaTYV6aoCcslt2th2fI17nt1l/16NnhaIMfQ4AEh3e9MQXjJzb5x689ociq1VcSfYzxzsF7a9W/Kv5pFS5xJJUgALwOrWFc5+D3SyFF2X/6mVkwNb2CwO8plVDwNcXBxMLqeomnVm82SfaJdwDykxM92a1wvwJQzHlVkFJam3AImC73gjz4LKTpw/KDr7vFNVqhCc0ISqTGuyttd/PxGeyKM7GBJ16wt55/hpog2sK2XF9YVRyRrY+wxWPPPhE/ZlTr31YPHc/3aTv6XDOPkGf6w2RoPSBvsoDOucIVH/ls=</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>
