<?xml version="1.0" encoding="utf-8"?>
<grid table="vdmdvcskb" code="ma_dvcs" order="ma_dvcs" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Thông tin Công ty" e="Company Information"></title>
  <subTitle v="Thông tin công ty (Thêm, sửa, xóa, ...) " e="Unit Information (Add, Edit, Delete, ...)"></subTitle>

  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã Công ty" e="Company Code"></header>
    </field>
    <field name="ten_dvcs%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên Công ty" e="Company Name"></header>
    </field>
    <field name="ma_so_thue" width="150" allowSorting="true" allowFilter="true">
      <header v="Mã số thuế" e="Tax Code"></header>
    </field>
    <field name="so_dt" width="150" allowSorting="true" allowFilter="true">
      <header v="Số điện thoại" e="Telephone"></header>
    </field>
    <field name="tk_nh" width="150" allowSorting="true" allowFilter="true">
      <header v="Tài khoản ngân hàng" e="Bank Account"></header>
    </field>
    <field name="ten_gd%l" width="150" allowSorting="true" allowFilter="true">
      <header v="Tên giám đốc" e="Director's Name"></header>
    </field>
    <field name="ten_ktt%l" width="150" allowSorting="true" allowFilter="true">
      <header v="Tên kế toán trưởng" e="Chief Accountant's Name"></header>
    </field>
	<field name="ten_thu_quy%l" width="150" allowSorting="true" allowFilter="true">
      <header v="Tên thủ quỹ" e="Cashier"></header>
    </field>
	<field name="ten_thu_kho%l" width="150" allowSorting="true" allowFilter="true">
      <header v="Tên thủ quỹ" e="Store Keeper"></header>
    </field>
	
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ten_dvcs%l"/>
      <field name="ma_so_thue"/>
      <field name="so_dt"/>
      <field name="tk_nh"/>
      <field name="ten_gd%l"/>
      <field name="ten_ktt%l"/>
	  <field name="ten_thu_quy%l"/>
	  <field name="ten_thu_kho%l"/>
    </view>
  </views>
</grid>
