<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "SOBCINV2">
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
      <header v="Ngày hóa đơn từ" e="Invoices Date from"/>
      <footer v="Ngày hóa đơn từ/đến" e="Invoices Date from/to"/>
    </field>
    <field name="invdate_to" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hóa đơn đến" e="Invoices Date to"/>
    </field>
    <field name="date" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Thu tiền đến ngày" e="Receive to Date"></header>
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
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn=1 or nv_yn=1)" check="kh_yn=1 or nv_yn=1"/>
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
      <footer v="1 - In các hóa đơn đã tất toán, 0 - Không in" e="1 - Print Fully Paid Invoice, 0 - Not Print"></footer>
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
      <item value="135, 30, 70, 100, 100, 130"/>
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
        <![CDATA[<encrypted>biiYrviVVfIAYdSNFPE0Efth8f+ZYKzoc97fFbsbOfDUAlW6uS7VMKlQZbF4ozFUjv/zgxmmC/3IjQuR7uz1L/pVD69C8TIs02oU+JtgEnr2ydXUWxLhKZsN1SigPb0fz+SlajAdFENHa08gVCxyAED0/coc1swUBXoNWLXpIb3GXMv5PapT5CFMGZ/NkkQcPD92MTWlNngJ52ogj6QuAiEhJcaH9w11hSoa6SnINpI=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>jAM+2OWNong2bHD6+883qkIFpUGRa5ANGadD7Vj55se+b2lAS35rGUpx8LKYTLbhsLim/oeLx7XaIVSfnQ7M8KKrFcNvuOJmEYjol/Ikg+ss54dx5u8RJYwtAli7nDxpx+apGi4HSXS+85nP/5W7FQI1fJ1y4I1+TTXPZG/gGdKW9kQ8x+jQkK1w0eGA4NP/4U6zgvSqeh7ZLg3Ff3UZ0MbsW16tRvRBkiyZeJvGMuP5xNUNm7rIodRJC9z9Cj3ZqOn8M3S6t2p1zLezsNoR/tTIuBqvbieL3baKwStxrFuB0Y+zXSsHsQMHdoV4An/yic4RDXgNHVRHPLsUrC25X12Hz1EZ//+3achW1X5lfp3QkyvT50seAEvbx4HpW+ir7rtj09ZeQlUK6MFJwZN5vpfF4+aqxVSTjQQHHAS6XxwIFlLGsngMcH8fvTUW/qNKgkz6U39S3a9mAtieqqvGHZhDrDNM9shFJ3/4iz73sXLi8K8EQQOSgvn7vhcQxVOZSrRYsvQJOmUyFSIxBIgC156t6PzKlauN5lV5m971O7fzOjpeB3wfZTROUs+5Y4UtTe/aiCKXIVTTvQIYDJNCgjDWvRFRBY+BCl97wo2/ybT/z9xwuAe0CQpHPSkNfR3Uo8g1P+aXmvIytKGUgDkgRRHqyKjXW4xE12My54SMoAgG5+7Ou3QswBbT+gETLLwtNzBNM3IraVVj8zb7n59f7ZNkDC8AcPU/MVYR1jjhhTysmuFyR60/zgGiafZd64jW</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
