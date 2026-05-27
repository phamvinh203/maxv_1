<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
	<!ENTITY Controller "rptReceiptTransactionList">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeFieldUOM SYSTEM "..\Include\XML\ReportDataTypeFieldUOM.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
	<!ENTITY Identity "&Controller;">
	<!ENTITY FilterExpression "f._filter$Expression = '&quot;' + f._filter$Pattern + '&quot;.indexOf([ma_ct]) &gt;= 0;';">
	<!ENTITY XMLGetParameter SYSTEM "..\Include\XML\GetTransactionParameter.xml">

	<!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
	<!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
	<!ENTITY Form "INBCNK1">
	
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
    <field name="so_ct1" align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="Chứng từ từ/đến số" e="Voucher No. from/to"/>
      <items style="Mask"/>
    </field>
    <field name="so_ct2" align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="" e=""/>
      <items style="Mask"/>
    </field>
	
	<field name="nh_theo" aliasName="nh_theo_inbcnk1" clientDefault="1">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
			<item value="">
				<text v="" e=""/>
			</item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
	
    <field name="ma_vt" categoryIndex="1">
      <header v="Mặt hàng" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="kho_hang_dc" categoryIndex="1">
      <header v="Kho hàng điều chuyển" e="Site Transfer"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho_hang_dc%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_kho_hang_dc%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="tk_vt" categoryIndex="1">
      <header v="Tk vật tư" e="Item Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tkvt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_tkvt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_loai_vt" categoryIndex="1">
      <header v="Loại vật tư" e="Item Type"/>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" categoryIndex="1">
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

    &ReportDataTypeFieldUOM;

    <field name="ma_nx" categoryIndex="2">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_nx%l" check="1= 1"/>
    </field>
    <field name="ten_nx%l" readOnly="true" categoryIndex="2">
      <header v="" e=""/>
    </field>
    <field name="ma_vv" categoryIndex="2">
      <header v="Dự án" e="Project"/>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" categoryIndex="2">
      <header v="" e=""/>
    </field>
    <field name="ma_bp" categoryIndex="2">
      <header v="Phòng ban" e="Department"/>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" categoryIndex="2">
      <header v="" e=""/>
    </field>
    <field name="lenh_sx" categoryIndex="2">
      <header v="Lệnh sản xuất" e="Manufacturing Order"/>
      <items style="AutoComplete" controller="MO" reference="ten_lenh_sx%l" check="1 = 1"/>
    </field>
    <field name="ten_lenh_sx%l" readOnly="true" categoryIndex="2">
      <header v="" e=""/>
    </field>
    <field name="ma_hd" categoryIndex="2">
      <header v="Hợp đồng" e="Contract"/>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" categoryIndex="2">
      <header v="" e=""/>
    </field>
    <field name="ma_sp" categoryIndex="2">
      <header v="Sản phẩm" e="Product"/>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_sp%l" readOnly="true" categoryIndex="2">
      <header v="" e=""/>
    </field>
    <field name="ma_gd" categoryIndex="2">
      <header	v="Danh sách mã giao dịch" e="Transaction Code List"/>
    </field>

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
    <field name="maxLength_mo" readOnly="true" hidden="true" maxLength="-109">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="258">
      <item value="130, 30, 70, 100, 100, 100, 0"/>
      <item value="1101---: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11011--: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
	  <item value="1100--: [nh_theo].Label, [nh_theo]"/>
	  
      <item value="110100-: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100-: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100-: [kho_hang_dc].Label, [kho_hang_dc], [ten_kho_hang_dc%l]"/>
      <item value="110100-: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100-: [tk_vt].Label, [tk_vt], [ten_tkvt%l]"/>
      <item value="110100-: [ma_loai_vt].Label, [ma_loai_vt], [ten_loai_vt%l]"/>
      <item value="11011--: [ma_nh].Label, [ma_nh], [ma_nh2], [ma_nh3]"/>
      <item value="11000--: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000--: [mau_bc].Label, [mau_bc]"/>
      <item value="11000--: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="110100-: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100-: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100-: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1101001: [lenh_sx].Label, [lenh_sx], [ten_lenh_sx%l], [maxLength_mo]"/>
      <item value="110100-: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="110100-: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="11000--: [ma_gd].Label, [ma_gd]"/>

      <categories>
        <category index="1" columns="130, 30, 75, 105, 105, 100">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="130, 30, 75, 105, 105, 100">
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
        <![CDATA[<encrypted>Let80D0Zwu9iY9cytyoFKvUVNBXDDKosuvJqBVaY10jSRODsw+t2L1ivibC+IJBBpRDWmRNl0JH2TZFRBKxObV7idltLFvk41t+9VbnoyvzoHKwk1WEaoRcwndbSgQ7pBP5PP8N7V7v7T0/x73rnLbbx6MussXAItJhiKy6HQwE=</encrypted>]]>&Identity;<![CDATA[<encrypted>GyEmappYCqSOSBCqTGEUegpDnDQJSOUKfeS16npcLaK+rLNeLcXTyj+KgGbN35vnB9MIjrkWIjoRW+4QVGtNxXhF7LXqn5uNdr57/gYHLsdgddg9xywu0K8XikSpRUEHDn86ns38WnWvJNl/f/90x/zGS1jxUVyyaJbJ9ghVBbQMcpSHnsrcVALPsxRqMlsi+85rqR9S05TdzgaYmRvf2qifwfY1txNnhvQd9GoC1S+EOhF4BQN6H2WDhw50Ihq9w58Zfu4rBMBHcw+wzREIaY+4nHx9CouH4wMZM6DlVAru4kQb2AGTy5qep5Rdj5lkovnLqv2k4WSNU3zouvXPMw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
	  &SetReportFormLimitRight;
      <![CDATA[<encrypted>CaUH7pzCpKkDFqBtT2CmS8aQkmKg+WVNKY0vCG2mbV1tHO7QnxIvVyHNQLa01y0h/BjvA0XSKxd7JbHu0hXhRhNboT6kO3gSNU+pti9aQxmQLcma5/Nsz87qOVWZHn03iYZX0V3x0zQLwin22TEEw3DKcW/E0INk1gaf/NZzbU4DNESqW2XobeFIAeOAAKhDrQK9qCGJez6hSz/XOWuQVp0JaSKR4WXDbzBEelTeR2V5XemWeChIywUeT7z814IhFnUKr1TwsMEzwho3MHXiG86T/iqOv11W5QxYVZ3tncJw4+VwitBIuPyMMpHlQ4To1Pbe0A/tZgVDA7DIxgh7kmHZopflzFquesTTSxqD0N1WBbp1oNhi9gCX6ZhmpX1DrP+T6PMe6zBoo8V3JjgPttSHXemy7v0qMTUFSdkFNBNRHLfOVgpWlyqK8Bk7oD+hfZb2XMrwZPM18vRr1fJ5B7RGJTMSdKz0blio8vS2Ee3cmkWxoM8U5mikOdPAcab/oma+W694RV4sbCHKt6j7SOTp/a4bH+EURI96FgnuI8fCIYiM4FVRkYp0IPhMuO8g8xP0SNDsIZjqip1KhPaKP8IRNr81L0cCRS3KQK3r0U/R6KdG1nlhCCvitOlrMuXkCGWjs4TOLH77XE3zM+KB94jiSNDYrTbAxUnLNfhZ1XVsJgNutKTGZ+gJYXZhCIjsT0HjyvTiZlAmD7aME0r57MeC2js5JpNo3hD7wLdbAEOtzCmfSF4DhuNM2yksglnj8ZevjrX99UuT1znYuZ9G7pR8OWH/jXfrq7NbAI67/hUwwhPjbw/jzwF0OrHuMl3e2j+byIE4s8aNJGC/DDlUQ9Su3qzn4hjiPHn0muZlA5dPw/rgGFTrXqdnkWc8bKRJ+3HhLnMuD6KZjYFF7VlpjWoy9N9Cc0pqrdQjIPSTN8P8lLK5Sy5xlTEw8ccQdTvv</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
