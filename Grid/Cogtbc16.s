<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">

  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-maxv-com:data-grid" valid="systotal = 1">
  <title v="Bảng kê lệnh sản xuất" e=""></title>
  <subTitle v="Từ ngày: %d1 - đến: %d2 (Loại LSX : 1 -Sản xuất, 2 - Mẫu)" e="Date from: %d1 - to: %d2"></subTitle>
  <fields>
	<field name="so_ct" width="90" allowSorting="true" allowFilter="true">
      <header v="Số LSX" e="No"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày LSX" e="Date"></header>
    </field>
	<field name="ngay_kh1" hidden="true" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày bắt đầu" e="Start date Code"></header>
    </field>
	<field name="ngay_kh2" hidden="true" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày kết thúc" e="Due date"></header>
    </field>
	<field name="Ma_gd" width="55"  allowSorting="true" allowFilter="true">
      <header v="Loại LSX " e="Quantity"></header>
    </field>    
	<field name="ma_kh" width="80" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Code"></header>
    </field>
    <field name="ten_kh%l" width="180" allowSorting="true" allowFilter="true">
      <header v="Tên khách hàng" e="Description"></header>
    </field>
	<field name="dien_giai" width="200" allowSorting="true" allowFilter="true" >
      <header v="Diễn giải / Mô tả lệnh sản xuất)" e="Description"></header>
    </field>
	<field name="ma_vt" width="70" allowSorting="true" allowFilter="true">
      <header v="Mã SP" e="Code"></header>
    </field>
    <field name="ten_vt%l" width="170" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Description"></header>
    </field>
	<field name="dvt" width="60" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="Code"></header>
    </field> 

	<field name="Ma_vi_tri" width="70" allowSorting="true" allowFilter="true">
      <header v="Màu sắc" e="Order Number"></header>
    </field>
	<field name="Ma_lo" width="50" allowSorting="true" allowFilter="true">
      <header v="Lô/Cỡ" e="Note"></header>
    </field>
	<field name="so_luong" type="Decimal" width="90" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Số lượng SX" e="Quantity"></header>
    </field>	
	<field name="User_id0" hidden="true" width="70" allowSorting="true" allowFilter="true">
      <header v="Người tạo" e="Department"></header>
    </field>
    
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="sysbold" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
		<field name="so_ct"/>
		<field name="ngay_ct"/>  
		<field name="ngay_kh1"/>
		<field name="ngay_kh2"/>
		<field name="Ma_gd"/>
		<field name="ma_kh"/>
		<field name="ten_kh%l"/>
		<field name="dien_giai"/>
		<field name="ma_vt"/>
		<field name="ten_vt%l"/>
		<field name="dvt"/>
		<field name="ma_vi_tri"/>
		<field name="Ma_lo"/>
		<field name="so_luong"/>
		<field name="User_id0"/>

		<field name="stt_rec"/>
		<field name="sysbold"/>
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
