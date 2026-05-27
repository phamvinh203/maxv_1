<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "POBCINV2">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày hạch toán từ" e="GL Date from"/>
      <footer v="Ngày hạch toán từ/đến" e="GL Date from/to"/>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày hạch toán đến" e="GL Date to"/>
    </field>
    <field name="invdate_from" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hóa đơn từ" e="Invoice Date from"/>
      <footer v="Ngày hóa đơn từ/đến" e="Invoice Date from/to"/>
    </field>
    <field name="invdate_to" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hóa đơn đến" e="Invoice Date to"/>
    </field>
    <field name="date" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Được tt đến ngày" e="Receive to Date"></header>
    </field>
    <field name ="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="invoiceNumber">
      <header v="Hóa đơn từ số" e="Invoices No. from"></header>
      <footer v="Hóa đơn từ/đến số" e="Invoices No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name ="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="invoiceNumber">
      <header v="Hóa đơn đến số" e="Invoices No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="tk">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_kh">
      <header v="Mã khách" e="Customer"/>
      <items style="AutoComplete" controller="Supplier" reference="ten_kh%l" key="status = '1' and (cc_yn = 1 or nv_yn = 1)" check="cc_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="nh_kh1">
      <header v="Nhóm khách 1" e="Customer Group 1"/>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_kh1%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="nh_kh2">
      <header v="Nhóm khách 2" e=" Customer Group 2"/>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_kh2%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="nh_kh3">
      <header v="Nhóm khách 3" e="Customer Group 3"/>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_kh3%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="invoice" dataFormatString="1, 0" clientDefault="0" align="right">
      <header v="Số dư hóa đơn" e="Invoice Balance"></header>
      <footer v="1 - Tất cả, 0 - Chỉ xem số dư > 0" e="1 - View All, 0 - Balance > 0"></footer>
      <items style="Mask"/>
    </field>
    <field name="print" dataFormatString="1, 0" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - In các hóa đã tất toán, 0 - Không in" e="1 - Print Fully Paid Invoice, 0 - Not Print"></footer>
      <items style="Mask"/>
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
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="130, 30, 75, 105, 105, 110"/>
      <item value="1101--: [date_from].Description, [date_from], [date_to]"/>
      <item value="1101--: [invdate_from].Description, [invdate_from], [invdate_to]"/>
      <item value="110---: [date].Label, [date]"/>
      <item value="1101--: [so_ct1].Description, [so_ct1], [so_ct2]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [nh_kh1].Label, [nh_kh1], [ten_nh_kh1%l]"/>
      <item value="110100: [nh_kh2].Label, [nh_kh2], [ten_nh_kh2%l]"/>
      <item value="110100: [nh_kh3].Label, [nh_kh3], [ten_nh_kh3%l]"/>
      <item value="1110--: [invoice].Label, [invoice], [invoice].Description"/>
      <item value="111000: [print].Label, [print], [print].Description"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [maxLength]"/>
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
        <![CDATA[<encrypted>sgw003BA4mnIuVsflClRPa6LFJvKfivX9ZrJQ4p1j6RO++mPoVNBskHBXAGBrezFropM1os4+TW9LAYO3xadgdvio8WWTwDX9HdTADJU1AEe46rJi4z8GqB0RfPxh3YC6AO4jgIQnhaP7X1a9gxA3yFCMBYpHB16AnAN1QC2yb6HdSdc8CSrYOAEB5uKvUA4jSWoMNy0PwpGEwlNDS9SNEZKyBLfWvBPBVlXMsd5KeM=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>6h8Q6zEeBPr1lRH/9ZDlWImI23F35QV2FTbR+JUnK311eoqDrW2yzyubc4mfC3ybkPIXlcasnsLcnNmVt4p6FrhhsLE5mOmeNsVPG6Tw+/PfAA8ERsvGU87nnQWO/SF6Or1JdRsu07sr8WPkvSmeJUQN8y+xEpx0uMDmt7pKxhY8pWJUQxAk5rSll4Jvm2prpvWeM2bl/G3Qao0A5wlySnjB+0dCv5S/nGTHnXXV2V7kre+aOgp2Yhxh6lpS6V6uHFRBJpPhMWiAKPiQWEB7daiOrbxhdcP4zpvoLtnSF80yvdxkA8rVZ+WiskpkckmKnLh7UkuSFMQnMEuOfEKUCX2X9lkg+edEWkEffH+VN6DXomDs/29COocpRO/8yUKUVdBKiaqQCO8+ge5Q9dnfXEcr2Vk6WFugxxQvC3L9pZhP2lCHrlRYNrs3ZRpD8QXdyWz4TQeqCedKHgNR6Z5NK5PDnVj1Ar4/Cq4oPg0DsEpwD5byw3XhI8NRlD3xyH216wOjxLBttOSKqU4MrBdfl2cge8Bt8uSHfrpp1L7crDQOux50iCzUvvIY59liWZhCuVzjcFR4hn1Ylzznq0D0vrjIpSUja1/GylhTmQPF16qWprtCB0/FzXLnjD40SlK+7J+jY5I5zMtUsiwMwWcQRQBz4l7aN8fC5fgCN9apCqY+9eoqThL7Fr5mP9eMvi0L2gJ8XB9P9H0lNA7yvIrpsA50JKE8lbC8F1bJ/w95gtw4kUHfFli9lQEODJouMJA7</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
