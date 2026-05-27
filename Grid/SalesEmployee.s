<?xml version="1.0" encoding="utf-8"?>

<grid table="dmnvbh" code="ma_nvbh" order="ma_nvbh" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục nhân viên bán hàng" e="Sales Employee List"></title>
  <subTitle v="Cập nhật danh mục nhân viên bán hàng (Thêm, sửa, xóa, ...)" e="Sales Employee (Add, Edit, Delete, ...)"></subTitle>
 
  <fields>
    <field name="ma_nvbh" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ten_nvbh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhân viên" e="Employee Name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nvbh"/>
      <field name="ten_nvbh%l"/>
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
