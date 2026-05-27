<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "TSBCKK6">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Kỳ" e="Period"></header>
      <footer v="Kỳ/năm" e="Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="so_the_ts" allowNulls="false">
      <header v="Thẻ CCDC" e="Tool &amp; Supply Card"></header>
      <items style="AutoComplete" controller="ToolandSupply" reference="ten_ts%l"/>
    </field>
    <field name="ten_ts%l" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="mau_bc">
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
      <item value="120, 30, 45, 30, 100, 100, 130"/>
      <item value="111----:[ky].Description, [ky], [nam]"/>
      <item value="11001000:[so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="110000-:[mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
 <command event="Showing">
			<text>
				<![CDATA[<encrypted>IAWxH/LFPkZLbC33jgWD5lnXOFMo+Bz3AHsei51KB0q2fRsxW9bRCMiVXuwszIprdEKUNd92g7x6mYxUghs1wMSuExb85pJ8WA0uZkekocmiA18ij0d88qNw0je4nBLFJWkOTcVLm4S5Gzikbq4GR1LagP71ls5avkMx+7Xlxkbxlu4xniNtjbmMLFdDLptn4Q5ZjgzdQuc44I9kJfcLUKLWtQ3zjVtBq4qcfaudXcRJf0Fvd/k99lsG4WQy5KFN</encrypted>]]>&Form;<![CDATA[<encrypted>5Dk18Vsx8RJ/AEkKNXj6inE9H+FbWdGTTq3PfO228aI/cEqVfb0FHxBb9DgKEDsEP++v9Bo+iJuNc4nmvcLZBSSVqocPleMIlUu2/+kZs+ybgkbFN/MVE356TnNoJNpZRXw5V6gp+W5DEffbfjLWdPCn/uTfo71KhvjmMS5IbVEPxaczXWtQ5ym+sSVjbvcnm6ijshw4R0a+ZHeZOIgo9LOLxnuwDShEPlvDCspBy0vkxy1xt8J3BEHiwOHFoZP4</encrypted>]]>
			</text>
		</command>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjK5v2RmpTptnJrshRnzVTTj4e6rziGqj3tqRfcFPYNrR65t0C77qbpaOsbSxgZXSpGTZ8kPG5gJvhd/ixrO4LSaY+bfV/hvLJt5W+ZfQc0xD</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>3U+00GWUFAg/3xPqElf3/jMAzdt7P6UlsxEH3cbAdyt7jtlQ+htYlreprmMSGstpPoEIlzB9iBWO2X+te4QoailZPOxkwNTFaCv/5aPa2gkDb3UsA+Y4ST5uTlAE6TVXpz79QfR0dGgzFpneygUizP8P5sir1qLHiNNLiLhHgv9Kf3IDvWEMb7jJhcoRmhe9v2/GFz0GEPOsLRpItwvySxjXvQRH9gRGLu2mWqk+X6CEVhvQeUYnEkHi3GJpYn3DYzvc740cFsNNTHnaEEDmmLWKkFxYZkaFaWCc1i6Hl9Qq5qYPY7QZi7lkHNOlwvH6jb6Nkc5OOYuHAb1rgEiqMAX00jDCrwPE46QEiwa5BGk/t+zWzPpFDrsE/GmMdIWY+PAbuVHdFrKA1XrNm5HoA5tL2G4EiTjig9DYZ6BkTtvnbLneIzfSMv5VI56YuEkXdSt0AGbS+e3nMCmNX7F5oiopvhaZ1x8VRY6UjNMrc6lS4AR0aPGOH0d9lCFEnGzoP/gERHetNJVRQGWXaI0P6tu/SHwKudDEf69zX3KbqpSxHLU7D7CGuT8dFAubCuvZP0uSptTwkjEdm2ddMo9Ixdjkx4PQZ9wUxNLeSPptsB3IifSe9DnbCOqUF0SxsEbnEa8fd1Cz2zpIBccxtqQ1um07IOu7KhYcQa/toJXBXBY=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
