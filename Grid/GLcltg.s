<?xml version="1.0" encoding="utf-8"?>

<grid table="dmcltg" code="stt" order="stt" xmlns="urn:schemas-maxv-com:data-grid">

  <title v="Khai báo bút toán chênh lệch tỷ giá" e="Exchange Rate Difference Entry Definition"></title>
  <subTitle v="Khai báo bút toán chênh lệch tỷ giá (Thêm, sửa, xóa, ...)" e="Exchange Rate Difference Entry Definition (Add, Edit, Delete, ...)"></subTitle>
  <fields>
    <field name="stt" isPrimaryKey="true" type="Decimal" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Stt" e="Ordinal Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ten_bt" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bút toán" e="Description"></header>
    </field>
    <field name="tk" width="120" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>

    <field name="tk_cltg" width="120" allowSorting="true" allowFilter="true">
      <header v="Tk chênh lệch" e="Difference Acct."></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ten_bt"/>
      <field name="tk"/>
      <field name="tk_cltg"/>
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
