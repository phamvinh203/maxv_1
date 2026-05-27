<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY Controller "INBCTK13">
	<!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
	<!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
	<!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
	<!ENTITY Form "INBCTK13">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
  
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
	
    <field name="ma_kho" aliasName="defaultSite">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1" />
    </field>
    <field name="ten_kho%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" aliasName="defaultItem">
      <header v="Mặt hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa45ibf3N+UvDBE8G8AYBEYJDWL1abuj2Bz1359JSqQBXF</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true">
      <header v="" e=""></header>
    </field>
 
 <field name="nh_vt1" categoryIndex="1">
      <header v="Nhóm vật tư" e="Item Group"/>
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
    <field name="loai_vt" categoryIndex="1">
      <header v="Loại vật tư" e="Item Type"/>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
	
	<field name="tk_vt" categoryIndex="1">
      <header v="Tk vật tư (trong Dmvt)" e="Item"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

	<field name="tk_ht" categoryIndex="1">
      <header v="Tk vật tư (hạch toán)" e="Item"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk_ht%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_ht%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

	<field name="ma_dvcs" >
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
	
    <field name="mau_bc" clientDefault="20" categoryIndex="20">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
		   <text v="Mẫu in số lượng và giá trị" e="Quantity and Values Form"/>
        </item>
        <item value="20">
			<text v="Mẫu in chỉ có số lượng" e="Quantity Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    &ReportDataTypeField;

    <field name="ten_dvt%l" external="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 75, 105, 100, 130"/>
	  
	  <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
	  
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
	  <item value="11011-: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="110100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
	  
	  <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
	  <item value="110100: [tk_ht].Label, [tk_ht], [ten_tk_ht%l]"/>
      
	  <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="110001: [loai_du_lieu].Label, [loai_du_lieu], [ten_dvt%l]"/>
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
        <![CDATA[<encrypted>UdjrW4Rj8QggJFj7ZZUhZIZZSx14r1jLMFvMhl0IQPcl5+mE58cnO2C+Nzu370LH3EQNpJdE6Ua8G1itwp0si1k1Htr1icROZY6no5v4RzBAKXApgCmZ+/0TfI3+2rQxa1RG/yP5OZB/C2vR24X4QjhegG4VZ0FE9/6/Vef3IXhbxN8941lFNCbHjHJZlrM7bfHSGw5f3MORQ0awCcvVHKXClafK1vd89AtVqbBPsILRnNeB05lDLMNMZSERZ4jOtCI7DefusYAweb7BMUh3NwPXX+BZ/i96cDTMHin5S59XW3MuXH400qzwq3Vt8rrhhu/O6Q4ZyfSuu5LwMcwizBo//8m/TPC+s2IbEwoxjgveKu5Di83pJmyy4+ONBwvsyRxCnQCR0A5Sy49dfd+nK29VrCpez6OOWX2Hvezk6/lB63SLuWfGCxhMcE/X3898qGaY3xMeiRvKnhof1q1IqA==</encrypted>]]>&Form;<![CDATA[<encrypted>SZehQOwyXJB8/PRC8UnvIABti6l6DddtQ69ZVrFUPgVqT4l/q3DgIjN3+p0/8GVVAmF1vMIQJUEinF079PeOHJAQPeaKXe0bSdhHmBoLXOsCI1Q/tz64QsRyu8p9SwhVDRgim/ActKUMLBu9umjgJlb0mmwhBb/dg2o7v9dF8yC02OpB+YChi0rhMbCAyMSsrJWUF4gUy83jT5qNLQ9FkUDK49ItzKGjbXiGojdG5AdGIwFMbovPCHAYm4dhsHwR2SjiiXIsXLVUqG92og4c8Ib+U29u79rtwmrTscznsVV/4j1/IL8oHr+LlaLuJIZpaErBcSdP0xueOzMoQAjCXcX8vTo89QJ2tsmNRdMv4V8=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
	  &SetReportFormLimitRight;
      <![CDATA[<encrypted>TBg/Bldmj8kNT8ObTmqhtCrir3jIY/jbxkI2hAvsINOzn9G4iKrLyM1XaS0iQV1WNreeh9cbud6I91wC3t+ATpuo6AfkYyLFh6XtYUom8sieB6OkcO/UK7tmOxbsy1+sf+JyaC8kOnIYefB1mnycME9w0tsh/hI0GJLNzRgakdQIVNP4921woByPYD7q6SjZfcvyZGSLOXQr4OjosA0+Ys8aAVnfOYFC2nUSBrkC7Gp58LdE1TeSSCaGo2NlVSdF+HMBDF06yuYbBew/sejQLghSH8HCaDbRoeqom7pm6ilMxY4VgN2BJy8hjUpBTmoZ3s8+R0xac7EnzU/KGeZSsNscKV0hN0CXlX/u7fbErdPDG/SO9qZFJx7uc1nyoXaChaIi3xN22Yarn3Xr+DTBK46X2wrDd6vmtCDU/oAseECrPkOkkMbNYc3d5LtfHWowS8kU9oQ6dqLUP4RDR1NU1u3UQN6aTX7S3gF2lMrPZDyDoX15r6A2p8ZWmkSOUG5Xa68znyGpv/+1iEaGyL/Ov4qkNXWKg9jbQgSMXosoNorWiMEjKUDW4GRrM+Oa5hmfwyAJMQpm2SacRB9HPgTg8KNL3zNBaBsDrLAZ9QqqRBt7hbgdfFIU9JBE9qHjj8vyONEi43QT8OAQ6+YFWsWaa975Trc+L6+xk/QDdxso2Ir87nJONtzU2vmBqT4VhhOXuwbbPBj94n7PZib82RVaZd0AOFs0RhFSy8yk/arrI+j4t4glwibicMIW5mSQJHOaN2Ko8WVJWx42K5ihlulrYKhAcVWFKM1mMllSgKFQ5tfEiGGCh492CGlXk+TiMtUZTv4DxB1XTj4pr8hkYK3HIpgPs5m3eeCpnn4FDX0L8gLBCDEkUW6ubXEgvCU7AG3jDwZRwSNrGNJemc83kizRpytF9iT4yj5l6Dus815w0UCi7fIv1rQRHxVlg3UKCLy4ZISVmfzv9ZyPBUMLzYAJQFJOHS6kSbqEPtnlMBMoL+jEpSSQGaFlVRglb0SB/VKZ1stn8Z3f82yftRoyJFNVLA==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>Vp+/QShYf8Z5RlHIS3Pekb7vyP7wpJ+N6lcoD7S+NVEBuq7DqQ2mvi0XAmQPxPOMONsxVS+3e1AnA6HO9Rh4sJnEyUdpUwSutektc/g/ejDmENX5YUVGGIjnzg8s4JEG4D8mPzCgBxfCnng9NWj4id5clmz/nwjDW4wZrg/ylWc0fuVAuFpdT3LetW5LqGSdoIo1+s9VsfinbZSMUoIVkaVOJbIzORvDtXJ8vVdqlsoEv4LK/R29paMU8Dn3QaAp</encrypted>]]>
      </text>
    </action>

    <action id="GetUOMName">
      <text>
        <![CDATA[<encrypted>ibBuqnhhHCQfUTnbpwp96Fh8Eju2vls1OBsAXfZE08zH7rWqvxPpGTr01eDtqY6AZ9L8YCCkSKo95S/KT+EcLHGa9N5i2m8jnKRCa4Vq4x2nvIBDzgbO2ZZSenb3kX/cCVEDCvTzhP3nTlfLGZGNBRnYyg5NP1DWy18xIhLU8pOplOhxGQuEYm6knGbqikG5</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
