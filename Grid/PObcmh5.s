<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Tổng hợp hàng xuất trả lại nhà cung cấp" e="Return to Suppliers Summary"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'pobcmh5detail', Controller: 'PObcmh5', Name: '[ma_vt]', Value: '[ma_vt] + this._queryFilterString'}, Script: 'beforeDrillDownWithCondition(this);'">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="250" allowSorting="true" allowFilter="true">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>

    <field name="dvt" width="60" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="true">
      <header v="Giá nt" e="FC Price"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>

    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="true">
      <header v="Giá" e="Price"></header>
    </field>
    <field name="tien" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
    </field>

    <field name="sysorder" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
	<field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>

      <field name="dvt"/>
      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>

      <field name="gia"/>
      <field name="tien"/>

      <field name="sysorder"/>
	  <field name="systotal"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>D9zuJYsIK61arRKwe1XSlY4XulA3Gd/GabjF3JKldD732CCaoz/xRGgN4jEoRnPI8uUyNNWxvjVdMFiy5JhfFJi/yCK73o4SeSfjcN5ugIO9WCkmLGw/PYHdb8WsGD8pT9C2Cms+ayDyaC8aPQz9f/bjTlDl+tJkAh4zVnpqlwvRATCAaQN8zJ9eQWwaEpQv/ayUQ5S1Q7/xtjmBaZBkCSsDOXy5ZgHrXlSnO1fNGh1PPZu3Z1ezI+AKjUc1ZugwG4d8q+Txri9WzcGSCabfxuSfgXNVVfYMgLLH8hxyWc4Q+o+ibCMpFl5XtfqezJ7WMeETFRUb1+8mer1T7Blq3YFgcpNtP5Zhmgdh8a9iCgFiKkDkW0fvMsrkRSsmQXR5NH81mLtK1RqcRjk820U1wDQj6wDt+ko8RGwjasm1bEJl6ndToHxycv5RdY/w2Iph9W1LP+Hpw1TPKA3uHAHwZYgS9g40mTIc4nQOi9EE1h/gF4OzxMWXlB8ozx0E+5pzLSGnapaOc6GEFUSIm4vXPa+vjp7vb9RdSjNgm8QEZqI/m2Hwrlt06hMekjs3Z02xKKJ2IJTf09LfPB6Uuia1hcQHm0vJoPgJieJ2YI98yuulll5kzFLSXJY6RRFWx2SSx4Uxe+YFaXh1UiJI4bKs8x4TiJHozIbTToBoIUe8KMmyjxDQ/ojjCDqljoXFL5qCv+3CjlFuhR0d2XmpYzLcSs955kjwPWtxjeYq5Oq0v1Ql2paqL71zclZarXZo/mrY65RMURscZFqrxgRBMWPtdQ==</encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
    <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FPRcNTa+yDH/Otj6rxEWg2Un2Kf9uBBA1J6TXCw5uCB68VRU0z30nYKyeQC5OO2BYgOCfot7FDm5ZsaFQS0/9Lw</encrypted>]]>
    </text>
  </css>
</grid>
