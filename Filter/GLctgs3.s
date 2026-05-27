<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLCTGS3">
]>

<dir type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="so_ct1"  align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="Từ/đến số ctgs" e="Batch from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ctgs_goc" align="right" dataFormatString="@upperCaseFormat">
      <header v="Số chứng từ gốc" e="Original Voucher(s)"></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList" >
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form" />
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form" />
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="keys" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="1101-1: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="110---: [so_ctgs_goc].Label, [so_ctgs_goc]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [keys]"/>
    </view>
  </views>

  <commands>
 <command event="Showing">
			<text>
				<![CDATA[<encrypted>IAWxH/LFPkZLbC33jgWD5lnXOFMo+Bz3AHsei51KB0q2fRsxW9bRCMiVXuwszIprdEKUNd92g7x6mYxUghs1wMSuExb85pJ8WA0uZkekocmiA18ij0d88qNw0je4nBLFJWkOTcVLm4S5Gzikbq4GR1LagP71ls5avkMx+7Xlxkbxlu4xniNtjbmMLFdDLptn4Q5ZjgzdQuc44I9kJfcLUKLWtQ3zjVtBq4qcfaudXcRJf0Fvd/k99lsG4WQy5KFN</encrypted>]]>&Form;<![CDATA[<encrypted>5Dk18Vsx8RJ/AEkKNXj6inE9H+FbWdGTTq3PfO228aI/cEqVfb0FHxBb9DgKEDsEP++v9Bo+iJuNc4nmvcLZBSSVqocPleMIlUu2/+kZs+ybgkbFN/MVE356TnNoJNpZRXw5V6gp+W5DEffbfjLWdPCn/uTfo71KhvjmMS5IbVEPxaczXWtQ5ym+sSVjbvcnm6ijshw4R0a+ZHeZOIgo9LOLxnuwDShEPlvDCspBy0vkxy1xt8J3BEHiwOHFoZP4</encrypted>]]>
			</text>
		</command>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>axSWm42bP66L27y95mWD0e8WIRWu2kYNFesVR2itJ75Zs+/a5ZY4pwfw5DYiV9JvHo2x2/RzIzQKkpPrzzCmnFgeP/QNTto+JsCuEbicp0poeoX2RN9LOXYOCSYHS0HHfVLdKgOROvgbsHhH0dRR8A==</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;

      <![CDATA[<encrypted>cjvO2xO0+i81Cp0JGCLLM1bYtHUKuSR0542MZzJOazZLZo0UxDD+FkwzqtWCSu/ymIT42UQ39hOmH420dYPjXcQkjmaIxtrHdy9CapS9iqm5YGbY1AEgvZ2nkNGvKB702ZA3GtdIjsKz0g9lMEe7m0XOT0Biz/h0V3lG+RMFY5P4MdCXnJYygA3iGvhdpt0e67zjDopnTpbiQSjxVfHJtw6Ag7QA7Hq12dwIG+r3go2elUw2k6cji25WKbjp7cAkoB8XYiR5COf8sgPn/rfBofthNRIc5u72fTTQxznt5IRn/DvBn0OCF3iR6rvVttYWIzUac8ZRFB5cN4ES+C3AtlZ9okmlRHL2HX6AkrOXMMZ0G/NiNklIu24DyGBcDHISGdQXvElkZgUCdwITQQVvikzX2oXZ2WiE5wX0wmh2385RrIhn8s6Yq8eV6D1dxZxu8BffU5mjYMpV6oCTIcCvjqw9Ql3tBiDFamC1vzDRrHe+5rvcU3EbuvvlqYaoi4CBBr4ZKNFGkyUC4Vof7erUZkHcIV59CKdlO0oD7U1lWyBx7TcB5HLOlkPOAqoNFiDV7uVQRKynvwQLEh7teZAUfoJ1ayTKgkmqu7X882twz4aJReLg/MjcEsl6DGpDlkxiN/P1/Af0kejAsAh8CaVs0V9NX+/xTwY+vctZ+cf08CcGtxMq6tPK4/9MKtjyRy9V3FvSOI4h6hKesGAsakXum5w+EP/Xfr4mGA5mjdgjKY/3ITjx8SaGuQABN13fTZM4krc3H5WKwcLryJ3jsKj8gA==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
