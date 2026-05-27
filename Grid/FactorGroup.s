<?xml version="1.0" encoding="utf-8"?>

<grid table="xdmnhyt" code="ma_nh" order="ma_nh" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Danh mục nhóm yếu tố" e="Cost Factor Group List"></title>
  <subTitle v="Cập nhật nhóm yếu tố (Thêm, sửa, xóa, ...)" e="Cost Factor Group (Add, Edit, Delete, ...)"></subTitle>
  <fields>
    <field name="ma_nh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhóm" e="Code"></header>
    </field>
    <field name="ten_nh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm" e="Description"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ma_nh"/>
      <field name="ten_nh%l"/>
    </view>
  </views>
</grid>
