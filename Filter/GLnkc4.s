<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLNKC4">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" normal="true" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130"/>
      <item value="11100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="111: [date_from].Description, [date_from], [date_to]"/>
      <item value="1100: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>AEF6vvYpxtWim+O4x3yMkq5viACUsgb+3jxDq6I/s0QJ/1ol8vdSVj08euxMkEh+QmJcgSUSozqW09FdQEzEJ8tfIqEum4cvKugRViBZts+Czx/8Xm1YDSr9GAcb2nqVl7KPZiuLCYYNV3q7Fli6uDnAQqGXUsWRT7X4Jm9xV+ufS3HwgPo4dQ6XInyQJppIOhG+Ts2KSrqx2agTeD1yHJJ/E7LmmjURgS74iwDAOkrkZy3DIi2FOx8qls0bdARWAgNPxbZ6qWtiLwaCnyhSww==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>olaLgH7GIbbjFBPXz1mHve4G5JIT/oK4RW8tf+ZbS/9hOLiUkjp3TC8Z7/eHn+ebxF+XmbBlm3AT/usoCBmtf6n1VBOaBJ0ZzqvNRxvwFrMo1TgryRdnB61HSRqqGzebp9dF0oiPG97UapzDnZRfxGKSmJOv5fXj9Kyp5dgRf6Ue7NRtgQbIjlWfSV9LizICO+tLLA7FHtLYnTj9/IIjQ6ArwXMV3et0QqDM463AXHc2Mz1rgOv+iBNxbjuwNiOW/8GIYfPZDX0AbB9r59d6Uy5WnH46VQA5Txw/j6+q0L1E5LVf09AzlcU9r3HFvfk/KgRFfdQQB1mu9Om4GGskXZK391MR93yoBI74ZKJKlBFKKmuLQ2R0FP1lIUgrZG4Xm9mlU8+vNkHclzkwJ19Hp5X4I9wm/QtCaKxl46w/VkIizQWV9k7Jf74Ejh8nZPq3g5B/dUaVbi7N/o7UEKizTDgBwwgqXea9s+MnU5MdIjEm8XSAETvGrrroW5HqrfLJkj19Ais396zqH9/ZZXCJJIjhNvVEbQdnzJuAy/mFSAkBLX+r5vpVCYnP3ouIEoQeyiCUBDvignqYD5CWP9zAOTr/jRif+oIPvNICYqdZxPNr3bqasghchlx1AFBOlRh8EbGFbiOzrKkeb5LjNWwOrziQaiSkyPDGr1hjBiMSja8JmGUE6oH4Tqe5oJFky+7SGGEDjEaRv2FX9wCboanhk5iTib6mMw+LEYLpnqzU64d7db4tFMJu3lCZo7ayw6a3Ych5idQ/EoxQEDty3ziw+refQ5U+t1+w1bHAjew5tO6Z5BYacNvQmYDBOXBOXOxB/cYgFFGAJFE0SlKe7HQ7x/Cc2n1HF3g/orzcvLPB6f4=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>8HDYmxrt5lmM5WqJ2VZ/jMAExMycWEQ5IjD1g2hfMngspqKY1L+hEVxvlorELloJ6erhw1DakIDqgtVVhiihZkPQykKizKMYFVfmFTQZfXLWyh1LM0kw83km1qYLifimjlPaRpmpVOIzWNvncPJ2OMoSeoGt8f3InjWWZNYgkRk=</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
