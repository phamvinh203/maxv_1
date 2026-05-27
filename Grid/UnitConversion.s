<?xml version="1.0" encoding="utf-8"?>

<grid table="vdmqddvt" code="ma_vt, dvt" order="ma_vt, dvt" filter="xtype = 'U'" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Danh mục quy đổi đơn vị tính" e="Unit Conversion"></title>
  <subTitle v="Cập nhật quy đổi đơn vị tính (Thêm, sửa, xóa, ...)" e="Unit Conversion (Add, Edit, Delete, ...)"></subTitle>

  <fields>
    <field name="ma_vt" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="ItemUOMConversion" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$vdmvtdvt.ten_vt%l"/>
    </field>
    <field name="ten_vt%l" readOnly="true" width="300" external="true" defaultValue="''">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>
    <field name="dvt" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="he_so" type="Decimal" width="120" dataFormatString="### ### ##0.000" allowSorting="true" allowFilter="true" align="right">
      <header v="Hệ số" e="Coefficient"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="he_so"/>
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
