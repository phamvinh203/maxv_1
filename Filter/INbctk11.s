<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "INBCTK11">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="ngay_xet" type="Decimal" dataFormatString="# ### ##0">
      <header v="Số ngày xét" e="Days"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mặt hàng" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="nh_vt1" categoryIndex="1">
      <header v="Nhóm hàng" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_vt2" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_vt3" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="loai_vt" categoryIndex="1">
      <header v="Loại" e="Item Type"/>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="20" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    &ReportDataTypeField;

    <field name="nh_theo" categoryIndex="2">
      <header v="Nhóm theo" e="Group by"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa48iuUH34KSJcVMNmWD13tUwDLloSPzj5913ZH74D/JQnvAOirG19jVpDo1U7QfXiUg==</encrypted>]]>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="">
          <text v="Không phân nhóm" e="No Group"/>
        </item>
        <item value="0">
          <text v="Loại vật tư" e="Item Type"/>
        </item>
        <item value="1">
          <text v="Nhóm vật tư" e="Item Group"/>
        </item>
      </items>
    </field>

    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <header v="Thứ tự sắp xếp nhóm" e="Item Group Order Type"/>
      <items style="Mask"/>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="186">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110---: [den_ngay].Label, [den_ngay]"/>
      <item value="110---: [ngay_xet].Label, [ngay_xet]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11011-: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="110100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11000-: [nh_theo].Label, [nh_theo]"/>
      <item value="1111--: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 240, 115">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
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
        <![CDATA[<encrypted>IzuruJ9bYYwG4HUyQ0sumq0drPIPGSQDNnHORSDsxCXBvyMsoPct3AN+mLL/u6nQSdwQyvG6U53f1Z3p8VOEHbbvpvJN5p7GfNFU5AGCGfXLY7IptV2b8Kocl1lc8Ox4oDcDTxDk+3iv6ng1fuwa3HzTTY8HUFsESn504bmTvfLqF39y1uKrQ2SS7pc+dD0uysqoGwXvxdNv5YuKwLNjOo9gRpWgHiOdmJkaHaiJDZ3jChw5dqybOQ/eExGTTmJz19svUg64ZBoNSCVC5aA5D+djNljfZ9DpOTiX7NHR9FubouMGTFcvDIP6F+xPfCwweLrK2IJax/UWZdPWIlWxhVGTMmIff/stjE1adtDXUGgVLgzlx2DRvWO+d8jR3nInyAFImYY60qjW4vb9pz2/S0wxB9n1AT8XaMCkxgxVE8bBgh7XFntfbHF3gF2+BL6a</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>QNwOnre2eaLRiI3VtqJiQqnB/xzwgr70OxyLAMBV2SqaRXv20dFmCUWCt/gez0YiLavzLx9Bh9QbK49+nNxHHZon3iIA2n6iq3MmsOT/GDkV2a8+GaWXpUkvtXpenG3A0/XJ22YZ63XnzkN9yb2NO4r2TJ90tB4h3OHyZyqop7ZTWiwY/V/+VLO8XZWVZkjOaYPaOpXPFKl1JSSpAFCurL6jxn7fWmsLagHwfKy2J1caDf3y/SGj4TBC/larITE88wkoLrPm3oCSM7zLCzhXUjl6r8Oiy8lcA5mDqGBzrmMwV2hO83V8Gm/L3QlgElISvu+tTLkWzvsSaww5xAqd0PJOeW96aMFIcozi0lI1uYUwvoGlmL96siuNLdT3SKqH</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>YmzjnfSvxoPKz2K3uIl42VkZf8ZDXqYvd6P5t87d1eSJGXwsvc76cLw3r01KsqNA84GF5wGSrsmxyN+A5HZVDJp/oY2uiOQrEuaPgJWMJmbo3UojfzuTrdMO4/zwG6V4/wy2JCbhhUnd9GXzkZNlLiaNjySm6KAA7Js5l7deiiwXP61DbQ7iR9r9sWy/8Z0o3tcx3Ml0nXA5NAqOOYDKqJoz592b44Sbpg+O4G2hBw8Ec9f2cGraDY+LwM8rLUW07Aqjoqa0nhFAYSnAbgDzlp+x1LylQu1bmx6OpP9rNpA9grFJs0e+wZCegSIgkbRgqGpd9kAh9dFZwGxnwW2yafNbIbNsf0YkSKI95GwhHSAQsIZswAOpXoNZOahVJ0nnUiZznY8jtMaqsXi+AgOL1LIhl81qYWL9pfmIfVo1vzOzucHZv3NrzAJxI1rDmH04YUTOH3Z+zW9GkBdRApe2HU+HvoEc+x8JwDs01KzTsv0JAtg8Fi6kS6w62Nq6UnxzZpwvHdcCV6vQTKvxHbYbO2CBQwJelRPwbweuwWBF5CyBInphpYKXlYB99OEQUWR1sth88Y1hTmjbPKILJrd9Qr8A8OBr9d++vInJunqEmZfhsvncXFI+3eU/0q0yEFaF0MtZn2vmz0dStMzRMPOy579pmP4u/LWL8Kb8eK9mm2YAy6sn+OXSlUQs1ig/+D17fYDsN2b8s5F3+WSMDed93JCF4/h+rXvQ/5HZ42hRr5sg0MRkOvVDBJ8arnRLg4CVr9lFeOgvHWli2+tJi5wi7SisZoplk9i2eceCREmf+BcjdfiigbgyetjdVbMLW6NNbUZVCHXx6G1/VAVrVBhcCPW7XtEYwm2u/9BDiJtEIst+pJkmiDkZJ+twrsTE9I8yb0m9V4fQFgPmhg1QDFqTxA==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
