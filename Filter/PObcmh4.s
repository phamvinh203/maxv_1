<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY Controller "PObcmh4">	
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
	<!ENTITY Form "POBCMH4">
]>

<dir type="Report" id="1" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ ngày" e="Voucher Date from"></header>
      <footer v="Từ ngày/đến ngày" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="Voucher Date to"></header>
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
	<field name="nh_theo" aliasName="nh_theoSobcmh4" clientDefault="1">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
			<item value="">
				<text v="" e=""/>
			</item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
	
    <field name="ma_kh" categoryIndex="1">
      <header v="Nhà cung cấp" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn=1 or nv_yn=1)" check="cc_yn=1 or nv_yn=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="tk_vt" categoryIndex="1">
      <header v="Tk vật tư" e="Item Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
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

    <field name="loai_bc" dataFormatString="1, 2, 3" clientDefault="2" align="right" categoryIndex="2">
      <header v="Loại báo cáo" e="Report Type"></header>
      <footer v="1 - Mẫu thường, 2 - Mẫu nhập mua, 3 - Mẫu nhập khẩu" e="1 - Common, 2 - Purchase, 3 - Import"></footer>
      <items style="Mask"/>
    </field>

    <field name="tinh_ps" clientDefault="1" categoryIndex="1" hidden="true" readOnly="true" disabled="true">
      <header v="Tính ps điều chuyển" e="Include Transfers"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không tính phát sinh điều chuyển kho" e="Not Include Transfers"/>
        </item>
        <item value="1">
          <text v="Tính phát sinh điều chuyển kho" e="Include Transfers"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="ds_ma_gd" clientDefault="" categoryIndex="2">
      <header v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-109" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ma_nx" categoryIndex="9">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_nx%l"/>
    </field>
    <field name="ten_nx%l" readOnly="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="9">
      <header v="Dự án" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="9">
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
      <header v="Phòng ban" e="Department"></header>
    </field>
    <field name="ten_bp%l" readOnly="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" categoryIndex="9">
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
      <header v="Hợp đồng" e="Contract"></header>
    </field>
    <field name="ten_hd%l" readOnly="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>

    <field name="ds_ma_ct" hidden="true" clientDefault="PD1, PD2, HM1, HMA, HMC, HMB" categoryIndex="2">
      <header v="" e=""/>
    </field>
	  &XMLUserDefinedReportFields;
  </fields>

  <views>
    <view id="Dir" height="230">
      <item value="130, 20, 85, 105, 105, 40, 0"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>
	  <item value="1100--: [nh_theo].Label, [nh_theo]"/>

      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>

      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="110111: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3],[tinh_ps]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="111000: [loai_bc].Label, [loai_bc], [loai_bc].Description"/>
     
      <item value="110000-1: [ds_ma_gd].Label, [ds_ma_gd], [ds_ma_ct]"/>

      <item value="110100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
		&XMLUserDefinedReportViews;
      <categories>
        <category index="1" columns="120, 20, 85, 105, 105, 40">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 255, 0, 0">
          <header v="Lựa chọn" e="Option"/>
        </category>
        <category index="9" columns="120, 20, 85, 105, 105, 40">
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
        <![CDATA[<encrypted>Let80D0Zwu9iY9cytyoFKvUVNBXDDKosuvJqBVaY10jSRODsw+t2L1ivibC+IJBBpRDWmRNl0JH2TZFRBKxObV7idltLFvk41t+9VbnoyvzoHKwk1WEaoRcwndbSgQ7pBP5PP8N7V7v7T0/x73rnLbbx6MussXAItJhiKy6HQwE=</encrypted>]]>&Identity;<![CDATA[<encrypted>sr2s/opNDAcy1Gy6NVmBqOKgzy2hl1A2qjfrF9DbBlCFv3wTewGKnoGDPIWMhOWYdmIijNLbcorq32CaN/lMazUJ5Q2kcnLrHVUrU5DiufDUDa+/7B29BwoM99S/XaZ6QP/UBgPQSD8B63d2MvluMdBT+BgM3yzsLxhZwwK5laGjhT/yHzAHOdh1kUk/RMCX/jQXC63QE1ZBXXOqvpIKU4RLYm3nPT1OXhqqnkKzZr15lvxCnoIZjens4lc9/26waJ9+TU5JAgKMefnI+VhfMugd9L01Fcxl9WFD3zWJ87K65GGsVcGKVZfcD9d3T1NY</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
	  &SetReportFormLimitRight;
      <![CDATA[<encrypted>XvCnKvpYlPCrvQOCOiNNK7RcOYvmfXJ0uChBML1GxBjd13Jej+FGn6AbiyQ4uy+dTAhF1vxkmjYNC2pu0McqkOlMjLafLPgoytSQYMvEnn2E+C9cCEkChSJq0bFSzW6F9Hkpvfw+ILaRLqrUDJ+bwTBcV29u7Aq5OjcTwKwN2/a9dzpBqGsJATYwJmBkodWtPjhm08avPFgcAkXSKRD37u1ykgfxWE0OGaCq9jMVytHsAoeoR97xH/iqQIOM8hG6oFhMdSFoDR0ITA804YGknhD3L4WladOOqbwyXjyeqVmGZkj1UtYDTnTXNMwNbKUKVpA/aBLxTdtQgCw3FRmnhrHkOmxXi/3NeEaMpzrVht066okJJmpX1BVV8BGlZealXLOqchNInJW+OE4ZESekTugJPTLq4hMyn5ls1FpNAKj4dZ3frR1/MaEWyVrgiOC8SgQqQIoQszIwvDYECvBb/weOdt77WbBL22WiE7URtEUEVkFkpkQYuq79JbOmLszPVo5AWunUlTx8muG6CE5VbbmgMxK/NYbOCz7XqUikex3UHXQtLmbvhT6+cOkqnfddKEuivO9DW+H/0DGtdurU9o+Sz0F3l3TYl/Ba2P8CL10C3HlDhEJl0VGC65dxjBGucvvJfDiEf3mcKelXN/ujVbRIW/lYGVG79MD2xgORLOzaHzpwmZfj1BLVHRwi8Dc143nav5Rim1sJSy1SWGyChRGeoepu1FFZ62drGDPADAxvjFasdR0SNJwXWK6TnZ4j9bZW6ojaCn2Z1mkLQZ0s5N/G7L/IMlMq2hiUrFT8ja+oowVZjqR6h0agQWgO2aVPaYs1HSRJZb6yf6KEd8gcR3dghbUIe2R5mnBj9aODycm7kW1F62Eu/SsEB1Fj7CEckJKL4k8SQ9oJW5IYGSWnw9/D6mimJn3Uwt4vr1aHipdAo0t+fQevOfkLRY/wKcTPvXqiLyu3FS/vgUQfWvUck5g6V400l0RfY5ku5yxDf9oaJtznwxXuMOTuvRb7233UaAk9QT61+VrnmdfWAaTlODTlEB6vHpaYKt9PQDzJPCdm+04HcdCrphycLjUJMD4WTzbpPIwoqYJUI48eZRuzlJq5IpjpIPKxExThJdtahONjFTwthZKUJB4VYea3G46gHAY5Vw+d/AYcW1qJh1bJezNULVCDh22Qdtaduj5uZjsjO/D+XJhl+pSQS86fz3C6</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
