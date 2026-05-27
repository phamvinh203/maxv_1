<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
]>

<grid table="vdmdvcsks" code="ma_dvcs" filter="&FilterCheckAccessUnit;" order="ma_dvcs" xmlns="urn:schemas-maxv-com:data-grid">

  <title v="Khóa số liệu theo đơn vị" e="Unit Locking"></title>
  <subTitle v="Cập nhật khóa số liệu theo đơn vị (Thêm, sửa, xóa,...)" e="Unit Locking (Add, Edit, Delete, ...)"></subTitle>

  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã đơn vị" e="Unit Code"></header>
    </field>
    <field name="ten_dvcs%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đơn vị" e="Description"></header>
    </field>
    <field name="ngay_ks" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày khóa sổ" e="Locked Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ten_dvcs%l"/>
      <field name="ngay_ks"/>
    </view>
  </views>
</grid>
