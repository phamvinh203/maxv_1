<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLTHPHI1">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
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
    <field name="bc_theo" clientDefault="tk">
      <header v="Báo cáo theo" e="Report by"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="1">
          <text v="Mã phí" e="Expense"/>
        </item>
        <item value="2">
          <text v="Bộ phận" e="Department"/>
        </item>
		<item value="3">
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
        <item value="0">
          <text v="Bộ phận" e="Department"/>
        </item>
        <item value="1">
          <text v="Mã phí" e="Expense"/>
        </item>
        <item value="2">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="3">
          <text v="Bộ phận, Mã phí" e="Department, Expense"/>
        </item>
        <item value="4">
          <text v="Bộ phận, Tài khoản" e="Department, Account"/>
        </item>
        <item value="5">
          <text v="Mã phí, Bộ phận" e="Expense, Department"/>
        </item>
        <item value="6">
          <text v="Mã phí, Tài khoản" e="Expense, Account"/>
        </item>
        <item value="7">
          <text v="Tài khoản, Bộ phận" e="Account, Department"/>
        </item>
        <item value="8">
          <text v="Tài khoản, Mã phí" e="Account, Expense"/>
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
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 10, 25, 75, 100, 100, 120"/>
      <item value="10101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
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
        <![CDATA[<encrypted>rZbYENDTiukVpKdNdmOSGW+sBjS1U+IL/o+YnReEH5bJ6CRE+pXCokz7EAqzlhCsUH1u4Zc/l/v99ML3vABdF9shyKg2C0PkHRZYT8lP0YM22qKlA6NbulM30tvUuOLawEMhwNJJa0oBp4EeJRAOs9V63ZxaDPkPf6Z3R9IYbmtXN3CqFiKAUlKQt7QwZWZUQ4bFcNc8AeAgF5NNfi3rDIrWBAyaIFKBalTdQkfwT/O53kCmEQHbTJlaLCqw/xeEmvgtCk7NX8NXkAFt4XewhPh9kDEhH4jA9zSXvsqhHZUzfT5yzIUJXL4ub3whg43gqC1IV/4IFYjqQhtCEUQH2zJL4+nxgFnBivISlU/9REVO+0/OA4BW1GdT+ncS+DQPAQv24qV1dPJdTWDWsYGmLCtBFzm8C3ob6hpXqKOjIVreWNTR85PbBHs32mO2EmxK8oTA2ccKTiJ7eL3YZWm8x5cEj6teZn8r5aiUmEeYXWd2r5xAH7Y5UgM6VuH+woNL+XGckTRtSnQHZxyjMACRvO4RGQ/zD9CCch8Vg13AK+4JGxlwLITWC/9bQDM1KeMTvKd6t7C3K3NT89bncJfP0EKdS0WpPPZLR96F6NZ0bGI=</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>CaUH7pzCpKkDFqBtT2CmS1dPe3xtYsrDW0DcAhhvYkD87fdu6YPneO0QyFGnhFGz1z9qiGH+nytK1r9VwmuSSUM7vtVcduCqJrF3EZGvnOXlDNMKMI4S8V56f+Y4dIwHxlB+1Dn9J75t5avanjjPsXCs17DUJRM/O7pmKkv1dmDwRd3FRIh3Hem/M+rYEP6U8SjA9bBwKtWKnFm55p4HH+UizMf0i5QAs+fNhfP31wikC38Pe+/G9AOzPY+dMpSGn5iYgopr4LOYodBggHAIF2ekuzxGHjAXN4HaHAb6HFjxtPVSH5jSxHKjr3W9XerzQsaY+a4437S1Hw1X68c4E39jSyT7ghLBCOX4leWlLPTiLrizbvp9GTRANcvSErSCCJNYTgLfqZarXvj1RIoEKdSt4ItcblgHMz6/el4XLf5otoIASM6h3s59LgxxwevGClMoiBrIUYOHRjcWdl+DhgK5huonNBeH04AICUt+N/txiWhXWU8SL4oR3rEko7JqU+FVih7eP2ZguiiPU83lip4AKYcQCzGAfq0DAHhFerbdV80vuBb8tx+5g6/ACPdPdDY5s9WcEilFAFQRLXNLRnha0mBNtO9LJL4k9cZagkOtauQZYf7F/9+OY1EmqtgOSLOiTl56aOqRH8mtv3pLhbEcvifSSSNHrA0sfHHF5UeV+4/IMcadhJBD8T1dx5F9zhQUpBaVHSUfJsvSGNymx1c1qPiRR1NGXvE1Ut/UhKJm+GZhKgrwsfD5BkdaAocGjVFpaRN0tnhPRIrlWwvH6s5bA6NNVrjMU5bIexNZF+I=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
