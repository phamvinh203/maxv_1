<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandCheckUnitRightBeforeInit SYSTEM "..\Include\Command\CheckUnitRightBeforeInit.txt">
]>

<grid table="vcthsts" code="so_the_ts, ky, nam" filter="&FilterCheckAccessUnit;" order="so_the_ts, nam, ky" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Điều chuyển bộ phận sử dụng" e="Fixed Asset Transfer"></title>
  <subTitle v="Cập nhật điều chuyển bộ phận sử dụng tài sản (Thêm, sửa, xóa, ...)" e="Fixed Asset Transfer (Add, Edit, Delete, ...)"></subTitle>

  <fields>
    <field name="so_the_ts" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Thẻ tài sản" e="Fixed Asset"></header>
    </field>
    <field name="ky" type="Decimal" width="60" isPrimaryKey="true" allowSorting="true" allowFilter="true"  align="right">
      <header v="Kỳ" e="Period"></header>
    </field>
    <field name="nam" type="Decimal" width="60" isPrimaryKey="true"  allowSorting="true" allowFilter="true" align="right">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận sử dụng" e="Department"></header>
    </field>
	<field name="ten_bp%l" width="200" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận sử dụng" e="Department Name"></header>
    </field>

    <field name="ten_ts%l" width="300" >
      <header v="Tên tài sản" e="Description"></header>
    </field>
	<field name="tk_ts" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk tài sản" e="FA Account"></header>
    </field>
	<field name="tk_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk khấu hao" e="Depr Account"></header>
    </field>
	<field name="tk_cp" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk chi phí" e="Expense Account"></header>
    </field>
	
  </fields>

  <views>
    <view id="Grid">
      <field name="so_the_ts"/>
      <field name="ten_ts%l"/>
      <field name="nam"/>
      <field name="ky"/>
      <field name="ma_bp"/>
	  <field name="ten_bp%l"/>
	  <field name="tk_ts"/>
	  <field name="tk_kh"/>
	  <field name="tk_cp"/>
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
