<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Các yếu tố không phân bổ được trong kỳ" e="Factors can not be Allocated in Period"></title>
  <subTitle v="Kỳ %d1 năm %n1." e="Period %d1 year %n1."></subTitle>
  <fields>
    <field name="ma_yt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã yếu tố" e="Factor ID"></header>
    </field>
    <field name="ma_bp0" width="100" allowSorting="true" allowFilter="true">
      <header v="Bp gián tiếp" e="Indirect Dept."></header>
    </field>
    <field name="so_lsx" width="80" allowSorting="true" allowFilter="true">
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Công đoạn" e="Section"></header>
    </field>
    <field name="ma_sp" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Product Code"></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>

    <field name="ps_tk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Ps trong kỳ nt" e="FC Arising"></header>
    </field>
    <field name="ps_tk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Ps trong kỳ" e="Arising"></header>
    </field>
    <field name="t_he_so" type="Decimal" dataFormatString="#.#0" width="100" allowSorting="true" allowFilter="true">
      <header v="Tổng hệ số" e="Total Coefficient"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_yt"/>
      <field name="ma_bp0"/>
      <field name="so_lsx"/>
      <field name="ma_bp"/>
      <field name="ma_sp"/>
      <field name="ma_vt"/>

      <field name="ps_tk_nt"/>
      <field name="ps_tk"/>
      <field name="t_he_so"/>
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
