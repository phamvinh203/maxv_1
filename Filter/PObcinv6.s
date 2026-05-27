<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "POBCINV6">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày tất toán từ" e="Write-off Date from"/>
      <footer v="Ngày tất toán từ/đến" e="Write-off Date from/to"/>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày tất toán đến" e="Write-off Date to"/>
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
    <field name="ma_kh">
      <header v="Nhà cung cấp" e="Supplier"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn=1 or nv_yn=1)" check="(cc_yn=1 or nv_yn=1)"/>
    </field>
    <field name="ten_kh%l" readOnly="true">
      <header v="" e=""/>
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
    <view id="Dir" height="">
      <item value="125, 30, 75, 105, 100, 120"/>
      <item value="1101--: [date_from].Description, [date_from], [date_to]"/>
      <item value="1101--: [so_ct1].Description, [so_ct1], [so_ct2]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
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
        <![CDATA[<encrypted>sVV0XVRytihjEQAw92yQ4CJVi0MSKRYSFpymxFc7cQU80ixqPrLkkJX2gOpABkEAWWhB0wlm7HTWjBiNFu3o8bVVKvn+NJmZxpKbHTq13lJ+ZO8sMq1P9fr/kr0t/AEBpZE7rVYa/08/+oXfN1c3sefI0qtTzPggW/pfhaG7Qrs=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>rvDITO0485NX+OWy7ss0Z+IZa7gbEXF7Iz2OGjucTQajroMS+e0hgGQT8KPAIShIP8WDd7d6J/9lbVWiuqn5dJ7oenqZjVLCDDWRKQ/U1jKx4E7KN0rrp88AZeR7I4Hpkw2+H92eyGvY8x3dzW6BuTm0+KKO75N3J4W+BvQPekOCmL/7AWa0i4wU5sDH2vX/7ddSmyNgNLLzH9D20hA5zpIiShym6RHKSYs60BR2aWeSZBtG0JNAmbUROE07g4lH2+lE4KYcZPCdaR4TBiVtxPySPBqS4RaHT5r6/LNl0V8Yn5auRQ6FEqqKkJTGvhR35fCE95kSUys65UKf8YeRs15kWh5/5rpmPJ1H3k8MShlhnU22CxTVzW6z6khh33o0nCAayfhm3BJUO+FeBiOnLo/oA5MuSaVbzuENMsKJdB01jcjCZLCJ/GxTzdX+lEGEk6E63IB7VVQR17SCSFjY9C9V3gxwAXtg1TRsWs1JitMHTPbu/t60EQ2jO3/TuVYdLlqYdFenvevRNFRif5MT05fmVMsPZoGoLaBbloaoSMZWpTCLjrOKl0OjHzI1I+1juq7/Bo5FRHOSnENXsagoLdsTzkLBnsScAkXMCLhHv+g1LmK/7YboZPBhRGeKsFsARjVpam7J9GEgNuzf3yx43aLTwJhdrk2igqhp+CNnJ3SJipSYpxSFcQWIGaRQ1J1JF7aMZZvQXtSzvMh+3qYvAw==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
