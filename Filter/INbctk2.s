<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY Controller "rptStockSummary">	
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
	<!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
	<!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
	<!ENTITY Form "INBCTK2">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>

    <field name="ma_kho">
      <header v="Mã kho" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mã vật tư" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
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

    <field name="nh_theo" categoryIndex="2">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="">
          <text v="Không phân nhóm" e="No Group"/>
        </item>
        <item value="0">
          <text v="Loại vật tư" e="Item Type"/>
        </item>
        <item value="1">
          <text v="Nhóm vật tư" e="Item Group"/>
        </item>
      </items>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa48iuUH34KSJcVMNmWD13tUwDLloSPzj5913ZH74D/JQnvAOirG19jVpDo1U7QfXiUg==</encrypted>]]>&OnSelectionOutline;</clientScript>
    </field>

    <field name="tinh_ps" clientDefault="1" categoryIndex="2">
      <header v="Tính ps điều chuyển" e="Include Transfers"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không tính phát sinh điều chuyển kho" e="No Include Transfers"/>
        </item>
        <item value="1">
          <text v="Tính phát sinh điều chuyển kho" e="Include Transfers"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="in_theo" clientDefault="3" categoryIndex="2">
      <header v="In các vật tư" e="Items Printed"/>
      <items style="DropDownList">
        <item value="1">
          <text v="Chỉ in vật tư còn tồn kho" e="Print only Items Stock"/>
        </item>
        <item value="2">
          <text v="Chỉ in các vật tư không còn tồn kho" e="Print only Items Without Stock"/>
        </item>
        <item value="3">
          <text v="In tất cả" e="Print All"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="in_sl" clientDefault="1" categoryIndex="2">
      <header v="Cột số lượng" e="Quantity Fields"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không in tổng số lượng" e="No Print Total Quantity"/>
        </item>
        <item value="1">
          <text v="In tổng số lượng" e="Print Total Quantity"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <header v="Thứ tự sắp xếp nhóm" e="Item Group Order Type"/>
      <items style="Mask"/>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="162">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11011-: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="110100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
	  
	  <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
	  <item value="110100: [tk_ht].Label, [tk_ht], [ten_tk_ht%l]"/>
		
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11000-: [nh_theo].Label, [nh_theo]"/>
      <item value="11000-: [tinh_ps].Label, [tinh_ps]"/>
      <item value="11000-: [in_theo].Label, [in_theo]"/>
      <item value="11000-: [in_sl].Label, [in_sl]"/>
      <item value="1111--: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 20, 20, 20, 240, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
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
        <![CDATA[<encrypted>SK0GYQR8TQg7cXUCCnccCewSL0HjAjAeM9l1ZCGTIDWdhXvk4y8aoAqyoDHZgyUqyRyLc4Jm/++xBVcZUUS+BIpd/pemyONg+1aF3MifAs7dWa/w34sl1lDnJSaOiYM6O2qnswRbIypqH2vdIZwj4crfzVQcNiHry/7fNbWVIOLswoYaUHnyIu4cSaARd1Cx3qE2IbKuGr4K+YDTYOYQY7ije1R154eSu+59Rjix+rLp6GEqLzgnqtppzdQgsdLg7bnmykzHBlmqRwLLwoC91xu82yTjG0EFUeFsfqq3IlPnKj8Hfr4tD/sX2hygomN5JkFvGotNr5q3uqmzjCXFDzOcAcD2n+wrg+hK9okcWXkGQkvp+9IoIMVWAMXgSn8Itfa6jZbmxrYeIiuZW02fSkF+VATwAB2KW5AeweIAfD2/nlZUPay6tRWLuV0EmvEv2VL9NrksZGkJp4q/fn4jpKirk/XOkxU5ETNGwrGKl7K/KfgDKLYzDbAAKNr52aHYYId223/N4nlEgOlPqJ7Ei88ylM4b5nnQV0UfCCHV3se0VGDicr47ENir5DnQz/Lk+wVwrGzeU8qY7bCbbdRfnw==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>QNwOnre2eaLRiI3VtqJiQqnB/xzwgr70OxyLAMBV2SqaRXv20dFmCUWCt/gez0YiLavzLx9Bh9QbK49+nNxHHZon3iIA2n6iq3MmsOT/GDkV2a8+GaWXpUkvtXpenG3A0/XJ22YZ63XnzkN9yb2NO4r2TJ90tB4h3OHyZyqop7ZTWiwY/V/+VLO8XZWVZkjOaYPaOpXPFKl1JSSpAFCurL6jxn7fWmsLagHwfKy2J1caDf3y/SGj4TBC/larITE88wkoLrPm3oCSM7zLCzhXUjl6r8Oiy8lcA5mDqGBzrmMwV2hO83V8Gm/L3QlgElISvu+tTLkWzvsSaww5xAqd0PJOeW96aMFIcozi0lI1uYUwvoGlmL96siuNLdT3SKqH</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
		&SetReportFormLimitRight;
		<![CDATA[<encrypted>vBHDLLB+MdCH+9fhsnFG7TVIjIdGLUl3oc26oegLYHRzB9bDwMycdLvZ4miPgT0ACeGC/o+hp8KsZVMmwPa4opstEoxQCdO+lvYFHgQ865a+YXv7vGSRXkLXQxO/CBHDGwa465P68Z5AELuH3Cw2cHOaGh3mozssYIDpK8Mm4TgnTDIk9ZPuUNbCf9sU3ja1YwhhtDnRTJVRpG24Gkz2KHnzFJPoOJ4B/eiXGiyxUNZAluwhxPJg3VNCGYMXvVLOrVSMb6YjxIjHA5fTrCu+fusJFkqMts6dKYr3BhiJZFedz0nVf+wqRSfPCgCwmfVDMKnU5txaS9S/2wiPRJoLhBKrcEuYJpk2s0H9dm2QTYKl5p/HnG1WVhXWy921XvRsC9/Bu3u41q4aO8vbkXA4UPan3pDnrwjo6cClX4XLpwv7ECYduKj9PCGA1nFEdFGeUacXLveCL5IgpSunNxtYQnWu3/1Pbx6prk301bnlIp64RIrVG0rhziWUjOrPI1KDoaDW56ptazM8wOo29TF0kdcfrUmu5rjTjlWJ3YSOlfBD/BfdNPATABk0HdDo4Jio+izxw3ID3PwHrDZX2TYQB2077GybbvsmQXHxwK5CECBTIEJWuSVSnXaBcPorMpG0EArMQYq+1Bkt2SAAGqDNmXMIBSasvAlFe8B/BnRjeDErvEZre7X0Bn8b7GmBkvoqTewooYo+D8nqcBuEZUo/1qArAsLpeoyb2ccfiw0LPbjcQA+vs9DhsBY5J27Na1rhE0KtmqqE9BexTIQENMIuXTCreXpRh61/E0hltr4LF+whbasy4xiwlBnf4cqGiHWvjB3wNmx4/WL78Ui9pQdcbFHaZa9zQHR7hOGIUpLl1JcWpcdaTat8vBYwYUGNx7eTmnL/h1lD0iZw9il6vGEd4yE/Q8VNTzq6+6/EprDL+69C1ciUTHRUaKp1K2A4d1zZ6tsj0f6od4Exz1jdCiydASGwdofFbQa/eu/oM3cMvS8IUfDWy5UgUhnk/jiNlBUUVwh4IUc9ZS/87JQGmzjLG3VcLgC2qTBQdCMWkr509MLei03fNv46XQF76+b1w9qf</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
