<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "COGTBC1">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="fromPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Từ kỳ/Năm" e="From Period/Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="tu_nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year1" defaultValue="(new Date()).getFullYear()">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="toPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Đến kỳ/Năm" e="To Period/Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year2" defaultValue="(new Date()).getFullYear()">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_sp" allowNulls="false">
      <header v="Sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_sp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx">
      <header v="Số lệnh sản xuất" e="Manufacturing Order"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai" key="1=1" check="1=1"/>
    </field>
    <field name="dien_giai" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_bp%l" readOnly="true">
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
      <item value="111: [tu_ky].Label, [tu_ky], [tu_nam]"/>
      <item value="111: [den_ky].Label, [den_ky], [den_nam]"/>
      <item value="1100100: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="1100100: [so_lsx].Label, [so_lsx], [dien_giai]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
 <command event="Showing">
			<text>
				<![CDATA[<encrypted>IAWxH/LFPkZLbC33jgWD5lnXOFMo+Bz3AHsei51KB0q2fRsxW9bRCMiVXuwszIprdEKUNd92g7x6mYxUghs1wMSuExb85pJ8WA0uZkekocmiA18ij0d88qNw0je4nBLFJWkOTcVLm4S5Gzikbq4GR1LagP71ls5avkMx+7Xlxkbxlu4xniNtjbmMLFdDLptn4Q5ZjgzdQuc44I9kJfcLUKLWtQ3zjVtBq4qcfaudXcRJf0Fvd/k99lsG4WQy5KFN</encrypted>]]>&Form;<![CDATA[<encrypted>5Dk18Vsx8RJ/AEkKNXj6inE9H+FbWdGTTq3PfO228aI/cEqVfb0FHxBb9DgKEDsEP++v9Bo+iJuNc4nmvcLZBSSVqocPleMIlUu2/+kZs+ybgkbFN/MVE356TnNoJNpZRXw5V6gp+W5DEffbfjLWdPCn/uTfo71KhvjmMS5IbVEPxaczXWtQ5ym+sSVjbvcnm6ijshw4R0a+ZHeZOIgo9LOLxnuwDShEPlvDCspBy0vkxy1xt8J3BEHiwOHFoZP4</encrypted>]]>
			</text>
		</command>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>8cJfTJxrXuQ1zeVr3IaNUILzUj0qPXxec3TEcn7jb+52MM0fmZGdo1sKRi3L2r2YcDozQHlZV1SER46aN8/6vDVVp/qjN6I8CPTG7bSgtiK9VkyU9G/UPpvPX9rts9VcoLst0b/7fSKme1atRUForCWlogamCn3GG7F52uHfbo/NiwYIMEAfBc69w5lo1T+LfkJHodLIjZPM7SQ3sljAgiBOKXYdq4rOxqjDZmAm2kVxtyHdqdoBjc8sRJm4u8d6</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>oN6BfA40InKV79N31LdmCWI3XbKVodLnOsVfG9rlP+FiPv4yQltc8DxVZG29ppjrLn9rdHx/dmzZGAS5Yw+8fzZu9vgEtgSYvOxioOdYqU6ix3eJzEEwbNeeoWLmAEnPSzXJZLHvpnmshHs2++Urrsn4iXsVdKTKKSr3/f6bqgDcOvnMeoNXwa1KeDEYb9cI87y8EQ7L31U/iMPVVRacGJDFyvtLPqJ78MLDWsVvH/ssqAwpCYv+zzzuXrsLHErS9skiEnk2kxxERhXhXhCKqs6eVaBJnn1NvehgcO4gdE/mWFTqs/PbmBHzyAGBGfQ0jLDdtBB8/7q3QmwV44kqszFREj9kYpy9lEtmvFqhU7zuVIpQfEkmlapMZVCx8RQr3H1uPzfUU7Q709MeErdSKnCdaWuunrN67RpaUSkZOl57Wh/qFzrds9eT2uXTP/r7p+OzPh5Dsesw1He3T6Q/ZWuHC5h34pLcexpt8Kyz8/WMIXcc4/+qet0LUGjcHF6aw72ld3LXZ38/W/eOJvbmqA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>DOzNlklDKJiLymB8SFihbZ12dd1sRDJW9NOagr3SkqqeIhbMoDz3qeeC8W17S3ed1PsNU9wzqKNfiLD6gb6Cv/lmyWbyU//GiSuRxhtLkTDTnLSbbbqFG+TGB2YnZrn6kbPjqpeRdIODk9Ap78XW3cwy+FT+pp5Mzel6SbI2OouVdbowjzJv1PieK9Co7iSkkhN2E1B4rZJdzyIN3UyQoDleN/EjQgikvOS1BvSbRL1ep6A53ENlarCFFDAbpWmoB5j+qLpOsmECs1d5cwQDCOa/JMDadPBc6zU1WM6xS7ZwwSF0GH/2IQALrGAY3jvVW2kDPo+4QHN1rZLMMAPhJVbrHFSq48TLTBbuEvqmKCit1BgaukVv52X/baeS4omkgX4HwsQv8PjpHhEwrG1h9lFmu2G1QB72uUqP+4hfT4Z+0IPg5pohMHu/C0ANJZWTnMSqyGu/28gijbraqPYhBob1WUFZQ4KkK1zHIq+6LUCjsInGQqJlQmL8r1lFx9X93PnDTpxDSCiRm2a2fLyvhK9ObJaseZFfB+HKk7NSU6v0IjzdgKcYMky3fkgnRoQJF2Ol9o3k9z8v0lAD+ELTkk2Xsra1i8EKKNVDtCvLAih9nQAjRitSokP6r8Mmd5lCF3IWdxQPH466zrrtVBzQtuaMAOv7XYwa/9vwmhwdwPNfu5aiPyC0sv9Hh/y+VipkJigwFcBC9uJ0SBAA6dBTlU/rLgM+E9iZ1WnbA/lhoB5U+EwkKx8pl18Q3BPG3R38Y2wu/9w71ODpEA1v+gNgw2mYQQpAzdUVV3WKnP4Fk27Onumxhkw/uzzVP/1PP8MOgo7Ox9150RCTktHrdkF6PpX0Svg5ZDMnG9MbHOLME8HOC8gyuwgRgCrc2joFb3kePVX+fzIXeNzWw8uqUsftHu1Llrwkr/a0gvzv6NdZZHTkYGQz/MMT8cSv7T31jNHgyi30JiEl8GxwrDjC6m55LCRK7ltbo989Q3iXgUVIUwX0Tor5ky1zbe7HnczLkLoMpSudmuTofx6o8HUafNseT32PfTwTUSmMapvi+5ckkKbEZ1w6AnXfrlGIAe/eUSyK5QBFSL0klGzd3qySQBsxaqaS52gc6Tk5/9y5GFDdMYLN8vUYL85hgUnPUVtUQKiIVN5WwC4C0JB6xVHVew/6cWXQl0Q0lbcwIqE0pvp1hiP85KseethnKpIMjPxlz8jTqCcEvDsfKAXnSHRHlpssPg==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
