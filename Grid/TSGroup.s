<?xml version="1.0" encoding="utf-8"?>

<grid table="dmnhcc" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục phân nhóm CCDC" e="Tool &#38; Supply Group List"></title>
  <subTitle v="Cập nhật phân nhóm CCDC (Thêm, sửa, xóa, ...)" e="Tool &#38; Supply Group (Add, Edit, Delete, ...)"></subTitle>
 
  <fields>
    <field name="loai_nh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" align="right">
      <header v="Loại nhóm" e="Group Type"></header>
    </field>
    <field name="ma_nh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhóm" e="Group Code"></header>
    </field>
    <field name="ten_nh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai_nh"/>
      <field name="ma_nh"/>
      <field name="ten_nh%l"/>
    </view>
  </views>
  
</grid>
