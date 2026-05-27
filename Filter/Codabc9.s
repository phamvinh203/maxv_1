<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeFieldUOM SYSTEM "..\Include\XML\ReportDataTypeFieldUOM.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CODABC9">
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
    <field name="ghi_no_co" dataFormatString="*, 1, 2" clientDefault="*" align="right">
      <header v="Ghi nợ/có" e="Debit/Credit"></header>
      <footer v="1 - Nợ, 2 - Có, * - Tất cả" e="1 - Debit, 2 - Credit, * - All"/>
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
      <header v="Nhóm dư án" e="Project Group"></header>
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
      <item value="120, 25, 80, 105, 100, 120"/>
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
        <![CDATA[<encrypted>SCD4MtrmuoC8pmQlT9nXdfjYW/d2K3AK5uRSG3l2M6l6ModxzanHCvGsPPA57qnuYdZ8ZwWrF5PrWO4yWDPFHcVYr8/85BKLMtQFYaSfo+frJCF6DssCx17Kaa3TKCpnZGOlNtw+9AuPf7aSgacQxTHGgIEC8yfpNFUAkD8GA5oJtKwejazpOMXSKT9PfFfV4ShO2Bey8N0V9/uAnWQP00oSGF4tNvrsxshDZXvFqIGS7mMzLpKeX5c543s3AIzIIxf7f6feAjjSs9uApWTRt9t3z5omMK/XRkAFMJtUUCvIbi8u1NSWls8JItn8bPcHBg6eVthZF8Jb8A1d3HzWlp4gMVteupfKvzsCvuwnezoB/rXyWQHu+3GQfGJON21DX3A4UN2O1kRSdGT+XBf2QUPIJOTLZ3b8An1NtTtnx/V60yqAIK5OeYMKeEJwxD3INcO+7Y+JHLmLkIZUF3ogTBGaJkHEavdOFmX/Dkldz7U=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>7oH8gnZRXmny1gCmndR4IK1dSExdHvAxd2QWtrZIU6QOy4/2q3mH4i7AFraHpnBxnKuO0LlgNX55nM3GyMow5qMV1m/umSgrqguZhP7F7pA2sFON1vOxtgzPJ4rFPPOotvV29tjpPQsl/imJpe8qROPtgTukJu6lTktarNthzLP23jW8Ndlmitx+aRGipb9O29rHE5RkUIHAFP9KCaTRgFyRn1x7gGlLbIkp4wpLNjRmibFjSXTk2rnP1lrdMlNCAdyh+78htPLZcjiSWJF508O6yPoo0Q6VzYmKbMwy2RBPJnRnShQ747HgQEYC9CmyRRw8egkqDFfedGa8FCUn+1RozkKvS43ugxUaC2/iIj58zmmYOaJNaqsudId5B3q+QuiUAPr8ryefZNtMfiC+yoLYWs0NXpkwikokRio1SbqyFNn3+0KlRD1T2tyH1XgRdXNktptMdhiqRiP9+jKDxHEnQTtGr9EtMcOxtsBnW25qXSZCOf6BYwik7DkdbRkCz4p19wlV6eRVWd0+OFJnQtchG/6cG44HD8IHGcJf2FvinKI6IRQW7keQBhkdcH4PNEnsuVv+bfuBI50nu1eoEWQ+a2yoF3/lp8iwHKx2gSN1UNOCrprDdtN7//59Amm/qI8gz1Ez63WvhR8d6yR0oke26RT4mGz0GEDq5g8EerZBmoj81rNYxNfhn4CYX+MnKYDJr3VeZixEjcB8H7PcSDxbb89Ramh9BVWHoPwQKbxUbMjb6yai+sDwvs5ZSW/bb8jRQdhz/RNET9Tme5dphZX2/ENwCgh0ixKrYYcuWkY5PT1FIVPZzq2k68ejDDgB8IJqmvYzXllD7SiYpU2JcOYmxzZbSHhPJ74VAj3CP53ERolsJbADkq2ZxIbSqBwZI7JiGGqwFm+CEqcTw5V4+9BymH25TOKWEvgWKD4Z8QyI1OK8lnreowUJ8MeC2HwUzdAyHgmFadAJtU3xxcBdfqP6JETMkbsQm+FxCH9tNRK0S+mbZIu+Q3yVxn878aSn</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
