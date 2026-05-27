<?xml version="1.0" encoding="utf-8"?>

<dir table="v20covvth3" code="stt, ma_so" order="stt, ma_so" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="chi phí sản xuất theo dự án" e="Costing By Project"></title>
  <fields>
    <field name="stt" isPrimaryKey="true" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Stt" e="Number"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa49qQr/9b2XAZAGV+SUIyH7h/+IIESMEYxJtds8gjiaC7</encrypted>]]></clientScript>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="X" allowNulls="false" clientDefault="Default" hidden="true" disabled="true">
      <header v="Mã số" e="Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="chi_tieu" allowNulls="false">
      <header v="Chỉ tiêu" e="Norm "></header>
    </field>
    <field name="chi_tieu2">
      <header v="Chỉ tiêu khác" e="Other Norm"></header>
    </field>
    <field name="tang_giam" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Tăng/giảm" e="Increase/Decrease"></header>
      <footer v="1 - Tăng, 2 - Giảm" e="1 - Increase, 2 - Decrease"></footer>
      <items style="Mask"/>
    </field>
    <field name="no_co" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Ps nợ/có" e="Debit/Credit"></header>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="tk_du">
      <header v="Tài khoản đối ứng" e="Ref. Account"></header>
    </field>
    <field name="tk_gt">
      <header v="Tài khoản giảm trừ" e="Deduct Account"></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="120, 40, 390, 0"/>
      <item value="11-1: [stt].Label, [stt], [ma_so]"/>
      <item value="1100: [chi_tieu].Label, [chi_tieu]"/>
      <item value="1100: [chi_tieu2].Label, [chi_tieu2]"/>

      <item value="1110: [tang_giam].Label, [tang_giam], [tang_giam].Description"/>
      <item value="1110: [no_co].Label, [no_co], [no_co].Description"/>

      <item value="1100: [tk].Label, [tk]"/>
      <item value="1100: [tk_du].Label, [tk_du]"/>
      <item value="1100: [tk_gt].Label, [tk_gt]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/67qREU7X8b3oKdQcWL58aKVSN5votxQbvEHnOexJEPwnTQQMwUBhsqOMhpt0DXW+vv9yn544eO7ffl0e1v08GMInWmX6waFjbnXUcCYoaybrp1V23BdnaopXlejwLLypGRtPsrL7PchZPSTexXgTLvlsKt3tLdmTcxzyPFs5LSYZaggwhMvvyvVMvUJGmX8D8Tmn2MEA27tqK47ZA4YSIz/z2HL+52FErrgNsEhwYr3eSPmFvN0zws4dGqMv5uM7LJ4x1guhZNPtF8Zdu+miD0BW2zM3rKvEP1B/sUM5wCqO</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>q3Yqw/J5wTUNfX7IMmJvHSbIxHSHZKo8T037OG1f6ZU4siuIBa1MkDVo91DsqAptjvgpj/G2ejFVO2IuKEjDVxlRxbR8A5DuXA4y+BVYtmwa5N013uU/ax/lZ3ezPqpjQNZwOvBfR2p0pw6dvyu7Zb5ZIZH7VscgXvgLX6N72hynPkRWjCO2fVdCCDNuScfR</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>4TNLpnHhiHIt4Cmf5OTr0MJUVzkTGDGJ0fuaM3J/nHHXdoRDHUrBhIlmDW74h0QtJbluZbIzcl3qAJFDKOiW7Qlfb9cz5BTXTZV5UvR6QQgrk+U3IdPie7YzpzEhd/xeEYCMDtW/zo+Ku4eYJ+pAaP+76rbQhR0wPm7ajWFplinyr3uBBJv+VYZCmEOU1+R6d9bQv9Y6b81w3lu8gGvGjzKcy2VPYYw7aQTkzPmxUiY=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>Kx1OzXBK2n+Rhyp+tA1LOyJldEIYxRcjI3wUUm/pj86s2T0R8YJfIFuSgBx7e+kqOk3vJh+ZHZ/pmKb1IINO8N+sDqT7RGZuYPktgNhd7nm6rHrLmofTsyIry3hS3UZEXiEwfKjwpg5hTKeZxvU0Xgh+Wd/23vFklJCN6vAAT6hUsvMXthwuSEZR3HkDrfRi</encrypted>]]>
    </text>
  </script>
</dir>
