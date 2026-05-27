<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="In các bút toán tự động" e="List of auto-generated transactions"></title>
  <subTitle v="%d..." e="%d..."></subTitle>
  <fields>
    <field name="ten_dg%l" width="350" allowSorting="true" allowFilter="true">
      <header v="Nội dung" e="Content"></header>
    </field>
    <field name="tk" width="100"  allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="tk_du" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk đối ứng" e="Ref. Account"></header>
    </field>
    <field name="ps_no_nt" width="120" type="Decimal" allowSorting="true" allowFilter="true" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum">
      <header v="Phát sinh nợ nt" e="FC Debit"></header>
    </field>
    <field name="ps_co_nt" width="120" type="Decimal" allowSorting="true" allowFilter="true" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum">
      <header v="Phát sinh có nt" e="FC Credit"></header>
    </field>
    <field name="ps_no" width="120" type="Decimal" allowSorting="true" allowFilter="true" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum">
      <header v="Phát sinh nợ" e="Debit"></header>
    </field>
    <field name="ps_co" width="120" type="Decimal" allowSorting="true" allowFilter="true" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum">
      <header v="Phát sinh có" e="Credit"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ten_dg%l"/>
      <field name="tk"/>
      <field name="tk_du"/>
      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
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
