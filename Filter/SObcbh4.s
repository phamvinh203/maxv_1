<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY Controller "SObcbh4">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

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
	<!ENTITY Form "SOBCBH4">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ" e="Voucher Date from"/>
      <footer v="Từ ngày/đến ngày" e="Voucher Date from/to"/>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến" e="Voucher Date to"/>
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

	<field name="nh_theo" aliasName="nh_theoSobcbh4" clientDefault="0">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
			<item value="">
				<text v="" e=""/>
			</item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
	
    <field name="ma_vt" categoryIndex="1">
      <header v="Mặt hàng" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_nvbh" categoryIndex="1">
      <header v="Nv bán hàng" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn=1 or nv_yn=1)" check="kh_yn=1 or nv_yn=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="tk_dt" categoryIndex="1">
      <header v="Tk doanh thu" e="Revenue Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_tk_dt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="tk_vt" categoryIndex="1">
      <header v="Tk vật tư" e="Item Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1= 1"/>
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

	<field name="ma_gd" clientDefault="" categoryIndex="1">
      <header	v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ma_nx" categoryIndex="9">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_nx%l" check="1= '1'"/>
    </field>
    <field name="ten_nx%l" readOnly="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_vv" categoryIndex="9">
      <header v="Dự án" e="Project"/>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_bp" categoryIndex="9">
      <header v="Phòng ban" e="Department"/>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_hd" categoryIndex="9">
      <header v="Hợp đồng" e="Contract"/>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" categoryIndex="9">
      <header v="" e=""/>
    </field>

    <field name="ds_ma_ct" hidden="true" clientDefault="HB4,HB1" categoryIndex="1">
      <header v="" e=""/>
    </field>
	  &XMLUserDefinedReportFields;  
  </fields>

  <views>
    <view id="Dir" height="258">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="1101: [voucher_from].Description, [voucher_from], [voucher_to]"/>
	  <item value="1100: [nh_theo].Label, [nh_theo]"/>
	  
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [tk_dt].Label, [tk_dt], [ten_tk_dt%l]"/>
      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
	  <item value="11000-1: [ma_gd].Label, [ma_gd], [ds_ma_ct]"/>
	  
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [maxLength]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>

      

      <item value="110100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
		&XMLUserDefinedReportViews;
      <categories>
        <category index="1" columns="120, 30, 80, 100, 100, 130">
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
        <![CDATA[<encrypted>Let80D0Zwu9iY9cytyoFKvUVNBXDDKosuvJqBVaY10jSRODsw+t2L1ivibC+IJBBpRDWmRNl0JH2TZFRBKxObV7idltLFvk41t+9VbnoyvzoHKwk1WEaoRcwndbSgQ7pBP5PP8N7V7v7T0/x73rnLbbx6MussXAItJhiKy6HQwE=</encrypted>]]>&Identity;<![CDATA[<encrypted>jExWby7GDURli4ysUE7FITw/gFl2VX62yPIHrpfTx7COqE3C18gj7do4UjHMg59SQz3Ewrb9/YnSReyen2lnJ4URuNkLPDqdBPkDf5KKxIf2WEKGCJPLciQOlfW+EoaFpt+CZi6G5XKZZ+VNBEdWQuJPIQn/8pnPvj3dVH9EzgtP+cn0PiJnSX+oL2c/niN2LmopVHyaEe7oqF/Q3PCF8ZpCbgGpKZNy7V7KoinBEOy1mDB+ekf/JilO+sVzZxcg3jKGDAMQV/O6XF0NqxpqnNVfMVIY6ENn3WPV4am/VuM=</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
	  &SetReportFormLimitRight;
      <![CDATA[<encrypted>So8cBBoiLLfRIt8I2Ecj/xt1YOOf5a+WUhKyiSSd5GvSTJLKkHzKrJODhF18J7NsYWszG8FFih3AKoHaUFhlr1S2co3S585SNZ/ylQLXNGvGGRD3NbCTjyiHCUlC17nN30YCEF84wSA1OH7NRQULsacGMpIipPCZIzaFjG5XK2NjvWf2G5Jl42NZ8i4qpt8P4oAlET0i4lr55U1k/Hiry2f/1gUyGvwk3gd9sJPAzJkvGJGcKKj0n+kxcG87PxO7VEqfKcMSpPfJ1VdTIFf5dCcsHmfAzSCbFsJK+0/ENt8YaZJKUG5lrG64CdQbEfJJIWQ4VMUhi9PRVa5i2hUxsvmI8Av2MKwRGahc3VnBZbqrj0ZkQAYAQ1ZW//KULlJmQWkmCc/FP4xrhHH7A6cgE/KzofH2JYru8ZbHWokyyIhEth0is/CxTBn/BZ7xt93OD66Jh8O1z0aXmmce1YLgVEsIqDafGKdK4bjG5JPsVaMIjuVszpaf0revncI7jtbtdgA16yOEo9ip5HcyS2WfReNVJzRDhI85CD4uDR32BtQ6fD/sNY/JNKhxGKf9k+ynQymNwLq1JHWANG3nmI2bcPb7DsAeKPowmoD/dOKZ9iCF8s2+RjKakrLEWsp8Yuqbfx5N2Uv0knn1tB/SfY0mSrLCvgZm8kq05CbT25j32R/3QYIM24d9z4DeHlOCv5q2TtiJ0r6P50Er9KzSkkHV548KSSgvdilp86huP3K8tOJB1o1ycTXBODUcGZzdfMyU84GBzkZoy0x0kllFqOw7GYTh+ZFDdf2HntnL/1EYirVJBqzilcjYf9KI5rOWVBn5n+crwvGspsCVBLqXVMrrRfL4qyUy1mOHg81XnhXQiVfTaz6N6mO2yt49BbNuN+DI7aJE0dIlUEdbV7qwqYxHBTpU0JhNY4c2x9qYz8fmZets3g0D4BzhNITMOVoijstXiL4LdhGzKnvndeaLUmKUT2ab0Z80jU0SRAKjkQuRCM5a6W6ZwnKFNGUKNyfepKsgsUQ4cjfW7a3mnq9YT9IQQjWPPXy0hs2O/52Y1MSfcefOAhwQ1T4A4nGJUHwEUwK3nHmPinq+rqY/VaFmPLAKGnT+5SBSNItg0W+z7IBvX2U=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
