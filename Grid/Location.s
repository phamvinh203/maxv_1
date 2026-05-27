<?xml version="1.0" encoding="utf-8"?>

<grid table="vdmvitri" code="ma_kho, ma_vi_tri" order="ma_kho, ma_vi_tri" xmlns="urn:schemas-maxv-com:data-grid">

  <title v="Danh mục vị trí kho hàng" e="Location List"></title>
  <subTitle v="Cập nhật vị trí kho hàng (Thêm, sửa, xóa, ...)" e="Location (Add, Edit, Delete, ...)"></subTitle>

  <fields>
    <field name="ma_kho" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ma_vi_tri" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ten_vi_tri%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vị trí" e="Description"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>
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
