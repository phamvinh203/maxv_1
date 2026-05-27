<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmthue" code="ma_thue" order="ma_thue" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="thuế suất thuế GTGT" e="Value Added Tax"></title>
  <fields>
    <field name="ma_thue" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã thuế" e="Code"></header>
      <footer v="Tài khoản thuế GTGT:" e="VAT Account:"/>
      <items style="Mask"></items>
    </field>
    <field  name="ten_thue" allowNulls="false">
      <header v="Tên thuế" e="Description"></header>
    </field>
    <field name="ten_thue2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="nhom_thue">
      <header v="Nhóm thuế" e="Tax Group"/>
      <items style="AutoComplete" controller="TaxGroup" reference="ten_nh%l" key="status = '1'" check="1 = 1" information="ma_nh$dmnhthue.ten_nh%l"/>
    </field>
    <field name="ten_nh%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="thue_suat" type="Decimal" dataFormatString="##0.00" clientDefault="0">
      <header v="Thuế suất (%)" e="Tax Rate (%)"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="tk_thue_co">
      <header v="Tài khoản thuế đầu ra" e="Output VAT Account"></header>
      <footer v="&lt;span class=&quot;DoubleTab&quot;&gt;Đầu ra&lt;/span&gt;" e="&lt;span class=&quot;DoubleTab&quot;&gt;Output&lt;/span&gt;"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk_co%l" key="loai_tk =1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_co%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="tk_thue_no">
      <header v="Tài khoản thuế đầu ra được giảm" e="Output VAT Deduction Account"/>
      <footer v="&lt;span class=&quot;DoubleTab&quot;&gt;Đầu ra được giảm&lt;/span&gt;" e="&lt;span class=&quot;DoubleTab&quot;&gt;Output Deduction&lt;/span&gt;"></footer>
      <items style="AutoComplete" controller="Account" reference="ten_tk_no%l" key="loai_tk =1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_no%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="tk_thue_no3">
      <header v="Tài khoản thuế đầu vào" e="Input VAT Account"/>
      <footer v="&lt;span class=&quot;DoubleTab&quot;&gt;Đầu vào&lt;/span&gt;" e="&lt;span class=&quot;DoubleTab&quot;&gt;Input&lt;/span&gt;"></footer>
      <items style="AutoComplete" controller="Account" reference="ten_tk_no3%l" key="loai_tk =1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_no3%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="tk_thue_co3">
      <header v="Tài khoản thuế đầu vào được giảm" e="Input VAT Deduction Account"/>
      <footer v="&lt;span class=&quot;DoubleTab&quot;&gt;Đầu vào được giảm&lt;/span&gt;" e="&lt;span class=&quot;DoubleTab&quot;&gt;Input Deduction&lt;/span&gt;"></footer>
      <items style="AutoComplete" controller="Account" reference="ten_tk_co3%l" key="loai_tk =1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_co3%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="stt" type="Decimal" dataFormatString="## ##0" clientDefault="0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110-: [ma_thue].Label, [ma_thue]"/>
      <item value="1100: [ten_thue].Label, [ten_thue]"/>
      <item value="1100: [ten_thue2].Label, [ten_thue2]"/>
      <item value="1101: [nhom_thue].Label, [nhom_thue],  [ten_nh%l]"/>
      <item value="110-: [thue_suat].Label, [thue_suat]"/>
      <item value="1000: [thue_suat].Description"/>
      <item value="1---: [ma_thue].Description"/>
      <item value="1101: [tk_thue_co].Description, [tk_thue_co], [ten_tk_co%l]"/>
      <item value="1101: [tk_thue_no].Description, [tk_thue_no], [ten_tk_no%l]"/>
      <item value="1101: [tk_thue_no3].Description, [tk_thue_no3], [ten_tk_no3%l]"/>
      <item value="1101: [tk_thue_co3].Description, [tk_thue_co3], [ten_tk_co3%l]"/>
      <item value="1000: [stt].Description"/>
      <item value="110-: [stt].Label, [stt]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7aVI1g9c4zb2QFazq/HMUVGQ6f2TrGrU4DAgoUBn+q7+daAQdCs53XzYzZvUU2bgbqOyzmVMgjYH6QK0rFFuexP88w0Aud76lXgdAEjuPjt5</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kkQlgqbdhpSlJHhdagHeZIFgSI/KU6Aex1spnVWOIGWLKg/BJfgPTAlih5fiFxVCZ20EuMcKeNlA4eX2iG31ED2DhjUvgGN0xXgtvPgSsJwc</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>5F4FmYRebB5jyxsOgkNNH6L5QlwUkuo8W/jE8bo9IzFxP3Ii/m1fM9LO9wBw+t4Le0vBfMcjlnDlSxitoV55nvXN83N4RUZIE4kiTlD8la8zwo5qOwZiQxFZY4lTZQg6bFyVka1VsCW+fbnrxNWmUwoxMkt/WC65DQ7QnlR3dY4qymRAxswf8OXwTP0vGA3HQUyEyinP/gEzg9IxSFFTRpgNsS2OQCcXm70f1jmNJ42h5qPY/3ggJNEdkLKUPwXK8T0MDMSJDvpnTKnsc9n+v0dcZSF61atKDkciOpMrQvIBMyhmDrRvNyU18xqixXp0pQ3dsyWhGAOGxsXoLOELETxrw1d/iRjzpkvLggc5eXG01bB0CsH+eTB/btmFI7eoZy9awYsgdEHk9e7v5e7+I40jS+lY0Va20P3gcxH7FMZGLIgxatmVWSq5BiG+ZTGELI0hTtjGv1CTkrILvkaX/Q==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>DZG7GEI227+BhsXCUCQqwcAaihgyGJV4OYSwEZR2Z8PSy1xwcV8u5q50T0pxkLWnL9PoF88jPJ6Un9x1YxB7UPkGJtKTSWiW3k8KlMLwuc1RVlj0aXqrCW6y8GZbcsTuIht1Zk9zlWmDl1dVyZo/hCPPyfAQVyfm/EC5gI8+IoY8+4HMMDmWQ5uY1YjmAnZGooluQtTYkq/IqAu5zzhSqPYRYOLeeTkJUOjobCCHy7gn7yse0Srxcc1d5cRRr2yEWkKDigie8BGtojRUkEVB1w==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>o10om3HJXOBMexYx7EkeDf3WIIT0TsCbjWe7/KTiWOeTDUIBxevHVydRvGrIMm02rhFhCb3UxzwtILGgE4l6N1lefa1uk5oVt5y6342izybWGOkSd8FyEgAxdXD0ezFmhwKM3gp5Ebkz7ey7xnT2mcMMNWKCu2TM/4uVh8tFaibyRMYwjaUNgcNgYogIJZ3s7kCA53AtfPCOMA75dNIxeIkgAwKCUradbGVRnS07NrewM/UwRSvT79CckWESsU40zhVlXTLZtPF1p4SMqvUNi5kjLmoYL3zXTYPWU0bVttU=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>SN657fUuqjPx55NaZl33PepH770nFQvNyabsioLOO1ByQbKtjtLWY537H9O5p/Ps4j/U8uXbkkYqSokiut7yxzEAL8GBE2RWuLkRhWSvViK5DcpbnRzrTFlTQjJo67sK</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>BRB8bxpT+2S3b+MC1U4Q7SO5+HcoxCBdrTeJMkgbVcF1cVl+8l4YJeecjPLxNAegu00pV2h8NQA/v/7HLVao7WBOMF1YKL2IkoxNMEn8GCa4YNXMkcUM50sw0KQGd/+5U4Aw1IpJSGqF007Lj1TWSk4+kBuu9p8YLwTYFopJtWsYIMmYri2TDTtjr0rfZuFSyOGDlmH7Qzk206zQVnWbjo4BgzOh5dz+r0c7LCxhOIHofQINgUlFMHa7fUMf9tmAkBb6vAJZguAA8MWrqzEtltnu5ukDUS9/jrx+M8bWCWP0mwMR9wh16QHsaj13WyzYtqAUMrMbrXzUKPJo2+Fahz+fb/W+jeNnMtijLidadUE=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>vebLVR/VgObp9AtagRihOv5ETqEtjb7nkQZjfU/5IGHr8ULAge4GpXO41cBnaYTZf3XYE+QhNvBaYLQz3qWXEzEuz3CRyRyUBeqN212K/zz9c9gJgAV0Hr30VmSjJUH2+7YsoM73zHioAfRpZ2XsKhjAbDNOUBrFJsG9DdmRsjzjLQ04z3uMXR+RQua8sIggatYcE5vha/rvB6HgwNPqjLovSMjmJOAw2LnN2S5/vrY=</encrypted>]]>
    </text>
  </css>
</dir>
