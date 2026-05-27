<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "SOBCCN4">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultARAccount">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1" />
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false" aliasName="defaultARCustomer">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn = 1)" check="kh_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true">
      <header v="" e=""/>
    </field>

    <field name="ngay_ht1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Hạch toán từ ngày" e="GL Date from"></header>
      <footer v="Hạch toán từ/đến ngày" e="GL Date from/to"></footer>
    </field>
    <field name="ngay_ht2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Hạch toán đến ngày" e="GL Date to"></header>
    </field>
    <field name="ngay_hd1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hóa đơn từ ngày" e="Invoices Date from"></header>
      <footer v="Hóa đơn từ/đến ngày" e="Invoices Date from/to"></footer>
    </field>
    <field name="ngay_hd2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hóa đơn đến ngày" e="Invoices Date to"></header>
    </field>

    <field name="ct_theo" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Chi tiết mặt hàng" e="Detailed by Goods"/>
      <footer v="1- Có chi tiết, 0 - Không" e="1 - Yes, 0 - No"/>
      <items style="Mask"></items>
    </field>
    <field name="tinh_sd" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Xem số dư" e="Balance"/>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"/>
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
    <view id="Dir" height="">
      <item value="130, 30, 80, 110, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>

      <item value="1101: [ngay_ht1].Description, [ngay_ht1], [ngay_ht2]"/>
      <item value="1101: [ngay_hd1].Description, [ngay_hd1], [ngay_hd2]"/>

      <item value="111000: [ct_theo].Label, [ct_theo], [ct_theo].Description"/>
      <item value="111000: [tinh_sd].Label, [tinh_sd], [tinh_sd].Description"/>
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
        <![CDATA[<encrypted>vGsMprkrtSRj98wvhCV3XcU5weD9tHUmxGt5/ZO7QQpxnD/7q0NKw4YbKF8nfiGWcZcleKr1E9yIEauiohBZHFosGOXvBvHdw7OChzTdXol5y3mQe12J9cloCof8coPvAuBvQKPaZ6j5shwkMkvhUXLCC7hDJj6097d/ZgDNOGF9N1fT3IqNjsXPhQPfZovbhiELU37xzNuY663/qLiWLLpCOLjNMfmX63rBjapdyPTvqt208ZCPkCJ8bznRdSJY0qKYcoQs/BBewYHcIgPikMJZbKpTX8IA48FDa4/mlLdLPh7HJEmfW6mLfZ4ZX74InO1YLHj+NgTc60Bq2nsfOWks53U1p6IqtmP/tSiZ9CdGn7KxCI9pSpIyYL/KatXmaesSe6Jv6o3Nw06Bh2jTwA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>iqhWqRqZjOh3rqQX8SBrSszPk/ZjDEF1j6S6BMGZzF3+3vrVzbcdiCMLGT3h05DmU0m1hyXG/5oxAHyYfAtCbgu7IgJIb4AOiM65dRS118mdOvy7GbkrED5+XGr3UsLNOvQizeiyGhdWfY4Zy/NvKU6tJtGr5UYEu9LrI06e7y9SyssZAuld7W11NvItP5gDasYpM5QvEwvquPRSRBp882Al3GQlXqijn51rwtAIzVUfYSktVKREh3WMTARZw2FHuW+tkr6l9W++LjbR/FUXXfv6XnliLzxswxFakjkq9MwKjgbiCtQckmawDf7BJqwngYEWIg5mmu1NvkLUv+Ub8SIy5mT486iyk5PA9BNr8Rlw5WHKIS3RgAnpN/Xj8mTjWdvsvCeWWd9V6D/KiTOvcuCblRfnumm4KWAxsXMxK7Ij8wLU2Pd2WTzRU9jwg9H8RS2uH4QcvpD1o/C28CFcGmNWWgipFVjMvdEOhuXT7UGinyiSAA5lwqHILcXmrYC1dCYJ++mZVTWAioPMp7kJpxRA5MN7kHkr10i6twMztzezWgOQm/5LUyDRA2thS7rM9YgKRgAgVoK0vE9nHYiCMHUueDfrPmPVTnWwDptozPmYTUll+y9IL2HdWnKAfCAWtRTo9QhtozV/SyL+WPZClDOc1LUbAEsG2pBnlZVYr+WMEFew3ZydPpRH1vGJ8Q1qgyAtfihGIV2FYvPXgcZMdYhAoYI08PqknSwLG+F94rk/U1pt0nwmgiRQe17+uPNNbh8036Jy1M+QfomZOsxviBEG4Y3IJmu/5Bx+3l9ueb4JrXCHWuothQ67JVwRjvebogabsKAkPl6LKzNmsWa4/G9oAJGMmV+ua5lUMxHkkbDQZYsFa0sVk7iFLCeKbGeP+XpftBhIulk8AO2zD765+ITDyeGt6hihGpQ0E6GzBYdD0pxtGWbi8ngrHfGSCbPjAWlcAAPE6FBhE+BrZEKbsybbBXezzzuDKfHtFXRmzlGsR4YRHdrXAP9AB3q9T1mWy4FJcpTSRPZk4MGOuqYunyjTZH4pWoZKVU522LgB+ZVOJBVBKhWoOc0KzB4mu3HDeN8jEhGdvpWBqMApDeYxXJLSwn6AKihP/UNkpNLmlSc=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>2ga57gGKoC4n80lu2Ug7Dr37QvnwA7TqfqEkV/zvfEqBsjnSJd4jtZmWaPeA+CqpjFudaJVqE/MhA40GOJ/FdHM3lgNE1wq21JoLctSaZVCwo42fvIywt89zILro9LZG46klllOmgcEc0sbs5ktnNCmNo9npcHt/xvWaZYYWuRrVBHWLQcimhLWnMD5tzLQMf4URUu+KiNRN9I+X0kswng==</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
