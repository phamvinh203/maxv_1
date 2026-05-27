<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Kiểm tra khai báo mẫu bảng cân đối kế toán" e="Balance Sheet Declaration Checking"></title>
  <subTitle v="Mẫu báo cáo: %s" e="Report Form: %s"></subTitle>
  <fields>
    <field name="ma_so" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã số" e="Code"></header>
    </field>
    <field name="chi_tieu" width="300" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="kt1" width="150" type="Boolean" allowSorting="true" allowFilter="true">
      <header v="Tk khai báo sai" e="Wrong declaration of acc."></header>
    </field>
    <field name="kt2" width="150" type="Boolean" allowSorting="true" allowFilter="true">
      <header v="Chi tiết một vế công nợ" e="One side of AR/PR"></header>
    </field>
    <field name="kt3" width="150"  type="Boolean" allowSorting="true" allowFilter="true">
      <header v="Giá trị không âm" e="Value is at least 0"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_so"/>
      <field name="chi_tieu"/>
      <field name="kt1"/>
      <field name="kt2"/>
      <field name="kt3"/>
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
