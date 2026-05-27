<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "INBCTK10">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="dinh_muc" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Định mức" e="Norm"></header>
      <footer v="0 - Dưới định mức, 1 - Vượt định mức" e="0 - Less Norm, 1 - Cross Norm"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mã hàng" e="Item"/>
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
      <header v="Loại vật tư" e="Item Type"/>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    &ReportDataTypeField;

    <field name="nh_theo" categoryIndex="2" clientDefault="">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không phân nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Loại vật tư" e="Item Type"/>
        </item>
        <item value="2">
          <text v="Nhóm hàng" e="Item Group"/>
        </item>
      </items>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa48iuUH34KSJcVMNmWD13tUwDLloSPzj5913ZH74D/JQnvAOirG19jVpDo1U7QfXiUg==</encrypted>]]>&OnSelectionOutline;</clientScript>
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
      <item value="120, 30, 75, 105, 105, 110"/>
      <item value="110: [ngay].Label, [ngay]"/>
      <item value="111000: [dinh_muc].Label, [dinh_muc], [dinh_muc].Description"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="110100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>
      <item value="11000: [nh_theo].Label, [nh_theo]"/>
      <item value="1111: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 225, 130">
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
        <![CDATA[<encrypted>MEcFR+OpK/sEclzynffABpx969S3FyS6miUQpEKkae+fvc0YrYm8M+xhLj1dYLxsreNb5DWqNQfYdTt1V0bEpUnWEOLL0F0y/MoUhkzQ4zCgFC7zSB4zwPxXYpLkZCi7bL6j/WN6Ybg7WCkyaZ3dK2V+6t9Er7lXRe7gOYmLApt7PYaKhsDb8F5IvQB6wMHH+YFvZ4triXh/5v9qHMGEOofZT9u/c1pvlYUsZwPXU4FwvfMPodK9jYXovGB7wRTkKp3ZNBVlqgITR1OhCnhQdbe/JqHg8a8grvbbeDMf+V5cdwRytEFlar04XEpWYhOP6vuO1ohbu7JTTCJoNg0BXNbFTJzqh+NVsg9cOaQU+qb91qFHRRMSwVl/paMpaR/RBOqy0Us+QqW5/wuLEtlhJbKshNEpZRH3snI7CEEzKnpIRFidBP517ITIbJo6Qp+wZdaVkagi8ip+dFwCL357bQ==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>QNwOnre2eaLRiI3VtqJiQqnB/xzwgr70OxyLAMBV2SqaRXv20dFmCUWCt/gez0YiDgM/76WOI37Fb/hfjO1KTbibZyqyJuntuFoxTqltqUcFGtmkK6AHp8K7yK22HsiIagRrg+/WX3kuWZPtfK3HPmPSJ7KxavtRhk58ZPhMqUsaPvjM2IG0F7CfPrTp6CKu40tG2eH8znfWuAVwKVbJaYP0ZS/QrOoU237wE3MF1Pawd2xqL9Jb0kgLR3TXcjbrU5YLz26ISj1iZqNfYIs7cv+/2NvRw6QM6FcRCPQQiKsXO3m6v5iN1biFnZ16wHCyGjRt4TjKEbz5Burxi0+XFUFcNODyA1nhWPJJHjZc7eXmWdszE+/NPS02YyRFoVMD</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>6h8Q6zEeBPr1lRH/9ZDlWMll5oLpj0IeWGJ9pW4Ai2pRFoW4NyXotf5rQu1xG0rv2bfSRNz8YQZX0CEoz9ATFC5j8gTq7rKSPPMM5/6+zAUSBAyExkeAX+oKm929OH5kyS0lLVkYWcvaksShGbk8Owu4a5PmquEJ0v8HHwFdu/x/uEitaQyRCwLkwYHFy5tDtyPLcG95wY4/lpYKS/yreOiDUqi5HuhaaqwNIbgl7HWrAGS/4skNWgJpUqwzxd7/gxing4wMoJLlAH0ua6z1oWYmsW1ddVviXJ9TcrY8v/XD86eqccBuyn29bVj460YPErmvEm0SGFqIheSbSbHbsqo9NY+4ZBqPZghC2V23+Jms/c6PftA4GlFdniYQIuASqEecZRa7BfYUDuNrCPPcf1CSophaXoQSB7nZm9LG2kB+emD84Ee5/hSZdxVSkXQnluOuQDhU2KWwrxPxOu3lHF8VfXmyeYTNTWqpUPGPgQL8UMXiaUfZS/hO695rlVfK01vyxoL1rp2WLuEwGFEsn0JadqoBWVtw1XdDjnq6coBPLXG38CiMr5ybv1YzrhHqUDBqR4hG7/X+i0zqWtUokgm9ier2E5oV5SWxmAuWGHcsthNg7Q7LKnSLrL4vCKcO+9bb4AKvMrCReRw243Bb1BNotyoCnV0+WBgXSQ0w5W7yUa1nw3Ubl/fdqkRY2P824ZG45IMyXOi7w2HxHBnIfH294GqE5+HY//kVluq7+x7dpdkZIb1tuelwa1Ml9CvOfQAjpE9zUVGw4Gq/nyhKK52yOVE3cwhRYlkTJkLYed733wOkPS4DiPwuh5F3Phm2GYxvHycoLRnud6kmlF0WcspLkBAKXxvAln7iyAfD5s+vLd8KRke4xgRFmL9A++454Pql6rr7jTGDxjQybio0imTpKbHf1eMipV0DZ7fVROOrOO+Y/lOCgt+lnqVS00kqRbKUJUl0pKGnOxeWNTWFuw==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
