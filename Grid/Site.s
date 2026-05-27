<?xml version="1.0" encoding="utf-8"?>

<grid table="dmkho" code="ma_kho" order="ma_kho" xmlns="urn:schemas-maxv-com:data-grid">

  <title v="Danh mục kho hàng" e="Warehouse/Site List"></title>
  <subTitle v="Cập nhật kho hàng (Thêm, sửa, xóa, ...)" e="Site (Add, Edit, Delete, ...)"></subTitle>

  <fields>
    <field name="ma_dvcs" width="80" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true" width="110" allowSorting="true" allowFilter="true">
      <header v="Mã kho" e="Code"></header>
    </field>
    <field name="ten_kho%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên kho" e="Description"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
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

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
