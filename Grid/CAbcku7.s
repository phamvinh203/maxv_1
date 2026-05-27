<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Báo cáo theo dõi thời gian thanh toán các khoản vay" e="Loan Payment Term Tracking Report"></title>
  <subTitle v="Tài khoản vay: %s1, ngày vay từ %d1 đến %d2..." e="Loan Account: %s1, Date from %d1 to %d2..."></subTitle>
  <pivot rowField="xRow" columnField="sysColumn" dataFields="ngay_tt_xoay" indexTable="2" indexColumn="1" indexHeader="2" indexView="7"/>
  <fields>
    <field name="ma_ku" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khế ước" e="Code"></header>
    </field>
    <field name="ten_ku" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khế ước" e="Description"></header>
    </field>

    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowSorting="true" allowFilter="true">
      <header v="Số tiền vay nt" e="FC Loan Amount"></header>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowSorting="true" allowFilter="true">
      <header v="Số tiền vay" e="Loan Amount"></header>
    </field>
    <field name="ngay_vay" width="80" type="DateTime" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày vay" e="Loan Date"></header>
    </field>

    <field name="tien_tt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowSorting="true" allowFilter="true">
      <header v="Tiền tt mỗi lần nt" e="FC Payment"></header>
    </field>
    <field name="tien_tt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowSorting="true" allowFilter="true">
      <header v="Tiền tt mỗi lần" e="Payment"></header>
    </field>

    <field name="ngay_tt_xoay" width="80" align="center">
      <header v="" e=""></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ku"/>
      <field name="ten_ku"/>
      <field name="tien_nt"/>
      <field name="tien"/>
      <field name="ngay_vay"/>
      <field name="tien_tt_nt"/>
      <field name="tien_tt"/>
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
