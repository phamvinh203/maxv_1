<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\PeriodLockedDate.txt">
  <!ENTITY XMLCheckProcess SYSTEM "..\Include\XML\CheckProcess.xml">
]>

<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Bút toán phân bổ khấu hao TSCĐ" e="Fixed Asset Depreciation Allocation Entry"></title>
  <fields>
    <field name="ky1" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Từ kỳ" e="From Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky2" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Đến kỳ" e="To Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="type" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Tạo phân bổ, 0 - Xóa phân bổ" e="1 - Allocate, 0 - Delete Allocation"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit(s)"></header>
      <items style="Lookup" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from dbo.sysunitrights where user_id = @@userID and r_access = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from dbo.sysunitrights where user_id = @@userID and r_access = 1)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky1].Label, [ky1]"/>
      <item value="11: [ky2].Label, [ky2]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="111000: [type].Label, [type], [type].Description"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLCheckProcess;
    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN3O/i40v0FNoEaxNYHWtlkgTmkKu1d0z8sVGHSmMd6Rz9Y65ZLabD6+FXjh6UlW1vwpuGW5yjYw5/Z0hlD1s0bATJIDYCQJLYUhDGNoXuXhSlCjK2jp9XMh8/Gc1h/Tv5g1BcWUueqwnSyMXDHmLpVc=</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>
