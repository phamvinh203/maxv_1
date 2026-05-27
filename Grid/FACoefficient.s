<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandCheckUnitRightBeforeInit SYSTEM "..\Include\Command\CheckUnitRightBeforeInit.txt">
]>

<grid table="vwthhspbts" code="nam, ky, so_the_ts, tk_kh, tk_cp, ma_bp_ts, ma_vv, ma_bp, ma_hd, so_lsx, ma_phi" filter="&FilterCheckAccessUnit;" order="nam, ky, so_the_ts, tk_kh, tk_cp, ma_bp_ts, ma_vv, ma_bp, ma_hd, so_lsx, ma_phi" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Khai báo hệ số phân bổ khấu hao TSCĐ" e="Fixed Asset Allocation Coefficient Definition"></title>
  <subTitle v="Kỳ %s1, năm %s2" e="Period %s1, year %s2"></subTitle>

  <fields>
    <field name="nam" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ky" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="so_the_ts" isPrimaryKey="true" width="100">
      <header v="Số thẻ tài sản " e="Fixed Asset"></header>
    </field>
    <field name="ten_ts%l" width="300">
      <header v="Tên tài sản" e="Description"></header>
    </field>
    <field name="he_so" width="100" dataFormatString="### ### ### ###.000" align ="right">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"></items>
    </field>

    <field name="tk_kh" isPrimaryKey="true" width="100">
      <header v="Tk khấu hao" e="Depreciation Acct."></header>
    </field>
    <field name="tk_cp" isPrimaryKey="true" width="100">
      <header v="Tk chi phí" e="Expense Acct."></header>
    </field>
    <field name="ma_bp_ts" isPrimaryKey="true" width="100">
      <header v="Bộ phận tài sản" e="Using Dept."></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" width="100">
      <header v="Dự án" e="Project"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100">
      <header v="Phòng ban" e="Department"></header>
    </field>
    <field name="ma_hd" isPrimaryKey="true" width="100">
      <header v="Hợp đồng" e="Contract"></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" width="100">
      <header v=" Số lsx" e="MO Number"></header>
    </field>
    <field name="ma_phi" isPrimaryKey="true" width="100">
      <header v="Mã phí" e="MO Number"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ky"/>

      <field name="so_the_ts"/>
      <field name="ten_ts%l"/>
      <field name="he_so"/>

      <field name="tk_kh"/>
      <field name="tk_cp"/>
      <field name="ma_bp_ts"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>
      <field name="ma_vv"/>
      <field name="ma_phi"/>
      <field name="ma_hd"/>
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
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
