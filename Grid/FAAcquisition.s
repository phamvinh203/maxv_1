<?xml version="1.0" encoding="utf-8"?>

<grid table="dmtgts" code="ma_tg_ts" order="loai_tg_ts, ma_tg_ts" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục lý do tăng giảm" e="Fixed Asset Acquisition Reason List"></title>
  <subTitle v="Cập nhật lý do tăng giảm tài sản (Thêm, sửa, xóa, ...)" e="Fixed Asset Acquisition Reason (Add, Edit, Delete, ...)"></subTitle>
 
  <fields>
    <field name="loai_tg_ts" width="100" allowSorting="true" allowFilter="true" align="Right">
      <header v="Loại" e="Type"></header>
    </field>
    <field name="ma_tg_ts" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã tăng giảm" e="Code"></header>
    </field>
    <field name="ten_tg_ts%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tăng giảm" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai_tg_ts"/>
      <field name="ma_tg_ts"/>
      <field name="ten_tg_ts%l"/>
    </view>
  </views>
  
</grid>
