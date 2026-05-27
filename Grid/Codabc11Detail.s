<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardQueryToolbar SYSTEM "..\Include\XML\StandardQueryToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY QueryString "
declare @c char(1), @d char(1), @tmp varchar(4000)
select @c = char(253), @d = char(252)
set @tmp = ltrim(@@queryString)
select * into #t from dbo.MaxvOnline$Function$System$Split(@tmp, @c)

declare @ngay1 smalldatetime, @ngay2 smalldatetime, @ma_nx varchar(128), @ma_kho varchar(128),
  @ma_kh varchar(128), @vu_viec_me varchar(128), @ma_vv varchar(128), @ma_dvcs varchar(4000), @mau_bc varchar(4000), @ma_vt varchar(128)

select @ma_vt = replace(data, @d, '''') from #t where id = 1
select @ma_vv = replace(data, @d, '''') from #t where id = 2
select @ngay1 = data from #t where id = 3
select @ngay2 = data from #t where id = 4
select @ma_nx = replace(data, @d, '''') from #t where id = 5
select @ma_kho = replace(data, @d, '''') from #t where id = 6
select @ma_kh = replace(data, @d, '''') from #t where id = 7
select @vu_viec_me = replace(data, @d, '''') from #t where id = 8
select @ma_dvcs = replace(data, @d, '''') from #t where id = 9
select @mau_bc = data from #t where id = 10
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết báo cáo tổng hợp số phát sinh NVL dự án" e="Details of Material Summary By Project"></title>
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
    <field name="ma_nx" width="100">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_kho" width="100">
      <header v="Kho hàng" e="Site"></header>
    </field>

    <field name="ma_nt" width="60">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat">
      <header v="SL nhập" e="Received Q'ty"></header>
    </field>
    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat">
      <header v="SL xuất" e="Issued Q'ty"></header>
    </field>

    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
      <header v="Đơn giá nt" e="FC Price"></header>
    </field>
    <field name="tien_nt_n" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền nhập nt" e="FC Receive Amt."></header>
    </field>
    <field name="tien_nt_x" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền xuất nt" e="FC Issued Amt."></header>
    </field>

    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat">
      <header v="Đơn giá" e="Price"></header>
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
    <field name="ten_kh%l" width="250" aliasName="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="ma_vv" width="100">
      <header v="Dự án" e="Project"></header>
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
      <field name="sl_xuat"/>

      <field name="gia_nt"/>
      <field name="tien_nt_n"/>
      <field name="tien_nt_x"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia"/>
      <field name="tien_nhap"/>
      <field name="tien_xuat"/>

      <field name="dien_giai"/>
      <field name="ma_nx"/>
      <field name="ma_kho"/>
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
        <![CDATA[<encrypted>X8wRdvoV4dPwRXf2U45b+n7eME8UPpgdAqk6uDeUeiD7KIoiWbwMIoVeLjljWEfz5+lKAykcebk2qvOfPkElvgh7PK0UJGVaVYovgtUmoKHekO2vrIvWs7LRBPY7YO3EVWbyJhVW9LXfEAy4oLwFcskISwsFJBvYgEwSZQGPgxgXdWGfQKDtgYsKow5GdYSzNCOPOhSev3Ql0cRf/p1dLU9tXhjvlIN/saDr96mxId34+rI5t+1twZ3IcJmFf1x3ygpNUk7rFZNKys8Uh50c/dEUlOS2A9nUzgW2w4KLoaZvPX4ZLdEzW2AqtaxkPsRZRDDyQ/zvTvi2br42q+Z15rbThG/unRpOauYnYB3NuIyIJIQj2Rjd9tIyv2sAEcrHmea31Q1AmbrmZAeE3nSc6BoNLgnv468S7LwXM2H2d2Kl4dmWNImbOIfgroXVnB6tySlAdDQx42nGe/YhNn5An34YTKzb9T+lc693UG5zltzascXE9xd+KhW1NaHMJVqfzZJkJwRoPFSNQZJKa/hHyg==</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>ReW0oEAeDuxZniclFBjTh1s4urHWM6wJ5BAD/s2ltpvClbQkF6jYOkX0C06KoFrhmarQITmJmSAvLhAlSauTNQjJBx8J3PkqqsRuv+N6O5J+JJFU8pVNpOGGHih5kV2eDiy1Mzf1h0C+N84kcJVnW+4f+Ra7K9nps/D0ZnHqVPk8fu3HNY8Iboe5Ti6CtMnG/Z6MTv00qB2T8I4NtXVddq1UlIdACBvzY/hMK9JtBjGt1DiWyPlrbEqS+129hV0n/16nEwlFiYr8oFnJEVNm3LrR78qKgneej0+lMiylWHAEUVYJuzYYcdH9t0YeS0kTb6QEfvZCJtz7ph103Qwvzu3C93jP7WQvPbVrMfxWzCQ=</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>
