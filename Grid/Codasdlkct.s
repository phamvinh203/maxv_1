<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">
  <!ENTITY XMLStandardBalanceToolbar SYSTEM "..\Include\XML\StandardBalanceToolbar.xml">
]>

<grid table="vv20vvlkct" code="nam, ma_dvcs, ma_so, ma_vv" filter="&FilterCheckAccessUnit;" order="nam, ma_dvcs, ma_so, ma_vv" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Vào lũy kế chỉ tiêu dự án, công trình" e="Input Project Accumulation by Job Norm"></title>
  <subTitle v="Cập nhật lũy kế chỉ tiêu dự án, công trình (Thêm, sửa, xóa, ...)" e="Input Project Accumulation by Job Norm (Add, Edit, Delete, ...)"></subTitle>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" hidden ="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="80" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="@upperCaseFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Article"></header>
    </field>
    <field name="chi_tieu%l" width="300" allowSorting="true" allowFilter="true" hidden ="true" >
      <header v="Tên chỉ tiêu" e="Article Name"></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Dự án" e="Project"></header>
    </field>
    <field name="ten_vv%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên dự án" e="Project Name"></header>
    </field>
    <field name="lk_no" width="120" allowSorting="true" type ="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Lũy kế nợ" e="Dr. Amount"></header>
    </field>
    <field name="lk_co" width="120" allowSorting="true" type ="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Lũy kế có" e="Cr. Amount"></header>
    </field>
    <field name="lk_no_nt" width="120" allowSorting="true" type ="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Lũy kế nợ nt" e="FC Dr. Amount"></header>
    </field>
    <field name="lk_co_nt" width="120" allowSorting="true" type ="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Lũy kế có nt" e="FC Cr. Amount"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="ma_vv"/>
      <field name="ten_vv%l"/>
      <field name="ma_so"/>
      <field name="chi_tieu%l"/>

      <field name="lk_no"/>
      <field name="lk_co"/>
      <field name="lk_no_nt"/>
      <field name="lk_co_nt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandWhenBalanceBeforeInit;
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
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar> 

</grid>
