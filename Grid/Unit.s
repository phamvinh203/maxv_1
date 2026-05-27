<?xml version="1.0" encoding="utf-8"?>

<grid table="dmdvcs" code="ma_dvcs" order="ma_dvcs" xmlns="urn:schemas-maxv-com:data-grid">

  <title v="Danh mục đơn vị" e="Unit List"></title>
  <subTitle v="Cập nhật đơn vị (Thêm, sửa, xóa, ...)" e="Unit (Add, Edit, Delete, ...)"></subTitle>

  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã đơn vị" e="Unit Code"></header>
    </field>
    <field name="ten_dvcs%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đơn vị" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ten_dvcs%l"/>
    </view>
  </views>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
