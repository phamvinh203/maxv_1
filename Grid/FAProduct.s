<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or so_the_ts in (select so_the_ts from dmts where exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = dmts.ma_dvcs and r.r_access=1)))">
  <!ENTITY CommandCheckUnitRightBeforeInit SYSTEM "..\Include\Command\CheckUnitRightBeforeInit.txt">
]>

<grid table="v20vctslts" code="so_the_ts, ky, nam" filter="&FilterCheckAccessUnit;" order="so_the_ts, ky, nam" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Cập nhật sản lượng thực hiện của TSCĐ" e="Fixed Asset Production Input"></title>
  <subTitle v="Kỳ %s1, năm %s2" e="Period %s1, Year %s2"></subTitle>

  <fields>
    <field name="so_the_ts" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Thẻ tài sản" e="Fixed Asset"></header>
    </field>
    <field name="ten_ts%l" width="300">
      <header v="Tên tài sản" e="Description"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="sl_kh" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true">
      <header v="Sản lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="ky" type="Decimal" isPrimaryKey="true" hidden="true" width="0">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal"  isPrimaryKey="true" hidden="true" width="0">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="so_the_ts"/>
      <field name="ten_ts%l"/>
      <field name="ngay_ct"/>
      <field name="sl_kh"/>
      <field name="ky"/>
      <field name="nam"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandCheckUnitRightBeforeInit;
      </text>
    </command>
  </commands>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
	<button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
	<button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
	
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>

</grid>
