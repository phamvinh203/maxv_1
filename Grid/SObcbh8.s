<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Báo cáo bán hàng nhóm theo 3 chỉ tiêu" e="Sales Summary Group by Three Criteria"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <pivot rowField="xKey" columnField="sysColumn" dataFields="tien, tien_nt" indexTable="2" indexColumn="1" indexHeader="2" indexView="3"/>
  <fields>
    <field name="stt" type="Int16" width="30" allowSorting="true" allowFilter="true" align="right">
      <header v="Stt" e="No."></header>
    </field>

    <field name="xRow" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'sobcbh8detail', Controller: 'SObcbh8', Name: '[ma]', Value: '[xRow] + String.fromCharCode(253) + [groupby] + this._queryFilterString'}, Script: 'beforeDrillDownWithCondition(this);'">
      <header v="Mã" e="Code"></header>
    </field>
    <field name="ten_row" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>

    <field name="systotal" type="Int16" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="sysorder" type="Int16" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="groupby"  width="0" hidden="true">
      <header v="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="xRow"/>
      <field name="ten_row"/>
      <field name="systotal"/>
      <field name="sysorder"/>
      <field name="groupby"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>4J+V/l+8YaYWpZyyxmU6HRYd+tFH0dscov1H434fJ7xbNBZNyi6YUKMzbDmWoGYcneyPAdJH81agT4zWW3/tTqvfR4MAMlECLBjoV17WnsudJpvTMCmKRqGq7tZ9HGz43yNn/m8zakhgyBjX9VGv4pFo95qJmZOwWFoASET6zWt779z+HG1PZIaFn5ZsElgoximwO57hij1eFPCYFBC6XbwqmCRF2qjtTGQn6q82O58jswXEjTtJC9apTESFIZ2Z6hTSdcFMitEMJ479OSbVkJyoqTnpdTGqGpdbAUwlKUjdKQDAlUb3I4IG02UjPaWPdS2tI6BQ6xmWPz+ZXr2A12ZIInfGVt/9vI20DYwQnQLhNmFljWMGQqFYji8ZBIWUfVLg2W5Gp4uw/jRnJrQ5D7rqxABeWtve4Dsa6WcPKtJE8jrfSZf2Iqpecfoa3Hd/7T+V221NUlcV6/jj2p6BvEF4a4d8bDLpTgS1gRKPkZ4D56gTD9zbjLb3ZD1M5JaG2yheQqg15oMFGYJvu7sOhP/Rb2LOyYytRX14Fvx3ObVIHxn/uKU7KZcv0rbCdUp7H24UBSmB/nMMiTMkJ4zwHKWAnrTTgXIMNl5m/Ke2i+hUrELIe0t8qQDEWhXn1tqjoTZx7m8fWBFh7st5gPqW2lcNSBf+Xu6vDkIld8JQCoCuEiuY9emsLWSpH48JlINpwiec4e738QepeQZzxYjPDPiffaaqGrPr5RVQ8gQbccDpzn/i84R5vdm4hDzU7Cyhnuz+SyU692wPB67/d50f4xYpNJ/9HDLusFi7JKB9e0KokVfiozywylNJ22RFaOSf</encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
  <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FPRcNTa+yDH/Otj6rxEWg2Un2Kf9uBBA1J6TXCw5uCB68VRU0z30nYKyeQC5OO2BYgOCfot7FDm5ZsaFQS0/9Lw</encrypted>]]>
    </text>
  </css>
</grid>
