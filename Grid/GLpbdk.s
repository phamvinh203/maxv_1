<?xml version="1.0" encoding="utf-8"?>

<grid table="dmpbky" code="ma_bt" order="ma_dvcs, ma_bt" filter="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)))" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Khai báo bút toán phân bổ định kỳ" e="Definition of Periodic Allocation Entries"></title>
  <subTitle v="Khai báo bút toán phân bổ định kỳ (Thêm, sửa, xóa, ...) " e="Definition of Periodic Allocation (Add, Edit, Delete, ...)"></subTitle>

  <fields>
    <field name="ma_dvcs" width="100" allowFilter="true" allowSorting="true" allowContain="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_bt" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Bút toán" e="Entry Code"></header>
    </field>
    <field name="ten_bt" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên bút toán" e="Entry Name"></header>
    </field>
    <field name="so_ky_pb" width="100" allowFilter="true" allowSorting="true">
      <header v="Số kỳ phân bổ" e="Allocation Period(s)"></header>
    </field>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true" allowSorting="true">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="ngay_kt" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true" allowSorting="true">
      <header v="Ngày kết thúc" e="End date"></header>
    </field>
    <field name="tk_no" width="100" allowFilter="true" allowSorting="true">
      <header v="Tài khoản nợ" e="Debit Account"></header>
    </field>
    <field name="tk_co" width="100" allowFilter="true" allowSorting="true">
      <header v="Tài khoản có" e="Credit Account"></header>
    </field>
	<field name="ma_nt" width="60" allowFilter="true" allowSorting="true">
      <header v="Mã nt" e="Currency"></header>
    </field>
    <field name="tien_nt" width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Giá trị nt" e="FC Value"></header>
    </field>
    <field name="tien" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Giá trị" e="Value"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ma_bt"/>
      <field name="ten_bt"/>
	  <field name="so_ky_pb"/>
      <field name="ngay_bd"/>
      <field name="ngay_kt"/>
	  <field name="ma_nt"/>
      <field name="tien_nt"/>
      <field name="tien"/>
	  <field name="tk_no"/>
      <field name="tk_co"/>
    </view>
  </views>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
	<button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
