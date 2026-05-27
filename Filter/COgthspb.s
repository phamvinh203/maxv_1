<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vxcthspbx" code="nam, ky, ma_yt, ma_sp, ma_bp, so_lsx" order="nam, ky, ma_yt, ma_sp, ma_bp, so_lsx" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc số liệu" e="Data Filter"></title>
  <fields>
    <field name="ky" isPrimaryKey="true" allowNulls="false" align="right" type="Decimal" dataFormatString="#0" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" isPrimaryKey="true" allowNulls="false" align="right" type="Decimal" dataFormatString="###0" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="copy" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true">
      <header v="Sao chép dữ liệu" e="Copy"></header>
      <footer v="1 - Lấy dữ liệu từ kỳ trước, 0 - Không" e="1 - Copy data from previous period, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11100: [copy].Label, [copy], [copy].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>d+NhytRN5QoENsC9Hz+oXTPkRb1qBuGyqpdNTLWBZfmOvu5Yw2vTGvoTQQI1k92PqSk+/Bq1k1s7Py4nFDMcajAKCmf1FGBpqN5jD4kGumjHsHw6T4MV+KT8NfM7XuSr/C7rxy4QdaMyUDtWiovfTYXXbOcfMA+J0XF419HtNiC/bnaESyqbJc85lljzGcUAmvku2c5gtZPOnuJ44InKLr12p66t7MdD88RfjkbcOKg=</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>O/qErHxosgDRl8mB9J7/7lwgNqtg548yLafxWePuBdF3fDShMje/Qmsyp/PMMkftWfPYIwWoKV36o8U7LdgnOZ1GxM/Vgj3mKeCcd9wmJ9iFtZLTLxxFIzX24ETT5ehdWLeo6n5AMRowtdPc6wgxsm6B+QgERagLHAHI8p0mgVZK5k2lTqf5xfBTRQE3GO4MIdSfCEuczOsBJwzQEkhPWafVUO55N4FNS8CGVxF/Od+P+2VGHFWd/eljutN5uxyhh7em9IseKjm4oANa/gaDdNHG1yb4LmNHn4bs9nEOjvLM5Eepcr4EuMMRGTGtXwgGCvHcMRIGKbTvHoUo3/b5jQoAqzCjEPjP1J2/uloSMlIuaN4WTWdrIn9LzXYEXktY9xZWilBHuFzyYt7KkjDWIHIE0znIRctzl7g5l8lW/LuIYVP4lbjT4LjG12LcPFPi4uXUKKAxebxXusX/Safo9bkhX1K//EsjBet00WaRcr6h1nuRswu+tiIZyzKUoOENPxp7WzxjeWawRMhAF+nREpRDl9Ds8LaTm4n+RCnE0sw=</encrypted>]]>
    </text>
  </script>
</dir>
