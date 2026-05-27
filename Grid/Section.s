<?xml version="1.0" encoding="utf-8"?>

<grid table="vxdmbp" code="ma_bp" order="ma_bp" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục công đoạn" e="Section List"></title>
  <subTitle v="Cập nhật công đoạn (Thêm, sửa, xóa, ...)" e="Section (Add, Edit, Delete, ...)"></subTitle>
 
  <fields>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã công đoạn" e="Section"></header>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên công đoạn" e="Description"></header>
    </field>
    <field name="truc_tiep" width="80" type="Boolean" clientDefault="true" defaultValue="true">
      <header v="Trực tiếp" e="Direct"></header>
    </field>
    <field name="ma_bp0" width="100" allowSorting="true" allowFilter="true">
      <header v="Công đoạn trước" e="Prev. Section"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="truc_tiep"/>
      <field name="ma_bp0"/>
    </view>
  </views>
  </grid>
