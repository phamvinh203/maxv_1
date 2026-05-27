<?xml version="1.0" encoding="utf-8"?>
<grid table="vdmtkhddt" code="ma_tk" order="ma_tk" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Tài khoản HDDT" e="Electronic Invoice Account"></title>
  <subTitle v="Khai báo tài khoản HDDT (Thêm, sửa, xóa, ...) " e="Electronic Invoice Account (Add, Edit, Delete, ...)"></subTitle>

  <fields>
     <field name="ma_dvcs" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ten_dvcs%l" width="300" allowSorting="true" allowFilter="true" hidden="true">
      <header v="Tên đơn vị" e="Company Name"></header>
    </field>
    <field name="ma_tk" isPrimaryKey="true" width="150" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ten_tk" width="450" allowSorting="true" allowFilter="true">
      <header v="Tên tài khoản" e="Account Name"></header>
    </field>
    <field name="ma_ncc" isPrimaryKey="true" width="150" allowSorting="true" allowFilter="true">
      <header v="Nhà cung cấp HDĐT" e="Supplier"></header>
    </field>
    <field name="ten_ncc%l" width="200" allowSorting="true" allowFilter="true">
      <header v="Tên nhà cung cấp" e="Supplier Name"></header>
    </field>
	
    <field name="id_phathanh" width="150" allowSorting="true" allowFilter="true">
      <header v="Tk phát hành HDĐT" e="Account Einvoice"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
	  <field name="ma_dvcs"/>
	  <field name="ten_dvcs"/>
      <field name="ma_tk"/>
      <field name="ten_tk"/>
      <field name="ma_ncc"/>
      <field name="ten_ncc%l"/>
	  <field name="id_phathanh"/>
    </view>
  </views>
</grid>
