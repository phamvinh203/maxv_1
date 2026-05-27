<?xml version="1.0" encoding="utf-8"?>

<grid table="vv20dmctnk" code="ma_ct, ma_nk" order="ma_ct, ma_nk" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Phân quyền NSD quyển chứng từ" e="Voucher Book Using Definition"></title>
  <subTitle v="Phân quyền NSD quyển chứng từ" e="Voucher Book Using Definition"></subTitle>
 
  <fields>
    <field name="ma_ct" isPrimaryKey="true" width="100" allowNulls="false" allowSorting="true" allowFilter="true">
      <header v="Mã chứng từ" e="Voucher Code"></header>
    </field>
    <field name="ten_ct%l" width="350" allowSorting="true" allowFilter="true">
      <header v="Tên chứng từ" e="Description"></header>
    </field>
    <field name="ma_nk" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã quyển" e="Book Code"></header>
    </field>
	<field name="ten_nk" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên quyển" e="Book Description"></header>
    </field>
	<field name="lstuser" width="300" allowSorting="true" allowFilter="true">
      <header v="Ds User" e="User List"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
      <field name="ma_nk"/>
	  <field name="ten_nk"/>
	  <field name="lstuser"/>
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

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
