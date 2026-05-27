<?xml version="1.0" encoding="utf-8"?>

<grid table="dmmauct" code="ma_mau_ct" order="ma_mau_ct" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Khai báo ký hiệu mẫu số hóa đơn" e="Invoice Form List"></title>
  <subTitle v="Cập nhật ký hiệu mẫu số hóa đơn (Thêm, sửa, xóa, ...)" e="Template of Invoice Form (Add, Edit, Delete, ...)"></subTitle>
  <fields>
    <field name="ma_mau_ct" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Mã ký hiệu" e="Code"></header>
    </field>
    <field name="ten_mau_ct%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên ký hiệu" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_mau_ct"/>
      <field name="ten_mau_ct%l"/>
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
