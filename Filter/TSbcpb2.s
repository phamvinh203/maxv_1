<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "TSBCPB2">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="fromPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="toPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Đến kỳ" e="To Period"></header>
      <footer v="Đến kỳ/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="tu_nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year1" defaultValue="(new Date()).getFullYear()">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year2" defaultValue="(new Date()).getFullYear()">
      <header v="Đến năm" e="To Year"></header>
      <items style="Numeric"></items>
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
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111---: [tu_ky].Description, [tu_ky], [tu_nam]"/>
      <item value="111---: [den_ky].Description, [den_ky], [den_nam]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>x/lzX3fX51YEXVF05xgmRXibPXeoXpFS/cyINGBqhMKYe/2FY0Qml4WWFKMTdOLqjEiRkO2kO33fcAMjtGTKRXdHcZKF5+VSACHnFd39QuYn8nCdpoRXkkscy0Ob9biOdafCjLj1a3NbOwT51+xx0XQ7oqDgmuNANqE2K3FdML92BUs/airGjK1dFoYqw9KakfFpe70KqGOLzPhvCDKntw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>6h8Q6zEeBPr1lRH/9ZDlWMLRyOU2Dhu8b9I7J7mQCNWYjQbWeq/EpUUYLRYFQ3bHFEutGNsXQpeNJEnRriGmH8LSVXt/q4H+e2h0spdST9ikAvHQ6bNPVpgQModKM8sJEKTFcI8EaUQo0hD3mA35hBGH0EgyqxUMb8gitPkDFpH4v2S0EBUn4BFVKfpocGWvBnROFoJC8FUhRaOemIjP8r8lFAiTgXguxprgoY8S1UQcMmU2yYPKm1edDpWsol9ugCz1Z1zwG/lTd1JQK0yktM0AaL1IPtUoBfPPkQGbcVlKPL/7URpHIJ9btGQMog9YkHIIfE6INicOvFSsZGteSKmgVrgg9LsEyyeajr4Q1lrRC+OArR49oQUIQYc8WYS+dG6cKWE6YjL/GCaJlzoIYKSqIIDKmJwvvQD/hLWh97tuq1OaGNv/mBYW7b4QJCC1ZPws5hpghIBE4bcrg6lzmMj595/K1fTstSQMfMMKzpQ+HIL40y4OVbi7W+lUVQFBBhmBLgPg0CZR4T57oXyzm4HoFWKWS+KVXPSE71p/jkqtMmXfEMM6CIdGoPBBaGgiyMFl8WGW5MhS9Pir3g7GQi7x+7FiQbmkHxOCA7KIJTLm0vX0uhRKlHccUvfz6GSQG2UhXu99B9cN9H+fELEfZyuu3Kle2/2zHFH49OLez+wfEr3klyeltE64hdMpSgURkLAEOnaNM4/Py8wXikqjZxLzQq/18K9TCaWNr4cyR1YjjB00pKEBf9qyv7jMq8Yc</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
