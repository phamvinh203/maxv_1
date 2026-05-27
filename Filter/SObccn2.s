<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "SOBCCN2">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="tk" aliasName="defaultARAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1" />
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ ngày/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer ID"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(kh_yn = 1 or nv_yn = 1) and status = '1'" check="(kh_yn = 1 or nv_yn = 1)"/>
    </field>
    <field name="ten_kh%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1" categoryIndex="1">
      <header v="Nhóm khách 1" e="Customer Group 1"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh1%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh2" categoryIndex="1">
      <header v="Nhóm khách 2" e="Customer Group 2"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh2%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh3" categoryIndex="1">
      <header v="Nhóm khách 3" e="Customer Group 3"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh3%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" categoryIndex="1">
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

    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <header v="Thứ tự sắp xếp nhóm" e="Group Order Type"/>
      <items style="Mask"/>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="sx_theo" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="2">
      <header v="Sắp xếp theo" e="Order by"/>
      <footer v="0 - Mã khách, 1 - Tên khách" e="0 - Customer ID,  1 - Customer Name"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="171">
      <item value="120, 30, 80, 110, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [nh_kh1].Label, [nh_kh1], [ten_nh1%l]"/>
      <item value="110100: [nh_kh2].Label, [nh_kh2], [ten_nh2%l]"/>
      <item value="110100: [nh_kh3].Label, [nh_kh3], [ten_nh3%l]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>

      <item value="1111-: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>
      <item value="111000000: [sx_theo].Label, [sx_theo], [sx_theo].Description"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 20, 20, 20, 40, 25, 100, 35, 170">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
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
        <![CDATA[<encrypted>91rf7N+gr3XskXbtKWCRKpDVQSVeIq2DliripEmT8xy+oy1hj56tINU2MFPjcZqOj0XjocvjDG7oF2aftHHZYeuB5ZpTDclHjpcNXouClRMsm9qrM937B1CKXXYUhnZ/Pw7ijGWDpADgrhvt7W4c7Z0TpCRpCf09R9eVQ+C+dxd/i7PS6e1hsz8TFsFYWl3LP7VGxs2uE1yTFQgWb2ADvotYvbLU6cjeePPjnSd16SOhQCpSg8LNkkSyq68PNxVZvKSoz7Oo633XMegnXlKqYrO/9qXHYL9nx2WrHoDg6eQS51wUSx09RYkpPwsdyzcGpR3cS3C8yavjp11xcfLd1R9HiHiaypx+D+7Vk7z3e27eTaFiFE4NI7iBEscJDZ+VF7rYGoHH4o+0TKmlGVWtB/0lw1Im5eJCFrjaOzjqAl9mDIjFtV3Jt9suJxRLHhj1K7REFb4x8BiRMf75W07X95t0ncMohwoPf9o7PWoA7Cs=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>QNwOnre2eaLRiI3VtqJiQqnB/xzwgr70OxyLAMBV2SqaRXv20dFmCUWCt/gez0YiLavzLx9Bh9QbK49+nNxHHZon3iIA2n6iq3MmsOT/GDkV2a8+GaWXpUkvtXpenG3A0/XJ22YZ63XnzkN9yb2NO4r2TJ90tB4h3OHyZyqop7ZTWiwY/V/+VLO8XZWVZkjOaYPaOpXPFKl1JSSpAFCurL6jxn7fWmsLagHwfKy2J1caDf3y/SGj4TBC/larITE88wkoLrPm3oCSM7zLCzhXUjl6r8Oiy8lcA5mDqGBzrmMwV2hO83V8Gm/L3QlgElISvu+tTLkWzvsSaww5xAqd0PJOeW96aMFIcozi0lI1uYUwvoGlmL96siuNLdT3SKqH</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>6h8Q6zEeBPr1lRH/9ZDlWPIRriADPJsMUbGMZ7fGzc3C1SqOoPaiD0SoWPaS/FgMcHMrf7SLgrGW+SSpU8jMhJYLZrGH/NEoVKbL+yDcwCvUFxAUAJh8jAVhzQ3G/hfrQgW10rcFNGxXheu60JSK9+aGCDZQMcqm7BA39GBBLzpvyLJJjQiGBspaT1ziryvzpdOYEGZ/DShkjLNEjkTQPkAdv+qL0U1eWbRwG0yYBB4KeRjQWPYHxbl0Hie5aJ4yP8UkJ29/e2lagsbzWbq3cfdGqTcI17CwGW9NAyp58GjjMivrqsBkY6glec2C2sne+icsIDhfXNkdAU07W1SHOdaYn8JviyWP764O838qRH84xQ68aiMM920FRstCC0oy/EAAYBvx+98pUenGWGS7cQltFGr2A6SMtsAkpbdi1PbnsKhFzVQu/M2ntwcmVT1Hbhes+zHpPOFpeHSbpY8750yimwYajYhkVk8aXYS+Pkh2JJBTdePcnt9yCQD8rh2W0lvy/Q+Otl40c39o/Mx4qk52811FzcAV80nBY6Y3pNID3bStrR/KHZFLyi9O7hTso3L3fAFwKflPSMtvQ0m4knT5VtsXGITSH4eNtbDRPsVIIhUqwdNDlerofeqfH5seAtLs/GTkpLkvVWFSXfCiVift2vjzKCNBf7NBaPredU4H1R1L0VTxWhWGgb17smSirVuGAm3mcy6QDg3Bt6nEsNlxfsh7GRpoc1BA54F+ne0S8+RsSaM9V+bFaSDif2lQBhxghp4n7JqLbz4rmVfCzrmSr30pd4ggVXGIh+zgwLSNxRuNtPyR1FOnkNyD7aL689aek2CaK6vk5STWJ6AsUi6fpgTf8GzHk7uDwvVyUrum3YF2RWrY7nRUb1IaZk3HnNA4SLsZ/6G1aDOn/GDJjaIb2Ck6V2R4NihlTkkfx6IVhMH5oCi4g8pqjkgxoAUSmFpGRFVLSQt+6BNOMfB4Tx3/AmCwbxuhObENR0Y9LdKWCrmIyT/XF9FnO5ve/oKR</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>8HDYmxrt5lmM5WqJ2VZ/jMAExMycWEQ5IjD1g2hfMngspqKY1L+hEVxvlorELloJ6erhw1DakIDqgtVVhiihZkPQykKizKMYFVfmFTQZfXLWyh1LM0kw83km1qYLifimjlPaRpmpVOIzWNvncPJ2OMoSeoGt8f3InjWWZNYgkRk=</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
