<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Bảng định mức sản phẩm" e="Bill of material"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Hiệu lực từ ngày" e="Date From"/>
    </field>
	<field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Đến ngày" e="Date to"/>
    </field>
	
    <field name="ma_ct" width="50" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
  
    <field name="ma_sp" width="100" allowSorting="true" allowFilter="true">
      <header v="Sản phẩm" e="Customer ID"></header>
    </field>
    <field name="ten_sp%l" width="250" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Product Name"></header>
    </field>
	<field name="dvt_sp" width="60" allowSorting="true" allowFilter="true">
      <header v="Đvt sp" e="UOM"></header>
    </field>
	<field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="250" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
	<field name="dvt" width="60" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>	
	
	<field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Customer ID"></header>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Department Name"></header>
    </field> 

    <field name="so_luong" type="Decimal" width="120" dataFormatString="### ##0.0000" allowSorting="true" aggregate="Sum">
      <header v="Định mức" e="BOM"></header>
    </field>
     <field name="stt_rec" width="120" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ma_ct"/>
	  <field name="ma_sp"/>
	  <field name="ten_sp%l"/>
	  <field name="dvt_sp"/>
	  <field name="ma_vt"/>
	  <field name="ten_vt%l"/>
	  <field name="dvt"/>
	  <field name="so_luong"/>
	  
      <field name="ngay_ct1"/>
	  <field name="ngay_ct2"/>

      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
    
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
