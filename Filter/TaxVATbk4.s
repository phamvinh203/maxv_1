<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "TAXVATBK4">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultARAccount">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" normal="true" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="10">
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
    <field name="ma_nt" width="0" hidden="true" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101-1: [tu_ngay].Description, [tu_ngay], [den_ngay], [ma_nt]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>A2vseZFsoQz+SKIPEQPOa0yMhBP9Mg2/EvRQyxVKHGIDm8iMEljGJydBS6CL2xxxdk5Pb5eX9/y1cJ4mxfdZN6u8daplDwMu87lHdhL42y+DmR+h1RPCg4c5fKANSzJr817uMiBA0Q2RHjAy5ORpr0FsBNAxSgCSoIzj11M6LGoiRNG2rHSg/Pwyu1ISDONMG9ZIrl8gPnmox5kpCHp5s94PfIDTGqJRxWthRPf+7heorOoMZCNv+3Bmgle2NkeM</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>jAM+2OWNong2bHD6+883qoikW7VtfYad0xB4LX4+/HR6jTHt2gio9eVRq4dLeRVXsuhr/OarL8vTfG6FXd2c8qvAREGdm+x7ySMcK9gbGArU5ePbb/Z/FgOWMS+OHGfE8tjy7ZNSrgYSGSuo4ke7j8EtTeRUPF+cZZtGTCyhPso+ZWOIjpyL8H+SxVa3kzfdqBe2UeTTs5FoqHKK8M1wbaqX802FxpdljxXmEEN1ljM4Ebq//V5pR8Fyazn86AtaR0EDXPZOAAggF+EtSCO4AlYoJ+1CScKx2MawUDf1L39qesA8C4WXApmQcINE5e9Mlo+CVnI3dJ7yK8CQ2V44Tu2fxb0bral8qNhQchkPuoKc3ggy1i5THKHiQ2uMag8sLsXJ09HVM+e4ZJa7m+31DZDn9StNcBKDHX1TQFwxThSN7yp7WB4p5fh+mg/1DdM1ZKJ1v17DfG/WmzSgyp6Fz/h16BeviNWQgVhKbNUJSwU1f8zRw+C/P5/BkaJ1n03NrTJ9dTFHEGIHP4Npk32+aqcs42gdMQux3/q69UfBy1Q5vczb16wXVQRA+FMuUpjlrYMo4FLIALA4x56MTu4z38CkdXWayWN8nbar5rF8uTmtsqTT8IipNeq1K0D06o9Tcu+dqSctm6t0qXT4A3KKCfTttZNlLZV4GbUejeArUGnxRHFHz8nwj1Sw1Du7zLrp9q2xF+JQKHgABS5NIFghbJBA/uIfFX3C6xGzew+Mi4zpxQOY8/jzKd3R8ANPLzoEqvgTtoOdx1jFhHrENDoomsQqsmO0d7AtWliVqRyyhdbXkfIHJBj6p8u0KOghM0A38NkJ5SV4bdhhDaapIZCcySVpWLCodiP7jVltyR+sizgEb/bf4jWt22AB+RA7QXjwLOjYkR/X7mGWFS5k3X//Ig==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>AptZp4OZykEUH/yZocrbJ2PBfOw80bFHt34gdfTW6qKJFGd2Wo+uthg8JhyC0yDRXWzKi4LccuEP9hZURN/YfJawgK8W1wJABUUCQSqJvtVwnBabZls2seRysEuAAmkYylaKRXikqCqXmwZiHsEisU4s+SaH2j1ZUFDrrfawEsbcabn6uVP8QCFQ8ZvzCxxp</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
