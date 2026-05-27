<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 0" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Bảng tổng hợp phát sinh theo đối tượng (Tk, khách hàng, ....)" e="Account Summary by Customer, Job, Sub-account, Reference Account"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" width="60" type="Int32" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
	
    <field name="ma" width="110" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'glth1_detail', Controller: 'GLth1', Name: '[ma]', Value: '[ma] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="" e=""></header>
    </field>
	
	
    <field name="ten" width="300" allowSorting="true" allowFilter="true">
      <header v="" e=""></header>
    </field>

    <field name="ps_no_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
    </field>
    <field name="ps_no" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Phát sinh có" e="Credit Amount"></header>
    </field>
	<field name="systotal" width="60" type="Int32" allowSorting="true" allowFilter="true" hidden="true">
      <header v="" e=""></header>
    </field>
	
  </fields>
  <views>
    <view id="Grid">
	  <field name="stt"/>
      <field name="ma"/>
      <field name="ten"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
	  <field name="systotal"/>
    </view>
  </views>
  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7cp/o4yHIi5iNPyL4s81qug0snhjhoxRsI5BSgIRH3Ty2B+YEVOqZxgm7YO6+FmZNcgzONXccixmPYJSgSGG0qo=</encrypted>]]>
      </text>
    </command>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>NINN7bIMq8q4rkI9VeviC5IvBGZx+wLEcD2JEypA5jqeggs+EyGs9u0zOCrjMAcK1KzlW4BLI60r9NF9Bg7M7wriCHPh4i4mAmx6SzX7l1pEpHM/bDTey4o+ABhnPuGz/rnOssD2A9L/0jQVAXkKOfSYLOFWHKo8tb6KF2SbEDg45r3eRzcWDYAFAczBOeDqKFTMtAJJKsU9niQK5khdQNmqrCpAIvMDgx0rTbTjuFOIWVFiHgnXttlsUKKFMtBVDcUz+hK1MHf0M/DC52vggAbsCjzu6ha8ec2Xbs+y3hGMaPIaxl7FWVE6345VvxHXpAUb8eaylYw/Wfmxj9u3XOLoSR9AL9qLqCW12/JQW+bG0zMWHhqwY+jFVWAETclITihenS8vMy9PlxoY3KbaHMXplxLgSa/jELXnLTiusv8kJ3BJOc264BFLC0ViYFWfAYqlQkeAG4q/Hvsyd3Ja7ZPk/P1pLMpkwR7sIxPKMYzbzW8sv8NRzRG/hYDUJy24x0xjb+32eBd5pU+fhsyPCWcWHfVLIOdfMF7s7yXVwohFCN6fvF7alvw6dBoAhsfDh+YPz9Kg/sSDs5ZPyHc7H/6LsWeDy35faWRdDUEJSg9dBYCgu27AYKpA8ZHwQrAMETg7MPIgC/O0yhs7ipXVw753YK7ig2RNjq7d/MthsjXvYh3LjGbtcs05/YEQZKqncnFnfNuuzMrye65hGmBPOdbCz7EJiagxVMMwGzsc9CGv9Vjs1hrGal0HrDI8OC7nteMQIu9JIUtg8jTsyPLFjQvltNa9Pozu6gjYNEoUBa+xrVmwQh2sPiJNLwHbz8zzEGX5dTSY7OSo4xL7QQEcsm0+EiZZH8uMxr9oGePtiRcPTfpSUysduv8FP8GwvTRVDcG9ZgfG+s0O1AfO12Vy8dophv/L8KN7Nndbq9fJJKreKYxVhSqou300cAag+1BCQ8OPC+BDGlO+81bxY36Vj7jo1fVdBYAqgfRN1P8Pmeh3/OGrquJwYrk/BVX1afFwvXYgdwHeuemtGJIeXg2N7eBehB2r8pOCFk9QZIsHH0KlPh1tCkpi5dfG8edDP/tz9l9Nav9c60j34ZEFw4EYvDHURO7Zen3eFeRjxTiHfXZh3BWZ/04Zs8JHxMZRXOj4P1hZO56X5jpAtZfLArXyfwu7AsfFh2IcBAx9BuCr/kRGU9tZ5Saqh7E4ewPi52A27pof9Ft1tRzx7wB1I6VWn2KrBpFpMCCEts+bxfKbpl4xexozTjzJ1H4ru6PyMIMk7nQ/lEX9QGRKvcRKVYN8xoO3oSYDNDp0nb58JEaA578Fme1Neq+85rTV9YFcYkWjR3kKvNUGh+n47Ei0TSAH3kE2d0gXOA4X4noxmq37hnSCPHEGTOSqBkZRkqcOEtk7</encrypted>]]>
    </text>
  </script>
  <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FPRcNTa+yDH/Otj6rxEWg2Un2Kf9uBBA1J6TXCw5uCB68VRU0z30nYKyeQC5OO2BYgOCfot7FDm5ZsaFQS0/9Lw</encrypted>]]>
    </text>
  </css>
  &XMLStandardReportToolbar;
</grid>
