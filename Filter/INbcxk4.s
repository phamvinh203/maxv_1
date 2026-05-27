<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY Controller "INbcxk4">
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
	<!ENTITY Form "INBCXK4">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ" e="Voucher Date from"/>
      <footer v="Từ ngày/đến ngày" e="Voucher Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến" e="Voucher Date to"/>
    </field>
    <field name="so_ct1"  align="right" dataFormatString="@upperCaseFormat">
      <header v="Chứng từ từ/đến số" e="Voucher No. from/to"/>
      <items style="Mask"/>
    </field>
    <field name="so_ct2" align="right" dataFormatString="@upperCaseFormat">
      <header v="" e=""/>
      <items style="Mask"/>
    </field>
	
	<field name="tk_no" aliasName="tk_noInbcxk4">
      <header v="Tk nợ" e="Debit Account"/>
      <items style="AutoComplete" controller="Account" normal="true" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
	
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" normal="true" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Nguyên vật liệu" e="Item"/>
      <items style="AutoComplete" controller="Item" normal="true" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" normal="true" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="tk_vt" categoryIndex="1">
      <header v="Tài khoản vật tư" e="Item Account"/>
      <items style="AutoComplete" controller="Account" normal="true" reference="ten_tkvt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tkvt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_loai_vt" categoryIndex="1">
      <header v="Loại vật tư" e="Item Type"/>
      <items style="AutoComplete" controller="ItemType" normal="true" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_nh1" categoryIndex="1">
      <header v="Nhóm vật tư" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" normal="true" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ma_nh2" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" normal="true" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ma_nh3" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" normal="true" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" categoryIndex="1" clientDefault="20">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu in chỉ có số lượng" e="Quantity Form"/>
        </item>
      </items>
    </field>

    &ReportDataTypeField;

    <field name="tinh_ps" categoryIndex="2">
      <header v="Tính ps điều chuyển" e="Include Transfers"/>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="0">
          <text v="Không tính phát sinh điều chuyển kho" e="No Include Transfers"/>
        </item>
        <item value="1">
          <text v="Tính phát sinh điều chuyển kho" e="Include Transfers"/>
        </item>
      </items>
    </field>

    <field name="ma_gd" categoryIndex="2">
      <header	v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>

    <field name="ma_nx" categoryIndex="3">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" normal="true" reference="ten_nx%l" check="1 = 1 "/>
    </field>
    <field name="ten_nx%l" readOnly="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
    <field name="ma_vv" categoryIndex="3">
      <header v="Dự án" e="Project"/>
      <items style="AutoComplete" controller="Job" normal="true" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
    <field name="ma_bp" categoryIndex="3">
      <header v="Phòng ban" e="Department"/>
      <items style="AutoComplete" controller="Department" normal="true" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
    <field name="ma_hd" categoryIndex="3">
      <header v="Hợp đồng" e="Contract"/>
      <items style="AutoComplete" controller="Contract" normal="true" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
	
	<field name="ma_sp" categoryIndex="3">
      <header v="Sản phẩm" e="Product"/>
      <items style="AutoComplete" controller="Product" normal="true" reference="ten_sp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_sp%l" readOnly="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
	
    <field name="lenh_sx" categoryIndex="3">
      <header v="Lệnh sản xuất" e="Manufacturing Order"/>
      <items style="AutoComplete" controller="MO" reference="ten_lenh_sx%l" check="1 = 1"/>
    </field>
    <field name="ten_lenh_sx%l" readOnly="true" categoryIndex="2">
      <header v="" e=""/>
    </field>

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
    <field name="ds_ma_ct" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="234">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11011-: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
	  <item value="110100: [tk_no].Label, [tk_no], [ten_tk%l]"/>
	  
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tkvt%l]"/>
      <item value="110100: [ma_loai_vt].Label, [ma_loai_vt], [ten_loai_vt%l]"/>
      <item value="11011-: [ma_nh1].Label, [ma_nh1], [ma_nh2], [ma_nh3]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="110000--: [tinh_ps].Label, [tinh_ps]"/>
 
      <item value="110000-1: [ma_gd].Label, [ma_gd], [ds_ma_ct]"/>

      <item value="110100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
	  <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
	  
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
	  <item value="110100: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
	  <item value="110100: [lenh_sx].Label, [lenh_sx], [ten_lenh_sx%l]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 5, 220, 130, 0">
          <header v="Lựa chọn" e="Option"/>
        </category>
        <category index="3" columns="120, 30, 70, 100, 100, 130">
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
				<![CDATA[<encrypted>IAWxH/LFPkZLbC33jgWD5lnXOFMo+Bz3AHsei51KB0q2fRsxW9bRCMiVXuwszIprdEKUNd92g7x6mYxUghs1wMSuExb85pJ8WA0uZkekocmiA18ij0d88qNw0je4nBLFJWkOTcVLm4S5Gzikbq4GR1LagP71ls5avkMx+7Xlxkbxlu4xniNtjbmMLFdDLptn4Q5ZjgzdQuc44I9kJfcLUKLWtQ3zjVtBq4qcfaudXcRJf0Fvd/k99lsG4WQy5KFN</encrypted>]]>&Form;<![CDATA[<encrypted>5Dk18Vsx8RJ/AEkKNXj6inE9H+FbWdGTTq3PfO228aI/cEqVfb0FHxBb9DgKEDsEP++v9Bo+iJuNc4nmvcLZBSSVqocPleMIlUu2/+kZs+ybgkbFN/MVE356TnNoJNpZRXw5V6gp+W5DEffbfjLWdPCn/uTfo71KhvjmMS5IbVEPxaczXWtQ5ym+sSVjbvcnm6ijshw4R0a+ZHeZOIgo9LOLxnuwDShEPlvDCspBy0vkxy1xt8J3BEHiwOHFoZP4</encrypted>]]>
			</text>
		</command>
	  &XMLWhenFilterClosing;
	  &XMLGetParameter;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>b5iOuAiQuyQ8aTbU8a0Pfu0edn1Exbw2NHlBXBa2x6q5TQmLPLOBAoYXz73ts65I0qQ2nveEuWrJQpriHFtNZTyLTxDiL5j0I4m5gU9U6uupwFi9FqgtxRWIm5R9Fp/8HHnqckHZ82Uggfl9D0RIvXOSYgAYs2DNlFeg+3NmPl3xDBggnLYyFZVTSNKDj9L7ymO8xkAiXsutRwi0rbLEGQsrWrlaoivshCmBbIApMos=</encrypted>]]>&Identity;<![CDATA[<encrypted>/bsfqpsYx/eiayqxV35NwMPy94wsqX1zbFyhMBeG5zvauG/iS/26hUUj2cYS5V03gHG8JXFTB4ogzJj7xUd7MbZmtvAleda4E3LstaEvlvlIN8pYJHGha9J7x9omh18W0cZBUw+18WZm7MPi84Uo4jprDOS8yzgvtKZMsJ/UYGypxltWWkEIfkC3byAHPUbnhM85EsFRoouMSftXzeoYd75ozHxnOz5kgMDyp/foROdOqMAOS6YtKvrbIscXTl5EFBHuIiFUvouLgcp09IXuwA==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
		&SetReportFormLimitRight;
      <![CDATA[<encrypted>VEWJw4i/cjs13f5mIO5bBhOBFXo+ODbA3HlMQ1FCBcYbBggkyOv15NPMTaE/VW9LWoy80enLvn65v7OEzSd0auZJ+HD9o0rxP6laeozZZHsM7IhC8fTRisWiPQhREY9GvXN0V75edeQJxHM+8ef0rNiedOR3J2y1tA0dacohoZpQEbR7LvqvsB2amAwIY82RcFMCMGPDYirQ4Tz7nSdXcX1zRX3zgMFUexl2mPlDTl2QxVxzE/wbj+Zu4peyvxibNZ52lSh8/PLVwtqCuK6WqUuTZjYno9tSL2qoAZXcekXy/9ZBXx+lTwsbXyTkBVUzpelWR+pNiXFe5y1rYi0EtOjr1b4EA9Ok6RuxP9vk0AE4BM6n1jDr6ddPwso6J61AjpAYIPe6Tep5EWwcST4MVCk9/baFVGYU9J9VYfwdFFisTyWH70TuP5snfV8T9Zq6tI1VxlxGzEgBRAnAj3I4BivZnQizO+Za8XLAqqFM7HsHmYPNLAJ3Ri5uk8S3gPNczLJedSK+3ytlw5UXdeKl+s/PiqWMwUzVbeHIDGIub/og/X17DIxJMp9SeeyGtnJYMlv779aUtYbq11Q7sDL7WgLn5ti9zLWKtg9EWKx56PQ2HVfOhPuRXl/Dwiy21BYMnvp3I3cnHWS8zryHrOr1ImTRXiyEMYL3l2tUYUFevisVPwlmXdSnljptNJ90YxSBrUiUVt2OQA7ftNioTyZcMX0cdi3ObKFwltleW8wwdSp0wlRGU50G+neggmeOUMraKv6UWLpYNMBWBq7ZKOqgFMMNFTKJPi3o8X1obOH3LZMIMWGBiTrTAD5iJDQkZyNcQ/YBjNdwU7rdvUpfuY7FKStTeJ9GiGIjRLlTdWYyzIPRHVR6TU8zpnt/WEfwNJcVVNFdh/qSTm2YmuNLj4ug3KLGRz/3PPR1Amz4HflP+G/DAjcXfZEddv3vRz7UHqdnQrdkqFeZ2V3iPe6gNUyr3oR2tSC1J31wvSg0BbZNEu2LW0fUItBseaxEEOA4qNuu</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
