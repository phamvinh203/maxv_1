<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "SOBCINV1">
]>

<dir id ="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ht1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày hạch toán từ" e="GL Date from"></header>
      <footer v="Ngày hạch toán từ/đến" e="GL Date from/to"></footer>
    </field>
    <field name="ngay_ht2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày hạch toán đến" e="GL Date to"></header>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" defaultValue="new Date()">
      <header v="Ngày hóa đơn từ" e="Invoice Date from"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoice Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" defaultValue="new Date()">
      <header v="Ngày hóa đơn đến" e="Invoice Date to"></header>
    </field>
    <field name="ngay_tt" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày thanh toán" e="Date to"></header>
      <footer v="Thu tiền đến ngày" e="Date to"></footer>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Hóa đơn từ số" e="Invoices No. from"></header>
      <footer v="Hóa đơn từ/đến số" e="Invoices No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Hóa đơn đến số" e="Invoices No. to"></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(kh_yn = '1' or nv_yn = '1') and status = '1'" check="kh_yn = '1' or nv_yn = '1'"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nh1">
      <header v="Nhóm khách 1" e="Cust. Group 1"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh1%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nh2">
      <header v="Nhóm khách 2" e="Cust. Group 2"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nh3">
      <header v="Nhóm khách 3" e="Cust. Group 3"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh3%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="so_du" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Số dư hóa đơn" e="Invoice Balance"></header>
      <footer v="1 - Tất cả, 0 - Lớn hơn 0" e="1 - All, 0 - Greater than 0"></footer>
      <items style="Mask"/>
    </field>
    <field name="in_hd" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - In các hóa đơn đã tất toán, 0 - Không in" e="1 - Print Fully Paid Invoice, 0 - Not Print"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
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

    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="135, 30, 80, 110, 100, 130"/>
      <item value="1101-: [ngay_ht1].Description, [ngay_ht1], [ngay_ht2]"/>
      <item value="1101-: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>

      <item value="110--: [ngay_tt].Description, [ngay_tt]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>

      <item value="11010: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11010: [ma_nh1].Label, [ma_nh1], [ten_nh1%l]"/>
      <item value="11010: [ma_nh2].Label, [ma_nh2], [ten_nh2%l]"/>
      <item value="11010: [ma_nh3].Label, [ma_nh3], [ten_nh3%l]"/>

      <item value="11100: [so_du].Label, [so_du], [so_du].Description"/>
      <item value="11100: [in_hd].Label, [in_hd], [in_hd].Description"/>
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
        <![CDATA[<encrypted>1xiUCp4UBbULH5IiiaFj7/mV2LPYpQduye6K/gj4ZLnlU+lH/9mp1MZIYtB8QJ12FIm3z5sFWz6WH4JDmzGyU/4MIrhXslLAm0fHuuMxLCu22DLgdz02uCf4gz6UghV0NxhT7D0BOLNxNw5xfcpGD6snQs51b/OiqfnWCZG23Jz31cRx3QiR2uYD1SIphji81Bq1OOWspcF1YjMv53mUlkooGWs4vH/KjXxXTUZfqbCPYuWxZFTWbtUwOKGYQGD9</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>ZM0Yhb1gBE0SIPvcuakKa/nWGVhRsZl31yjKnw4erDgg29omwbVr2fXzYn6W33jTTxUwx4+NK7j7BQ6yAR8ePa+4MT2MyhS30YzRtlXKgU7J6Rn1PclR3+A+CfevIIcImEqJiH68tP2c9Jy8pPh5Tii9y2kmRKfaO54mBXnI1IwEbGIsIE0UmIbARQ/06e92vgXW7tymFwOvglRfM54me14PzgsJbdkaf7bWoMCubEJCH40cOBpgQgUl5ogbYvwTY8Az8i2nW9rlB1AX/dnJoqKMaY06IwDJedxjMyWQ+6zmdII/G2bmrVpyhT6NsSZAF4Q9P91b4sCZXCMYCwaY2Xkh116Ut2qPcKCC91Qf6n4N218CwEe4+kidEhdgyl4MswrG5+nzfD1lpA4Jp0JMp2LCbzShtB4h7NaSkNQvmDBEkfc4/r+0z4+Z70nEDmTfFDxoo/mfdA+Z2nUwBXpBREo6r48UPxH6oztXKP/F/gOo3N+kUlzfD8BCohubXuCUUDIVq0G8XWNbRB+SMTMm/V3aUyVwx1/SAZe1U0TcUHsyj1JNuQyokkyyNLkof5qiNUm4TtSPNaqpkTBNow/a5+LSbLT3HajzZUIGVX0RyHTpIPMwdxSuAU2fDfk4wneKehJnfleC1i6gXG+sa8XcJ53aT7E1Uns/QbEwXVtyVjBE0h4tLdcZ0D6jAljv+xfghVt1wC3+PeQK13WstcuvLWKiAO3D76/vBglDzqfQuqG8jeLKUdBe/TEtb591j9IM</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
