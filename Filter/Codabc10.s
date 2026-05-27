<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeFieldUOM SYSTEM "..\Include\XML\ReportDataTypeFieldUOM.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CODABC10">
  
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Từ ngày/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chừng từ từ số" e="Voucher No. from"></header>
      <footer v="Chừng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chừng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>

    <field name="tk">
      <header v="Danh sách tài khoản" e="Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ghi_no_co" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Ghi nợ/có" e="Debit/Credit"></header>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"/>
      <items style="Mask"></items>
    </field>
    <field name="tk_du">
      <header v="Ds tài khoản đối ứng" e="Ref. Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="tk_gt">
      <header v="Ds tk không tính gt" e="Non-deduction Acct. List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>

    <field name="vu_viec_me" onDemand="true">
      <header v="Dự án mẹ" e="Parent Project Code"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv_me%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv_me%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vu_viec">
      <header v="Dự án" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv1">
      <header v="Nhóm dự án" e="Project Group"></header>
      <items style="AutoComplete" controller="JobGroup" key="status ='1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="nhom_vv2">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="JobGroup" key="status ='1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="nhom_vv3">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="JobGroup" key="status ='1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>

    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct">
      <header v="Chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'"/>
    </field>
    <field name="ten_ct%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt">
      <header v="Ngoại tệ" e="Foreign Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nt%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải chứa" e="Description like"></header>
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

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 80, 105, 105, 130"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="11000: [tk].Label, [tk]"/>
      <item value="1110: [ghi_no_co].Label, [ghi_no_co], [ghi_no_co].Description"/>
      <item value="11000: [tk_du].Label, [tk_du]"/>
      <item value="11000: [tk_gt].Label, [tk_gt]"/>
	  
	  <item value="110100: [vu_viec].Label, [vu_viec], [ten_vv%l]"/>
      <item value="110100: [vu_viec_me].Label, [vu_viec_me], [ten_vv_me%l]"/>
      
      <item value="11011: [nhom_vv1].Label, [nhom_vv1], [nhom_vv2] , [nhom_vv3]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11000: [dien_giai].Label, [dien_giai]"/>
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
        <![CDATA[<encrypted>TYikHsdCB8/qoSRUllgyyX/de3HnDB/oGhFSc/TegkFrAJU5Sym7uFCP+Ba9kWQ93xl7p6BKaLasx6lEcoIE7sROkO0aymFhg2uQaS2h0uWZnIkVh5t0SzKjBxxZFOWdL5MESqJz/Ocs0LNIkuhzv04wHQElzz+EshO8R7QYw0WQwMY7slSKvN9zfRsbEIvXWWeBYDf7mYMDN7nD+Oynk8mJoix0XAzJQxCNPw3nniRhbjAv6rAjiq6OvXFUGVvddKzahXwq6SpI00Ex/QloAw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>6h8Q6zEeBPr1lRH/9ZDlWLRe8/zQNUjiurU6wzLLz9yDDnDmOD+/9P81+rJbFcwUSOWQii+VhrzA+3J6qmh0uwSXq8sbVQHdqB7V3dhMZhPRjd0dy4MC67+Lbxi70gyKfpM5lFsuwgzHwoYKorkdVlsTkK6r6/+7P9mAAUtlmATYry6GM7iz+Ew9zLAI9J7FV2kKhuvQ+rs5Qp3goNXbTXvBbWtA1kNVd3dMrpUZSk2LeXltiK5Jm6fj9YYk5yDHHCjcgmseXZu9F5o4CkQDnIAK6ci4AiIv0Rlk97SLeFfuRH4vERhTXLadm0/8B48pvblVnO8YQ3+3vbInsDKxH33+kojfQEtmF28zwSzh0frBYhKjbwebCLxSgN6mH4sTQhF+IlrcgNRaTKgtTT6u0FfCuLA18AyiQjpcGpNhMnlCl1nghoKDKx3iRS9gy+RXCkbR6c5+oBAp8Z11OMEF9EvOjAQPmVTZPoHGbbkwrxoN5CptodHlaEewZcQ378P6UeXLlSAA7fTlp9n+Z9Lthm702HKOelkvaFsTfHL1UG4JKc9wFdDvZ2CNEui1051ioT1suScxLofF2N9mbx55R7nhvseohz8xmXTgHKgNZndmay73IbpQxlr0Jj2R2XZzkeQMLz1SC046zNVwQrNCBQDjJK20wub69PWfbG0UkzeLqE2j5runGZwwoXCWxZSuqWUl4iPaURDVX3Gj3W773qUSIxPtmpqEXChEc0xdLYT4PVZxiaRMJsfmEFm16dQp4opDKteZroN8g/2MnA9rcLTTWKSgo68NWDyZfeKEIKNY8EDhPqrTeevHUhAec5XQMYCDb9XbaNV6pdUSlypmew==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
