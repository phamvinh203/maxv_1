<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Đơn hàng/HĐ từ" e="SO Date from"></header>
      <footer v="Đơn hàng hàng/HĐ từ/đến" e="SO Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đơn hàng/HĐ đến" e="SO Date to"></header>
    </field>
    <field name="so_dh1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Đơn hàng/HĐ từ số" e="SO No. from"></header>
      <footer v="Đơn hàng/HĐ từ/đến số" e="SO No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_dh2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Đơn hàng/HĐ đến số" e="SO No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" />
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
	
    <field name="ma_nvbh">
      <header v="Nv bán hàng" e="Customer"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" />
    </field>
    <field name="ten_nvbh%l" readOnly="true" >
      <header v="" e=""></header>
    </field>
	
	
    <field name="ma_vt">
      <header v="Mặt hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Kho xuất" e="Issuing Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

	
	<field name="status" clientDefault="*">
			<header v="Trạng thái" e="Status"/>
			<items style="DropDownList">
				<item value="1">
					<text v="1 - Duyệt" e="1 - Approved"/>
				</item>
				<item value="2">
					<text v="2 - Treo" e="2 - Close"/>
				</item>
				<item value="3">
					<text v="3 - Đang xuất hàng" e="3 - Issuing"/>
				</item>
				<item value="4">
					<text v="4 - Hoàn thành" e="4 - Completed"/>
				</item>
				<item value="*">
					<text v="* - Tất cả" e="* - All"/>
				</item>
			</items>
		</field>
	
	<field name="nh_theo" clientDefault="1">
			<header v="Nhóm theo" e="Group by"/>
			<items style="DropDownList">
				<item value="1">
					<text v="1 - Theo số đơn hàng/HĐ" e="1 - By Purchase Order No."/>
				</item>
				<item value="2">
					<text v="2 - Theo vật tư" e="2 - By Item"/>
				</item>
				<item value="3">
					<text v="3 - Theo khách hàng" e="3 - By Customer"/>
				</item>
				<item value="4">
					<text v="4 - Theo Nv bán hàng" e="4 - By Sales"/>
				</item>
			</items>
		</field>
		
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="210">
      <item value="140, 30, 70, 100, 100, 130, 0"/>
      <item value="1101: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101--1: [so_dh1].Description, [so_dh1], [so_dh2], [maxLength]"/>

      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
	  <item value="110100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
	  
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>

	  <item value="1100: [status].Label, [status]"/>
	  <item value="1100: [nh_theo].Label, [nh_theo]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>EfOzosaBAPZ1FLIf9trAYYuxQUtnzB1GVj+lzc5/UVCkzT7biUFSvnwo1Gb7HGRTdnIefl2vjfm7NnXsDBq91brMlBvN0S89fTcaBVRySRr36WqRJ69CZDASxNHG8Dqmf989F0W01Ls0t0V37h7HgnjA9Bu3VHXHxcUcwIOa7CoqsN9kLMx0t8fRhEZB7rwP9RYyHDTr76iWJCwEEtKPLlGjnqjJhXXw7DxVYhPfYk9R1ZrAd4S4hDWH87REXfIvR7+SxW0QT5SO5VszsuMdOSFyG9ydIfXLogNugw+TJg62H9+tN91QGyoIhigvFyoThnNgpkS30x4QXZCJ2rim5M8wYAZ+GlsYmsQ2sTM/dsN2RnjOP3e2DegdsQdbCcbMmzYDlqXELML4yqL111E3v1XJYsPqrB3wkaTcfiEgnMMdWEYC4yR3iJK3V1Xz5Ni3EDZUEJQTMuC8FCTjQGNWWw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>oYvfojAxniijv7xeESp1nYBf0SI7CjAs90GqpQND/XJfwoYZBJQew4tb3V515d6YtNSQm6ovFwSZ64YuCoKM+jt107XpZ2eYbTo7uYGBH47vu8JWtb6CfBPY1xc//mOZFZ/Qq7g/BYW9OEqx2esz9rLmmt5skP0m/eQu/rV0jbUbpvq9sxiatdkZyC/mMv+P6Tvo86ukkew6dxlrVbW1QKOllDA+DzBxkee0PmSFEBcaXhTds/+mUEvbQZQQPpGyvRLvLImbxTu2vitvSymWxG8wDW/OUmKHrCodGByqE1A6rr77kx7KTMhXvAOSw1wVe1TldMfGRpsyJ5vmzQAyBhbHAHenie0nRb2+QbvaUwBkQV85fKm1o8rPBFUS91x9N4m+/jl7n3V7F4pBRvtJorCweiy0EBCgRD4ISr8hEXkvhAeB+51Y3jdMhCPOXqquLMDu0OpUoZvd8u3MwwYw7KXHgEIx8nQ4PT1eddu3JSufQ8vZBFkJypg+dWY1GT2s9MvhxJ4XYzFH1n2T/yTPxgmJngAiczOktW8bjD71tWcAK6VRAu9QIQNRkGzKid+xjgFbsCbWAg4kn38OjO7gBPjmHmNUjulpSbK/xPkOIoh8J8IwdN2RIhudZt/aTk2J7S7zcg7WlvxEeXil+j0/VDsDE1ugZmcaVPO/J/dXN+UuKjRBOPHAYZcP2axfOiT1qrV8Bv8DHbMAVseVLorEjkJwmZwCnO9PTkUaJZL+13IfWvxDW1b8Z2kw9gayQG48EdIR22bhwyjOVpo5HiP5N37eHEooD4L+xMRc+QnTx3zgQx9TBtVLOeAK8psLpUIA</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
