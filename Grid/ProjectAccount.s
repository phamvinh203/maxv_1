<?xml version="1.0" encoding="utf-8"?>

<grid table="vdmtklkvv" code="tk_lkvv" order="tk_lkvv" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục tài khoản lũy kế dự án, công trình" e="Accumulation Account List"></title>
  <subTitle v="Cập nhật tài khoản lũy kế dự án (Thêm, sửa, xóa, ...)" e="Accumulation Account (Add, Edit, Delete, ...)"></subTitle>
 
  <fields>
    <field name="tk_lkvv" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>      
    </field>
    
    <field name="ten_tk%l" width="300" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="Tên tài khoản" e="Description"></header>
    </field>
        
    <field name="no_co" type="Boolean" width="80" allowSorting="true" allowFilter="true">
      <header v="Nợ/Có" e="Debit/Credit"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tk_lkvv"/>
      <field name="ten_tk%l"/>
      <field name="no_co"/>
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
