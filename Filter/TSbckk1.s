<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "TSBCKK1">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Kỳ" e="Period"></header>
      <footer v="Kỳ/năm" e="Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="dau_ky" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Đầu kỳ/cuối kỳ" e="Opening/Closing"></header>
      <footer v="1 - Đầu kỳ, 2 - Cuối kỳ" e="1 - Opening, 2 - Closing"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_loai">
      <header v="Loại CCDC" e="Tool &amp; Supply Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_1">
      <header v="Nhóm CCDC 1" e="Tool &amp; Supply Group 1"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm CCDC 2" e="Tool &amp; Supply Group 2"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm CCDC 3" e="Tool &amp; Supply Group 3"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
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
    <field name="nhom_theo" clientDefault="10" categoryIndex="2" aliasName="nhom_theo_tsbckk1">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList" >
        <item value="">
          <text v="Không nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Loại CCDC" e="Tool &amp; Supply Type"/>
        </item>
        <item value="2">
          <text v="Bộ phận sử dụng" e="Using Department"/>
        </item>
        <item value="3">
          <text v="Bộ phận sử dụng - Loại CCDC" e="Using Department - Tool &amp; Supply Type"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 45, 30, 100, 100, 130"/>
      <item value="111--: [ky].Description, [ky], [nam]"/>
      <item value="1110000: [dau_ky].Label, [dau_ky], [dau_ky].Description"/>
      <item value="11001000: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="11001000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11001000: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="11001000: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="11001000: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="110000: [nhom_theo].Label, [nhom_theo]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>qTatsfNhgnUI/BEfsqRPH/RH1qQM/Nd4L97z+eXU49S4mRLz/rJkA84Lw0KrGmVUkQ5OEltDYjXJH81XZSeKgmHqzeflLrV0rs5tG6XeuS+lLRYwByGTG3Sb19cDN71Dcgcse17QjWltnqpfytxMM/DowyRJ9Ui3ttOMTs6rdc4w/cHRPMTzy3iGk/nQlgfezMlr3jl054IBOGkn4QJe1CJaHpSPCP7RDahTXO0HZG4s6Qg76MoLZIOGm3O27j58Nrn2QJv4JupC+jCOQ5QfZEo8M3a/IORUJYqIkyUYyscoFM8wjXB5kipIjNg9BsJpjdj7LO9m238tMDegOE+hew==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>ldwDG5ifkB0/R5z9CrNw7YPlnEJECsIQW7lJu5nuJzBI8ZHM8LdSIQfsWSCUgjOy8BvN6ZYAlqWBOjcMu0FUAmr4GE+kPiKgksNwbYlCa+1/xq2sy9dVmUgr128872YFq8L4rMZ2ZcOUC/6CtOTlL9Zmf4QFXW6oVGxRsB86zJnkmENlGeIhfYnOdxOR/Adcxs588CCNoobi6fA4PQloInr3pxOcrkR2r0PBhJp88KJ7Jt/0EgdWewdzEuL88uDo/tkC4/yavDPTVod/3CZJ/CDHiZrxW+Zfivrgp91cTVO4/TeSyw5MXOrhOTrsv+BJfend90+U66bIBMZBIktkRy859zqy1iqLJkix45cvhm9EAeSncgyQXBJCzB2KrISU6XcGz6H/6yPQUdRfJmZbOcqKNMt8myv4l8ABuoBzNgvumVqPebwDPvMhgzD5iqmDIMJ0vLSsA5kyeqliedBUpH6Vn8lVPPyJGiG2C8UbRPREUiwxWToW6DKzuTptbmzTg1MXTrWwf6UH+ioT+srnL2qesFWh7x+uNzAydNa3+OS5QU0DAUQ9KtrgBqmmcN25Gb5cQYJkAcdMb8qwXITfhl94cTxnL12bgCZ2F2lLDQPKQtf8+VZsY56YHldcMHfTa/mIA+QjHBQqbS/7o/iSZHd6HghOgIwMcT3gddbJwYSeSqdkTYKO6nsFdZEvsd7AVwskuraqKjpUHnavSZgAhT3P1Bq4MjMRyX3lw2A5E8y9VSbx9IVSFLnqFLu10DoyElwtuec+rSyxQsVnyA9r1hicgoY5RjKQQKAUBn8b0pYUR1zMvsA98Ss6kb0ANJdPRM9Lz4zzjydELmi0ybPFYIND2LmlHShsDIIxuIQgdFtVDoDy/9rFbokA+Z0Hk1+hVR1ZiX+TjN/cHY7hyOHDeg==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
