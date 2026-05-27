<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY Controller "SObcdh1">	
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeFieldUOM SYSTEM "..\Include\XML\ReportDataTypeFieldUOM.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
	<!ENTITY Identity "&Controller;">
	<!ENTITY FilterExpression "f._filter$Expression = '&quot;' + f._filter$Pattern + '&quot;.indexOf([ma_ct]) &gt;= 0;';">
	<!ENTITY XMLGetParameter SYSTEM "..\Include\XML\GetTransactionParameter.xml">

	<!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
	<!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
	<!ENTITY XMLUserDefinedReportFields SYSTEM "..\Include\XML\UserDefinedReportFields.txt">
	<!ENTITY XMLUserDefinedReportViews SYSTEM "..\Include\XML\UserDefinedReportViews.txt">
	<!ENTITY Form "SOBCDH1">
]>

<dir type="Report" id="1" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày đơn hàng/HĐ từ ngày" e="Voucher Date from"></header>
      <footer v="Đơn hàng/HĐ từ ngày/đến ngày" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đơn hàng/HĐ từ đến ngày" e="Voucher Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Đơn hàng/HĐ từ số" e="Voucher No. from"></header>
      <footer v="Đơn hàng/HĐ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Đơn hàng/HĐ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>

	<field name="nh_theo" aliasName="nh_theoSobcmh1" clientDefault="01">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
			<item value="">
				<text v="" e=""/>
			</item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
	
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" />
    </field>
    <field name="ten_kh%l" readOnly="true" >
      <header v="" e=""></header>
    </field>
    <field name="ma_nvbh">
      <header v="Nv bán hàng" e="Customer"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" />
    </field>
    <field name="ten_nvbh%l" readOnly="true" >
      <header v="" e=""></header>
    </field>


    <field name="ma_vt" >
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vt%l" readOnly="true">
      <header v="" e=""></header>
    </field>


    <field name="nh_vt1">
      <header v="Nhóm vật tư" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_vt2">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_vt3">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="20">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Báo cáo đơn hàng/HĐ" e="Sales Order Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>


    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>


  </fields>

  <views>
    <view id="Dir" height="210">
      <item value="155, 25, 80, 105, 105, 60, 0"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>
	  <item value="1100--: [nh_theo].Label, [nh_theo]"/>
	  
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
	  <item value="110100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>

	  
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>

    </view>
  </views>

  <commands>
	  <command event="Loading">
		  <text>
			  <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX+NX59xiN/5VfhvPS78jFasDQ//Xr+YmqZbq9oCTxbxGkCifAOzbjPX71WzPRLSDhg=</encrypted>]]>&GetReportFormLimitRight;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7fKDsRh16dSWcJklvUputqJ6ZKqOfxuATEAw+ZKMq9sJsyWQUlNGnsYi80D4AzwTnnO1fXkrlLNiUvY3Jn01PVSVbkQuHxkw/SIQ6fD+to6o</encrypted>]]>
		  </text>
	  </command>
 <command event="Showing">
			<text>
				<![CDATA[<encrypted>WAx1EIzggWomp7TPxhHO3pTgjy2rJDbdwSEsg6CCv7rwYFeyqkzEnI0Yl0FVlrSnS9ZVMBblDwRjJy/Ih6Sv/cOZlY0kXKEHTSgymdoQTDkgdUBCPV1CE07hm8iGY2FrZzXLx6xfKilgqYibCP6jtHS1YKcYWvvNZK+LMwfCZTBJ3lDc4jUG2msylCtDzX3haq/lg+HPD+kAWODlBwR6E5zgJbHLQLrHvGWIKIT9qG48gCZUGdQ+hp9IHpvJqFlsC73QB9bTK66FMdM87/y4xQ==</encrypted>]]>&Form;<![CDATA[<encrypted>VfAQ9kahSaLQDNcRqzoSWFTYZ1C6AVn4AojxGeeLd3Om2qYrrFHJ2bmMBKSlLlv4s9e5F5KwppS/hbtXiuRgDLeGuy1EZbechg5wjksO2ekBOWVLLRy74OCpOvrE++eIeAvsmFDEdo3apObc22hmVnxj7WExSVXdlIbrMaFv+cRtSSc0XphqIhLhlg/tsbfKmBJZBK2dezHDY1/15JVjDe9MMVrJsN+C0hn/HJ0A3u5hvqMtzu0urzwB8scru9/z</encrypted>]]>&Form;<![CDATA[<encrypted>T7qyw9BdwS/13/WwaJD6f5t3O779mGWUpBDTzcGkThLxJu9EgKXkjgz05N+Ls51xtPZ/BHYuOo78boEwsls7A1RT9DHhovQVxDd/qSEhr1sVLSHlMt3PWBuflwZzZIk42Ng4B0LkgvfybEPvE75QcgAeXIPEEmtqSKRuHEMSpOKz9TBxolphieukfpKXf+iTY7lP8lEQJE8qa29Qsaqo2TgjKDwkogaJJeBs7q6RwbKPmCElBrDXtlpGstU6f/iEToTD5WWPSPuhW8wMhckx2D3ShhyxeD0mcxOcB95e46pqR232PmFlTQktymkGQDpS</encrypted>]]>
			</text>
		</command>
    &XMLWhenFilterClosing;
	  &XMLGetParameter;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>lcymwshU/F6CAbAH/gAD9NUycjXD9XMwEX7dHgGz1ySXFWcih/mk4/hK7qkAq1oOnrZGsHrDBJqQV1DXD+WuXDm9rMxt7OXn63h/TxD0MRaUYfxDI6VTX2EwN5idEi6wuOZ97kB2dhYDmLK4Jgg1MI5mWDD1s4I55hs5dS7cmxhZnT8wNyIAHUeGKuqBDwpSutSySX3tEwlgeQboy5PQFWjW3ZRlpgYAJoRCuGFQxcjepx6JMEvggHbWbM52VmHp</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
		&SetReportFormLimitRight;
      <![CDATA[<encrypted>ZM0Yhb1gBE0SIPvcuakKaxhJ8dtcxsrK7okdwU8JTy3dF63aNKKFrEY3N5RhaoLsGu8bS20JHYnffdd1ugpd64RH738/6MlzUYjuwlsX+5zRZzYLiync+vWyU16BDwcQWeMiASl9RC1iuso8qtJhwT1LppOGGZJXyMxpbSYGpfN6hjQA8uc++gTIVBPdr/YvwM6KkDIdbt0CTS20huCjLEM7lO96/DX60Ztoewes9LzE+Rz/BNtrElCvyiz58VAYDTMjPP5UcIfxRvBeyTYG5GG8vEspkGzHa481tOdxtiqo0+qaGsZBS5loOJbuVwKIUYRU6PBma3YvB7GZwthE/xlNgp9Y0ABloiGAilZS6zacZoi8xhR4Cu6hDcbeO6JwOtmHTcPxP/4SB2HNwdPc1otZAxIjb2TzrQCPRjOXslR62HrYDAQ37bt0axltGQu0DJZkMgx4DdgEgIeeb2tMcY4LQZHKYN+H1zL4ogF5eqNnf31P/ngEiyA2WxNAeSxOXrCeUB2Dx9CqZMiWrVhTmrbFAjxfKAGnx4QQupAnM7MNX+1uG0ArcX2k84huqgiSTHmmUS4Ojf62wLb7dHkV4z8D5etTfesMvZnPyzKCiBgRmbhyyJkvNbZFFMo+V5sZClcSTTb3APp2F4YWX95pIWLtk5tYwOr7DHcw02nSyEBTdXBDcsMXRsaBid34GpIKpjCDQ+y1EnZdTVEqy9BsF4+4t0XW0u7SI9RQTHLpAjUf2y0qZbaQACTGLWytIUpu1UUPdfCEt/xNeOnWjPANS5Q5k4yHW29JI27TbNrCjING52FwLdzY+h4MpdnJXC3Bm5GJqAMjaQsvhiMs7mI/Gyd1M9mgt0MEweWOxFPcZUo=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
