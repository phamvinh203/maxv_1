<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
	<!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
	<!ENTITY ReportDataTypeFieldUOM SYSTEM "..\Include\XML\ReportDataTypeFieldUOM.xml">
	<!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
	<!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
	<!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Controller "SObcbh1">
	<!ENTITY Identity "&Controller;">
	<!ENTITY FilterExpression "f._filter$Expression = '&quot;' + f._filter$Pattern + '&quot;.indexOf([ma_ct]) &gt;= 0;';">
	<!ENTITY XMLGetParameter SYSTEM "..\Include\XML\GetTransactionParameter.xml">

	<!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
	<!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
	<!ENTITY XMLUserDefinedReportFields SYSTEM "..\Include\XML\UserDefinedReportFields.txt">
	<!ENTITY XMLUserDefinedReportViews SYSTEM "..\Include\XML\UserDefinedReportViews.txt">
	<!ENTITY Form "SOBCBH1">
]>

<dir type="Report" id="1" xmlns="urn:schemas-maxv-com:data-dir">
	<title v="Điều kiện lọc" e="Filter Condition"></title>
	<fields>
		<field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
			<header v="Ngày chứng từ từ" e="Voucher Date from"></header>
			<footer v="Từ ngày/đến ngày" e="Voucher Date from/to"></footer>
		</field>
		<field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
			<header v="Ngày chứng từ đến" e="Voucher Date to"></header>
		</field>
		<field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
			<header v="Chứng từ từ số" e="Voucher No. from"></header>
			<footer v="Chứng từ từ/đến số" e="Voucher No. from/to"></footer>
			<items style="Mask"></items>
		</field>
		<field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
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
	
		<field name="ma_nvbh" aliasName="ma_nvbhSobccn1" categoryIndex="1">
			<header v="Nv bán hàng" e="Sales Employee"></header>
			<items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1=1"/>
		</field>
		<field name="ten_nvbh%l" readOnly="true" categoryIndex="1">
			<header v="" e=""></header>
		</field>
		<field name="ma_kh" categoryIndex="1" aliasName="ma_khSobccn1">
			<header v="Khách hàng" e="Customer"></header>
			<items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn=1 or nv_yn=1)" check="kh_yn=1 or nv_yn=1"/>
		</field>
		<field name="ten_kh%l" readOnly="true" categoryIndex="1">
			<header v="" e=""></header>
		</field>
		<field name="ma_kho" categoryIndex="1" aliasName="ma_khoSobccn1">
			<header v="Kho hàng" e="Site"></header>
			<items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1"/>
		</field>
		<field name="ten_kho%l" readOnly="true" categoryIndex="1">
			<header v="" e=""></header>
		</field>
		<field name="ma_vt" categoryIndex="1" aliasName="ma_vtSobccn1">
			<header v="Mã hàng" e="Item"></header>
			<items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1=1"/>
		</field>
		<field name="ten_vt%l" readOnly="true" categoryIndex="1">
			<header v="" e=""></header>
		</field>

		<field name="tk_dt" categoryIndex="1" aliasName="tk_dtSobccn1">
			<header v="Tk doanh thu" e="Revenue Account"></header>
			<items style="AutoComplete" controller="Account" reference="ten_tk_dt%l" key="status = '1'" check="1=1"/>
		</field>
		<field name="ten_tk_dt%l" readOnly="true" categoryIndex="1">
			<header v="" e=""></header>
		</field>
		<field name="tk_vt" categoryIndex="1" aliasName="tk_vtSobccn1">
			<header v="Tk vật tư" e="Item Account"></header>
			<items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1=1"/>
		</field>
		<field name="ten_tk_vt%l" readOnly="true" categoryIndex="1">
			<header v="" e=""></header>
		</field>
		<field name="tk_ht" categoryIndex="1" aliasName="tk_htSobccn1">
			<header v="Tk vật tư (hạch toán)" e="Item Account"></header>
			<items style="AutoComplete" controller="Account" reference="ten_tk_ht%l" key="status = '1'" check="1=1"/>
		</field>
		<field name="ten_tk_ht%l" readOnly="true" categoryIndex="1">
			<header v="" e=""></header>
		</field>

		<field name="nh_vt1" categoryIndex="1" aliasName="nh_vt1Sobccn1">
			<header v="Nhóm hàng hóa" e="Item Group"/>
			<items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
		</field>
		<field name="nh_vt2" categoryIndex="1" aliasName="nh_vt2Sobccn1">
			<header v="" e=""/>
			<items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
		</field>
		<field name="nh_vt3" categoryIndex="1" aliasName="nh_vt2Sobccn1">
			<header v="" e=""/>
			<items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
		</field>
		
		<field name="ma_dvcs" categoryIndex="1" aliasName="ma_dvcsSobccn1">
			<header v="Đơn vị" e="Unit"></header>
			<items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
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
	
		&ReportDataTypeFieldUOM;

		<field name="kieu_loc" dataFormatString="1, 2" clientDefault="1" align="right" categoryIndex="2">
			<header v="Kiểu lọc" e="Filter Type"></header>
			<footer v="1 - Tất cả các vật tư trong phiếu, 2 - Chỉ các vật tư theo mã trên" e="1 - All of Items in Invoice, 2 - Only Item Above"></footer>
			<items style="Mask"/>
		</field>
		<field name="ds_ma_gd" categoryIndex="2">
			<header v="Ds mã giao dịch" e="Transaction Code List"/>
		</field>
		<field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
			<header v="" e=""></header>
		</field>

		<field name="tk_du" categoryIndex="9" aliasName="tk_duSobccn1">
			<header v="Tài khoản" e="Item Account"></header>
			<items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1=1"/>
		</field>
		<field name="ten_tk%l" readOnly="true" categoryIndex="1">
			<header v="" e=""></header>
		</field>
		<field name="ma_vv" categoryIndex="9" aliasName="ma_vvSobccn1">
			<header v="Dự án" e="Project"></header>
			<items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1=1"/>
		</field>
		<field name="ten_vv%l" readOnly="true" categoryIndex="9">
			<header v="" e=""></header>
		</field>
		<field name="ma_bp" categoryIndex="9" aliasName="ma_bpSobccn1">
			<items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1=1"/>
			<header v="Phòng ban" e="Department"></header>
		</field>
		<field name="ten_bp%l" readOnly="true" categoryIndex="9">
			<header v="" e=""></header>
		</field>
		<field name="ma_hd" categoryIndex="9" aliasName="ma_hdSobccn1">
			<items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1=1"/>
			<header v="Hợp đồng" e="Contract"></header>
		</field>
		<field name="ten_hd%l" readOnly="true" categoryIndex="9">
			<header v="" e=""></header>
		</field>		
		&XMLUserDefinedReportFields;
	</fields>

	<views>
		<view id="Dir" height="288" anchor="5">
			<item value="130, 30, 80, 110, 100, 130, 0"/>
			<item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
			<item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>
			<item value="1100--: [nh_theo].Label, [nh_theo]"/>
			

			<item value="110100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
			<item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
			<item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
			<item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>

			<item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
			<item value="110100: [tk_ht].Label, [tk_ht], [ten_tk_ht%l]"/>
			<item value="110100: [tk_dt].Label, [tk_dt], [ten_tk_dt%l]"/>
			
			<item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
			

			<item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
			<item value="11000: [mau_bc].Label, [mau_bc]"/>
			<item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>

			<item value="111000: [kieu_loc].Label, [kieu_loc], [kieu_loc].Description"/>
			<item value="11000: [ds_ma_gd].Label, [ds_ma_gd]"/>

			<item value="110100: [tk_du].Label, [tk_du], [ten_tk%l]"/>
			<item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
			<item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
			<item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
			
			&XMLUserDefinedReportViews;
			
			<categories>
				<category index="1" columns="130, 20, 80, 100, 100, 130" anchor="6">
					<header v="Thông tin chung" e="General"/>
				</category>
				<category index="2" columns="130, 20, 80, 100, 100, 130">
					<header v="Lựa chọn" e="Option"/>
				</category>
				<category index="9" columns="120, 20, 80, 100, 100, 130" anchor="4">
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
				<![CDATA[<encrypted>WAx1EIzggWomp7TPxhHO3pTgjy2rJDbdwSEsg6CCv7rwYFeyqkzEnI0Yl0FVlrSnS9ZVMBblDwRjJy/Ih6Sv/cOZlY0kXKEHTSgymdoQTDkgdUBCPV1CE07hm8iGY2FrZzXLx6xfKilgqYibCP6jtHS1YKcYWvvNZK+LMwfCZTBJ3lDc4jUG2msylCtDzX3haq/lg+HPD+kAWODlBwR6E5zgJbHLQLrHvGWIKIT9qG48gCZUGdQ+hp9IHpvJqFlsC73QB9bTK66FMdM87/y4xQ==</encrypted>]]>&Form;<![CDATA[<encrypted>VfAQ9kahSaLQDNcRqzoSWFTYZ1C6AVn4AojxGeeLd3Om2qYrrFHJ2bmMBKSlLlv4s9e5F5KwppS/hbtXiuRgDLeGuy1EZbechg5wjksO2ekBOWVLLRy74OCpOvrE++eIeAvsmFDEdo3apObc22hmVnxj7WExSVXdlIbrMaFv+cRtSSc0XphqIhLhlg/tsbfKmBJZBK2dezHDY1/15JVjDe9MMVrJsN+C0hn/HJ0A3u5hvqMtzu0urzwB8scru9/z</encrypted>]]>&Form;<![CDATA[<encrypted>T7qyw9BdwS/13/WwaJD6f5t3O779mGWUpBDTzcGkThLxJu9EgKXkjgz05N+Ls51xtPZ/BHYuOo78boEwsls7A1RT9DHhovQVxDd/qSEhr1sVLSHlMt3PWBuflwZzZIk42Ng4B0LkgvfybEPvE75QcgAeXIPEEmtqSKRuHEMSpOKz9TBxolphieukfpKXf+iTY7lP8lEQJE8qa29Qsaqo2TgjKDwkogaJJeBs7q6RwbKPmCElBrDXtlpGstU6f/iEToTD5WWPSPuhW8wMhckx2D3ShhyxeD0mcxOcB95e46pqR232PmFlTQktymkGQDpS</encrypted>]]>
			</text>
		</command>
		&XMLWhenFilterClosing;
		&XMLGetParameter;
		<command event="Processing">
			<text>
				
				<![CDATA[<encrypted>gKIQSIpk59q+HfIXN0hgeD3nsbB1U0U0vKSYYjt2SDPsBgtOsnH847HSXd9fJ9bN5DiWvnRr9Qy9jIWob49yjTRowlVcc/vZ1wtjF1NOCU2bN97wGwUai/7eU+A7eHBhjOWDoQA2eLFMXYUpZ3U5JS+5xzf0tKVtQ2qMcJzzDGs=</encrypted>]]>&Identity;<![CDATA[<encrypted>cMaGAc68ILmnfpgYRXX4ODkwqrVhLfsXO+kMfCviMRcYHtED6G9iMKCxQzXGEhnHlaqB9890olBLQssgiEpK1Wd1wE/n4qP9GDSO81M+6f8xZfwhbNH47nxZ4pyIsQK6yEPKfUl/QvkfcrzLZvXOK9Bw6CvJXyhMBLcUtwtc8CYbRiYtYEON+Go+okxMMAuk9cyeopHcnK1mvnzuc2EGAYRY0TqTWWA+9PswdS4Pwjv3dy8YaPusJMFxM/DgbZz8yfGFpwkc2xtXZAzfvSKYuThmULWmeuZfr90WS2V5z9w1id5kkPJ9Mcq0ExcVg4EwlOBntj18hKmS9UsVTfrQ8w==</encrypted>]]>
			</text>
		</command>
	</commands>

	<script>
		<text>
			&OutlineEntry;
			&SetReportFormLimitRight;
			<![CDATA[<encrypted>N29L+VtGr6PC25V0sTFC39C+KXM4MMK0PDBhnw8btuc8C8lpko0HANx7gN02ooFPa4AqjyE86axOuqHwxl/BuM5irnTEit5ipZTB2wLd2MBevLyR8Fj2jOzagcHhcH17y0U89uVZl02az2xkWT+t7Cz730CjyGFlCWR2BrurhlzA/JZlpRvdyO3mxQoUF0P/WvWpvs1eXsLb9Z5UJ01NZJ418irbCLt+4mHwtAZ//Wx6Gc/5N06ZeJl8Y7wD6sQ1ingXmQXJt2pdAd9/nsOOsD1cdegqVWDodXBAVG+Jk+1PC2S3/f6Jz5uus5pvgGHXT6BPAqs8zFzNjKXgTVmfGCy203PGOPEwMstQ0BKKQ8X0WNlate8PF47j2g85ByFFCG9fvwbpwzPTqVi2IYuVNTHeWPVBWOAtdS4LEQcWsLhHVBUrCKmapzJDAC0z9LAzhtwxpo7B8TRR1saTqDDokEZdfbsVVspluataIN9SynBq931EJejKur60NmwvA9mx/mR1yVdL5iTYcqT5WUH8w+/YUg01R1X3PZTTBobWlSWKkuOlwoSCB1Fi6Kz1DKL+fu390igaQ506OeB3WrckM33W5on07frZ0MFH1CZUMO4ozpd9UC9EdLn1rbRvwZVFZl6qKE3xjISyUuz+48eLHkmP2OIxwpefDDG0MgYfDqB6SO63KCQ7r1ad9aWDXYPGgckdgZvAXgZWjzVH3T7EvShfBbX4b1MWdMIOzlMWqElqdesW+ZSP96s7YFai+HOdp5eCp61Mo7Ja540u+ujmjMMKEPXcpl/t0ZDfX/AlKEtZM0MMpqde39AG78hEDJYNbIXHVTW/WlTls8F4ANfVvpy+iQte26D76Kfb1MCa9f9dT+9n7fsG68UupqCedMv77wdeVyhJ0BFOB+JDwil2+uwIwvaeyxQDFKbPZT5l9tBRRiflWADdj7/xsYk0+XyIqD88VW8wXWg3GvCm/RkUtZFFOUq5wobtHXHru91u4/EP2UQw+ZJm4fDVqjzhQzvziKrD0JLPEDPVr792rU7tryjg5geIPgb/jyNwSkLS5uQ=</encrypted>]]>
		</text>
	</script>

	&OutlineCss;
</dir>
