<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Kiểm tra số liệu giữa sổ tài khoản và sổ kho" e="Stock Card and Account Activity Reconciliation Checking"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2, tài khoản vật tư: %s..." e="Date from %d1 to %d2, Item Account: %s..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="80" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="VC. Date"></header>
    </field>
    <field name="so_ct" width="100" allowSorting="true" allowFilter="true" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>
    <field name="ma_ct" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="ten_ct" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên ct" e="Voucher Name"></header>
    </field>

    <field name="kt1" width="200" type="Boolean" allowSorting="true" allowFilter="true">
      <header v="Không có trên sổ kho" e="Not exist in Stock"></header>
    </field>
    <field name="kt2" width="200" type="Boolean" allowSorting="true" allowFilter="true">
      <header v="Không có trên sổ tài khoản" e="Not exist in GL"></header>
    </field>
    <field name="kt3" width="200" type="Boolean" allowSorting="true" allowFilter="true">
      <header v="Sổ tài khoản và sổ kho khác giá trị" e="Stock and GL not equal in value"></header>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
	  <field name="ma_ct"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ten_ct"/>
      <field name="kt1"/>
      <field name="kt2"/>
      <field name="kt3"/>
      <field name="stt_rec"/>
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

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
