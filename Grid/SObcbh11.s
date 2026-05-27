<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Báo cáo tổng hợp bán hàng theo 2 chỉ tiêu nhiều kỳ" e="Multi-period Sales"></title>
  <subTitle v="%t, %p, từ ngày: %d2..." e="%t, %p, Date from: %d2..."></subTitle>
  <pivot rowField="xKey" columnField="fKey" dataFields="tien, tien_nt" indexTable="2" indexColumn="1" indexHeader="2" indexView="3"/>
  <fields>
    <field name="stt" type="Int16" width="30" allowSorting="true" allowFilter="true" align="right">
      <header v="Stt" e="No."></header>
    </field>
    <field name="xDetail" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'sobcbh11detail', Controller: 'SObcbh11', Name: '[ma]', Value: '[xDetail] + String.fromCharCode(253) + [tKey] + this._queryFilterString'}, Script: 'beforeDrillDownWithCondition(this);'">
      <header v="Mã" e="Code"></header>
    </field>
    <field name="ten_key" width="250" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="tien" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="true" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="true" aggregate="Sum">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>

    <field name="systotal" type="Int16" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="sysorder" type="Int16" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="tKey"  width="0" hidden="true">
      <header v="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="xDetail"/>
      <field name="ten_key"/>
      <field name="systotal"/>
      <field name="sysorder"/>
      <field name="tKey"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>R7nNTZBxqspPiUmZ3F7lNQwzEw/98UcDn5hXOH9e07IORTC+1dip3cDtEOtpB743Sp9tbOl9ZUC1BOwX/VwQKXl48otN3kTQAGtHrXz1aX+q0odXeki9NTeMoGXnlKUhV2kmtS/Z32JpDWnwYy0b9EUxrW25lNIG8FHvgIXJTB7obpEM0fPGkrZCpSXaobn+/f1H9kkfvxARnPrEqRwTKfyNfXTxCbvyu4aYqHRTkKCP9hOulyE4QfDfgOck8JIOa2wxOozZwCLWgpYv1V9sRJf1m/VMou4YNjgft1TlyUtgnPbDUXifN8BImf8GgjwX4zOs4NN7KIs01X1Id+18dC3AFd7lTlE/WDUKT6Z4PWffLx1xyUJb7LUdUEOhldt1wKJzhJwae0tWXgswV339viuHtYXV/oaWtt7tfOm0hQsJ3lb2cl/vNcf7gkAelZgQIAoHyka0/2qsyuF6RtWYQDOvkNKCdA4LKRthImGIDBZvAWaolnir4A8y1r2KtFMGD/a3az+yaWxi8nZ6yuJ+kLy169BfeNXN2gejVIDKuGyL7hpdsRGD9X0oDjdb3XtL4CdG62BFiMP5wEIZlLt+WHDHW+EBf+cS+Zocx10nM87M/WLJMDhj5ETIaVAT8CCCw+lYy5z43udIYG92dcobPdq/J+PQDUykAGXbdmZytTpUbj7E4dkU3LfCMz+IXOoc9QIx0jzssh3uHX60+4AYu67xk1zVk9jNGB2dXXSSz30LapIfxHekSRk1WbcQ6LCtnguL2MQO4g0nagKtC0HY0TwR30fJ6AHEoilvILVXE3koE1YOwA5Ym1QvM9TmjPi8</encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
  <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FPRcNTa+yDH/Otj6rxEWg2Un2Kf9uBBA1J6TXCw5uCB68VRU0z30nYKyeQC5OO2BYgOCfot7FDm5ZsaFQS0/9Lw</encrypted>]]>
    </text>
  </css>
</grid>
