<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "SOBCHD3">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_hd">
      <header v="Hợp đồng" e="Contract Code"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_hd%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_hd1">
      <header v="Nhóm hợp đồng" e="Contract Group"/>
      <items style="AutoComplete" controller="ContractGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_hd2">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ContractGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_hd3">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ContractGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_3%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="sx_theo" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Sắp xếp theo" e="Order by"/>
      <footer v="0 - Mã hợp đồng, 1 - Tên hợp đồng" e="0 - Contract Code, 1 - Contract Name"></footer>
      <items style="Mask"></items>
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
  </fields>

  <views>
    <view id="Dir" height="186">
      <item value="120, 20, 90, 110, 110, 135"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="11011: [nh_hd1].Label, [nh_hd1], [nh_hd2], [nh_hd3]"/>
      <item value="111000: [sx_theo].Label, [sx_theo], [sx_theo].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>y2CUj5xDIjEkQdb1dZUzWxL9xdjAkX3UPga4CPIg3abM06R5b86MNYE/oTIywvsvvCluJP6LU0XKnM987Plh1yWtu3Lr6lLm9qA+9f8lDQpRe7Tj2D77ovmtXk4QcZOzaOCPoPuEiRpZMRS7lKVn3/tykCPjYGFPtRwNw7aOI78AY+o9sUvlqVjIEjNG4yl/nRqmSN4J9zhpAT96sx1vKBBOTPjl9cH7g9xbHrJrBc2l/4YGyYNYwF0IA8QYEpNrp5u0Euh5wCSvIQs2ceFS6dLxtyLR4UKC7QNKWUcMOznRzEVrQ1nQWIfrpIW+Z+g4IaED8t3V073d+650W8+7LZNbmiKdYIJoCD0FjBmrkBZ7LnfSgPmmR7hT8n24ay9b</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>rHRSwslZMic5Lbl3gFjEhQaDQxXJXusDW9po+Uwg1WDd12Ir6Pvq63J5xdRKjvQcaa+eLXngJ62Q30762lxys0YwX/0EuezoUUPtjeQTAFJaljQvhCCl7z+3mO2ojzwmnRkZ1T1kZvSbTkdwo3pryDKA0oU9Gddg7TdGIfMFCDdvzemE0DH42byrG4BbNl+NpBPF2gzwI7dCOFy7z0D4ij/3GIwQpoND4mpIT0Oy4kgFYkkxWpgHPZ3nZaakkYaVbNZpdfxi/QMc2bxYxPof9oJWrL1EbImuVWmr6SE46ycQFOtWTri8iziMDOTteYtCwkD/G4O9vI8MyMiLj0agFl274hf4nEqVL5A0EDqcZ10d+EwuSWP9hxyYgWCNxBLkEIeO3blKMbi+aO5IaUlHk98mTBfAytvnv9mZvLdjIXgqvzOkwQx23XB8QyxPSaYZWTzkHj5ZCgaC84G4MmRsfZgco1+0PdGxrROD21j5b2RDM2WBBRUratlEL6JSQBZUYgw/lPubdXtAlPsjXwQzh7rpS+5uPDYUv+pVyf55yWxYvWeSUEwvo7iYkk6b33H72FgRlq2EowpR2aFi960iFHZva8HLeDLc3hQBO2qSVmLXcy2VoYFYqyPoidhQW96P+ZLTlHVE4wqeEdYJWPI8FZsg0/UPMbhQ01w+HPkUJpM8O0tyVdq9Q6Ai9W2fKCOZO+e+pLwg4BjMoAuTMxtq3cnpzIjYBvVJ4TOgaro77tpI8ajkhygE5pcFjVqV+Iq+SNsZ8BeJWTXahpLyT9sbH0ZZcxv5DpyJQmgQaNsKqrTORyhcOPD4iP4x4YpAlP1uMEMyXzwZcgdG8OQMT07PGGtk+i0BE+eHX+v/EY2pTLlJququcpkNkyyPYN0gH3NR</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>oi418YDhDgYQMMvpwvrc+cbVOWr9OPMPV6R0KfX4xC1ijcX1YKMM1Nd6XoDM0P6/pmN/NnF4AGGV1Z8ygG7twIaD14ze8qTv0+FzPvmZdEcXiU4LPINBdAhlLTbU5g5lgxbOmkRjFdFPfWR9q2iMf47KuMf9A0zVFH3VmnYkACQ=</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
