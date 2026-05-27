<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
   <!ENTITY Form "FABCKH2">
  
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
      <item value="120, 30, 45, 30, 100, 100, 130"/>
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
        <![CDATA[<encrypted>rJGAkFapn8VKgS+hw3r+6yxoG5FLwOOFsutf2tjCd8bKy/UFgQMiryVDrEFzGJRUKSwsBOvaLUha/PS3M4pcRZmuKE1DrYRnjOddm+oJEwhYUlqgKPEZNbIXRgEimEghbvkjdiZJRZvCXGs8YRHmAdwNKzU1XvNol0yea6QFmW5IqHqQV+/zQ8F0YZoP+PaO46uRIqJ+JH7Fd0+B+bh0UQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>rHRSwslZMic5Lbl3gFjEhcdF9DQOS5qjLZVkrEn5KtACTboG51DgKAbBW6mRufXc6nNDH/NsoGik6ysOIG16M8H1Tl242kil96wnL42JHgNzcq6bavbXizqQloxm7qbkHy0jHTCFBuBe9UowtsGYMQaTmdmoL2FCgRMLjo5pozhDkfwWzfNKyW+IrN1SDaMnvLJVw0N6dBCJAlf//8tm4qm0VAxWspwCPjJTZiAE9MFiRFqZT/2ien6WiRnYfGiqij6Pzq+0YJplHiVm/4k4vRdrIkZHKcKuZso9uBDCFi6hG6O5Xxf8oExb0TxrV3ADClx4kSpvZ/G9f0Z4Cz6bhdwgo/B3XBIFyrReIVOgz1URJjxLEi+ZL1nvjUbpIRqhjbKq4gBTHdy2kIngQLERc3/JegYpy4DeTNg8QeafjXPaLsipcon0C+xDzWxRVBgVaclYGT5gs8XlgPmr4gsMol8fLNBr+T5dj0brXxn2p8IyRz3QAEM6gP6FDdnJ6ebnh2ckEUQS4W7Wl3Y6aHVwOwmFIcMAis16Xw2WW0hFISCx+9L2t9QXKLxwWs7xZeccaxfXn9E3+b3gfLWUP1t4biB3V7BmhnS4dQUGAMom65QAa6iCwduiranYfRbzK3+raRUb/qaArI5kmWSmMGPZziipzPtKDEjYuVfr5d6UMsyZ640FUdJ0JMBfWRpUffjTxuOzhUzwU208th5dwH6+GZ5KCkiwa/hycF/X5FOqrW70F82oRLwlNjXJGMpLTDt0</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
