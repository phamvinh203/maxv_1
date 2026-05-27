<?xml version="1.0" encoding="utf-8"?>

<grid table="dmnt" code="ma_nt" order="ma_nt" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục tiền tệ" e="Currency List"></title>
  <subTitle v="Cập nhật danh mục tiền tệ (Thêm, sửa, xóa, ...) " e="Currency (Add, Edit, Delete, ...)"></subTitle>
 
  <fields>
    <field name="ma_nt" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã ngoại tệ" e="Currency Code"></header>
    </field>
    <field name="ten_nt%l" width="350" allowSorting="true" allowFilter="true">
      <header v="Tên ngoại tệ" e="Currency Name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nt"/>
      <field name="ten_nt%l"/>
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
