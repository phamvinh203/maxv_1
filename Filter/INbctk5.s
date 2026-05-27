<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY Controller "rptStockSummaryByLot">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
	<!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
	<!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
	<!ENTITY Form "INBCTK5">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ ngày/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="ma_kho">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true">
      <header v="" e=""/>
    </field>

    <field name="ma_vt" categoryIndex="1">
      <header v="Mặt hàng" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_lo" categoryIndex="1">
      <header v="Mã lô" e="Lot"/>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_lo%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_nh" categoryIndex="1">
      <header v="Nhóm hàng" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ma_nh2" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ma_nh3" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ma_loai_vt" categoryIndex="1">
      <header v="Loại vật tư" e="Item Type"/>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="bc_theo" dataFormatString="1, 2" clientDefault="1" align="right" categoryIndex="1">
      <header v="Báo cáo theo" e="Report by"/>
      <footer v="1 - Vật tư và lô, 2 - Lô và vật tư" e="1 - Item and Lot, 2 - Lot and Item"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" categoryIndex="1" clientDefault="20">
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
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="tinh_ps" categoryIndex="2">
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
    <field name="in_theo" categoryIndex="2" clientDefault="3">
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
  </fields>

  <views>
    <view id="Dir" height="210">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [ma_lo].Label, [ma_lo], [ten_lo%l]"/>
      <item value="11011-: [ma_nh].Label, [ma_nh], [ma_nh2], [ma_nh3]"/>
      <item value="110100: [ma_loai_vt].Label, [ma_loai_vt], [ten_loai_vt%l]"/>
      <item value="111000: [bc_theo].Label, [bc_theo], [bc_theo].Description"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11000-: [nh_theo].Label, [nh_theo]"/>
      <item value="11000-: [tinh_ps].Label, [tinh_ps]"/>
      <item value="11000-: [in_theo].Label, [in_theo]"/>
      <item value="11000-: [in_sl].Label, [in_sl]"/>

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
        <![CDATA[<encrypted>To+A+NIkVYNeFi1UF1XRDP450+I0z6weiPJiloCOUW4EoWwZlw4NhvdNoKVXCApo9aEzR/KHj/cNf5eC9HYu4d72mdttWi5UtCL3k1SfIJE0TpChO6OB4vtc84akOu7K7aCPhi82RiTy1Cy992x/gYAnNNYJW6ivATQiHaOW4KQtrHwM046X7qzBZMKt489ofI8l/gHQ6Hpbn7JfZkSDQddftrxMV8jLeZetCcfEubxhUHC2hMgnqSGr4BkVKbKwaM3eaEZXCsWBEJEraSehvwtsXAVnvDAfdoAT+zJtJp1622c58lzaMdF1HtSBdfx3GYj0sC/QFdqz/Fd6sbBm3Ef9sla88tp2hAGiNy4ikXaIjsBRjfnTWTpagyObqmPPh+cx1gJIrexQiQ9xYx6t9wX7FZpq455RX2D1hDJyg6NJT/x27oRwTkYhG0786IMv</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
	  &SetReportFormLimitRight;
		<![CDATA[<encrypted>ZM0Yhb1gBE0SIPvcuakKaxLEz5dv3zQMn2+lWuWBMV0Y0FaAG+MxgcNP1OlS52OQRMBBDi7RM9qzcwUiTTqe0xWkmLnLrEiB8UqkV0EYeSLPF3n+7nvXbVL1w4n6slPjVNkhp2mGgr5AxFQ7aC7CsBKnKJEVvgZQ0IsG0k1h0lkerIW0b8sE8S09KTj13r5T4ZLmOPyAM3pzIsKvHy9Kk3wHmYQKvLO86D6eSMLLgu2L4ZOIDF5hSU7SA/giG3yrFmbUs2n5JQmNEBrTE/31DCJxGvBeZISMQsq/cDviZtiewRetOLdJRIRWH6xCHVKKTgiYSc+ZVORgkBEh6HSZuZNzp9veREW8bF43A+HmWoebIF1AKvnvnfTDcm1AoXFzoNWe01V3L/YiKO0YjHG9t7hOCPyuIxFaI2Ls49/fvDo1wm4o+TVcAcbLlw9jvq4LoBU1quFBCprYmv43u62pFurtsYrdi52C5XxxV4CM+FFYthsgWJz+6C6RvOmQaTjeyMUhMNPV+tH8PHe5o2bhMvkejZtwt09nxt6t5R0RP6NYSDvZuTM3dCn+fY0qQ0oYGGZREQ8OExzUInxWojH66HZ29wlw6ZyhAShQ9F2FHaQ7C3AunI/hyZAS8Gf280NeWiazRrmTDbdf9iA9mptsyD/KvB2BgFweECs7O9oHhM1L8nKT8ORZ427YCdwkgNglYN5I43Q7Ibielvw/ECeK9t12M1hKWPOK+EOCSATEtntNQUD5qIbIPVqec73jJSVcwoM6QgH0QbbSNg8r//Tz1KXUjMPjzJGxdy8mXOOgAY5RJgZvLtoPOKG1AnZKotUz/KzuOwBC4b+Yn2eW4Irplvwpg4ooztJ673Z0K7oS5z9lezYkLvaQGbaFF1oct2x11T2GcBBTwEzGgO5SekWR0x8GO9viTmJwsO21gobkqXqGvA+CvbhqlWBjCTkvnYpjemf/2ha8oPmNL3JkvtgbOw==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
