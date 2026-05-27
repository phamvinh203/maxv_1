<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="ctctcc" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="CC1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="ctctcc" prime="ctctcc" inquiry="icc" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="ten_ptkt" width="300" allowNulls="false">
      <header v="Tên phụ tùng kèm theo" e="Spare Parts"></header>
    </field>
    <field name="dvt" width="50" allowNulls="false">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="100">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_tri_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Giá trị nt" e="FC Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_tri" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Giá trị" e="Value"></header>
      <items style="Numeric"/>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ten_ptkt"/>
      <field name="dvt"/>
      <field name="so_luong"/>
      <field name="gia_tri_nt"/>
      <field name="gia_tri"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kgjjGPc3YEB51We2f928z6gFfS8a4sEg/4zLCYhw69vXiLj61eToyDAO03VYbuLG20mngRpDExn+nqjJRQVAd0sGqdTWSP1g8on2TrEtjvtQg0dsH3Qzv6uYi+rf9RaqYw==</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3khX63lKwmzHzjwARyexDzCorVHfmE8qReTfVMF9VVLxu9aLeXbyjhv3z3RGadw9dU+2obabtzwfVqQJIpxouwPpBmkDXyD9sNzsfdqC2HtDz</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>ACQC/Gl7mfXvC6tjw5TMe8e9KLQ16MU6KYub3UKeSZkRifwsaXLGWv0eoCIqj+x+DVJaEpZZ2c2e0+v11KJbnOKQa5l0/WyKeGLrYM2gf85OliCRCKQcZtfGczvdT28FKw9MqOfW+P1A88+7S+QU+RP9crxfwGGonSpUujjDGUnKPBPUHw1nA19qqOiJGJIcfjS4to3ZICvdMtzRjMuxgBncHM7KWuAq3ZvsIjPdc2Ctygj0kiUYqT4SFpoJkEeT0ZISSXYeVS892A7m5TAObEBxlAQ/dCY5gq1yuY1nYbKfULhnyhGi/9YwfK8b5ghjh0SPQYzxTcJIPCNP8KBx4bQE3TzPUeyrnrFBVzj6AYJroKCpxe3G1i1qZJgPXn9WHOmrWIX8km82GYtJ47OoGli+cNnxSAed4/EZkAkx/qWAJSqX1GbJgPu3dIp6dCEl1iy+S/dv4GcnJPzmmUo/u9QYm3f0p6Tw1MCpsiwwNgoK8zzqryBUhkb5iVPlYKHBrBAy19lH4tTanmVvcscg12nZh5ETOcOxZheV+A1nZ/PCglM8NkPyItc1f92BacSaNQ5R7u0+dGre32JgDnunmg==</encrypted>]]>
    </text>
  </script>

  &XMLStandardDetailToolbar;
</grid>
