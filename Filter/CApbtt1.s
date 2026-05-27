<?xml version="1.0" encoding="utf-8"?>
<!--C-->
<!DOCTYPE dir [
	<!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
	<!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
	<!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
	<!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

	<!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
	<!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
	<!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
	<title v="Điều kiện lọc" e="Filter Condition"/>
	<fields>
		<field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
			<header v="Hạch toán từ ngày" e="GL Date from"></header>
			<footer v="Hạch toán từ/đến ngày" e="GL Date from/to"></footer>
		</field>
		<field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
			<header v="Hạch toán đến ngày" e="GL Date to"></header>
		</field>
		<field name="ma_kh">
			<header v="Khách hàng" e="Customer"></header>
			<items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn=1 or nv_yn=1)" check="kh_yn=1 or nv_yn=1"/>
		</field>
		<field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
			<header v="" e=""></header>
		</field>
		<field name="tk">
			<header v="Tài khoản" e="Account"></header>
			<items style="AutoComplete" controller="Account" reference="ten_tk%l" key="tk_cn = 1" check="tk_cn = 1"/>
		</field>
		<field name="ten_tk%l" readOnly="true" external="true">
			<header v="" e=""></header>
		</field>
		<field name="ma_nt">
			<header v="Mã nt" e="Account"></header>
			<items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" />
		</field>
		<field name="ten_nt%l" readOnly="true" external="true">
			<header v="" e=""></header>
		</field>

		<field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
			<header v="Hóa đơn từ/đến số" e="Invoice No. from/to"></header>
			<items style="Mask"></items>
		</field>
		<field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
			<header v="" e=""></header>
			<items style="Mask"></items>
		</field>
		<field name="loai_pb" dataFormatString="0, 1, *" clientDefault="*" align="right">
			<header v="Tính số dư" e="Balance"/>
			<footer v="0 - Chưa phân bổ hết, 1 - Đã phân bổ hết, * - Tất cả" e="0 - Unallocated, 1 - Allocated, * - All"></footer>
			<items style="Mask"/>
		</field>
		<field name="ma_dvcs">
			<header v="Đơn vị" e="Unit"></header>
			<items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
		</field>
		<field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
			<header v="" e=""></header>
		</field>
	</fields>

	<views>
		<view id="Dir" height="126">
			<item value="135, 35, 20, 55, 100, 100, 130, 0"/>
			<item value="11001---: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
			<item value="110011--: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
			<item value="1100100-: [tk].Label, [tk], [ten_tk%l]"/>
			<item value="1100100-: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
			<item value="110100--: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
			<item value="110000--: [ma_dvcs].Label, [ma_dvcs]"/>
			<item value="1110000-: [loai_pb].Label, [loai_pb], [loai_pb].Description"/>
		</view>
	</views>

	<commands>
		&XMLWhenFilterLoading;
		&XMLWhenFilterClosing;

		<command event="Processing">
			<text>
				<![CDATA[<encrypted>HSEfj6zv0Zay3ROcGijPQyYZ9upOsNzZEWer8Jwhvtez6uPK0YOELeO8hEl9quRIIsMvOFbS7AwUZStTALydWCVqeAotSNWZD+QsLKaTCGdTkhUhWCTSJpvVc25edRkJvtrBP8QFcyZORXulVWZ5/f8KIpQXe94cN966PXkwYlQ=</encrypted>]]>
			</text>
		</command>
	</commands>

	<script>
		<text>
			&OutlineEntry;
			<![CDATA[<encrypted>fUuMZdwcfcygKFgKd/fRsf87GH6WVaznW/zpT6W3oW0GCeJE1nyiukJfRpBNPR2H/zljKDa+boZGH5Y9IjrCn7FSplOpYXc+AK4OWtlpNXXHeKikO46izglqcuEZNUaKuMCx7PEz0ri6cLYzDak2fz5TEP/SiWWvxSOZ8pupLXJDzhptif8OYKs9Cgiw66mVoT8HlSd1U5aDb6zNPaeVl1Sh7J+hMacdz+bKrmdUE74WwK5UseqeCZeUagHYa2+r/Z+W2THUdMQb4esTMdUuK4AMASo4jC27fmkxvZ0rf2jtWFzQCskvXFOBJAskIViMeloAvCCjEANLijgvjCNecUJYTQYEshcVnLUM2RYsvygw8LQsvUPkWyzPAoCLzFpSF9NNbDaSIgZ7e8/P8Jy5MasRWhix52t1snixWyfigjQ=</encrypted>]]>
		</text>
	</script>

	&OutlineCss;
</dir>
