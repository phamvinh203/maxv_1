<?xml version="1.0" encoding="utf-8"?>

<grid table="v20dmtcthue" code="ma_tc" order="ma_tc" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục tính chất thuế" e="Tax Type List"></title>
  <subTitle v="Cập nhật danh mục tính chất thuế (sửa)" e="Edit Description"></subTitle>
 
  <fields>
    <field name="ma_tc" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã tính chất" e="Code"></header>
    </field>
    <field name="ten_tc%l" width="500" allowSorting="true" allowFilter="true">
      <header v="Tên tính chất" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tc"/>
      <field name="ten_tc%l"/>
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
