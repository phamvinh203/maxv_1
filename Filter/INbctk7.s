<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY Controller "rptStockBySite">
	<!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
	<!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
	<!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">	
	<!ENTITY Form "INBCTK7">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date"/>
    </field>
    <field name="ma_kho">
      <header v="Kho hàng" e="Site"/>
      <items style="Lookup" controller="Site" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mặt hàng" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
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
    <field name="ten_loai_vt%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>

    <field name="gui_ban" dataFormatString="1, 2" clientDefault="1" align="right" categoryIndex="2">
      <header v="Kho hàng gửi bán" e="Consignment Site"></header>
      <footer v="1 - Chi tiết theo kho hàng gửi bán, 2 - Gộp các kho hàng gửi bán" e="1 - Detailed by Consignment Sites, 2 - Collect all Consignment Sites"></footer>
      <items style="Mask"/>
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

  </fields>

  <views>
    <view id="Dir" height="162">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110---: [ngay].Label, [ngay]"/>
      <item value="11000-: [ma_kho].Label, [ma_kho]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11011-: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="110100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
      <item value="111000: [gui_ban].Label, [gui_ban], [gui_ban].Description"/>

      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 30, 70, 100, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>

    </view>
  </views>

  <commands>
	  <command event="Loading">
		  <text>
			  <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX+NX59xiN/5VfhvPS78jFasDQ//Xr+YmqZbq9oCTxbxGkCifAOzbjPX71WzPRLSDhg=</encrypted>]]>&GetReportFormLimitRight;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7fKDsRh16dSWcJklvUputqJ6ZKqOfxuATEAw+ZKMq9sJsyWQUlNGnsYi80D4AzwTnnO1fXkrlLNiUvY3Jn01PVSVbkQuHxkw/SIQ6fD+to6o</encrypted>]]>
		  </text>
	  </command>
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>NijkaU4rvU3ZYOJ6bhXlI5Sl8Z4qCItQhKvX0uI7IM01dNqNGlzxFQwR2Lswo/HZdUx2OJ/343Qqhuk+Vl1bY3HGQK4xVPQ0rN0sKdWXmxVJiSQ5b1WIxXQt6VJrk8fX0/ys4gMNaZ2YgRG+ojGYst07ZdcH+ePW4PLvzSLQBwX6bDnApSo8qT18kL1oS6cswfiz0z/ZAk3qn1ZDgGNvFw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
	  &SetReportFormLimitRight;
		<![CDATA[<encrypted>5Tdyzpq0WbxY95jou9uKLix8PBql0norP1UOezYsArWiYchabq6253IQG8SOZgnlgLY/2fg4fBERR0IhQuM34i8zmokjsMMj/LxmI+jeqd07HHAZDwOirq0rgM7KsKnxhAv4OEWnOMcyILKnGnwxDZC3OoTbXg9Xz/0jkhx0Q5ptctdk+AmUhKgGy9jegywOsGTZGFcqXpGkD3d9mt6FqJ2fWRdiSpOMNzrYgDff8gecPY/w5jJiI6x4+HTWkBvKK6vmSQv2+kzBZdzGfieNJDbd/jYX24P6IVKdsnr8tHLBgngpXTt+GyYXKxePMGlW3H6Q4HpOCU8zGqIv703YmUNNvEd2yPMV8w6+dorUwqTB47ZoLyakR+/Qw+BUVAnEy8CqxWIUShLpuFSqoRsvgywu1CU6fFoZAKxhhC6yaT1IxQyPbJXcbgCXE9uo3Cn/5o3nW9mGd19SVvM/vdXOHtaOIYFgNomD7iirm+1/4z0NJFLCEeBdMv/RBiVWahg9R1rpSCgIuosTkh5GQ3D+ySBKF6VyI2wrB/TC7Cuvmb04i+e9n0FnCw0jSkr4euiS</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
