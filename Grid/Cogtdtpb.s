<?xml version="1.0" encoding="utf-8"?>
<grid table="vxdmcdspx" code="nam, ky, ma_yt, ma_bp0, ma_bp, so_lsx, ma_sp" order="nam, ky, ma_yt, ma_bp0, ma_bp, so_lsx, ma_sp" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Khai báo đối tượng nhận phân bổ chi phí" e="Setup Rule of Coefficient"></title>
  <subTitle v="Kỳ %s1, năm %s2, mã yếu tố %s3" e="Period %s1, year %s2, factor %s3"></subTitle>

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
      <header v="Mã yếu tố" e="Factor Code"></header>
    </field>
    <field name="ma_bp0" isPrimaryKey="true" width="100">
      <header v="Bp gián tiếp" e="Indirect Dept."></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" width="100" align="right">
      <header v=" Số lsx" e="MO Number"></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true" width="100">
      <header v="Mã sản phẩm" e="Product"></header>
    </field>
    <field name="ten_vt%l" width="300">
      <header v="Tên sản phẩm" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ky"/>
      <field name="ma_yt"/>
      <field name="ma_bp0"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>
      <field name="ma_sp"/>
      <field name="ten_vt%l"/>
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
