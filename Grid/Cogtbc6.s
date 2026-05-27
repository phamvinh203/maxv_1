<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Báo cáo so sánh NVL thực tế và định mức theo sản phẩm" e="BOM and Actual Raw Material Comparison by Finished Item"></title>
  <subTitle v="Từ kỳ %d1 năm %n1 đến kỳ %d2 năm %n2..." e="From Period %d1 Year %n1 to Period %d2 Year %n2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" width="80" allowSorting="true" allowFilter="true">
      <header v="Số lsx" e="MO"></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>

    <field name="so_luong0" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Sl định mức" e="Plan Quantity"></header>
    </field>
    <field name="gia_nt0" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Giá định mức nt" e="FC Plan Price"></header>
    </field>
    <field name="tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền định mức nt" e="FC Plan Amount"></header>
    </field>
    <field name="gia0" type="Decimal" dataFormatString="@baseCurrencyPriceViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Giá định mức" e="Plan Price"></header>
    </field>
    <field name="tien0" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền định mức" e="Plan Amount"></header>
    </field>

    <field name="sl_gt" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Sl giá thành" e="Prd. Quantity"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn giá nt" e="FC Price"></header>
    </field>
    <field name="gt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tổng gt nt" e="FC Total Cost"></header>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn giá" e="Price"></header>
    </field>
    <field name="gt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tổng gt" e="Total Cost"></header>
    </field>

    <field name="sl_cl" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Sl chênh lệch" e="Diff. Quantity"></header>
    </field>
    <field name="ty_le_sl_cl" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="% chênh lệch" e="% Difference"></header>
    </field>
    <field name="tien_nt_cl" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền chênh lệch nt" e="FC Diff. Amount"></header>
    </field>
    <field name="ty_le_tien_nt_cl" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="% tiền chênh lệch nt" e="% FC Diff. Amount"></header>
    </field>
    <field name="tien_cl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền chênh lệch" e="Diff. Amount"></header>
    </field>
    <field name="ty_le_tien_cl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="% tiền chênh lệch" e="% Diff. Amount"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>

      <field name="so_luong0"/>
      <field name="gia_nt0"/>
      <field name="tien_nt0"/>
      <field name="gia0"/>
      <field name="tien0"/>

      <field name="sl_gt"/>
      <field name="gia_nt"/>
      <field name="gt_nt"/>
      <field name="gia"/>
      <field name="gt"/>

      <field name="sl_cl"/>
      <field name="ty_le_sl_cl"/>
      <field name="tien_nt_cl"/>
      <field name="ty_le_tien_nt_cl"/>
      <field name="tien_cl"/>
      <field name="ty_le_tien_cl"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>
