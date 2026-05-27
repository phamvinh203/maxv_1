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

declare @type char(1), @ngay_ct1 smalldatetime, @ngay_ct2 smalldatetime, @ma_dvcs varchar(8000), @tk varchar(128), @mau_bc varchar(32), @tk1 varchar(128)
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

    <field name="ma_nt" width="100" aliasName="a">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
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
	  <field name="ma_ct"/>
      <field name="ngay_ct"/>
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
        <![CDATA[<encrypted>/MzfmTfNYP3xVPB5HJKK/RULu3vD9nId2yV18kehbAsHXLtNxrpAblrUuiiP/zxYVx/iFoAFx/ezujfT1UfdPE6YpjBIeJOu9tLKVpMTD12HkvOpQr7MAEkfXYsd5e8PaZAxeTXD2ZL3XDSKkRYb0kd/1n9i+VsfcJZuha9zH0ZKYjiZJ2HH0TZqanmPM2ReA1Jst5avREOlJXmVuk/bHe/FqyDkAPHq+kWGJcTo5h/jQ+QH74wVgmNAlAVnuyrhIyp1z3lxqE7DOcflIA5TqGdC5TMR15HzV0LyABIqvnUNSu7yHUv9bNsg7LAlG+SmyWiEWCJTWtza8R+Y14iF+w==</encrypted>]]>
      </text>
    </command>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>/JBeKz0JeOb0OC35Vb7LaZS67yk6FenFAn4tVp9CG1Z4z5Cn+vOpMA+eVEwLv6+xaja0IbJhVng3BwRnq6N0rFECVW+xtMWh93NNvnKIGKOoipW/LsSa3DfrZvSs6eJVpwQMu2pARdV0C5saoYu7DQNKA1egQC4FtTVa2tjjC2lcbQGdq356Q3IfEch5ZLn347P//sIREYcPog8vN0Vh3tV6chpRBr9H2KREtoPaQ0mj4KQoGpMjdT3PpdMw1ByxYQDecrRE9cHqJxlC1i5l+BywfW38IFnhCpv4dOjC5zKxJH0CEulPbzRzDiIyjEGOYF/GtBLePyEwMihYVIMfYzNq/IFRMbiyZS/2KUJwJ4CDLTWt7hAUw/mMiC/iLI19</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>agdcC2BZM+qqSDVaPDgcNR13Cii7fA+MwPveBst6BZPsU+DrI7msMtBrD1NZ2WROcI4RQTiGkdqhGOzKJ27OJVWKV5TDAB0WgDj9ukEouT6UDDytrDv1Dnc7TNQl6ukTXp/5qdDyFVLvM+QyqSh32QRSGAPN2vFr3HQGJMsIrV6IIPeshHw8cDRoavpxQVgTUgbE1Uqx360ntRdVnsF9DESJsgwkcRThKdASb/W5+nrj+QkIcnPEEhvT2cxx/CeZZr7nqSip6fr1ON7A+ZzcPqeZRiLo18I0qoerhBKlJhBPacq/gTE/Ix/PfQ4rAjZms8rrHFMJH00u8Ru7m/rpr6KmyzafIZlshVxK21CIUUs=</encrypted>]]>
    </text>
  </script>
  &XMLStandardQueryToolbar;
</grid>
