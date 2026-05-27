<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "SOBCHD2">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" allowNulls="false">
      <header v="Hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 80, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
  <command event="Showing">
			<text>
				<![CDATA[<encrypted>IAWxH/LFPkZLbC33jgWD5lnXOFMo+Bz3AHsei51KB0q2fRsxW9bRCMiVXuwszIprdEKUNd92g7x6mYxUghs1wMSuExb85pJ8WA0uZkekocmiA18ij0d88qNw0je4nBLFJWkOTcVLm4S5Gzikbq4GR1LagP71ls5avkMx+7Xlxkbxlu4xniNtjbmMLFdDLptn4Q5ZjgzdQuc44I9kJfcLUKLWtQ3zjVtBq4qcfaudXcRJf0Fvd/k99lsG4WQy5KFN</encrypted>]]>&Form;<![CDATA[<encrypted>5Dk18Vsx8RJ/AEkKNXj6inE9H+FbWdGTTq3PfO228aI/cEqVfb0FHxBb9DgKEDsEP++v9Bo+iJuNc4nmvcLZBSSVqocPleMIlUu2/+kZs+ybgkbFN/MVE356TnNoJNpZRXw5V6gp+W5DEffbfjLWdPCn/uTfo71KhvjmMS5IbVEPxaczXWtQ5ym+sSVjbvcnm6ijshw4R0a+ZHeZOIgo9LOLxnuwDShEPlvDCspBy0vkxy1xt8J3BEHiwOHFoZP4</encrypted>]]>
			</text>
		</command>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3km5hq0IoWfF4A+a26vUbqNIkNEpmcg5jY3i50X4aB4KQrrGwA6kspeHI+Of9r01XDMdbuy0q3PilvbewBWSAQPajv5VlAZG6S+leSRa3yhCj+nbsTnHcrMuTHtdGRZo86Q==</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>1S0P/TEgL5583owwEI76QJpvwJdP3aj2cAnnX889HtiPN0y6RgTwYBBypQxMwOszv2TMwnQKKY1lk488beQHGbtmzpHrS145bxn1nJVeE4V5cZx7iBCRJNwTsNw/+NGFT29rC0xfCyY7QwnjlONFmDxjeAD99XRo6dDpbxYSkvngvcF9cEnyovkj55gPp53/145dIojxOTbOIy74bzYgNgUVpxjW4MKQxrm403AbELkdwUDJDrF2NDTTEGYDQrePxynYvmmzC+Bwbw9fEbUuABlDSBnOvLa93khMOAutTjlCHbpVbFcoRxwk0pcuJDqA+66uQ7OKbQ2Hl3zgJNRFtw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>R08+cUaB60yhk1oB0q7YS9ibYr11zSA8zJqlsP3d806GFD8ymVUfROgJFhyKovhXaviPUeNRHRsinI0jquayoWetHDPdo6XVrgFApzWiFU1/cgnaQtvQhiC+r4qiHoTCpM1XttwGdHlI9rSQtVFd2otrfaylNFG45BOinbJ3ILnxXh0iXvXsJliiEr9l4ehK5bKjUIws+xLTPAGKo9fIw6ftDZ9Tyw5+0inNbP4AxjSquIYhAQE9XFj+5x9ycsze98yYsGZtBb+hXiF1siuSZ8WyJHwJEUOaf2vpg+2sVzaXGvgzc5p1lMd7wcQv2tRZqXB5E6PSRYHdhRc36bjVqxuXxcLXOLA/EVUXBOoiUjgmY7RluccEQfrfw4D6XpkqDgQCq7KIY9K1vkp7fp5bBvPzd4GENg/OLtQjgOtk1q4OUvZ1R3PPp0YMhPSdlioPnNYs66h4XYtWqKL9Q8+9HB+r3udlPfQnd6BsBfbgMVWuiVHi9pLo/Jr5xMogBmXhUL+BGcHV3zWVt8TMSBAUP/2ghI1Gl7UcdYqEHZj4ICczIH8l2Nr68misgKGjezrs/yiKPHR1CLVkQ+2E/foLAPk/IePdecrU1wpIeiANBE11XCt8UV6MGwk+qMT7nDgKVHVddA+D40WSehxgmDa/3KUknqMaB7+pF0dd5Ih8WawfzteBaLCx59LlE8H35s9oAg4Om/qKJUGYdMUxC5GtDBoRbEJvICRANTmIBOe2Z9g1D4S4o1RjhToPak9igBhtsm9upjVBjcuC051YqvpVjFL9Ac5UFkIynaNbKGTjNjzUreEV1IrVc09Ce1sxHVThZnOYsK0blhAnOb79oTglpY1sYi5jgBgZNgqNIxGVbjR7qOUEnP42/valD3FDGHa6TSJ0NUjnxYHoLv7xJG8j0h7qkXO/F4USOI8cjONkHns=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>6z34DB+AhCv1K3puiGUPRI2wf7OpUBsUoVu+lHQf/O2qkHf1btP7AQs5GKrhkBuhxtXCE+1/icpFR6NptsL23XhlNCjWTa0VUH/9c7CRLo1qnpuSFNs/PjNqImVB7VWpkFipJKzcFDQOYLel7B1+zT1qHV5i65/rYsuefNVzseI=</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
