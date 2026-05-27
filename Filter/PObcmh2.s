<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
	<!ENTITY Controller "PObcmh2">
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
	<!ENTITY Form "POBCMH2">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ ngày" e="Voucher Date from"/>
      <footer v="Từ ngày/đến ngày" e="Voucher Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến ngày" e="Voucher Date to"/>
    </field>
    <field name="so_ct1" align="right" dataFormatString="@upperCaseFormat">
      <header v="Chứng từ từ/đến số" e="Voucher No. from/to"/>
      <items style="Mask"/>
    </field>
    <field name="so_ct2" align="right" dataFormatString="@upperCaseFormat">
      <header v="" e=""/>
      <items style="Mask"/>
    </field>

	    <field name="nh_theo" clientDefault="2" aliasName="nh_theopobcmh2">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
	
    <field name="ma_ncc" categoryIndex ="1">
      <header v="Nhà cung cấp" e="Supplier"/>
      <items style="AutoComplete" controller="Supplier" reference="ten_ncc%l" key="(status = '1') and (cc_yn = 1 or nv_yn = 1)" check="cc_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_ncc%l" readOnly="true" categoryIndex ="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kho" categoryIndex ="1">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" categoryIndex ="1">
      <header v="" e=""/>
    </field>
    <field name="ma_vt" categoryIndex ="1">
      <header v="Mã hàng" e="Item Code"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" categoryIndex ="1">
      <header v="" e=""/>
    </field>
    <field name="tk_vt" categoryIndex ="1">
      <header v="Tk vật tư" e="Item Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tkvt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tkvt%l" readOnly="true" categoryIndex ="1">
      <header v="" e=""/>
    </field>
    <field name="ma_nh" categoryIndex ="1">
      <header v="Nhóm hàng hóa" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ma_nh2" categoryIndex ="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ma_nh3" categoryIndex ="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ma_nx" categoryIndex="9">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_nx%l" check="1= 1"/>
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

    <field name="ma_dvcs" categoryIndex ="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="ma_gd" categoryIndex="1">
      <header	v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>
    <field name="mau_bc" clientDefault="20" categoryIndex ="1">
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
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
    <field name="ds_ma_ct" hidden="true" clientDefault="PXC">
      <header v="" e=""/>
    </field>
	  &XMLUserDefinedReportFields;
  </fields>

  <views>
    <view id="Dir" height="250">
      <item value="125, 30, 75, 105, 105, 60, 0"/>
      <item value="1101--1: [tu_ngay].Description, [tu_ngay], [den_ngay], [ds_ma_ct]"/>
      <item value="1101--1: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="1100: [nh_theo].Label, [nh_theo]"/>
	  
      <item value="110100-: [ma_ncc].Label, [ma_ncc], [ten_ncc%l]"/>
      <item value="110100-: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100-: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100-: [tk_vt].Label, [tk_vt], [ten_tkvt%l]"/>
      <item value="11011--: [ma_nh].Label, [ma_nh], [ma_nh2], [ma_nh3]"/>
	  <item value="11000--: [ma_gd].Label, [ma_gd]"/>
	   
      <item value="110100-: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100-: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100-: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100-: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

      <item value="11000--: [ma_dvcs].Label, [ma_dvcs]"/>
     
      <item value="11000--: [mau_bc].Label, [mau_bc]"/>
		&XMLUserDefinedReportViews;
	  <item value="11000--: [loai_du_lieu].Label, [loai_du_lieu]"/>
      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 60">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="9" columns="120, 30, 70, 100, 100, 56">
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
				<![CDATA[<encrypted>WAx1EIzggWomp7TPxhHO3mOGaOQSIZrSTTXD0yXg3Acvc2+v08uKQQvzJMI4/iLUnI+L3b9Dmhvj5Y9WyMgF34DUHj4f3qn7Lo7Smi/lsGfjwPSjHKLmeR1ETHdKrBJZnr6SVY/bJ6slmDfTssTkhN7W5nutSguNntzWgGftdwQ4YhfDZDlirJ3NKOr6ZUjCxo91vBTgUDOEYbd3207NH5f+nyEZHKA6VusSficroI3QdnskQHYcMIyPPXrmtj/jPwSiF5R2iXFbkLmi9bpkHw==</encrypted>]]>&Form;<![CDATA[<encrypted>in5QY6pT0wP70kToSE1ByzoFEWQ2/ThY/nJrimM44tXnAUyMNxlgLrHNA4MFl6lLsEPFP3g89UTZcmqtEZOIbGjx1tJSEmnu2w0g7rx2uX9wI/G7MibSUzhodS/Uw4kYqDs/FsFN2fzgyXORi1SCRH8FOTV5b7hDdovw9muJLzDwGWCY0mv20I0N9p53qmTBhHIKWQnVT7e1zwAbfk7onTTETxVgV3u5oKWMFc/yS+HRkcZiZ25AZUvvcr/qhP2a</encrypted>]]>&Form;<![CDATA[<encrypted>T7qyw9BdwS/13/WwaJD6f5t3O779mGWUpBDTzcGkThLxJu9EgKXkjgz05N+Ls51xtPZ/BHYuOo78boEwsls7AzLUik+OjKnDavTggoA0+VTHdcKF78dhJs7y/rdV6BaHrsM0AN8g3GgXiy4zDELsE4qshWbXFeQRVVI9agDWZbERkLNa4IVK+NAMBNj3OUroSLnCt2qanGGe8B9a12eif/xNtbSVOUEpL/L0LPtbhcZY9dcOu9B/hNLKMU4SeoN4R8K8EVDBA+bdOiCphpg5gGk3/PKX1jX/79skzsN4vDmzMtQq8wcVZnbz9umNsapf</encrypted>]]>
			</text>
		</command>
    &XMLWhenFilterClosing;
	  &XMLGetParameter;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>Let80D0Zwu9iY9cytyoFKvUVNBXDDKosuvJqBVaY10jSRODsw+t2L1ivibC+IJBBpRDWmRNl0JH2TZFRBKxObV7idltLFvk41t+9VbnoyvzoHKwk1WEaoRcwndbSgQ7pBP5PP8N7V7v7T0/x73rnLbbx6MussXAItJhiKy6HQwE=</encrypted>]]>&Identity;<![CDATA[<encrypted>c+RdOLyLEhnBQ5841uTs8ZaleyquuglqOMncQqp+FjnBejoupXeCKu0uced+LXs6i4R6F8ObYvDS8lRAW+fl+p+ypr4rHs/2Qq/KSag/m2C2QUrYBJgyhjcbWPSJygxOOqnSdq8N1CIBLFLYgDmSxBkDVObfTCtB86YSit03QmflSpy4G4t39pTxak7I2Jls/Fmg3f8p5RYGmApWJAGgrwa4M/JH49e5RWra4YePPoOCO2ghe0gB71yaks3PzcWCLixu2NwS3UHo9n+I6fogX5Wyd1vD4uEdOoHrJSp/mQwigZLyUsXt2+BanRzVMuIb</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
	  &SetReportFormLimitRight;
      <![CDATA[<encrypted>CaUH7pzCpKkDFqBtT2CmS1eyFlg7noUrAhs8bqHE6zfw4QlhrUSfkJaLx4qwb98AXXexcRA9OoNVdsD34Jw89oWHtnFQawE/nlIXnXLpkbqnc5kcwrRs9j0SrivEMFo9eh7uH9NN4YD3rGNffbnM+8SvOy9uksVsI0Llli0gU3hYxofYiFlDEJR3dzLHw76vYaazT1APXrRIQBCNJu/Raz6bI/pS+rc43eb/hqJZsiTUy6J4YnvzJMYdmElkWiSeHbyuDexzR5h4EA6gFgCSNxGMd5SRD6JjUndjC/Xx3eMKnPgNj+7p05lheJeKXRzZzUdiKdom8BKGE+7Rq0UXRpTwYTk1YZc7lGG6tYEMukM/xyot+8EmR68PIspPwImORtlzA8VXKckbNpG7J1WVSnmdDEcYIYSLZPHc8sVZccNV8cj8qk04f/fE6ack0ov+cNnp/OnEsv+cN7Qy6BFbCObXBM/z8Mc5StBHq5vPWz0V1CVQ0cqzf7NpR7Ax52x+Umr5odjZpjdSoMchevHt5i1KnIdAmUyJ7uQXi9jWIKu+ThwrjN2MOEjfAr7dqwm8SvplyQ51PtPmcHgQYTl8vy13Kwx/F8hpb+vRr0I9MKANcLustJFJb6Mo//tdGHzDHemZBbhcFdkgCm+0higUtjDf3Vx9qmDDKfvuVejottDW8mOMAT+gs4hHeUlqCjbjrOOV2rKv/bEL6PqdK6aA5urlnlz68so8pmn3v+RY4KjzZ2mZuTpXYLytE9F+xmTLM8HpldalsUtyjblTFViLaywd0MrXxB1EdiqVmCJCRSZwhNIUi+Lg7AK6gqEvG9D4e21YF3ZzePIuomzARhqIQlgRIm7obneJVO/OwiG8oD6tXOCzg2SdaMXsz+Ibx+5b4YgDr/DmVS/IyM4ujBbd2dpgCb0cIDAWTTi/B6Zj4Ak=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
