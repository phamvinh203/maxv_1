<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandCheckUnitRightBeforeInit SYSTEM "..\Include\Command\CheckUnitRightBeforeInit.txt">
]>

<grid table="vctdmts1" code="so_the_ts, ngay_ct, ma_nv, ky, nam, ma_tg_ts" filter="&FilterCheckAccessUnit;" order="so_the_ts, ngay_ct, ma_nv, ky, nam, ma_tg_ts" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Điều chỉnh giá trị TSCĐ" e="Fixed Asset Value Adjustment"></title>
  <subTitle v="Điều chỉnh giá trị TSCĐ (Thêm, sửa, xóa, ...)" e="Fixed Asset Value Adjustment (Add, Edit, Delete, ...) "></subTitle>

  <fields>
    <field name="so_the_ts" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Số thẻ" e="FA Code"></header>
    </field>
    <field name="ten_ts%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài sản" e="Description"></header>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" width="80" allowSorting="true" allowFilter="true" >
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ky" type="Decimal" isPrimaryKey="true" width="80" allowSorting="true" allowFilter="true">
      <header v="Kỳ" e="Period"></header>
    </field>
    <field name="ngay_ct" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_ct" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số" e="Number"></header>
    </field>
    <field name="ma_nv" isPrimaryKey="true" width="100" hidden="true" allowSorting="true" allowFilter="true">
      <header v="Nguồn vốn" e="Capital"></header>
    </field>
    <field name="ma_tg_ts" isPrimaryKey="true" width="100" hidden="true" allowSorting="true" allowFilter="true">
      <header v="Mã tăng giảm" e="Reason"></header>
    </field>
    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ngoại tệ" e="Currency"></header>
    </field>
    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="so_the_ts"/>
      <field name="ten_ts%l"/>
      <field name="nam"/>
      <field name="ky"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_nv"/>
      <field name="ma_tg_ts"/>
      <field name="nguyen_gia_nt"/>
      <field name="ma_nt"/>
      <field name="nguyen_gia"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandCheckUnitRightBeforeInit;
      </text>
    </command>
  </commands>

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
	
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
	
	<button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
	

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
