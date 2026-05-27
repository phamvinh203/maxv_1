<?xml version="1.0" encoding="utf-8"?>

<grid table="dmcp" code="ma_loai" order="ma_loai" xmlns="urn:schemas-maxv-com:data-grid">

  <title v="Danh mục chi phí" e="Charge List"></title>
  <subTitle v="Cập nhật chi phí (Thêm, sửa, xóa, ...)" e="Charge (Thêm, sửa, xóa, ...)"></subTitle>

  <fields>
    <field name="ma_loai" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã chi phí" e="Charge Code"></header>
    </field>
    <field name="ten_cp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chi phí" e="Description"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ma_loai"/>
      <field name="ten_cp%l"/>
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
