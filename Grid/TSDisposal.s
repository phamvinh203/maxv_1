<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
]>

<grid table="dmcc" code="so_the_ts" filter="&FilterCheckAccessUnit;" order="so_the_ts" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Khai báo giảm CCDC" e="Tool &#38; Supply Disposal"></title>
  <subTitle v="Cập nhật khai báo giảm CCDC..." e=" Edit Tool &#38; Supply Disposal..."></subTitle>

  <fields>
    <field name="so_the_ts" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" align="left">
      <header v="Mã công cụ" e="Tool &#38; Supply"></header>
    </field>
    <field name="ma_giam_ts" width="100" allowSorting="true" allowFilter="true" align="left">
      <header v="Mã giảm" e="Disposal Reason"></header>
    </field>
    <field name="ten_ts%l" width="300">
      <header v="Tên công cụ" e="Description"></header>
    </field>
    <field name="ngay_giam" width="100" type="DateTime" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày giảm" e="Disposal Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="so_the_ts"/>
      <field name="ten_ts%l"/>
      <field name="ngay_giam"/>
      <field name="ma_giam_ts"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
