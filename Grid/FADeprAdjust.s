<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
]>

<grid table="vwctkhts2" code="so_the_ts, ma_nv, ky, nam, ma_bp" filter="&FilterCheckAccessUnit;" order="so_the_ts, ma_nv, ky, nam, ma_bp" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Điều chỉnh khấu hao tháng" e="Adjust Monthly Depreciation"></title>
  <subTitle v="Kỳ %s1, năm %s2" e="Period %s1, year %s2"></subTitle>
  <fields>
    <field name="so_the_ts" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Số thẻ tài sản " e="Fixed Asset"></header>
    </field>
    <field name="ten_ts%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên tài sản" e="Description"></header>
    </field>
    <field name="sua_kh" type="Decimal" width="60">
      <header v="Sửa" e="Edit"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_nv" isPrimaryKey="true" width="0" hidden="true">
      <header v="Nguồn vốn" e="Capital"></header>
    </field>
    <field name="ky" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="0" hidden="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="nguyen_gia" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_da_kh" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Gt đã khấu hao" e="Accumulation Depr."></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_cl" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Gt còn lại" e="Remaining Value"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_kh_ky" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Gt khấu hao kỳ" e="Monthly Depr."></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="so_the_ts"/>
      <field name="ten_ts%l"/>
      <field name="sua_kh"/>
      <field name="ky"/>
      <field name="nam"/>
      <field name="ma_nv"/>
      <field name="ma_bp"/>

      <field name="nguyen_gia"/>
      <field name="gt_da_kh"/>
      <field name="gt_cl"/>
      <field name="gt_kh_ky"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>

</grid>
