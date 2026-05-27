<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "SOBCINV4">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="date" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Thu tiền đến ngày" e="Date to"></header>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày tính hạn tt" e="Due Date"/>
    </field>
    <field name="so_ky" type="Decimal" dataFormatString="##0" allowNulls="false" clientDefault="30">
      <header v="Số ngày/kỳ" e="Days of Period"></header>
      <items style="Numeric"></items>
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
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn= 1)" check="kh_yn = 1 or nv_yn= 1"/>
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
      <item value="120, 100, 100, 100, 130"/>
      <item value="11: [date].Label, [date]"/>
      <item value="11: [date_to].Label, [date_to]"/>
      <item value="11: [so_ky].Label, [so_ky]"/>
      <item value="11100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="11100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11100: [nh_kh1].Label, [nh_kh1], [ten_nh_kh1%l]"/>
      <item value="11100: [nh_kh2].Label, [nh_kh2], [ten_nh_kh2%l]"/>
      <item value="11100: [nh_kh3].Label, [nh_kh3], [ten_nh_kh3%l]"/>
      <item value="1100: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7bd9FNywYYNz3RxLLMUwzwwhLQy7DE5iEYJ6k4xCkvnwxwE0Wtw28cBspaRQtgWVsnqI3CKbq4UjFBlGYgph4gisQuhJYAFsM4ciD5jL1XlHmPRRjQMJBSrplPR3MUPyA66G2kbLKD7jYyINlhffth8F2Mgx4lTwW21dv/Kfi1A6</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>DmJBiMdaUK0mDbgXzrcur2kdKYO6j2yL4zCHmAGI0nE0oUDXyqWwNuvkQAGqgw/JgsS8+67MJ+C6wX5yOcxjkL1UdgyLzEsAh2h0Tvw/mAnMzChzRJhD2OmCneYt5lJOOt/mEYRmHJ/z9odjkOumFuCS19uX3xEv6X6oGUfYUeLXFx9iBBSG8PWQHIJLO0XdpZDfatba7tV2YjBE6+yYhpG2fDmXWB3TuTYgpGgUEs1W22IdrhpajKsnMzBOS59MWoAWcf/Vcy7PoCKxqh6+gGxxybVwU4jI8THOxhRF2RAIuxUi3W+/BoJ65Husl6m1mRD3mfpuHJc6fypg1KHx3Av9UNp2ZQ71qkiQJgWlZ+M7UlLTtDpQ9lTjs0Oy7e9IiEoAhzw4sTdrOFJBphrzvsojZ6FTfKQ6tU3e42j+hmYcI46RbbH7JfYet+Sj4e6wk6OhEg21yZtMdakqMIcXNBIzAwr4cUqkB33TTzUtMqFxAov2fjljRn8W50eC1HIT0mQkK5Urx4uxhsyg626VuayyAmGJEFAi7OMmJBcAMb2Hx4rAywRsjeJKQxw7Tk3hwzuALPdu5NTWcnCKyDmeAeL3ngKvgcBfqSaRMgu5JFWrwROgFUF4zOSorBptEpWoqJ8JVNSs7F5oW0yfpvsT/l+hv7YTMp4klb1BBQPfBOjOh/h/OVsQe7dTEkE3/KMF5/sZDaR6S2chAiqB3wsn6+lslu/C8CS9OAA4A1oSnP9dMLrDZPmBBjyqiMHCs3SywhpqZ6zD9EUQ/OG9AXAyrCOWXrFCrvVZeXYu3362erWgVtCFcUtPN52IBBxFjUIuHNfpB7+r+r/wfPMXXt25TQ==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
