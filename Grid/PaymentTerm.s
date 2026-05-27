<?xml version="1.0" encoding="utf-8"?>

<grid table="dmtt" code="ma_tt" order="ma_tt" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục thanh toán" e="Payment Term List"></title>
  <subTitle v="Cập nhật danh mục thanh toán (Thêm, sửa, xóa, ....)" e="Payment Term (Add, Edit, Delete, ...)"></subTitle>
 
  <fields>
    <field name="ma_tt" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã thanh toán" e="Payment Term"></header>
    </field>
    <field name="ten_tt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên thanh toán" e="Description"></header>
    </field>
    <field name="han_tt" width="120" allowSorting="true" allowFilter="true" align="right">
      <header v="Hạn thanh toán" e="Payment Day(s)"></header>
    </field>
  </fields>

 <views>
    <view id="Grid">
      <field name="ma_tt"/>
      <field name="ten_tt%l"/>
      <field name="han_tt"/>
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

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
