<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY XMLWhenFilterInit SYSTEM "..\Include\XML\WhenFilterInit.xml">
	<!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
	<!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
	<!ENTITY ScriptFilterInit SYSTEM "..\Include\Javascript\FilterInit.txt">
	<!ENTITY TableDetail "d25">
]>

<dir table="m25$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
	<title v="Điều kiện lọc" e="Filter Condition"></title>
	<fields>
		<field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
			<header v="Hóa đơn từ ngày" e="Invoice Date from"></header>
			<footer v="Ngày hóa đơn từ/đến" e="Invoice Date from/to"></footer>
		</field>
		<field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
			<header v="Hóa đơn đến ngày" e="Invoice Date to"></header>
		</field>
		<field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
			<header v="Số hóa đơn từ/đến" e="Invoice No. from/to"></header>
			<items style="Mask"></items>
		</field>
		<field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
			<header v="" e=""></header>
			<items style="Mask"></items>
		</field>
		<field name="ma_gd" categoryIndex="9" filterSource="master" operation="10">
			<header v="Mã giao dịch" e="Transaction Code"></header>
			<items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = 'HB4' and status = '1' " check="ma_ct = 'HB4'"/>
		</field>
		<field name="ten_gd%l" readOnly="true" external="true">
			<header v="" e=""></header>
		</field>
		<field name="loai_ct" hidden="true" filterSource="master" operation="15">
			<header v="" e=""></header>
		</field>
		<field name="ma_kh" filterSource="master" operation="20">
			<header v="Mã khách hàng" e="Customer"></header>
			<items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
		</field>
		<field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
			<header v="" e=""></header>
		</field>
		<field name="tk" filterSource="master" operation="30">
			<header v="Tk công nợ" e="AR-AP Account"></header>
			<items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and tk_cn = 1 and status = '1'" check="loai_tk = 1 and tk_cn = 1"/>
		</field>
		<field name="ten_tk%l" readOnly="true" external="true">
			<header v="" e=""></header>
		</field>
		<field name="ma_nt" categoryIndex="9" filterSource="master" operation="40">
			<header v="Mã ngoại tệ" e="Currency"></header>
			<items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
		</field>
		<field name="ten_nt%l" readOnly="true" external="true">
			<header v="" e=""></header>
		</field>

		<field name="ma_kho" categoryIndex="1" filterSource="detail" operation="10">
			<header v="Mã kho" e="Site"></header>
			<items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1" information="&TableDetail;"/>
		</field>
		<field name="ten_kho%l" readOnly="true" external="true">
			<header v="" e=""></header>
		</field>
		<field name="ma_vt" categoryIndex="1" filterSource="detail" operation="20">
			<header v="Mã vật tư" e="Item"></header>
			<items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="&TableDetail;"/>
		</field>
		<field name="ten_vt%l" readOnly="true" external="true">
			<header v="" e=""></header>
		</field>

		<field name="tk_du" categoryIndex="1" filterSource="detail" operation="30">
			<header v="Tk đối ứng" e="Corr. Account"></header>
			<items style="AutoComplete" controller="Account" reference="ten_tk_du%l" key="status = '1'" check="1 = 1" information="&TableDetail;"/>
		</field>
		<field name="ten_tk_du%l" readOnly="true" external="true">
			<header v="" e=""></header>
		</field>

		<field name="ma_dvcs" categoryIndex="-1">
			<header v="Đơn vị" e="Unit"></header>
			<items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
		</field>
		<field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
			<header v="" e=""></header>
		</field>

		<field name="status" dataFormatString="*, 0, 1, 2" clientDefault="*" align="right" inactivate="true" categoryIndex="9">
			<header v="Trạng thái" e="Status"></header>
			<footer v="Ký tự &lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Hiện tất cả các trạng thái" e="&lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Show all status information"></footer>
			<items style="Mask"/>
		</field>
		<field name="user_id0" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
			<header v="Người sử dụng" e="User"></header>
			<footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
			<items style="Mask"/>
		</field>
	</fields>

	<views>
		<view id="Dir" height="88">
			<item value="120, 30, 70, 100, 230, 0"/>
			<item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
			<item value="1101: [so_ct1].Label, [so_ct1], [so_ct2]"/>

			<item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
			<item value="11010: [tk].Label, [tk], [ten_tk%l]"/>

			<item value="11010: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
			<item value="11010: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
			<item value="11010: [tk_du].Label, [tk_du], [ten_tk_du%l]"/>

			<item value="110101: [ma_gd].Label, [ma_gd], [ten_gd%l], [loai_ct]"/>
			<item value="11010: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
			<item value="11100: [status].Label, [status], [status].Description"/>

			<item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
			<item value="11100: [user_id0].Label, [user_id0], [user_id0].Description"/>

			<categories>
				<category index="1" columns="120, 30, 70, 100, 230">
					<header v="Chi tiết" e="Detail"/>
				</category>
				<category index="9" columns="120, 30, 70, 100, 230">
					<header v="Khác" e="Other"/>
				</category>
			</categories>
		</view>
	</views>

	<commands>
		&XMLWhenFilterInit;
		&XMLWhenFilterLoading;
		&XMLWhenFilterClosing;
	</commands>

	<script>
		<text>
			&ScriptFilterInit;
			<![CDATA[<encrypted>BxoqM2sdFcMntWnc+NPsdA+iupCOVGpTuauCyg/sXew8OFyn8QqDGNh1cXrR+EB0vavMjYt2Oz2OY8bMY1T3A40u51h3aipQVvPC6KTLLGNoHXESH46xwvCytQZtg7pDLOT0SAwV38lI5268hp6+Jum6ovcUJ5/5XrXW8aGVo/YDRAQ4S+DgHakEoNriJ+lhVQ9oqoL+yxlMQxNTAOrjE1CtmUMTpUtuY8C8IGG+AhoIP/xiu5kzixai0tHXHvz5tplAqhhIdAeQhOYCS4I18PsmvnKebc888aRCV7f0gZQ=</encrypted>]]>
		</text>
	</script>
</dir>
