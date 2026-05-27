<?xml version="1.0" encoding="utf-8"?>

<grid table="dmtknh" code="tk" order="tk" xmlns="urn:schemas-maxv-com:data-grid">

  <title v="Danh mục tài khoản ngân hàng" e="Bank Account List"></title>
  <subTitle v="Cập nhật danh mục tài khoản ngân hàng " e="Bank Account "></subTitle>

  <fields>
    <field name="tk" isPrimaryKey="true" width="120" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Tài khoản hạch toán" e="Account"></header>
    </field>
    <field name="tknh" width="150" allowSorting="true" allowFilter="true">
      <header v="Số tài khoản ngân hàng" e="Bank Account"></header>
    </field>
    <field name="ten_nh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên ngân hàng" e="Bank Name"></header>
    </field>
	<field name="tinh_thanh" width="150" allowSorting="true" allowFilter="true">
      <header v="Tỉnh/Thành phố" e="Province"></header>
    </field>
	<field name="Phone" width="150" allowSorting="true" allowFilter="true">
      <header v="Điện thoại" e="Telephone"></header>
    </field>
	<field name="ma_nh" width="110" allowSorting="true" allowFilter="true">
      <header v="Mẫu ủy nhiệm chi" e="Telephone"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
       <field name="tk"/>
      <field name="tknh"/>
	  <field name="ma_nh"/>
      <field name="ten_nh%l"/>
	  <field name="tinh_thanh"/>
	  <field name="Phone"/>
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

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
