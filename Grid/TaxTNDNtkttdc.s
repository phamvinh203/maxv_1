<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or ma_dvcs in (select ma_dvcs from dmdvcs where exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = dmdvcs.ma_dvcs and r.r_access=1)))">
  <!ENTITY CommandCheckUnitRightBeforeInit SYSTEM "..\Include\Command\CheckUnitRightBeforeInit.txt">
]>

<grid table="tax0128_luu" code="ma_dvcs, ma_so, ky, nam" filter="&FilterCheckAccessUnit;" order="ma_dvcs, ma_so, ky, nam" xmlns="urn:schemas-moka-com:data-grid">
  <title v="Điều chỉnh số liệu tờ khai thuế thu nhập doanh nghiệp tạm tính" e="Provisional Corporation Tax Return Adjustment"></title>
  <subTitle v="Kỳ %s1, năm %s2" e="Period %s1, Year %s2"></subTitle>

  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" width="80" allowSorting="true" allowFilter="true">
      <header v="Mã số" e="Code"></header>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Số tiền" e="Amount"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Số tiền nt" e="FC Amount"></header>
    </field>

    <field name="ky" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ma_so"/>
      <field name="tien"/>
      <field name="tien_nt"/>

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
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>

</grid>
