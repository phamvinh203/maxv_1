<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate.txt">
]>

<dir xmlns="urn:schemas-moka-com:data-dir">
  <title v="Bút toán phân bổ chi phí sản xuất chung" e="Production Overhead Allocation Transaction"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Kỳ" e="Period"></header>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="111000: [type].Label, [type], [type].Description"/>
    </view>
  </views>

  <commands>
    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>ZwR/ME8PKcglbP6+Wq5jKRcA6q5x5Y30VHHDUpuDuJUt3Z/rN+kubO8Dwqz6j6KiCx52C3mKELkjkrcWrDXrVKdrupy9nvOCjiML+6Fpzv3fq4NYKvSG8ss8hxJB1nJs6Ju0REDIxZUzKrXlw4YhLCiuEruqUqdKU6hmAEfzYbA1j8vf/qMhm5L8eFgHS9BDc1ktfmz+qNNvsZbQDRddKkgpMNnczBrRBp/yskO3NYNz/OoG4VSAo+SwcgP5SmkbxTeSZY2A50kuvfr/zMi7W/eyQqBUlAkmYtygj6hvEjQWUIqAJUys2oa/AHM22rC6y9nWHjt3uFvzf6fAm+gdxysfRQr1ej7GXQUm5biVl5fkTxk+WAO0diT5A400AB2CGqkHtHpICfjiIsxr/ImsGQKz1A3CkLyW4G18HB+eZd/GjnQIAzgm9hSuFQBym+8zuNNuhLisIlOZvbAlVo7nYQ==</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>
