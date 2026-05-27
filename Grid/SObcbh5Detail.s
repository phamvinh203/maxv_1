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
  @ma_bp varchar(128), @ma_hd varchar(128), @tk_dt varchar(128)

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
select @ma_bp = replace(data, @d, '''') from #t where id = 12
select @ma_hd = replace(data, @d, '''') from #t where id = 13

select @ma_dvcs = replace(data, @d, '''') from #t where id = 14
select @mau_bc = data from #t where id = 15
select @loai_du_lieu = data from #t where id = 16

select @ma_gd = replace(data, @d, '''') from #t where id = 17
select @ds_ma_ct = data from #t where id = 18
select @tk_dt = replace(data, @d, '''') from #t where id = 19
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
    <field name="so_ct" width="80" align="right">
      <header v="Số chứng từ" e="Voucher No."></header>
    </field>

    <field name="ma_kh" width="100" aliasName="a">
      <header v="Khách hàng" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>

    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="gia_nt2" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
      <header v="Giá bán nt" e="FC Price"></header>
    </field>
    <field name="tien_nt2" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Doanh thu nt" e="FC Turnover"></header>
    </field>
    <field name="thue_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Thuế nt" e="FC Tax Amount"></header>
    </field>
    <field name="pt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aliasName="(a.tien_nt2 + a.thue_nt - a.ck_nt)">
      <header v="Phải thu nt" e="FC Receivable Amount"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
      <header v="Giá vốn nt" e="FC Cogs"></header>
    </field>
    <field name="tien_nt_n" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
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
    <field name="tien2" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Doanh thu" e="Turnover"></header>
    </field>
    <field name="thue" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Thuế" e="Tax Amount"></header>
    </field>
    <field name="pt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aliasName="(a.tien2 + a.thue - a.ck)">
      <header v="Phải thu" e="Receivable Amount"></header>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat">
      <header v="Giá vốn" e="Cogs"></header>
    </field>
    <field name="tien_nhap" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
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

      <field name="sl_nhap"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="thue_nt"/>
      <field name="pt_nt"/>
      <field name="gia_nt"/>
      <field name="tien_nt_n"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia2"/>
      <field name="tien2"/>
      <field name="thue"/>
      <field name="pt"/>
      <field name="gia"/>
      <field name="tien_nhap"/>

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
        <![CDATA[<encrypted>DZdNczswdDOSj8KzbhDu9Og0J3UhGVP7EwNPHCO/Mdf3NEnn3hNihNOH0NAxw2vlhjPkja6/t/ej6mjkzjcCq5D+2TFaHQckguZq0Wzm8dbty2NNuN5u6GH6t6b6DdYuttKGWWRpxZ+tntqjromeu2BuT9NxtGUCV6fMrDosTZ3CeXIqIG5F1nL0AGJC8jJ3L+ha6trge0rrWTNAtLIICqD6wNV3UIDn/q2kMI+6imL4nKCI/2uoyCCM74MsGWF/eurfbuycEY/YfLSOjwoUPtVJ2w8Lt/sNdb85V7Yq+KESq3RGw35YCt7C4MAYmxEM</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>IGdTlnedVEcHRGTcmqxnM6sa6i6EJW6R9tH9aFBmKr+RIqinpXxIrtaI5jED0jqppfsOYe3YzS6sgfs+7Fb1Zrre1ilXPWt9EE2UI6No1kg4QGCSVfcsluXPxiPmF8MOxEg+71Up/1TBL2oliobLZlTYgd1/2RghiMPlYhNMQiMUTksjidrKYbPUMasTPKOPzEIjdrUZE+JHg9ofrYR0j6Jb4Wybow84R5/wu8DWcuFY3jAj/GFNaYCuccinf5rQD5QSrvF86BHusSXDXC5wVXjNc4gio110s12hG4/QMNi2LoofrZYDhHEbzw8P4Hp/43phiptU7CkS1pkB8fO0h5fbhSFqHML3qaj9Qnl+TDGhG4x6b245vbujaYIecrCo3Dv1BSQOVeRl8YvxzrBaJqUwp0u922SaEWudsctakc8H/TMScyYkZV2MZ/QcyeZA7xxLWvj1ocaSnw0LOd1cpZx+CwE4EmuPk1XltBOjD5biLCSIyJUEpjZPXTpia9st8jFNbAy2aagyPl6/gRFqJ6iCQQOd1MbL4Oq7isxNAr2hw0K1GfxdPBP7SNQkieFnsbp8wtyj0/lDK5CZzSi3Qj5l+9GRNZUcbRBZYKdfwhDlJK9EDToQ66mitAFvWoJ3Ix6UGgzDjc5RQ9GRXV2xJik+1H6Wx2YlJSKZVhetnhaH7x9F0YB4HaxhnSblFw2N</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>knsZf6E5Yn0qrhsco7ZrLOE+ECNU4WXsP/PBKg/ZLLECfFgbk5Rwp9qloJpbyWv6PtzgFPqCRH9z/yhegoX3zm2ojHMkElYLgAZrvwZcLyPvueSeOIrDgwyUtQivxcS7K+9UMBguMQfqR1lmnmhT15K981zGwWAOQBo7xJj4dROMb7KqK6RckNLg8pfZ92VKKNnqLdQ61F3uA2rqPdONfx6EmQGRcyvKlkU8k/ZP7uIi1m2H0TSDmyAhQ8Bb/2yzsEtF2UghFilSmJVdQYqcXrgO22Mkzc5Bv0su6JivuIlF6g2kIhl8DL2FiOGPTGcUqAX1ZcIb72xHCDqyTPO1lBSJXTE3xXF8CStnxZzB6v7THMngcB+oH/5g2WOlpvHaBgHOuFAbFUIwI7pn05CSlg==</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>
