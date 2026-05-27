<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLTHPHI6">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay_k1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày kỳ 1" e="1st Period Date from"></header>
      <footer v="Kỳ 1 từ/đến ngày" e="1st Period Date from/to"></footer>
    </field>
    <field name="den_ngay_k1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày kỳ 1" e="Date to"></header>
    </field>
    <field name="tu_ngay_k2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Từ ngày kỳ 2" e="2nd Period Date from"></header>
      <footer v="Kỳ 2 từ/đến ngày" e="2nd Period Date from/to"></footer>
    </field>
    <field name="den_ngay_k2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Đến ngày kỳ 2" e="2nd Period Date to"></header>
    </field>
    <field name="ds_tk">
      <header v="Danh sách tài khoản" e="Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="no_co" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Nợ/có" e="Debit/Credit"/>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>
    <field name="ds_tk2">
      <header v="Ds tk không tính g.trừ" e="Non-deduction Acct. List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>

    <field name="bc_theo" clientDefault="0">
      <header v="Báo cáo theo" e="Report by"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="1">
          <text v="Phí" e="Expense"/>
        </item>
        <item value="2">
          <text v="Đơn vị" e="Unit"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="nh_theo" clientDefault="">
      <header v="Nhóm theo" e="Group by"></header>
      <items style="DropDownList">
        <item value="">
          <text v="Không nhóm" e="No Group"/>
        </item>
        <item value="2">
          <text v="Đơn vị" e="Unit"/>
        </item>
        <item value="1">
          <text v="Phí" e="Expense"/>
        </item>
        <item value="0">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="2, 1">
          <text v="Đơn vị, Phí" e="Unit, Expense"/>
        </item>
        <item value="2, 0">
          <text v="Đơn vị, Tài khoản" e="Unit, Account"/>
        </item>
        <item value="1, 2">
          <text v="Phí, Đơn vị" e="Expense, Unit"/>
        </item>
        <item value="1, 0">
          <text v="Phí, Tài khoản" e="Expense, Account"/>
        </item>
        <item value="0, 2">
          <text v="Tài khoản, Đơn vị" e="Account, Unit"/>
        </item>
        <item value="0, 1">
          <text v="Tài khoản, Phí" e="Account, Expense"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="nh_phi1">
      <header v="Nhóm phí 1" e="Expense Group 1"></header>
      <footer v="Nhóm phí" e="Expense Group"></footer>
      <items style="AutoComplete" controller="ExpenseGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_phi2">
      <header v="Nhóm phí 2" e="Expense Group 2"></header>
      <items style="AutoComplete" controller="ExpenseGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_phi3">
      <header v="Nhóm phí 3" e="Expense Group 3"></header>
      <items style="AutoComplete" controller="ExpenseGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 10, 25, 75, 100, 100, 120"/>
      <item value="10101--: [tu_ngay_k1].Description, [tu_ngay_k1], [den_ngay_k1]"/>
      <item value="10101--: [tu_ngay_k2].Description, [tu_ngay_k2], [den_ngay_k2]"/>
      <item value="101000-: [ds_tk].Label, [ds_tk]"/>
      <item value="1011000: [no_co].Label, [no_co], [no_co].Description"/>
      <item value="101000-: [ds_tk2].Label, [ds_tk2]"/>
      <item value="101000-: [bc_theo].Label, [bc_theo]"/>
      <item value="101000-: [nh_theo].Label, [nh_theo]"/>
      <item value="101011-: [nh_phi1].Description, [nh_phi1], [nh_phi2], [nh_phi3]"/>
      <item value="101000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="101000-: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>M03/tScRSCk5g0Hqs7BFDkX+WuSTz+n6mibmMeq+gLDzGQWeoHXbhWafQ7vTsJ56xn/9B7cUJXvcV8hETDYjbpIU6ZTCT5iXce0LLwIqS2zaFKd298NXDyvFUdJSSyuUeexr2wcmZQysjdV8eKhaZPXecCmKv+807tVrJkHuLB5LIaxsxQDcjwMsDEfWN8XP/Wz27G8YfRs4PTyRyFqb5N/K4vlLzF/nHMWEzsRvNVYzPjuT9xuzyGcERTKlBWbLnCEazE1E1Al9oLx2SpXRFolXyMsFDrNVGCW8+2HZP1CnZ15QQ790SZcmqEGpCTB6FCB7n+1NLN+uHY/PbpcPr7U19p0Kd8a0CERpHvYV4TU5VGFACgB5XsbF5pmIVnvtoabQ5xSx1C75qmHgrU3hNd3rVngCsYieF144997X3mhLjTOsfjl/V+g/h++AunoTjESRpLbk9c/CfFd66y4ZKw==</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>f7WBbzG1rXoeyGiJUb7h80HMrFtv5OnrjdCq9IhDJCqm3YoVcFS7fk38lgNfv1QvutPFcwLJhD1nxmel5Z/U5vW7eZCmnasX30oFgVyRdmsBuMmuQXsHgR9rwP/1JEsTb3J7V5Ror98xw5mW9YwKJ5bRv6e6isSejUbLaNRh+J4ePZG/ydvrfkkO1dm8jdCjFE9qkjh8+fmuakArs1JEcNoCy3Ix10GX3sPqYPtHb0ydbJNqwcMM+epryliUap6ebXxqCLDlTicao9i3r2SA0AMl/l6c8yWiwk7Ji4Ut+YE+4ggt587Qp9lqHHRHE0aamKmMSrJopEGg2M2w2gsO4EnTy/1nfenTJYDRyLxPvuYsXY7DfJgeL0G9nd0MAEe7MlviQYWkKHWZvNE9JL5UQXoywtQch1Oep8aIxKwQKBmoAlCgoiExmH9q2Y4j/1ayrgKrnkd0cBE8dMcZMcAY5EjxcHHftNDUkPng2ODhKW86reqJWjklXaN+UdR5jMUfIxzpdfe8C1rLnRDj5SejA+HT/cIcAFd3wG2gA/n568SKmPK3b9xvq2PvwE2wpz5QaZOoWvy7CTzNGBVDC5E4a70g4T7qO8BNqGIRPvBIxtKvxVttR5byxuvnICV4rhITfGwOBzn5kqVZ2KkIkOuCYMMuoRk7y9PV76ZAoaPPcBchPKa8BMqz4YjJdLIn5O4eihCVnjjwWIsEWO70o3Wv2BhbnWnDyZPaFh/fRAOL+o9oq0kUHO1ppHVGijipQqoHib1A6TtMFbozzpptpNQ/tHQHqtQ1tsdfiz9LGb45MH4ObgKe16GV5mo/vwiqP7dcpwBF7ZxDlJYHphKEI1b8mlDyijAMEIZ2NGzIaSJtgmuR+YPH2UZOJjwgqB31Rv/3NdXEny1o4GOTAROos4Y03kQ5MKB5NCvUfNYiN63oHeBvb5fuAEkrGDwkDly5HjvBnQUV+12Yc5R5F0AIasiDv4+CmbjqtcK9GhSJDqjMaK/JYh0wlQzu6sT9mo/rTRUd</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
