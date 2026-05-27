<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Phân tích bán hàng nhiều kỳ" e="Multi-period Sales Analysis"></title>
  <subTitle v="%t, %p, từ ngày: %d2..." e="%t, %p, Date from: %d2..."></subTitle>
  <pivot rowField="ma_vt" columnField="xCycle" dataFields="so_luong, tien2, tien_nt2" indexTable="2" indexColumn="1" indexHeader="2" indexView="4"/>
  <fields>
    <field name="stt" type="Int16" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'sobcbh10detail', Controller: 'SObcbh10', Name: '[ma_vt]', Value: '[ma_vt] + this._queryFilterString'}, Script: 'beforeDrillDownWithCondition(this);'">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt" width="250" allowSorting="true" allowFilter="true">
      <header v="Tên hàng hóa" e="Item Name"></header>
    </field>
    <field name="dvt" width="60" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="tien_nt2" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum">
      <header v="Giá trị nt" e="FC Amount"></header>
    </field>
    <field name="tien2" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum">
      <header v="Giá trị" e="Amount"></header>
    </field>
    <field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_vt"/>
      <field name="ten_vt"/>
      <field name="dvt"/>

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
      <![CDATA[<encrypted>eHZSO1/uvs9YUcBbRKqQHbROQbvjAvJpjxLZQ3BrlGePO71iqzMKP0/MkT8wPi5xQ0RJ35uyZ0VgObUf3BKAMyJFt3rAxr5+pEuZT5fh8vxABUC1zw9v6+S32wI7UjC2mF1U94fxSJlDKwbDXuU11HaFfFziCHi4fkZwttZ4YOGG5iSaspmAlQ5/Bt5s61yja5s4qiwFWZXRmGuQopzmGA==</encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>
