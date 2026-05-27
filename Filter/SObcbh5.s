<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY Controller "SObcbh5">
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
	<!ENTITY Form "SOBCBH5">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ ngày" e="Voucher Date from"></header>
      <footer v="Từ ngày/đến ngày" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến ngày" e="Voucher Date to"></header>
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

	<field name="nh_theo" aliasName="nh_theoSobcbh5" clientDefault="0">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
			<item value="">
				<text v="" e=""/>
			</item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
	
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn = 1)" check="kh_yn = 1 or nv_yn = 1"/>
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
    <field name="ma_vt" categoryIndex="1">
      <header v="Mặt hàng" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="tk_dt" categoryIndex="1">
      <header v="Tk doanh thu" e="Revenue Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_tk_dt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
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
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu in chỉ có số lượng" e="Quantity Form"/>
        </item>
        <item value="20">
          <text v="Mẫu in chỉ số lượng và giá trị" e="Quantity and Values Form"/>
        </item>
        <item value="30">
          <text v="Mẫu in chỉ số lượng và giá trị ngoại tệ" e="Quantity and FC Values Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    &ReportDataTypeField;

    <field name="ma_gd" clientDefault="" categoryIndex="1">
      <header	v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>
    <field name="ds_ma_ct" hidden="true" readOnly="true" clientDefault="HB3" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="ma_nx" categoryIndex="9">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_nx%l"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="9">
      <header v="Dự án" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="9">
      <header v="Phòng ban" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" categoryIndex="9">
      <header v="Hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
	  &XMLUserDefinedReportFields;
  </fields>

  <views>
    <view id="Dir" height="234">
      <item value="120, 30, 80, 110, 110, 130"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>
	  <item value="1100: [nh_theo].Label, [nh_theo]"/>
	  
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [tk_dt].Label, [tk_dt], [ten_tk_dt%l]"/>
      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
	  <item value="11000-1: [ma_gd].Label, [ma_gd], [ds_ma_ct]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>

      

      <item value="110100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
		&XMLUserDefinedReportViews;
      <categories>
        <category index="1" columns="120, 30, 80, 110, 100, 130">
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
				<![CDATA[<encrypted>WAx1EIzggWomp7TPxhHO3pTgjy2rJDbdwSEsg6CCv7rwYFeyqkzEnI0Yl0FVlrSnS9ZVMBblDwRjJy/Ih6Sv/cOZlY0kXKEHTSgymdoQTDkgdUBCPV1CE07hm8iGY2FrZzXLx6xfKilgqYibCP6jtHS1YKcYWvvNZK+LMwfCZTBJ3lDc4jUG2msylCtDzX3haq/lg+HPD+kAWODlBwR6E5zgJbHLQLrHvGWIKIT9qG48gCZUGdQ+hp9IHpvJqFlsC73QB9bTK66FMdM87/y4xQ==</encrypted>]]>&Form;<![CDATA[<encrypted>in5QY6pT0wP70kToSE1ByzoFEWQ2/ThY/nJrimM44tXnAUyMNxlgLrHNA4MFl6lLsEPFP3g89UTZcmqtEZOIbGjx1tJSEmnu2w0g7rx2uX9wI/G7MibSUzhodS/Uw4kYqDs/FsFN2fzgyXORi1SCRH8FOTV5b7hDdovw9muJLzDwGWCY0mv20I0N9p53qmTBhHIKWQnVT7e1zwAbfk7onTTETxVgV3u5oKWMFc/yS+HRkcZiZ25AZUvvcr/qhP2a</encrypted>]]>&Form;<![CDATA[<encrypted>tnSxRhoCeJ+6LrpxGsoIZno2n4GE4uel4fDRWY7Uu8YjIg1OZiHhA7xczsq8o63k8JWiPqQkGIAFMnZIo5EB3nMt1CSIEQbTn7y8ktbkr3SGsw2ew3BqOFyzLIGIUg7j9c5uFXnttIt3dgpd/CLRPF2+fJS8NZuazr7bZNuzk2SOyCFkPntyQD4WoCw/hHVpsGEkPGMqMTxcatrAHtWjeURZBiczjDoFWrFAf7noi/9qr/LIHXgwlIAlGH/Twu7nekGKV2H2fMRhQouW0HOtLw2bk2oTOBKaOjee5nSzXikSD1MGeaaEhfMGVDtxouIO</encrypted>]]>
			</text>
		</command>
    &XMLWhenFilterClosing;
	  &XMLGetParameter;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>Let80D0Zwu9iY9cytyoFKvUVNBXDDKosuvJqBVaY10jSRODsw+t2L1ivibC+IJBBpRDWmRNl0JH2TZFRBKxObV7idltLFvk41t+9VbnoyvzoHKwk1WEaoRcwndbSgQ7pBP5PP8N7V7v7T0/x73rnLbbx6MussXAItJhiKy6HQwE=</encrypted>]]>&Identity;<![CDATA[<encrypted>9GWYgpitt1590tr+91qXGGqYvIAHVGPRlpqw+SDj0Sv1qldktNEPbf/aUkSrHCUSFa8xABWY3enOLbwdH6UkLHK8in9YRS/o8v31bKVcaXw+K7M2tjUcauQrAQeZVv+XFbw0/q5fftgMuXUFronYqypekI1N5mSCDf89ldZ31Fa7pvEkP767Epu7qQ6/arp40GmU/rIzuFlOLuD0q+cgqpjDWjj9WojhgpKmw/Qy/QONVIJ7/WRrfgdyQYnGMnNMtAzEnNSSsWGwvzE2I86/VfAXRVP9YaTHFdlC3gDS4vU=</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
	  &SetReportFormLimitRight;
      <![CDATA[<encrypted>So8cBBoiLLfRIt8I2Ecj/5Uf49OwVjtYjzInGih33LfXr/8t8eJc9PGPKdN02kuy69Crew0OFblf+kmAfuNXt7A1KBsYKfG2ZxUTsCbQwFhBiTiROhnDqVsuO0hp6uB0xQQPLp5M6g0+99PadRgCQ8YrgNmpLYsQzG7ZaNTh++j5CMF3SVRmlb99ROFmvtcH3R0ZPr/pypkIztSSYvMSEes6x4KfOMiJlXE+N3+rq6/mB6DWkqG/WHJSGlgjIljkTguN3xds50hHZ5ztstRPN2bxEqrKi4OOhKIFUC6EC/6WEiUK6iKSabFhX4I0cc3Ol7UwKyYtbBOvKrZ7/musSdefdU5ixS9vLOKNftYr+sy4Ty44P6wL0e3RXTZObyGGbtLNj3g7yqGm19sZMTRzwziyKM76kWoIDqj9V2uHpqGEM2/GzD261Jz1b6aq0ODEb5p2/M8wF6qi3feIRYCMJQlPbj4TK24j14/pwtyOLL/LR/0y6TEWx1jM6Q4wustM68T8Vd1o5keCbCE62GgK6rUO5CYB863No5LuFZleQGxm14INtwIyUo1KvBBH+TfguyqniGdcvTbsn4OMPQzrB3E46P0mWEP+UMpRUxWX8mqOD+qzdtEwpB+mjFwv4warcq586Q5LzKYamghAc3+1M7Z4OHu+FrMRR+/sDsflpMNceXAJfBTm/KGwmErRuC3ohVcdgcgNGe1P+aASR01T2CBTgn4Y+mT3AWz3e6r/GonDh8i2MM6vorK1GrYS4NDyLAEMf5NrEOZKBvsmRYxE0xpDOi1NU0sg/f/IyE4EIbDuQBiXu8rY8knk5wzQiMY+kCV7/mGc3e3TZTaKpCRwxG3KIeFTJq0Idd+4hN4l7TA2f3IRIumj6q+/ZoFoqE/Z5O40FYx2M7Q3MBqfEkp7x3b0ALXt098AkiyP9QOf3uKtggWQbaQqiMO4Lw0ZOwzfqO/cRbA3AoLOHM4AtyiMGBNBFm9g64vzrGLNVtm8kSeUzFywI9dajaCLX1WZIgSSiFALQOxLJzlENJP9+OBO+YlJC+z++OBnAZ+9Ra4uy9sj6tE75PLSZT0uhj86TFh/CLwSXXSjI5ANUGq9wX4keQ==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
