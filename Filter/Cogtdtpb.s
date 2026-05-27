<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vxdmcdspx" code="nam, ky, ma_yt, ma_bp0, ma_bp, so_lsx, ma_sp" order="nam, ky, ma_yt, ma_bp0, ma_bp, so_lsx, ma_sp" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc số liệu" e="Filter Data"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_yt" isPrimaryKey="true">
      <header v="Mã yếu tố" e="Factor Code"></header>
      <items style="AutoComplete" controller="Factor" reference="ten_yt%l" key="status = '1'" check="1 = 1" information="ma_yt$xdmyt.ten_yt%l" new="Default"/>
    </field>
    <field name="ten_yt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
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
      <item value="11---: [ky].Label, [ky]"/>
      <item value="11---: [nam].Label, [nam]"/>
      <item value="11010: [ma_yt].Label, [ma_yt], [ten_yt%l]"/>
      <item value="11100: [copy].Label, [copy], [copy].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>hZTItsXswaKESU9Q7vbG8+l/BOg437BpUShDBViHe3Si7aip2ihmIiMKBBzIDEkv849nNk/txxRfSzXi2DX7J9n1G1me6kAVoRwaU+Tjo1d5B8b8GNbfPh/CLm/nQLge85JgW4d7ac5ZRiw0I4OAQc/VhvZ3S9qah0qJ6b5O9vVmd6AWYMm9/JWd46+Z0Qt+KLrFyxG8Hc2WTSptZxH2eHAs9QpFkrjGIIWRX4rQsrQ=</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>7l8FROgSVnLs7g21/zFkNWmE0F9auLK/ydJ97XPJx6TA9sJ2ndLq9snLEd1hlCrD2RDzQvbaw+sNpwXqJqtGaYaYK3zNegt5oiRIDnYpcqO/g9fLMNpcdpXU1jYTOUO2ZUxyfbqrYOfjmaMtbVSJuncTBOFnSkRpJPUg0Miq11+kLGsKAFp6ICeSn95fnctDoj4oexH7ISWI4ISaGAqdVG0kGzLZdrV0lZYCMkeqNbMDbzUHQESpXxSXogFZh0m//U4b8S5kwzAiGRGSpUUwbM0OzjRoQRN1gfhvKAXYztl6RuoBKt66gmYxOc53+mbsHbc22Ey1NUvj03pv+9CwdJhycIaZIqE+KVy3oPK1ZlwuWFgV3s+B3A+0RKnrnv4OnNEyAkvJqhCTIK4mM2vR02NWtGr6WLFWhmjQ9BqMTfwUmhUcXpbVn0rV4yv/Wbfm5DZSKrJ1KdE9DdK3dS/Hwv///fowtnBOrJNwffCmunD4bAZwx79JCDygiHC2OCG2iKmxe9lqsCVE81XkDYD+/9CYxv5Aok9/nfUa1ywmHrZuxPsiWMuaB5i0PBMGAPnAWJHcsB3jr87pd8mG8l0B65h4yPrZmLLgroaoPuB5roRZT+ZLHsFKawakDo3GfFw2</encrypted>]]>
    </text>
  </script>

</dir>
