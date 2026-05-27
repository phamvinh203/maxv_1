<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLCTGS2">
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
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList" >
        <item value="">
          <text v="" e="" />
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
        <![CDATA[<encrypted>axSWm42bP66L27y95mWD0X5wYlSnIqfSyEW78C+0/pwwUip3r+hedrkPh8SbQTHY2i1YDoPBt8yaaeK/sx6OTo6HlSI1yl9ilX8A7WRq0YzggAf6Yrp4q7O5XDho8CQ1i+8B1yduYFqToRBAf0gvBg==</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;

      <![CDATA[<encrypted>jAM+2OWNong2bHD6+883qiCYsbviCl/bYaXdRfQhBrRLLjQk2JytZVkknm/j1LoIy1dILPiDkgZY3uFqtSMl++HM6CFSJ3885031Od1uACvq2LERtTXhcbiK6y+VtzrixpzzliYd9pLJ6fc/Cr5sYAskyvHcXjkBt+f2dI2LcsabvJrZcj9tYxRn95BJrsX0S4mf/Pqk8iLk9qsj+wh9M31d9ixafyXYibQi20kP2lc4Zylx49BeGMAxKvOiDt85ZLD8/ok8SPyLyDKGxewscKgy80Mz878gZZGwk+DdLrIFYnhVwN+ENVgo1ycZ0bbn216FaqEz8XjDgwTtKh4n/dC9wERwshD6g1wR7aE5b+MD7deKtqcg4ES9cQ8+2HS9WZy8DxIn/WZEGlhn+G/Cu/EsNyhrpiZmCj2VW476a+X8FERlUk9Dto3WUbLQC3qse/LhlOxXrKl4/e/M7cVCxBIny1I9bblbJ26IyvMT8MS3x+OMeuTkR9EfVX5RcJD+mPTuc+pOdz8ClWR2IWBSE0hHwJSWrs1YVgXdp2I7TLV8qsxNp4rQS8H63rPGSVzTPekaJGDL/aNGNH/JQtUdwNmgoXGrgSCo0LcVMetJd3SFaw+yCUY+9KtjDxcqiHHEntcnV9KLdJ9D65lB2vRG+Ny+oWkqv0n94yuNyVrz0Z6PLkVgyhadZia1QT/AL8cBu5Zblu+1mznFZSHpuJPKiJAFL2tzlkWVaWJd1W62SP9vQQTlrE2n6QcV0CM20P1EqOziuyEI47jeA5+Wek3WZA==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
