<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>

    <field name="tk_vt" allowNulls="false" defaultValue="Default">
      <header v="Tài khoản vật tư" e="Item Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_tk_vt%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 5, 70, 100, 100, 130, 0"/>
      <item value="1100: [ngay1].Label, [ngay1]"/>
      <item value="1100: [ngay2].Label, [ngay2]"/>
      <item value="1100100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjEOp5F41TxMad1+M5E1U+/YFbrIVOp2v1IwkJeEmFAIM/RhgXuSJOammK8OBPk4TES776NdT08R2OTjW8h4uK3kqpeZPflG5X/vEs6keXF/N3gP5EShcW3JpAqv6kJIrVw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>LENHFFvSIFv7S//49CY+FzYb+batnirP/ETuxSH6bPSyZVCmesY0SDWI5XvE1/KcQ8Do1YxyEH9zVqkGdDzWxunHlfELuOTrhreUF29oeOfF7e+0f0y53UFXSORfjXezYW3Di/n/KHcqNawNbhiQ7Ps28vEAcuYHqt7gkWFzPgF9geFp6QmBzy20K1dJTxwdVtgb0p3byBtZAlm6prt4c91aY32cOqrwdVuh++B1OC2AbnYr6QZYZCsMr905O1Acku0DO43FWyrdOIHZ1JJ3ZO47I7mpdg0v0Gles1b0lnADlSW0Ot2wH0OyQt7Txbwdx6LFCknsk0xJIAitONQsUj6oqRDm1Ej4JdNCJepdiwFn2nQWrFEcDMyYRTDKpM/k0q15S0SeAqyGO80CUGR5oC/InqU7nBMxYvIOOwKyFv2tt9nEBvoMRJi9B3q4w2xLmU1Z0emFkykLuW3F3qhu2SIYDrjvTNjOeyRywMxigfEllWI8T5F5iyWxptbadIHkSH1OI5o1YOvCMyr8RdThjg==</encrypted>]]>
    </text>
  </script>
</dir>
