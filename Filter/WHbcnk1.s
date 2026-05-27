<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
	<!ENTITY Controller "Whbcnk1">
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
  
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="loai_du_lieu" clientDefault="2" categoryIndex="1">
	<header v="Loại dữ liệu" e="Data Type"/>
	<items style="DropDownList">
    <item value="1">
      <text v="Số liệu kho thực tế" e="Physics"/>
    </item>
  </items>
  <clientScript>&OnSelectionOutline;</clientScript>
</field>

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
				<![CDATA[<encrypted>WAx1EIzggWomp7TPxhHO3pTgjy2rJDbdwSEsg6CCv7rwYFeyqkzEnI0Yl0FVlrSnS9ZVMBblDwRjJy/Ih6Sv/cOZlY0kXKEHTSgymdoQTDkgdUBCPV1CE07hm8iGY2FrZzXLx6xfKilgqYibCP6jtHS1YKcYWvvNZK+LMwfCZTBJ3lDc4jUG2msylCtDzX3haq/lg+HPD+kAWODlBwR6E5zgJbHLQLrHvGWIKIT9qG48gCZUGdQ+hp9IHpvJqFlsC73QB9bTK66FMdM87/y4xQ==</encrypted>]]>&Form;<![CDATA[<encrypted>VfAQ9kahSaLQDNcRqzoSWFTYZ1C6AVn4AojxGeeLd3Om2qYrrFHJ2bmMBKSlLlv4s9e5F5KwppS/hbtXiuRgDLeGuy1EZbechg5wjksO2ekBOWVLLRy74OCpOvrE++eIeAvsmFDEdo3apObc22hmVnxj7WExSVXdlIbrMaFv+cRtSSc0XphqIhLhlg/tsbfKmBJZBK2dezHDY1/15JVjDe9MMVrJsN+C0hn/HJ0A3u5hvqMtzu0urzwB8scru9/z</encrypted>]]>&Form;<![CDATA[<encrypted>Rr9dr6HCpgpOBiiz4kDVNWaWhkElYIn/PjVUMKrYqZA27CPsYTfmVeK3M8W5u6og/GjYyOAMg/q3NY8Zy2XO6B8siRnY3SeKmu4/amiNoqQxhor09Y9f32voi5WW+F0lf1d14gWVJSs5NVCoKbdPOjiRl67YL4QhSMQXiQnNbZVG/AXwuzr3R46+NIeZRgKyCePIh0TFkMwnE0JQpUNn2mQUV8oHtpQiEOy9i2uM0jU3P4el52dgqNqpYGIIB397WPVcFxpax8D8pLFpgEx+zg==</encrypted>]]>
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
      <![CDATA[<encrypted>CaUH7pzCpKkDFqBtT2CmS27ZXs7dF1sKPLeuMxtLbBECjSSis8WLamk940Hayl5hrbZZgQbn5j+WzveJyZNKw7fZrjMzxohvKkv8Ovc7wlQcxqn2Vp5u2gyPxyTR4oWI2Z570GsZBvNlLQMbT6v3QVUihDuXSA8OFHtMo03MLQrDt5/WVqUVWI1N21v3hHc890DhE9usAzqx5Lq5JRcSTgfjDTBHxjwpKDuIP8MS6tb1Zox/FDxPh2JogI1jTHEm05XzJ5WmJxqyLxg7L7LPvLhRFMg1n6pD1hLX6TUXQnz4ypOwBPtHM4RNYSQSkx2woMJy39NaPbe1D1BYsDweBZTeS9rgc34DdWo642aixzrU+fytmUnq5zWtts6hKkEvxASuGoh5csUWIUIFM0Gjiiy/rKJBvIvbxdCvBZELkNXtuYXPo8ljqoI9NvlEn5huoeOl/aZrVzWy6DUCEJfBteOPbV2CjPWkTmJYZ/FwdQDgR0HlainqA/arWwRyqqWlIxt+z5Ag8FKAU6CP+eal7RUz1z6ytaiFDdILqXCVgHS7H9ygAWvOZUIVz83Zb23RpfsRgMBt+/obQ9YxB3asYX/QFFPKnsrJwAaI+tmnhy069oNbwp2XH12NKg3sukjWBNYm6qdZqypqcC4b1r4nleThgFa+LCEBpLmlFhfelGBWvDHYkxaQS7jkxOGW3/Uv5T5trs5OiU5bn04nqXc0IwpnX2jGkf5FIsppjffJvEJdeUelWubpq+S8M53lAJzrvQM6a50NyE7sCHimPrhKLX3he4/6tH0tU/JxHNrtBtJ2sJ3cg/xXr24RglpNQ9B6kNjwdpQcnGBWaOjBR8CB5ipEBoWfLYnxzxgwo6YThob093Blt45a4dLw2/D+eYyA</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
