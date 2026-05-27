<?xml version="1.0" encoding="utf-8"?>

<grid table="dmthue" code="ma_thue" order="ma_thue" xmlns="urn:schemas-maxv-com:data-grid">

  <title v="Danh mục thuế suất thuế GTGT" e="Value Added Tax List"></title>
  <subTitle v="Cập nhật thuế suất thuế GTGT (Thêm, sửa, xóa, ...)" e="VAT List (Add, Edit, Delete, ...)"></subTitle>

  <fields>
    <field name="ma_thue" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã thuế" e="Code"></header>
    </field>
    <field name="ten_thue%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên thuế" e="Description"></header>
    </field>
    <field name="thue_suat" width="120" allowSorting="true" allowFilter="true" align="right">
      <header v="Thuế suất (%)" e="Tax Rate (%)"></header>
    </field>    
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_thue"/>
      <field name="ten_thue%l"/>
      <field name="thue_suat"/>
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
