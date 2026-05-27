<?xml version="1.0" encoding="utf-8"?>

<grid table="dmmagd" code="ma_ct, loai_ct, ma_gd" order="ma_ct, loai_ct, ma_gd" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục mã giao dịch" e="Transaction Code List"></title>
  <subTitle v="Cập nhật mã giao dịch (Thêm, sửa, xóa, ...)" e="Transaction Code (Add, Edit, Delete, ...)"></subTitle>
 
  <fields>
    <field name="ma_ct" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã chứng từ" e="Voucher Code"></header>
    </field>
    <field name="loai_ct" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại chứng từ" e="Voucher Type"></header>
    </field>
    <field name="ma_gd" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã giao dịch" e="Transaction Code"></header>
    </field>
    <field name="ten_gd%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên giao dịch" e="Description"></header>
    </field>
  </fields>
  <views>
    
    <view id="Grid">
      <field name="ma_ct"/>
      <field name="loai_ct"/>
      <field name="ma_gd"/>
      <field name="ten_gd%l"/>
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
