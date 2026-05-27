<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Báo cáo tổng hợp giá thành sản phẩm" e="Cost of Product"></title>
  <subTitle v="Từ kỳ %d1 năm %n1 đến kỳ %d2 năm %n2..." e="From Period %d1 Year %n1 to Period %d2 Year %n2..."></subTitle>
  <pivot rowField="xPivot" columnField="sysColumn" dataFields="gt, gt_nt" indexTable="2" indexColumn="1" indexHeader="2" indexView="7"/>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_bp" width="90" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" width="80" allowSorting="true" allowFilter="true">
      <header v="Số lsx" e="MO"></header>
    </field>
    <field name="ma_sp" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Item Code"></header>
    </field>
    <field name="ten_sp%l" width="250" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Item Name"></header>
    </field>
	
    <field name="dd_dk" type="Decimal" width="100" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum">
      <header v="Dở dang đầu kỳ" e="Opening Wip"></header>
    </field>
    <field name="sl_tp" type="Decimal" width="100" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum">
      <header v="SL thành phẩm" e="Store Qty."></header>
    </field>
    <field name="gt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum">
      <header v="Giá trị" e="Amount"></header>
    </field>
    <field name="gt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum">
      <header v="Giá trị nt" e="FC Amount"></header>
    </field>
    <field name="dd_ck" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum">
      <header v="Dở dang cuối kỳ" e="Closing Wip"></header>
    </field>
    <field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>
	  
	  <field name="dd_dk"/>
	  <field name="sl_tp"/>
	  
	  <field name="dd_ck"/>
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
    </text>
  </script>

<toolbar>
  <button command="Search">
    <title v="Toolbar.Search" e="Toolbar.Search"></title>
  </button>
  <button command="Export">
    <title v="Toolbar.Export" e="Toolbar.Export"></title>
  </button>
  <button command="Aggregate">
    <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
  </button>
  <button command="Seprate">
    <title v="-" e="-"></title>
  </button>
  <button command="Freeze">
    <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
  </button>
</toolbar>
</grid>
