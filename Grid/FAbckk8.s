<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Thẻ tài sản cố định" e="Fixed Asset Card"></title>
  <subTitle v="Kỳ %d1 năm %d2..." e="Period %d1 Year %d2..."></subTitle>
  <fields>
    <field name="so_the_ts" width="100" allowSorting="true" allowFilter="true">
      <header v="Số thẻ tài sản" e="FA Code"></header>
    </field>
    <field name="ten_ts%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài sản" e="FA Name"></header>
    </field>

    <field name="ngay_mua" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày tăng" e="Inc. Date"></header>
    </field>
    <field name="ngay_kh0" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày tính kh" e="Depr. Date"></header>
    </field>
    <field name="so_ky_kh" type="Decimal" dataFormatString="# ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Số kỳ khấu hao" e="Depr. Periods"></header>
    </field>

    <field name="tk_ts" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk tài sản" e="FA Acct."></header>
    </field>
    <field name="tk_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk khấu hao" e="Depr. Acct."></header>
    </field>
    <field name="tk_cp" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk chi phí" e="Expense Acct."></header>
    </field>

    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Bp sử dụng" e="Using Dept."></header>
    </field>

    <field name="nh_ts1" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm 1" e="Group 1"></header>
    </field>
    <field name="nh_ts2" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm 2" e="Group 2"></header>
    </field>
    <field name="nh_ts3" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm 3" e="Group 3"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="so_the_ts"/>
      <field name="ten_ts%l"/>

      <field name="ngay_mua"/>
      <field name="ngay_kh0"/>
      <field name="so_ky_kh"/>

      <field name="tk_ts"/>
      <field name="tk_kh"/>
      <field name="tk_cp"/>

      <field name="ma_bp"/>

      <field name="nh_ts1"/>
      <field name="nh_ts2"/>
      <field name="nh_ts3"/>
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
