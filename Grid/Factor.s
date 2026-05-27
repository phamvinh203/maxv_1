<?xml version="1.0" encoding="utf-8"?>

<grid table="xdmyt" code="ma_yt" order="ma_yt" xmlns="urn:schemas-maxv-com:data-grid">

  <title v="Danh mục yếu tố" e="Cost Factor List"></title>
  <subTitle v="Cập nhật danh mục yếu tố (Thêm, sửa, xóa, ...)" e="Cost Factor List (Add, Edit, Delete, ..)"></subTitle>

  <fields>
    <field name="ma_yt" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã yếu tố" e="Factor"></header>
    </field>
    <field name="ten_yt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên yếu tố" e="Description"></header>
    </field>
	<field name="loai_yt" width="70" allowSorting="true" allowFilter="true">
      <header v="Loại YT" e="Description"></header>
    </field>
	<field name="nh_yt" width="70" allowSorting="true" allowFilter="true">
      <header v="Nhóm YT" e="Description"></header>
    </field>
	<field name="tk_no" width="150" allowSorting="true" allowFilter="true">
      <header v="Tk Nợ" e="Description"></header>
    </field>
	<field name="tk_co" width="150" allowSorting="true" allowFilter="true">
      <header v="Tk Có" e="Description"></header>
    </field>
	<field name="tk_dd" width="70" allowSorting="true" allowFilter="true">
      <header v="Tk dở dang" e="Description"></header>
    </field>
	<field name="dd_ck" width="70" type="Boolean" allowSorting="true" allowFilter="true">
      <header v="Tính DDCK" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_yt"/>
      <field name="ten_yt%l"/>
	  <field name="loai_yt"/>
	  <field name="nh_yt"/>
	  <field name="tk_no"/>
	  <field name="tk_co"/>
	  <field name="tk_dd"/>
	  <field name="dd_ck"/>
    </view>
  </views>

</grid>
