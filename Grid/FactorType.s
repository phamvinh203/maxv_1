<?xml version="1.0" encoding="utf-8"?>

<grid table="xdmloaiyt" code="ma_loai" order="ma_loai" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục loại yếu tố" e="Cost Factor Type List"></title>
  <subTitle v="Cập nhật loại yếu tố (Thêm, sửa, xóa, ...)" e="Cost Factor Type (Add, Edit, Delete, ..)"></subTitle>
 
  <fields>
    <field name="ma_loai" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã loại" e="Type Code"></header>
    </field>
    <field name="ten_loai%l" width="450" allowSorting="true" allowFilter="true">
      <header v="Tên loại" e="Description"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ma_loai"/>
      <field name="ten_loai%l"/>
    </view>
  </views>
  </grid>
