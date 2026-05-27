<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
]>

<grid table="dmts" code="so_the_ts" filter="&FilterCheckAccessUnit;" order="so_the_ts" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Khai báo thôi khấu hao" e="Fixed Asset Abandonment"></title>
  <subTitle v="Cập nhật khai báo thôi khấu hao " e="Edit Fixed Asset Abandonment "></subTitle>

  <fields>
    <field name="so_the_ts" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" align="left">
      <header v="Thẻ tài sản" e="Fixed Asset"></header>
    </field>
    <field name="ten_ts%l"  width="300" allowSorting="true" allowFilter="true"  >
      <header v="Tên tài sản" e="Description"></header>
    </field>
    <field name="ngay_kh1" width="100" type="DateTime" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày thôi kh" e="Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="so_the_ts"/>
      <field name="ten_ts%l"/>
      <field name="ngay_kh1"/>
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
