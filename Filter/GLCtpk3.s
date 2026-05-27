<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\PeriodLockedDate.txt">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLCheckProcess SYSTEM "..\Include\XML\CheckProcess.xml">
]>

<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Bút toán kết chuyển tự động" e="Closing Transaction"></title>
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
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit(s)"></header>
      <items style="Lookup" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
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
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLCheckProcess;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;<![CDATA[<encrypted>sVV0XVRytihjEQAw92yQ4LT48nXon6Pj24SLM/D69tqtQVh+H85VWAo11W3VA+Ty</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>XI9a1yoWNbqlS0ZfUPu/85uI7Ot+RpvduhwVyG3Sjrj/7CdVOoJKTgHpX5hZpEWzqsyxUkA9X3xzQ+bjY39sbBcmpLlkK64tpHSV2c5KfmRoMDndUXoj8lKbfrX+4rPNlLgnxqgVhO/LKYfNEBsk0CXi1F9Kx9s+LNo8De3oPj0PWiWrKUBM6i2qc5gODz0Yh0Wv63OyN6ND8lGq1Qa3140bvekwlP7s0ay0l4yCv1+vBcYwjtQCXLcds/6SgpZVB/nza7cGosHLsBULA1MkSRlkCiFM8mYrAX5033GgAYZsIjm+3WVXCyjokDwh8aOi/6r/nq9trGlH4duZkyAl4bhtnKpj6hk+5a2ZUbk1n9ysNFUBwgdkmsSEn2b0wZXezFE4aYj+tVY2SGfJUJqdxJ3KCDsgKTaHyWLrLVYNcJvtWL/xAyXbyJl36rDZvF51cVuVW0XMFg6Dr/x8CLJ3Rg==</encrypted>]]>
    </text>
  </script>
</dir>
