<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "SOBCCN1N">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultARAccount">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="tk_cn = 1" check="tk_cn = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ ngày/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn=1 or nv_yn=1)" check="kh_yn=1 or nv_yn=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1">
      <header v="Nhóm khách" e="Customer Group"></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=1" check="loai_nh=1"/>
    </field>
    <field name="nh_kh2">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=2" check="loai_nh=2"/>
    </field>
    <field name="nh_kh3">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=3" check="loai_nh=3"/>
    </field>

    <field name="isbalance" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Xem số dư" e="Balance"/>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="kieu_bc" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Kiểu báo cáo" e="Report Format"/>
      <footer v="1 - In từng trang, 2 - In liên tục" e="1 - Eject Each Page, 2 - Print Sequently"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
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

    <field name="keys" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="126">
      <item value="120, 30, 80, 110, 110, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>

      <item value="111000: [isbalance].Label, [isbalance], [isbalance].Description"/>
      <item value="111000: [kieu_bc].Label, [kieu_bc], [kieu_bc].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
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
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjO+Bim3aMMg09oeWt4icEN2KUNkw9O4MMROxx7Blf+FrQkg7x7oliqpT/j2uJHiM7YlnfF4chSiwvYmVCjg1Gw0Al1jR3LeH2AM5EqW6ScaLAiUq1WI5zO2cbyKisM8Y75R1+IdC/ferxh6oVqEGy78=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>bUGKh8Mx4egaYNfu/9Mu2yv+ysnjLIVJWW5aOLoitg2UVS560zxIUQpSGLp1NIAkmeBT2IA/ccHKtyHdl5YqptN0YKnJRcPACQTZwydqkExjpgoz5bSXEa/PQ8KB5NjBS4NfQG7mJppY45hqsP8NBEyqi7wTZQQFzOI4ZuPS+SsEvrkOh4C3BxNGDXjMhqrU4AWXvC8M5+GZoE4NyJ9M/qdefQydsOlcb8xKiUceMV4cJn0cc2EhbPZcXgSC5edvXzmxdY+bQIxDRPoUvMlhFXWkgU90eK5tJFGWNjJfZSDfgDhYteDtJ9+xE4gUhGnIA3mBFL8gTBr+KLpy45zj5Z4SHUtYSnVgU1Efe8rG9Ycw0zCQp3ImW8/urKcYFhDbA4n+iakFgGqKc3b0BzTbQgRMBHyIx1p9qeYn7GhkHA/QxmDKR0gxicjk+tCjgcvAWZ3QluQfGBWAMSdChWz31RsNr2LNZkPZbY33iQF7V0Iow/zKaM2YNL3EebeIvXiARfUH6eurNB+n6b79qfz9UFYPbpAlmXgVnLkvxpG1xcrGD4QTE9rCm1v7ikP+s0/N59MZWs1la2bQF87COQXrCUB5tvpFIJsXyKB3X89r8cmvdsowgSbvwh0petDvaj2YpawF7cYHAa4msWPhk3+aLqhsk+7nLsVutl0mrBHf+NbIjw2SMTPdUA+L0K7FvxUuVDkEMvZtb/+ez0fUTLJz5zKUCB8wSOWn9QmQFBC/bBT0MMQe6djqqf5ufmF7ZBIiCQbAGBDW2FnJvtW7P+6/2rvGTiDMajprfuKg6kGzKMCNedyM8ud6/eov7FBtlSfbs/+lRCefaLk8Lh8JtvtVR2+1gAveJqquwkrc6DJ79ml1p0QJWH6IaFhL+N7z3tmyeT5BjU6VcPq+duZkVKwt4j0UwS8VeVA2kn1/PyzO/7vCDtTtfgUnSpzD2UbWyjSMcWFWwXCgBdGhZxp8nBv4S7J54kc6muv57Jsb4oXIlbD48o0R24tCtsWKyxHr6a6q</encrypted>]]>
    </text>
  </script>

  &OutlineCss;

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>8HDYmxrt5lmM5WqJ2VZ/jMAExMycWEQ5IjD1g2hfMngspqKY1L+hEVxvlorELloJ6erhw1DakIDqgtVVhiihZkPQykKizKMYFVfmFTQZfXLWyh1LM0kw83km1qYLifimjlPaRpmpVOIzWNvncPJ2OMoSeoGt8f3InjWWZNYgkRk=</encrypted>]]>
      </text>
    </action>
  </response>
</dir>
