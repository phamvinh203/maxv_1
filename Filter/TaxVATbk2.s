<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLCheckProcess SYSTEM "..\Include\XML\CheckProcess.xml">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A01119\ReportCircularTypeField.xml">

  <!ENTITY Identity "rptOutputVATList">
  <!ENTITY Form "TAXVATBK2">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky1" allowNulls="false" type="Decimal" dataFormatString="#0" aliasName="Period1" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Từ tháng" e="From Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky2" allowNulls="false" type="Decimal" dataFormatString="#0" aliasName="Period2" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Đến tháng" e="To Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" allowNulls="false" type="Decimal" dataFormatString="###0" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_thue" dataFormatString="@upperCaseFormat">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_thue%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tk_thue" clientDefault="333, 133">
      <header v="Tài khoản thuế" e="Tax Account"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="tk_du">
      <header v="Tài khoản đối ứng" e="Corr. Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_du%l" key="loai_tk = 1 and tk_cn &lt;&gt; 0 and status = '1'" check="loai_tk = 1 and tk_cn &lt;&gt; 0"/>
    </field>
    <field name="ten_tk_du%l" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh2">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh2%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv">
      <header v="Dự án" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>	
    <field name="ma_bp">
      <header v="Phòng ban" e="Department"/>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
    </field>	

    <field name="phan_loai" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Phân loại" e="Classify"></header>
      <footer v="1 - Nhóm theo ký hiệu, số ctừ, thuế suất, 0 - Không" e="1 - Group by Series Number, Voucher Number, Tax Code, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    &ReportCircularTypeField;

    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10"  >
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
      <item value="120, 45, 60, 100, 100, 130"/>
      <item value="11: [ky1].Label, [ky1]"/>
      <item value="11: [ky2].Label, [ky2]"/>
      <item value="11: [nam].Label, [nam]"/>

      <item value="110100: [ma_thue].Label, [ma_thue], [ten_thue%l]"/>
      <item value="11000: [tk_thue].Label, [tk_thue]"/>
      <item value="110100: [tk_du].Label, [tk_du], [ten_tk_du%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
	  <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>    
      <item value="110100: [ma_kh2].Label, [ma_kh2], [ten_kh2%l]"/>
     
      <item value="1110000: [phan_loai].Label, [phan_loai], [phan_loai].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>

      <item value="11000: [chon_tt].Label, [chon_tt]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
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
    &XMLCheckProcess;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>Let80D0Zwu9iY9cytyoFKpl7kp4QKW3dAprZ5eziNd5J2eYENzmrKB4NwdocvFRpiimxQx0iJ5flFqgbbx62T0uVzwNNeUaSAbkY9C34sxvyK3Wr3+GVZkvwCX51AF9wS1EPCU4TCnU4Qt8bqr4jte8/vwCCLIE0RC/PgGjWAKM=</encrypted>]]>&Identity;<![CDATA[<encrypted>8/1JEnlswCvZZ80dVCkFuvGp7xaem0DR4UTjKTT+gFsggbf0RacD8O6Gd1TUmiFHSLoKCLQJotJslgNCF8XIvSJyO7g3aQR3EZEFTISaq3VPlIEaDSwQqUmb1cf0KhySqioUhsFMlPx59JCnshbleGgZsH2ua73nNgdZ8Snrh+lhqhy9szmEzPzKzwm5Nx4LFy+t6jHB7imxEJgb+NnAsD0AvyWsGvzx6vbuWBiHTEfee7m4WxIqr7R8nL0yEEliw0d+BCsd7D3izEP8lMiFLHz5ItCaBZHjsuUtb0f4NEU=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>6h8Q6zEeBPr1lRH/9ZDlWE4Ci7i2TxiurOQvriwf5I06bdb2xbXdQf/4TX+jRuNBSIW5Y3sUYEsSYvu2Hc1wCtSGW24VAWJUCotIaEZsNNVXNyXbmE2i/GzJVZpEYlIh8mja7K/iMgPZOm/nYUHwSTA42/rZD7kmJND77/rDF7uaOGBD1uwrkSsIV6tZs0kqt51wxPMCBxKaDhnQBPqqo4NJo/0bBNpKIIbxcrlCYqBPsbu3syOOlUjkRQwui3e29CanD0MXEqsOc7b27t3E4fsAQFzOQ8FLqudoWUp7xrpWIAM2m8Mah8b588tcXgsyFngsgf5xWcFO+OI8mtBBHppDcNNoULqqAGRov83KJwVCzONxJ9w1B4cdhIHnkZzVa6+c19tz89KTHSBEQVbrSPmu0RMOneNvEJWTH2WHW1iI/izkSVYgU5ghnfcsxOfRRifAQvcl6AEzB4n1MkoAiwYlU2wbqIGG7HL0T16hi0OzeW9akjRj9DW0M+1UpEHj8OuqT9P2PWcsOQzcYhlekNFKk2gTYvaX6aPQQh2FOEGV+g8ydMkeynrNZFMag4i4/yxXLkN+1HNYpx6DoJnOLwLDv4pNmoVk2J7VqlsLCMPMwMCAzZvrLshHEHwYQhMhL8qb7+i6Qgq7RXHgbO4IVf9sIeX29IK/TOydh/y/IMEOxNQg3wtDRP9IYWypypSjzbf9j/Oxm1uZaQeAXAr3BsExR+rrte1qZchhwz/kt4DCdrhDyiUczPOvfmTYFzbshDBNy1h1Q0nK5bwrzyUzOaQW6ke19WhK3RwZmfrSf/g+2nvIgk3p7taAAbNO0XpadATQ9JUNiAJbPZm5Z5hv6tbZQjYRO+b+FWZNP7tzrSfHojo5UKgiQEX0xPB/YSb6QvQSZrq0p2D1LataNYyrx0UeVOUq+YBucuclAJL8QYc=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
