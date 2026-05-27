<?xml version="1.0" encoding="utf-8"?>

<grid table="v30dmsnk15" code="ma_snk" order="ma_snk" filter="xtype = '1'" xmlns="urn:schemas-maxv-com:data-grid">

  <title v="Khai báo tham số báo cáo nhật ký" e="Report Form Parameter Declaration"></title>
  <subTitle v="Sửa tiêu đề cột, danh sách các tài khoản..." e="Edit Column Header and Parameters..."></subTitle>

  <fields>
    <field name="ma_snk" isPrimaryKey="true" width="100" dataFormatString="X" hidden="true" readOnly="true">
      <header v="Mã sổ" e="Book"></header>
    </field>
    <field name="ten_snk%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên sổ nhật ký" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_snk"/>
      <field name="ten_snk%l"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
  </toolbar>
</grid>
