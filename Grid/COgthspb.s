<?xml version="1.0" encoding="utf-8"?>

<grid table="vxcthspbx" code="nam, ky, ma_yt, ma_sp, ma_bp, so_lsx" order="nam, ky, ma_yt, ma_sp, ma_bp, so_lsx" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Khai báo hệ số phân bổ" e="Setup Coefficient of Distribution"></title>
  <subTitle v="Kỳ %s1, năm %s2" e="Period %s1, year %s2"></subTitle>

  <fields>
    <field name="nam" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ky" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_yt" isPrimaryKey="true" width="100">
      <header v="Mã ytcp" e="Factor Code"></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true" width="100">
      <header v="Sản phẩm" e="Product"></header>
    </field>
    <field name="ten_sp%l" width="300">
      <header v="Tên sản phẩm" e="Product Name"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" width="100" align="right">
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="ma_bp0" isPrimaryKey="true" width="100">
      <header v="Bp gián tiếp" e="Indirect Dept."></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" width="100">
      <header v="Mã vật tư" e="Item"></header>
    </field>
    <field name="ten_vt%l" width="300">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="he_so"  width="100" type="Decimal" dataFormatString="### ### ### ### ###.0000">
      <header v="Hệ số" e="Coefficient"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ky"/>
      <field name="ma_yt"/>
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>
      <field name="ma_bp0"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
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
