<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLTHPHI8">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
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
      <item value="120, 30, 30, 40, 20, 80, 100, 90"/>
      <item value="1111: [ky].Label, [ky], [nam].Label, [nam]"/>
      <item value="1100000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100000: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7buzkP/t1/cxoGINCxvBnN9624NvONDsLYEU6GjByb/a/k/Uuf8J2mAXQweX9teldlrqN8xHAAxyPfZAnrnAkBbV8upxjyxhowyGTDS1xF4K</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>rHRSwslZMic5Lbl3gFjEhQ/wAOAlijpNKxBiSybHXdeuGhfnTV4c02O1f6WC2+VUl3gVtvRa/482QBGb1BLLlv0y+CY40xjFTtpLDAQZTwzY4qF7r9aqU5q9s90wdoVet2a02GLOChXKEYcrcJJ4m0gboPvKA8Tl6/aGMxA2+jO0i6qSzAkVm3lzv2I/HAJKKmiW33C/2q2zkBuPBiWdqgPqcTKwABhjusUSvctZurbNv8luwz0lTqr1SIXIcy3bKqqBLJxR8ZncJTOztu2MTgYG6mxg7eTK7fqa/JqghrYY3Bg9BC+19eccklHP+ZVSkJ2FnAwkjQST5Sawye/AnPtVkJ0BIzPJULARep3IKNApsHUXBUlad0yhh+QKGZGYE6cR6sy8NY0NShqFsZCGEuYRoiYcqUUrg9+ShGL6vktI8qVlUvo2qb/BYtpRTIycgpSSee6fplhe4ouyS9lp6MnivzjoNWrgibPlxPA5YStKGXh9b0QNe9yxtNjN6KF0FKGK+8KBn9RUAzoJmNBEI4mXFDmxNAizAyCC6GN7AXJ/L/DSkMOh8MHw/uH6aXZoxDR1a+Kn3/U90Qjvij/Q6V2SwGEg080sBXi38vk5ERhej5BlqNUuJku9zEfLusTHT6hO9/ZW+ghx1ZN0LEfiy5Y/LTbTAFc2OONPQzNfiJ5jTXESPr9Bo7ZAzEmbjiWv/fpzbPUCONGv3uX1OAJeKzgMvjA17Rrv35wDV/9cRop+nPVGQJU+QAAxAXmNe5kh00WDhvxLWR8ub+KaqG+7/dvDUrBp+CK8RJhpcInXrBQ=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
