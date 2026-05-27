<?xml version="1.0" encoding="utf-8"?>

<grid table="vdmkc" code="stt" order="stt" xmlns="urn:schemas-maxv-com:data-grid">

  <title v="Khai báo bút toán kết chuyển tự động" e="Closing Entry Definition"></title>
  <subTitle v="Khai báo bút toán kết chuyển " e="Closing Entry Definition "></subTitle>
  <fields>
    <field name="stt" isPrimaryKey="true" type="Decimal" width="100" allowSorting="true" allowFilter="true" allowNulls="true">
      <header v="Số thứ tự" e="Ordinal Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ten_bt" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bút toán" e="Description"></header>
    </field>
    <field name="loai_kc" type="Decimal" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại kc" e="Closing Type"></header>
    </field>
    <field name="tk_no" width="120" allowSorting="true" allowFilter="true">
      <header v="Tài khoản nợ" e="Debit Account"></header>
    </field>
    <field name="tk_co" width="120" allowSorting="true" allowFilter="true">
      <header v="Tài khoản có" e="Credit Account"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ten_bt"/>
      <field name="loai_kc"/>
      <field name="tk_no"/>
      <field name="tk_co"/>
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
