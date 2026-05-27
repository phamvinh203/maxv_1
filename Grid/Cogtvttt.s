<?xml version="1.0" encoding="utf-8"?>
<grid table="vxdmvt2x" code="ky, nam, ma_vt, ma_vt0" order="ky, nam, ma_vt, ma_vt0" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Khai báo vật tư thay thế" e="Material Replacement Declaration"></title>
  <subTitle v="Kỳ %s1, năm %s2" e="Period %s1, year %s2"></subTitle>

  <fields>
    <field name="nam" isPrimaryKey="true" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ky" isPrimaryKey="true" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" width="100">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="ma_vt0" isPrimaryKey="true" width="100">
      <header v="Nhóm thay thế" e="Group"></header>
    </field>
    <field name="ten_vt0%l" width="300">
      <header v="Tên nhóm vật tư thay thế" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ky"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="ma_vt0"/>
      <field name="ten_vt0%l"/>
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
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
