<?xml version="1.0" encoding="utf-8"?>

<grid table="dmloaivt" code="ma_loai_vt" order="ma_loai_vt" xmlns="urn:schemas-maxv-com:data-grid">

  <title v="Danh mục loại vật tư" e="Item Type List"></title>
  <subTitle v="Sửa tên loại vật tư" e="Edit Description"></subTitle>

  <fields>
    <field name="ma_loai_vt" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true" align="right">
      <header v="Mã loại" e="Type Code"></header>
    </field>
    <field name="ten_loai_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên loại" e="Description"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ma_loai_vt"/>
      <field name="ten_loai_vt%l"/>
    </view>
  </views>
  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
