<?xml version="1.0" encoding="utf-8"?>

<grid table="dmnv" code="ma_nv" order="ma_nv" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục nguồn vốn" e="Capital List"></title>
  <subTitle v="Cập nhật nguồn vốn (Thêm, sửa, xóa, ...)" e="Capital (Add, Edit, Delete, ...)"></subTitle>
 
  <fields>
    <field name="ma_nv" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nguồn vốn" e="Capital Code"></header>
    </field>
    <field name="ten_nv%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nguồn vốn" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nv"/>
      <field name="ten_nv%l"/>
    </view>
  </views>
  
</grid>
