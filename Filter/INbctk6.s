<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY Controller "INbctk6">	
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
	<!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
	<!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">	
	<!ENTITY Form "INBCTK6">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date"/>
    </field>
    <field name="loai_ky" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Dư đầu kỳ/cuối kỳ" e="Opening/Closing"></header>
      <footer v="1 - Đầu kỳ, 2 - Cuối kỳ" e="1 - Opening, 2 - Closing"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="ma_vt" categoryIndex="1">
      <header v="Mặt hàng" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="nh_vt1" categoryIndex="1">
      <header v="Nhóm hàng" e="Item Group"/>
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

    <field name="nh_theo" categoryIndex="2" clientDefault="">
      <header v="Nhóm theo" e="Group by"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa48iuUH34KSJcVMNmWD13tUwDLloSPzj5913ZH74D/JQnvAOirG19jVpDo1U7QfXiUg==</encrypted>]]>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="0">
          <text v="Không phân nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Loại vật tư" e="Item Type"/>
        </item>
        <item value="2">
          <text v="Nhóm hàng hóa, vật tư" e="Item Group"/>
        </item>
      </items>
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
      <item value="110---: [ngay].Label, [ngay]"/>
      <item value="111000: [loai_ky].Label, [loai_ky], [loai_ky].Description"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11011-: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11000-: [nh_theo].Label, [nh_theo]"/>
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
        <![CDATA[<encrypted>YLGjXV0SzfvN5gSB48sDXozv+yiQ4TYGOhhd1JwX32bw1gIG3+PX9wOnswPCKORJAabZwoT2KmEwXCCku42JNbR2m121R+Uiw1vwu3TmtcJgz3b9beOZEO8mfZm59aFyEPwXj7bed3FLlYIxbonhqezW702BsSZc1QR2NJhd0GduYNe/1p9lX6uYkCKtrLJtMLoEBshdG9jli7l/XYwU81+97Q9aa+FNGJYW5/2u1QG/vLeTa46q77Fnu0sIv76uFCZOQH+53mgbT7nLvQRW2ZFmfq1PFVDehcDMXL9Y2jwunB+RRjGD9kBsWeFsmILOC1pICYiHx+diIc5aRYrWPtPt5+pgPpTcYadMeemBYzckE7JY3+mWHXUMSiLQMZ+x3mrRqCodAIuyl+JbCBuf6X4b0j8wD10kspwbT1z2x8OtJY0OxHJwqh2SajxX8c66WqkRzLho3lCLs7UIQ+tQpVkW2quo63V6AAFkW2rimX/yDZm1fFsJpz3r7T0HH/RDZVVmJrdZwg0PeK1I09TZ7tewItLyag6nLv3banH0YojdPs27mbi6lAEIlpt+YzyBUTip3puFaa76/qYIcI7c5YIJ0GdkDaFtXAHOCRK69vj0/WTau76huZSifFL3f3T+</encrypted>]]>
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
		<![CDATA[<encrypted>cM8TAJrrSEGodh5M/V4L83AO31F4eHfoIZoDr9ue7W24kPQqcEJVVNERir/gu/pJoPY1MfmlfL/fcvKoTKkaZipvnA6kTgoq0UwMa+9WsWwUvCGpMgWzmBqL1Lwrd57jHBuQIfs0ElExpfd4W8sWbSQTcbeH6uiIu+hgl071YfxWgus1hPL8qyLSYFaetdzBfg0DS5D98y9GNsTVRxZ/i6wyj1TvPrqN2hHND+aO6RFisKwJ/xMH+S+ztSp89Um/idVG29DIOTEwTbdrZvEmo7drGUpmH8r83ZwaHl73ai49jwlTNRl3A2c1TY2fWlj07LwhqJguuvV6fd3HH2QM8w48ZfpIbeL+Dbi4hnqPtUiDWld6tolGHbyaYHXpB1FHnT+I+/1x3JEDVgXFYDcXWQo+slBoBfdldCJwGN7jYjGL7GJeuGUTIbk1gkjE7rjbY7qw/IpU/6k2GpFcYO58fQ3SPBwrmFH1BENhhFL3bYz421QGEDpAznufkIxFiNoun1+IwqN18y2C/c0VZ/q7E0m42FTcJ4d6XutCGOFWHmTmpgywtiZzLAHZXwQkxPfmTH8n3PL8Dx5Srz/htzB1J/CLvHj/IMjKSrrYx2rNScp+t2hqQ1XxGKQ2WcLa98bdCgakr+4cxkguHsjDgmgjhf2P4eaLkkubeYVn8GDNqeCYSLPG4A75XTBgHkc5J7HyGxcGDhzhfdEwrckHaiAQoZ1g0txDEKNYWMnNwYhqBDP2RDqtUpAXV2Lo6lCvOoN2VbNMFMDNCb3wkzQ6GsXZFBeXlSMNcsvEMEHBbeRGgGebpE41r/n6xCi+WLMsvwmLeamgT+pJjoeqixZs7esTJZFmmPG7tL5iCnygbiV97VF+KfD8JLY3eGvxtjEejbwiirZB1kDbDNSwb9EqCyyo7oq0E5XrauGrd9lZ/fXLH3wf3A2iQpLPMyG+u0VaFNl5gOsngp4wftuVZNKEm9cgX6TX1BiWkdOn7i2T+cHaFM7QwDjwQZuwfAduOOUsfUfhFdemAL6KVDEQtwn8xgKYNjCuEZINImHM4m2DoBymZS/a5K6849g5koeDpdhvtOgY</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
