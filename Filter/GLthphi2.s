<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLTHPHI2">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay_k1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày kỳ 1" e="1st Period Date from"></header>
      <footer v="Kỳ 1 từ/đến ngày" e="1st Period Date from/to"></footer>
    </field>
    <field name="den_ngay_k1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày kỳ 1" e="Date to"></header>
    </field>
    <field name="tu_ngay_k2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Từ ngày kỳ 2" e="2nd Period Date from"></header>
      <footer v="Kỳ 2 từ/đến ngày" e="2nd Period Date from/to"></footer>
    </field>
    <field name="den_ngay_k2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Đến ngày kỳ 2" e="2nd Period Date to"></header>
    </field>
    <field name="ds_tk">
      <header v="Danh sách tài khoản" e="Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="no_co" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Nợ/có" e="Debit/Credit"/>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>
    <field name="ds_tk2">
      <header v="Ds tk không tính g.trừ" e="Non-deduction Acct. List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="bc_theo">
      <header v="Báo cáo theo" e="Report by"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="1">
          <text v="Phí" e="Expense"/>
        </item>
        <item value="2">
          <text v="Bộ phận" e="Department"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="nh_theo">
      <header v="Nhóm theo" e="Group by"></header>
      <items style="DropDownList">
        <item value="">
          <text v="Không nhóm" e="No Group"/>
        </item>
        <item value="0">
          <text v="Bộ phận" e="Department"/>
        </item>
        <item value="1">
          <text v="Phí" e="Expense"/>
        </item>
        <item value="2">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="3">
          <text v="Bộ phận, Phí" e="Department, Expense"/>
        </item>
        <item value="4">
          <text v="Bộ phận, Tài khoản" e="Department, Account"/>
        </item>
        <item value="5">
          <text v="Phí, Bộ phận" e="Expense, Department"/>
        </item>
        <item value="6">
          <text v="Phí, Tài khoản" e="Expense, Account"/>
        </item>
        <item value="7">
          <text v="Tài khoản, Bộ phận" e="Account, Department"/>
        </item>
        <item value="8">
          <text v="Tài khoản, Phí" e="Account, Expense"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="nh_phi1">
      <header v="Nhóm phí 1" e="Expense Group 1"></header>
      <footer v="Nhóm phí" e="Expense Group"></footer>
      <items style="AutoComplete" controller="ExpenseGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_phi2">
      <header v="Nhóm phí 2" e="Expense Group 2"></header>
      <items style="AutoComplete" controller="ExpenseGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_phi3">
      <header v="Nhóm phí 3" e="Expense Group 3"></header>
      <items style="AutoComplete" controller="ExpenseGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
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
      <item value="120, 10, 25, 75, 100, 100, 120"/>
      <item value="10101--: [tu_ngay_k1].Description, [tu_ngay_k1], [den_ngay_k1]"/>
      <item value="10101--: [tu_ngay_k2].Description, [tu_ngay_k2], [den_ngay_k2]"/>
      <item value="101000-: [ds_tk].Label, [ds_tk]"/>
      <item value="1011000: [no_co].Label, [no_co], [no_co].Description"/>
      <item value="101000-: [ds_tk2].Label, [ds_tk2]"/>
      <item value="101000-: [bc_theo].Label, [bc_theo]"/>
      <item value="101000-: [nh_theo].Label, [nh_theo]"/>
      <item value="101011-: [nh_phi1].Description, [nh_phi1], [nh_phi2], [nh_phi3]"/>
      <item value="101000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="101000-: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>RlzYyft54GOVf0R2UDxUjZhoE6wVcr91VlcHWf1Nt2XBWRTQaUzdIC83/sLAHFr2HtULOpD0DiA+dNyciHC9HRGiM5IjV7OJgrwbAutpXXUsDHwFZCCWN66Mln3zm5QDj4aPoyrQw8yX0JvJhLMd0R9tVZSRDgvf4mLJGJZ2mBtmaQWxyRJo8FcZA2X9PjtDqsUMyTJx4USxZX+XF1LcjyHZeso6ODK+oFPZTCRaiOhrNUu+YHROEE1Z7VA3ygtcfBFsbZvywSbFN5Wwzqrj0mnxPUkrN+y2SDK4cpxWSX4I8ILZQcXfb0Al8BE4RNO5EvaPYpnL0M5TLnLnfafbb5lpLwO0qOB+kxvdG0B69PuDhECXXpaHIejJn5/e1RY3Ftvz1tX3HGObD2debi1fCCva4c+KeZYb3D5H4Y6EMjyzerkDR9xJrXRuysB8hrJ3bl4LA4dwgaBxonBzsT1Q4q40z7O41qGU2Q8OPp/cuw9DEyShKyC1EhWsn6Pa0n1xR+zJummbb6AND0VowHPATi+tzdeRgiY0PBYtAR852vfxkqGO0KH6EfRLgSuPubGfaSoOfPGbXZWmtMyGAOtbmbl+mHb+2TWUaklyn9QYQDk=</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>f7WBbzG1rXoeyGiJUb7h8xa/4YoA2HMDpz43rlDgNguyiwXEAIPeuTNQgQ1KhYWKaM4osIDNGQZZ8qlKyR+lmdqleKjYkMCJKJEp6b3Ll1y65tZrF9+QiZYvTnrFqWNN7u4JocrNGAeyimFF1cYepKAH48GJgtTv7gbZIfG9aO4E7jFQZXPbMn329tNRG780kN2PrAC8VYgsDxYCLdpRF/Jqvv+uVtBxt2GG6qXj8kKZsA9wjZ70pZKjin06id4JtkgVhZV9DglXaSo9YU76z4DbuK9HJUCKBwnoPEPf2ZkKPkMASYUpTzAylYg258cOyJTaa1xHmWhZLgivJqQhhihhBgXPNlt2T71j/VGx+gsaKHMAKkMxH4eaONKjE7vBOeclzsF/ulS0mWhupu6L07PSkIFFWkJ7zuUKeze7y5OFA1fzR9s9LzFnfspFeRnDfVG/yWAG62iw7g/byFyi3+jIkoQ8+8X0y8dVQ12OKAbQ4PuYFIAe2lVMr3AH0xp+UOHbBVEpbcPOoMq3p8n6XqlplC5EV9bBYBJDqgO8ZPFdMhAUBDTalUgfhA6D6jioTuLGPftZaQUUCvPS7TH+QGdW5twYb64ukhzjmOS7qhyE2Y9dryC/4t7DBWsA4y04TZxCGBWFgNT7KwoSBk5kFalMSH9HiY+mwxktOFYVHB/kf4zyQjqAGziQ+ShWyK5jTfeq8E5MvKmX3BmfeDuTLOiTm405l/S4jMZwD59c4mj1WuqnciPUawB2UMC6TEw4CrP+LxVsqTxZ/XiMgVTr7u9AxPxy9Wx11+BAY4EJ0i6gRW2D76LCqGVkow06nGJH/X7hUMLxPdhWfVte4peDCn7tQctBRuSEk07J8tTHA72tlGYvpVUgQuDT9Jrg7WYIm8pUzZCzceW/J68wpnWNBxGSQ4RdRckpCecbOrcxxq7p7ILXoIRq+zveZJ/GkWirynr3NUewR7c0Z6M2BJYbc9hQVs8YJBFCn7QCUofbzunP7gkpiN/pzj9PTX0mNPXOjMqB7uecDNgg9Dyjjv3/0w==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
