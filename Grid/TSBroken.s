<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
]>

<grid table="dmcc" code="so_the_ts" filter="&FilterCheckAccessUnit;" order="so_the_ts" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Khai báo hỏng CCDC" e="Broken-down Tool &#38; Supply Declaration"></title>
  <subTitle v="Cập nhật khai báo hỏng (Sửa)" e=" Broken-down Tool &#38; Supply Declaration (Edit)"></subTitle>

  <fields>
    <field name="so_the_ts" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã công cụ" e="Tool &#38; Supply"></header>
    </field>
    <field name="ten_ts%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên công cụ" e="Description"></header>
    </field>
    <field name="ngay_hong" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày hỏng" e="Broken Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="so_the_ts"/>
      <field name="ten_ts%l"/>
      <field name="ngay_hong"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
