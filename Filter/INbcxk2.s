<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY Controller "INbcxk2">
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
	<!ENTITY Form "INBCXK2">
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
	<field name="nh_theo" aliasName="nh_theo_inbcxk2" clientDefault="1">
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
      <items style="AutoComplete" controller="Customer" normal="true" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mặt hàng" e="Item"/>
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
        <item value="20">
          <text v="Mẫu in số lượng và giá trị" e="Quantity and Values Form"/>
        </item>
        <item value="30">
          <text v="Mẫu in số lượng và giá trị ngoại tệ" e="Quantity and FC Values Form"/>
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
      <item value="1100--: [nh_theo].Label, [nh_theo]"/>
	  
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
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

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
				<![CDATA[<encrypted>WAx1EIzggWomp7TPxhHO3pTgjy2rJDbdwSEsg6CCv7rwYFeyqkzEnI0Yl0FVlrSnS9ZVMBblDwRjJy/Ih6Sv/cOZlY0kXKEHTSgymdoQTDkgdUBCPV1CE07hm8iGY2FrZzXLx6xfKilgqYibCP6jtHS1YKcYWvvNZK+LMwfCZTBJ3lDc4jUG2msylCtDzX3haq/lg+HPD+kAWODlBwR6E5zgJbHLQLrHvGWIKIT9qG48gCZUGdQ+hp9IHpvJqFlsC73QB9bTK66FMdM87/y4xQ==</encrypted>]]>&Form;<![CDATA[<encrypted>VfAQ9kahSaLQDNcRqzoSWFTYZ1C6AVn4AojxGeeLd3Om2qYrrFHJ2bmMBKSlLlv4s9e5F5KwppS/hbtXiuRgDLeGuy1EZbechg5wjksO2ekBOWVLLRy74OCpOvrE++eIeAvsmFDEdo3apObc22hmVnxj7WExSVXdlIbrMaFv+cRtSSc0XphqIhLhlg/tsbfKmBJZBK2dezHDY1/15JVjDe9MMVrJsN+C0hn/HJ0A3u5hvqMtzu0urzwB8scru9/z</encrypted>]]>&Form;<![CDATA[<encrypted>T7qyw9BdwS/13/WwaJD6f5t3O779mGWUpBDTzcGkThLxJu9EgKXkjgz05N+Ls51xtPZ/BHYuOo78boEwsls7A1RT9DHhovQVxDd/qSEhr1sVLSHlMt3PWBuflwZzZIk42Ng4B0LkgvfybEPvE75QcgAeXIPEEmtqSKRuHEMSpOKz9TBxolphieukfpKXf+iTY7lP8lEQJE8qa29Qsaqo2TgjKDwkogaJJeBs7q6RwbKPmCElBrDXtlpGstU6f/iEToTD5WWPSPuhW8wMhckx2D3ShhyxeD0mcxOcB95e46pqR232PmFlTQktymkGQDpS</encrypted>]]>
			</text>
		</command>
	  &XMLWhenFilterClosing;
	  &XMLGetParameter;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>b5iOuAiQuyQ8aTbU8a0Pfu0edn1Exbw2NHlBXBa2x6q5TQmLPLOBAoYXz73ts65I0qQ2nveEuWrJQpriHFtNZTyLTxDiL5j0I4m5gU9U6uupwFi9FqgtxRWIm5R9Fp/8HHnqckHZ82Uggfl9D0RIvXOSYgAYs2DNlFeg+3NmPl3xDBggnLYyFZVTSNKDj9L7ymO8xkAiXsutRwi0rbLEGQsrWrlaoivshCmBbIApMos=</encrypted>]]>&Identity;<![CDATA[<encrypted>jaZ7eL+vVEAwogwI3gDixIfKVRnQQheT6pS2SiNfGnuCwOHMsAzAO+OCGMJaY9v8hkLTAC7XlS9WrTibGnGAzg10SS7jstIBeQg4BM3z/13xct509s/86GZONqkbFH3IjkT3rCZ9wvExZG4p1lphrlv5hoAiXJTSIhMhwh3sB3Kim4txqK71vK56sWZZ9wneDLICoNJJErMctF5aeqd2c5+Pm7y4UnVteOMRdPBuFhRdJHq7WHWe6yCq8sKZgq1+</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
		&SetReportFormLimitRight;
      <![CDATA[<encrypted>pY1uJRG+AnN74v4PvoYCDYFHo+1/49sJOjU7WCAXsCMB0lEq/Oub6TPSb5k3TgA0J6vQ9T3zPvbMF2BikyPGn11Nt2tVb3dSWDG5yg90OTJFjHM9TqmWcHkUAD5ifOmqHxCHU5oz7qNaxjpI2p0g4WDW/W3XNzgdpre3IJ2I4oE6kfSm/dEcehfHyhk67LlSQAqs+kgvw1JXhU5rZ7Iz5q1JKTHUpXyBPddI/t+Dz4Y3eOxTcdBEIsA81vvJxuRs7+ejund39XYYU7h/xl6oZ6+Mm8ncBPSynbd3UguOEgpHsiUn2TFSO/7NdA7ljXSCdBaWizZn143Kkur9R6o1bFaw9Q+8grOzzXbhxl8rZB+w85Lou4ROFpjc8Nsgvn+6Tj9UrStNdX1/STFTJsWNC51XUxehyaqfsMlcHeSQ9OT17BwyYtK37cqXcn0wHeeQgNEvWdVEci9HeRbylbzdzZivY2Gp93Qim1tHYmSWXz1PEjeZ7rq+wM1YgTurNNc4aA1ZfP94XGzfLiuHKWWOsdtJsNaJ0TblA+myoNo4NZJ7XFY0qHS2tOKtSGTj7T0bHejKaPpWDisseg2j8w8p/+F8QRvr74cHoL8Wn4SXqBd6abd6fh7v7bk8sYyI81dtip6IacRGO6qxKyJ7aEggfeN1UxN4otrOeCjDwrbrwsQ3tqYnavlw5DGoxRQR0Gx3Mvheu5JI6kae0pgzq/ZtpMN+hW21dNZNTJZ4pUsRJG+J/3oruySfFQ9+EwVG/3JiqSWA2p+aE4O4L0yyRx2LdaAXJ/wxzpOC8hbMZevuFT710QGbuIS7GWWxLZnEmSpEYp6CQBGwHotMEk81rOuQHQi8kfv2s5Bum4DC2h0aM2e6jEETLZVb73Cvbcw94cAV8cUsVfEYGpTnUOO42N8qAZR12V7eKzTdJKH+rCsGSm3rCnqgUtIZOgQQOHVf/iMqER15xwaXkSBt4Zf1JRfcu9hQEg47dcqccyK+CRFnrT0ik6jkTk8rbI+q2ZsxeeA6w7wsvT7msz9iiS0H6N0aI5YRFPSMvTSOseF9EwX4iOw=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
