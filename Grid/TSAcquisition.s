<?xml version="1.0" encoding="utf-8"?>

<grid table="dmtgcc" code="ma_tg_ts" order="loai_tg_ts, ma_tg_ts" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục lý do tăng giảm CCDC" e="Tool &#38; Supply Acquisition Reason List"></title>
  <subTitle v="Cập nhật lý do tăng giảm công cụ dụng cụ (Thêm, sửa, xóa, ...)" e="Tool &#38; Supply Acquisition Reason (Add, Edit, Delete, ...)"></subTitle>
 
  <fields>
    <field name="loai_tg_ts" width="100" allowSorting="true" allowFilter="true" align="right">
      <header v="Loại tăng giảm" e="Type"></header>
    </field>
    <field name="ma_tg_ts" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã tăng giảm" e="Code"></header>
    </field>
    <field name="ten_tg_ts%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tăng giảm" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai_tg_ts"/>
      <field name="ma_tg_ts"/>
      <field name="ten_tg_ts%l"/>
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
