<?xml version="1.0" encoding="utf-8"?>

<grid table="v20covvth3" code="stt, ma_so" order="stt, ma_so" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Khai báo mẫu báo cáo tổng hợp chi phí sản xuất theo dự án" e="Costing Summary By Job Declaration"></title>
  <subTitle v="Cập nhật chỉ tiêu (Thêm, sửa, xóa, ...)" e="Costing Summary By Job Declaration (Thêm, sửa, xóa, ...)"></subTitle>
  <fields>
    <field name="stt" isPrimaryKey="true" width="60" align="right">
      <header v="Stt" e=" Number"></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" width="100" hidden="true" readOnly="true">
      <header v="Mã số" e="Code"></header>
    </field>
    <field name="chi_tieu%l" width="300" dataFormatString="X">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="tang_giam" width="120">
      <header v="Tăng/Giảm" e="Increase/Decrease"></header>
    </field>
    <field name="no_co" width="120" dataFormatString="X">
      <header v="Ps nợ/có" e="Debit/Credit"></header>
    </field>
    
    <field name="tk" width="150" dataFormatString="X">
      <header v="Tài khoản" e="Account "></header>
    </field>
    <field name="tk_du" width="150" dataFormatString="X">
      <header v="Tài khoản đối ứng" e="Ref. Account"></header>
    </field>
    <field name="tk_gt" width="150" dataFormatString="X">
      <header v="Tài khoản giảm trừ" e="Deduct Account"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_so"/>
      <field name="chi_tieu%l"/>
      <field name="tang_giam"/>
      <field name="no_co"/>
      
      <field name="tk"/>
      <field name="tk_du"/>
      <field name="tk_gt"/>
    </view>
  </views>
</grid>
