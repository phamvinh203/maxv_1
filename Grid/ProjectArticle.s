<?xml version="1.0" encoding="utf-8"?>

<grid table="v20dmvvct" code="ma_so" order="ma_so" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Khai báo chỉ tiêu dự án, công trình" e="Project Article List"></title>
  <subTitle v="Cập nhật chỉ tiêu dự án, công trình (Thêm, sửa, xóa, ...)" e="Project Article (Add, Edit, Delete, ...)"></subTitle>
 
  <fields>
    <field name="ma_so" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Article"></header>
    </field>
    <field name="chi_tieu%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chỉ tiêu" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_so"/>
      <field name="chi_tieu%l"/>
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
