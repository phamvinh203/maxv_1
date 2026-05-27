<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "SObcbh2">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">

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
	<!ENTITY Form "SOBCBH2">
]>

<dir type="Report" id="1" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Ngày chứng từ từ" e="Voucher Date from"></header>
      <footer v="Từ ngày/đến ngày" e="Voucher Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Ngày chứng từ đến" e="Voucher Date to"></header>
    </field>
    <field name ="voucher_from" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ từ số" e="Voucher No. from"></header>
      <footer v="Chứng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name ="voucher_to" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>
	
	<field name="nh_theo" aliasName="nh_theoSobccn1" clientDefault="0">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
			<item value="">
				<text v="" e=""/>
			</item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn = 1)" check="kh_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
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

    <field name="tk_dt" categoryIndex="1">
      <header v="Tk doanh thu" e="Revenue Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tkdt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tkdt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="tk_vt" categoryIndex="1">
      <header v="Tk vật tư" e="Item Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="nh_vt1" categoryIndex="1">
      <header v="Nhóm hàng hóa" e="Item Group"/>
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

    <field name="ma_gd" categoryIndex="1">
      <header v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="20" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"></header>
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

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="tk_du" categoryIndex="9">
      <header v="Tài khoản" e="Reason"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" check="1= 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_vv" categoryIndex="9">
      <header v="Dự án" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="9">
      <header v="Phòng ban" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" categoryIndex="9">
      <header v="Hợp đồng" e="Contract ID"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
	  &XMLUserDefinedReportFields;
  </fields>

  <views>
    <view id="Dir" height="268">
      <item value="125, 30, 80, 110, 100, 130"/>
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="1101: [voucher_from].Description, [voucher_from], [voucher_to]"/>
	  <item value="1100--: [nh_theo].Label, [nh_theo]"/>
	  
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>

      <item value="110100: [tk_dt].Label, [tk_dt], [ten_tkdt%l]"/>
      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>

      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>

      <item value="11000: [ma_gd].Label, [ma_gd]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [maxLength]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="110100: [tk_du].Label, [tk_du], [ten_tk%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
	  &XMLUserDefinedReportViews;
      <categories>
        <category index="1" columns="125, 20, 90, 110, 110, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="9" columns="120, 20, 90, 110, 100, 130">
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
 <command event="Showing">
			<text>
				<![CDATA[<encrypted>WAx1EIzggWomp7TPxhHO3pTgjy2rJDbdwSEsg6CCv7rwYFeyqkzEnI0Yl0FVlrSnS9ZVMBblDwRjJy/Ih6Sv/cOZlY0kXKEHTSgymdoQTDkgdUBCPV1CE07hm8iGY2FrZzXLx6xfKilgqYibCP6jtHS1YKcYWvvNZK+LMwfCZTBJ3lDc4jUG2msylCtDzX3haq/lg+HPD+kAWODlBwR6E5zgJbHLQLrHvGWIKIT9qG48gCZUGdQ+hp9IHpvJqFlsC73QB9bTK66FMdM87/y4xQ==</encrypted>]]>&Form;<![CDATA[<encrypted>VfAQ9kahSaLQDNcRqzoSWFTYZ1C6AVn4AojxGeeLd3Om2qYrrFHJ2bmMBKSlLlv4s9e5F5KwppS/hbtXiuRgDLeGuy1EZbechg5wjksO2ekBOWVLLRy74OCpOvrE++eIeAvsmFDEdo3apObc22hmVnxj7WExSVXdlIbrMaFv+cRtSSc0XphqIhLhlg/tsbfKmBJZBK2dezHDY1/15JVjDe9MMVrJsN+C0hn/HJ0A3u5hvqMtzu0urzwB8scru9/z</encrypted>]]>&Form;<![CDATA[<encrypted>T7qyw9BdwS/13/WwaJD6f5t3O779mGWUpBDTzcGkThK9/tZUM8SCCBtzsyXwJZk77zl0G47TKB43/oriHk8gR382FPQVN4ISnEEjvYA9s61NuESdSnWIMFXnYnYTFLI0nwsCYdlO8LieaDd2NT1zUrWcR3+J8DaW6S9JIF3UP7L5oljZzSeyD4keqqUT496J2tl13fpVzCD7cSN4tcJI9G4NWBqRidjfJlPCkhZZHg9L5WAMFnnwB01YIo4Pz6uJW0HS9tdTnhX14uxsQ8rQvch6REI9TliUV1NDgjCdVXY=</encrypted>]]>
			</text>
		</command>
    &XMLWhenFilterClosing;
	  &XMLGetParameter;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>Let80D0Zwu9iY9cytyoFKvUVNBXDDKosuvJqBVaY10jSRODsw+t2L1ivibC+IJBBpRDWmRNl0JH2TZFRBKxObV7idltLFvk41t+9VbnoyvzoHKwk1WEaoRcwndbSgQ7pBP5PP8N7V7v7T0/x73rnLbbx6MussXAItJhiKy6HQwE=</encrypted>]]>&Identity;<![CDATA[<encrypted>SAS2xVFJ6hdR9SDE9dJbeQufFyScdbbh8SWKGG3vSHAbB+dxKSPSCJFH5u1tjdkKkP5oyYKn6NoDohlMC0v4dtawxyihCCpb9RQCWlyfRjVuQsXEXC4IhE/hIadmFX6hpjcYkAVSa2Q1CWnJv/7CXOdZ/ql8Yht4hD1tS+8zney76OSA9yW3ocvmJN5MS/LVWFV2lAsfxtQ8rsbStksJ7fdO9Eb+bg1BjKWc3JJqlNsQG3shImNglZEcmOWhwSTB+/I0pQ7/0ZFSsFWOE4LrgADhXqOfJFyacCJ38pbNNEJu89XWXALHf69FrtWrbZui</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
	&SetReportFormLimitRight;
      <![CDATA[<encrypted>3IIG3VvR8liMMNaL8yCXHY94Yv4KF9AAM5lwh5HOKTVQULHoIhpYeR0SuHCtYyv6C+MDzEZl4hELsbn0PXH1RzZJq6IfhLEfMiPocIBh1iUTvXi21dwNxUwpGSt6QSl2DdttV1i9ZDaotYuhSaXBuue7rIVs55mIlBmjv9uoMwf8Sq07/DBfWxMjg9TW5OqPS4HH9pigSHayOuddHqDbBWo571q6SBumkvHCXlenpKK994ZQ2sTtJiMeLk9XSvFVfWqPzlWO7Wv+ApWt4psPm2bgtKDaqJWODHS871KLwJnFC8zF2fjWa8EjcNSGGnGZg1lFGWdJPMjq+bnqK4hHEzc98Ccr+v5wSB72gV36M64DiZd7XlIaYAzrKu5zEAxAw9vpE583NC6gVBi03d6dqj40y0Ymoqr8JAruJGnQR7b8T/2ARqQGNAFy2rx3w/uvqJNYkpr9EgbyhBU3cqGvmlAS5k4F/EDIOextCNnxnjDXy4mUjRfdRyRJq0qHr/qUBavvo4zC3Blz2h2uP4KXMzPZxLAr8taO9HUwWu3Wk+OsRpL1LIrRNV3F/rvcjpIacn5WFSWoNzLnjohu4n7o5qTlcyYq7OzmTKgkWysVIZpRgH9xGAxz6tKvpex5p1E9xWlN8ZU52CaQ/ttlbYUdOOwZlfC09woPs05CXqgiaN9hqw+mWlNwUwMmAsGi0YRU6MMNezgqLizRSk1FJZelJg5UQNZ3eTYOK7YU7KFz4AcRhPGmOvMrz/Hto8AsfuPnVBixyuJ6yvNUpe0eRXg63RljlNr4jTNYtnSunxq7cPsgjdDdLk2XktzWY8cyMfSPIefc2jiZ4SjsDZD5X2pnv2P22QcqSG7PPBrApCT0WjM3tKaBeYfGKrJMXSQEsRk0P1TAwB7UJzSv0LQGlQnYGMhgv6H6i/0Q7Zj0BUOn2qUeho01dQS79fyzyGoDqBsQ</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
