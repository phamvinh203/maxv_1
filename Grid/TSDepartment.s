<?xml version="1.0" encoding="utf-8"?>

<grid table="dmbpcc" code="ma_bp" order="ma_bp" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục bộ phận sử dụng CCDC" e="Tool &#38; Supply Using Department List"></title>
  <subTitle v="Cập nhật bộ phận sử dụng CCDC (Thêm, sửa, xóa, ...)" e="Tool &#38; Supply Using Department (Add, Edit, Delete, ...)"></subTitle>
 
  <fields>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Code"></header>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
	<field name="ma_bp0" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận chi phí" e="Code"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
	  <field name="ma_bp0"/>
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
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
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
