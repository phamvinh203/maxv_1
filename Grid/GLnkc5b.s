<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 0" xmlns="urn:schemas-maxv-com:data-grid">

  <title v="Sổ nhật ký chi tiền" e="Cash Disbursement Journal"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90" allowSorting="true" allowFilter="true">
      <header v="Ngày hạch toán " e="Posting Date"></header>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" width="90" allowSorting="true" allowFilter="true">
      <header v="Ngày chứng từ" e="VC. Date"></header>
    </field>
    <field name="ma_ct" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" type="String" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>
    <field name="dien_giai" type="String" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tk" type="String" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản có" e="Credit Account"></header>
    </field>

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Ghi có nt" e="FC Credit Amount"></header>
      <footer v="%s nt" e="FC %s"></footer>
    </field>
    <field name="tien_nt1" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Ghi nợ nt 1" e="FC Debit Amount 1"></header>
      <footer v="%s nt" e="FC %s"></footer>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Ghi nợ nt 2" e="FC Debit Amount 2"></header>
      <footer v="%s nt" e="FC %s"></footer>
    </field>
    <field name="tien_nt3" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Ghi nợ nt 3" e="FC Debit Amount 3"></header>
      <footer v="%s nt" e="FC %s"></footer>
    </field>
    <field name="tien_nt4" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Ghi nợ nt 4" e="FC Debit Amount 4"></header>
      <footer v="%s nt" e="FC %s"></footer>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Ghi nợ nt khác" e="FC Debit Amount"></header>
    </field>
    <field name="ma_nt" type="String" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Ghi có" e="Credit Amount"></header>
    </field>
    <field name="tien1" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Ghi nợ 1" e="Debit Amount 1"></header>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Ghi nợ 2" e="Debit Amount 2"></header>
    </field>
    <field name="tien3" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Ghi nợ 3" e="Debit Amount 3"></header>
    </field>
    <field name="tien4" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Ghi nợ 4" e="Debit Amount 4"></header>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Ghi nợ khác" e="Debit Amount"></header>
    </field>

    <field name="tk_du" type="String" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk nợ khác" e="Debit Account"></header>
    </field>
    <field name="ma_ct0" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
	  <field name="ma_ct"/>
	  <field name="ngay_lct"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="dien_giai"/>
      <field name="tk"/>

      <field name="t_tien_nt"/>
      <field name="tien_nt1"/>
      <field name="tien_nt2"/>
      <field name="tien_nt3"/>
      <field name="tien_nt4"/>
      <field name="tien_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="t_tien"/>
      <field name="tien1"/>
      <field name="tien2"/>
      <field name="tien3"/>
      <field name="tien4"/>
      <field name="tien"/>

      <field name="tk_du"/>
      <field name="ma_ct0"/>
      <field name="stt_rec"/>
      <field name="systotal"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        
      </text>
    </command>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>Ers0gce30/eVDBIEgsojWvpukpZWOBPCcHccRPFzUkBRIZ3JEZr1iNPtgeoClrplrq0X0drHXNFXOZ5PWys1QuVwUb263Ph+7s5iPI7JLCmsZrmaN5qrP7+OB0KpOcE7mjxjFU6sR2Um1fjUGDXAUmDLS92APT/7kd3XDR600eu7IZC1VG5kwVgrcYrO3fgHfJbtDUzVZQXkVO7w24P/EL1GQisUNZ36pTALx1AR5MJ6nSIkVlKbcaCSZNOS9vwf4JHwmHnIGF3y+o0GsIklYKNSNPrdFfnspHocSNKJyQoC+rJzWGnNADD9xA4VqZCT5H5fdCchLcdpd56RdRbrLexjb8vIplCJ7Y0remO1oecHGuKcMZ+KLhDb0JYXg0m6zGrFSKia188ix+kXzZMvjU992pmc0BVAoY4SusPmVIQPql49BJpqvgUnT4fmiEEmnrQ+xSGgFqX74aueCIRz9nEdUXLsV3U7piMa7LPhZPRte2r8vq6UWGd30WmEuNqtiUXsmFaN7eFWnYGp6oO79dPBgbFNKUex7Luq8dkT56B6MSjeSsHiNcLYkqpGTnGOl5Q1gC29WCxyjQJfNU1n7Njvlt32ORRmBKHBV3sFNGcN0fcvrcDKsAkqUaLiZZyVccNMXomE+w7Lz6RcfBX4Hwg9e53qL9Q/87dQPmzL3WDpIQv09zkl6FDGEqzaOlPkqWu3jYgdqp/c2FLILKVJgoJuhVqSdNbMvkIeUjQ08Bo=</encrypted>]]>
      
    </text>
  </script>

  &XMLStandardReportToolbar;
  <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FPRcNTa+yDH/Otj6rxEWg2Un2Kf9uBBA1J6TXCw5uCB68VRU0z30nYKyeQC5OO2BYgOCfot7FDm5ZsaFQS0/9Lw</encrypted>]]>
    </text>
  </css>
</grid>
