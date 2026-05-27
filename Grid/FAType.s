<?xml version="1.0" encoding="utf-8"?>

<grid table="dmplts" code="ma_loai" order="ma_loai" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục loại TSCĐ" e="Fixed Asset Type List"></title>
  <subTitle v="Cập nhật loại TSCĐ (Thêm, sửa, xóa, ...)" e="Fixed Asset Type (Add, Edit, Delete, ...)"></subTitle>
 
  <fields>
    <field name="ma_loai" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã loại" e="Code"></header>
    </field>
    <field name="ten_loai%l" width="300" allowSorting="true" allowFilter="true">
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
