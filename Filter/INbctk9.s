<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY Controller "rptInventoryItemAlert">
	<!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
	<!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
	<!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">	
	<!ENTITY Form "INBCTK9">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
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
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="20" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu in chỉ có số lượng" e="Quantity Form"/>
        </item>
        <item value="20">
          <text v="Mẫu in số lượng và giá trị" e="Quantity and Values Form"/>
        </item>
        <item value="30">
          <text v="Mẫu in số lượng và giá trị ngoại tệ" e="Quantity and FC Values Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    &ReportDataTypeField;

    <field name="nh_theo" categoryIndex="2">
      <header v="Nhóm theo" e="Group by"/>
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
    <view id="Dir" height="138">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [den_ngay].Label, [den_ngay]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>
      <item value="110000: [nh_theo].Label, [nh_theo]"/>
      <item value="1111: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>
      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 125, 100, 130">
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
	  <command event="Loading">
		  <text>
			  <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX+NX59xiN/5VfhvPS78jFasDQ//Xr+YmqZbq9oCTxbxGkCifAOzbjPX71WzPRLSDhg=</encrypted>]]>&GetReportFormLimitRight;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7fKDsRh16dSWcJklvUputqJ6ZKqOfxuATEAw+ZKMq9sJsyWQUlNGnsYi80D4AzwTnnO1fXkrlLNiUvY3Jn01PVSVbkQuHxkw/SIQ6fD+to6o</encrypted>]]>
		  </text>
	  </command>
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>T8onpyWbyUN5fMbzNN77dkipxYz74tzRFagnNhg7gFqD/Ff/nZluUROLTXKwQJTS3xid1rimvdY2025yl+hWgC7m8SyNary63mS5OADUcDfh7BLiP9t63jJ6yFSn+XIeHu09fhVkzt/GKDXKJ7rKWgZ8t4at0OgOxoi4jaELf2rTiOdCZyI+/1Zz/pg2k1dDXHUDZBen86GMlpeRirfIGvdowvD/LEKWIYSHptnRe8JYp0Sf/6SM9HCyUiArwQfKHxki2o/V+QythmfomjIKZw/l3oes48Ped123IaXWXo3Ro9QGk4wSGSgHSy6NCFRG3nv4mO/MtqyyXZqOB05B+H2+LnaehNIhvqL9liaO1ZE6aom0WW6CSmWTnULxun9yZbdRoReq39ia+UklDHuqi4nXuNtZOEh8UPZsGk/mfiULlCy5OCMMDmYgYEwaV4L6</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>QNwOnre2eaLRiI3VtqJiQqnB/xzwgr70OxyLAMBV2SqaRXv20dFmCUWCt/gez0Yil6ZjbmQ+3ecm/VSP+kMGAt5RgEbFT+zk7wwbg9Nm39UIl2bJmfs4tt8j1Kc1YdzjlGZf8lUl26cqDvCezoLzm0+QYsvEgtmBA8HprTU2mxaoulIL3tVK5HurOjSjmO0y/TiXl4F5zGkEsFHQtTGZ6ql4QoVODRQTvbl8sAWG+TsyO0/I1Fyub0avma2r0P8WnHhOMMkJnyf0J4IGwhO3LqpMJRq+R7tDGsvr8dZcMUGCdeuvidhVd/cj3HjqSjDyfItHuhxPK20kWRWFPvASjypy8b5E2O/weYhFzHO7TFygJZ7ZRXT0jm+wFrHr7Lhf</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
		&SetReportFormLimitRight;
		<![CDATA[<encrypted>jAM+2OWNong2bHD6+883qmtzDqNSfvWQ0mK/xyTL9Wg846eFvtH51GUizhvNYZXxafaepjSgfwqdf3ju6r2mHzuoKG6Kk6imBRCvs6Rxk+iWN4aVdBsr3ooMAwcn/uHSWNA7GR2zfOQoNZzqA91ORPD1V61OXcrZn5F9c2FfmH0Zd0ZBsXVKH93/qs85oSCTZbKzX1Yjs6zvtAyp34ArC6ct0zhqqWZDmlLJ9YVRy0sOz+PzudnhI6G3PQrxB8Za2Ni/ZwSSPjscr7Q2Cg7MZRV0An1t65MX+hwyoqUy2J9WzXvnb9s9EVu8GdK/FKcgGWtphPH8v3xhMBcZTqUttnBKQoAuz4z6XgckXMBclLUCLAguA9dSfNYblT3W/IsSy4YH94KKv9NvTmFbdh4mx938FYNQ5cRamVMUK+b20EwDu1b5KQ8l1qXVBZVXdXvj0fm52jW4LK/eJy5Fia33VeKlg1qtdrzzrLNhgNi2Mz36RFtQdt8tbjlKZjuhYrbnq9ul2G6+HZZf5ukFVEyOr0Ra5TYn71MelRQyHx/JgDNitK/yezJFdIjMXGCvDVVCyaWBBYUisUoZR8M/tJfcpmYi+A0eiWoYgYq6cOXA4wutxvTxWlec00KU+cnuskHG9l4HEfvdzz/VFKNnYEP4kH3hdWbgrk8Sn1ixmXBq2jZmA6TLuik81JLX7d7RaWcGiCDUnedlIvbJK9vLrpng4AagEcbq2wFB6CrbdmWVZJNSWcHYm6O/KA8N9a3JPZLvR+aG0q4lVmzjeuP/GD1/XHJw5mXgVuLC2b5lGA1J123cxDRSjA8I+4Jm0UOTDT7ij/C0NLWNtbqVgrcPuG6rqGbVPmsZL2YiKJUUCH8iihsTPbqVu5Ot9oAKYa8xFqLzWCxFeJE/LVQHPk7T/NByoQ81nUTn/uopO8sjJY/MBWoijhTjFLxz8uwCVxteRIoF</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
