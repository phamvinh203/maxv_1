<?xml version="1.0" encoding="utf-8"?>

<grid table="v20covvct1" code="form, stt, ma_so" order="form, stt, ma_so" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Khai báo mẫu KQ SXKD dự án, công trình" e="Income Statement by Job Declaration"></title>
  <subTitle v="Cập nhật chỉ tiêu (Thêm, sửa, xóa, ...)" e=" Income Statement by Job Declaration (Add, Edit, Delete, ...)"></subTitle>

  <fields>
    <field name="form" isPrimaryKey="true" width="" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" isPrimaryKey="true" width="60" align="right">
      <header v="Stt" e="Number"></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" width="100">
      <header v="Mã số" e="Code"></header>
    </field>
    <field name="ten%l" width="300">
      <header v="Tên" e="Name"></header>
    </field>
    <field name="ma_vvct" width="100">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="cach_tinh" width="300">
      <header v="Công thức" e="Formula"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="form"/>
      <field name="stt"/>
      <field name="ma_so"/>

      <field name="ten%l"/>
      <field name="ma_vvct"/>
      <field name="cach_tinh"/>
    </view>
  </views>
</grid>
