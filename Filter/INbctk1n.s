<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY Controller "rptStockCardAllItems">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
	<!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
	<!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
	<!ENTITY Form "INBCTK1N">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ ngày/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="ma_kho" aliasName="defaultSite" allowNulls="false">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_vt">
      <header v="Mặt hàng" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="nh_vt1">
      <header v="Nhóm hàng" e="Item Group"/>
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
    <field name="tk_vt">
      <header v="Tk vật tư" e="Item Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_vt">
      <header v="Loại vật tư" e="Item Type"/>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>

    <field name="kieu_bc" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Kiểu báo cáo" e="Report Format"/>
      <footer v="1 - In từng trang, 2 - In liên tục" e="1 - Eject Each Page, 2 - Print Sequently"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="20">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <items style="DropDownList">
        <item value="10">
          <text v="Thẻ kho" e="Stock Card"/>
        </item>
        <item value="20">
          <text v="Sổ chi tiết vật tư" e="Inventory Item Ledger"/>
        </item>
        <item value="30">
          <text v="Sổ chi tiết vật tư tiền ngoại tệ" e="Inventory Item Ledger in Foreign Currency"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    &ReportDataTypeField;

    <field name="keys" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="126">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>

      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="110100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>

      <item value="111000: [kieu_bc].Label, [kieu_bc], [kieu_bc].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [keys]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>
    </view>
  </views>

  <commands>
 <command event="Showing">
			<text>
				<![CDATA[<encrypted>IAWxH/LFPkZLbC33jgWD5lnXOFMo+Bz3AHsei51KB0q2fRsxW9bRCMiVXuwszIprdEKUNd92g7x6mYxUghs1wMSuExb85pJ8WA0uZkekocmiA18ij0d88qNw0je4nBLFJWkOTcVLm4S5Gzikbq4GR1LagP71ls5avkMx+7Xlxkbxlu4xniNtjbmMLFdDLptn4Q5ZjgzdQuc44I9kJfcLUKLWtQ3zjVtBq4qcfaudXcRJf0Fvd/k99lsG4WQy5KFN</encrypted>]]>&Form;<![CDATA[<encrypted>5Dk18Vsx8RJ/AEkKNXj6inE9H+FbWdGTTq3PfO228aI/cEqVfb0FHxBb9DgKEDsEP++v9Bo+iJuNc4nmvcLZBSSVqocPleMIlUu2/+kZs+ybgkbFN/MVE356TnNoJNpZRXw5V6gp+W5DEffbfjLWdPCn/uTfo71KhvjmMS5IbVEPxaczXWtQ5ym+sSVjbvcnm6ijshw4R0a+ZHeZOIgo9LOLxnuwDShEPlvDCspBy0vkxy1xt8J3BEHiwOHFoZP4</encrypted>]]>
			</text>
		</command>
	  <command event="Loading">
		  <text>
			  <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX+NX59xiN/5VfhvPS78jFasDQ//Xr+YmqZbq9oCTxbxGkCifAOzbjPX71WzPRLSDhg=</encrypted>]]>&GetReportFormLimitRight;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7fKDsRh16dSWcJklvUputqJ6ZKqOfxuATEAw+ZKMq9sJsyWQUlNGnsYi80D4AzwTnnO1fXkrlLNiUvY3Jn01PVSVbkQuHxkw/SIQ6fD+to6o</encrypted>]]>
		  </text>
	  </command>
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>SvRtBirO/T6fbZSUMV9bLTdO9k14FTLFI+JM2TyMV1/qCyWRGcKn4IYI852jLZ3JFEK4njHlxjpBoN1/sg26vMMEeJZUuufbZ0Lb1tc8hFaBPbMEfxGDJzopI5gvNNYVcfQN8Z1MEX3+TKEtllz0rnEhn4a52y+PufKRxPil/fc=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
	  &SetReportFormLimitRight;
      <![CDATA[<encrypted>op21GaW0WYnbGAxprS+JE0Q7LZFL12FC3fftHn3byryfclbdpGL2mpSeCCKvaWs0L8knSQWlnH914WaCvfFXiw6RCbjYmjVXzORV3l9BGxsORkhw9jFUqX3LDSLilBzSjAS74qkYO0re66dKYB38kLaSfPJePZbVhcX8oVMTIvd5eYa220YQC++MGcPDqzRMDPSitieBNqm0VMGoPt4VhR4+L4vUnE7BNqBjn9TcY4FybOlCyMpclYFomGuxFoqpzYjYqnBgMsdRo90F2fdSgU5PPDHO2ztMY6PaCEwSSSmOkd7oekKcJQLsoUc70A44bi+u/JfQwEKxyn9bohQ+xW8pAe7SBWpmUlmjSYvJYQQMvShCoaJNq7PdZbgvk7L+Zv0TUdBp/EyTPCq2rgS7pdRc8bPyaSyVqQxcBf0Q0hNtWqR00Kdzwk/Ai/7tTdlaQXjKeuJrzyt+EoNlVrcaHhNBniTee6WyWf+6ihuJ6WZzXfSrEJZRAwHPPGOFR4L2qlxCuIq5sHVlCaU9zZSMmb+OUWRWs4SpJVDt0mq9qwZlrYpHKJ09li59L5dLRc7dgj5y1woRp50wb/wOAgx2+ID7CvkAMw0ob409PtvPk1CHnrfQF0stf0tXR9vdhU1kbVs68oqmMyLp3WJszEuDJx+takm+nB7kR+/lOXaw1zrO40AzqQ/AhEuGhuH6+eiGIJMPdRp5Crr3ltRs8XGRht+yv0ZPqBeX5C5cY0/U/kPkWX/cpC8J+PYaL2BHOU6Iaw6isulnimobDZj8EYO7EjFdiQXJN8wx1rdt7U0JGb1Jj8yCifxW96HL1dEUJkWKKgFSoeYMEVBJNGS+/rkycZjnfOr+yfGUY0eiVXosMo2CHefezWFoMYCzbxyVLz8OyHj+M+SZ7RCgAWlPyq32p+NVzcv7pNhgTU9BaeaTZTwrnPJToPl+tYA9v4Fiu2TE2nSZsEv5Zn069YsXhnEmGJTgDYNPu/v+sNwTD0aPIGLdghCoY6dgY44rNgwNzbzYugfyyY3/drjFGmsHcd9YQsvMdUkUYb/GB50S6Ko242V/ScWIuhK7UNIp4jC/wO5G</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>WQQdgB5CTF6mzHBhQpS1FxZ2K0p41rhQ7L35/1L0oxI/ftwAQSvR9HECSEZbU7GnYPdK0zDRheG33CqNv0QvwU35iMHdKxxze9USfESkLXcCLQKHwR3ZiZfOrtcf9pMssKQ9HDlH4hAsMf3zAWllIeNJNMV91gzxDNXJ/4HXQdk=</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
