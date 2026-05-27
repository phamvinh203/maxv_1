<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "POBCCN1">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultAPAccount">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1" />
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false" aliasName="defaultAPCustomer">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Supplier" reference="ten_kh%l" key="(cc_yn = 1 or nv_yn = 1) and status = '1'" check="(cc_yn = 1 or nv_yn = 1)"/>
    </field>
    <field name="ten_kh%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="isdetail" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Chi tiết mặt hàng" e="Detailed by Goods"/>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="isbalance" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Tính số dư" e="Balance"/>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 80, 110, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="111000: [isdetail].Label, [isdetail], [isdetail].Description"/>
      <item value="111000: [isbalance].Label, [isbalance], [isbalance].Description"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>urUv0ge3MRlUESNGtHFYjAba7xdZQihcpHayQ5piMTz8evhkxjRy3JBsruRkFgHAK0SlNxHAlTivJJpfsjwbcz4cC3NavfTXI12e5dKe0AHlQ2VO365TMyh3O8CZaWT/UfyaHHXgsiRMps6d3XTKleYWSW7yM0MtvnkTf7FmQkb6F+DHPQzf4FzFd/43ipTUOh5sTw8jIzv2hwgg/S+e97n6PytAXprY4DC1e8f2Ti6DPounDSDz2TUOJj/GAXoZ7W4BGnttLje8UsQ+bwNJB9Dz9Aa0ZAdgKpTiBdsl8+CIYfrau3hUkzn449vm9l1ehy72eu9LUOt+ZgeF9C0bCA0VR2BmFgOr8But37nC3VLE9nPFHHptAUYI4/rWyR39</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>adZc9n9tts7RkVT5bkyJFwtzvD1M+07Vp/YDLuiQAG5nYMfsB9/75PvPP7OWVEExsER5Ahvqf2Ke0IXepQ1tMgVLDjdDxy+D82rhOrhhv4pVHKVcRZOnbuf+Orj5dze7gdx1Zwzh3CiHYNxEhew1yW8F8kn51x+2AjLyTaN/eI8Ps5c9/Lt8nNg968LOjPNbdcAYtR24z8BM8bxGfPXyKeUnRR9I/Qom+1ZH3pEUZljANRStiS1vb/QQxaa+YgdR8tJMSW64RMEhDlFxNgUFnvq76QV+i+96FLodX3PWv5dnQfoSRTZYlzCQsS+vwhOJVAW3q0YVTtPkBDc3G5d/oeadrVSM1P3+kGGwOx0gTca3qlm2tmc0FMIqOaLkacAhDkrQsRdBiQVd8a46vNMWBbFMRmL7y+nn5vfgE78Hchae+gPwaAy5np0gDTqD1DcgaQNszSCT2EgsSRs8nQd8EZ2ZmRca6EOqYyWJ5Q0Z82vyPVXgtV1putKzLepIYqBL4IfFnyBzUgVdSmO+FZLt/mxavLbqlLSzz1t6uWfH4t1cOxtrNvzXJnt9yZkoN8ertB63EyZSgnibP9g7skUUCbm5sQBaTMEcmYqRpbZJvvajGzDDcOq9/OZbLEPTNkkJunDC2ScZw4koJskf9ZFhNu0bk9Qp4gCjepzxYrTTuvRP47+ilB6OveUl5Nntl5GL9GGjj1yk2NQp5G5XfCIKZ7AxyeIKoYU1cH5ERqIjgnsUSDc3Zd9NMD/amKgGsU7s414VZoOymFxo59a6iTKmjj+wI6XvVs6VX0NijQXjgxCgyZ53qDl/ENailYpEjfTzKBPL1eRu9Gl5VTb1fvIQxmO2oUBBtZ3AkLeH4k+XtJ8SghANLClL7jqnJeo4iyQIo9fh4hqvoUSKnpik7wzo4RYt/P1K2z7h6iTx4vHXfobR7hVK+4DHkTmeQyI0dkApkif6V6Hum7yC5RAoewVrVK8srZi5bZB+y/n+4lHeCllmjSrQ2pHkvfBVNvIWDLbIAH8P7scWgeg58KnmPmsfS4rPwY0i8OPA0pr0Obm9LHE=</encrypted>]]>
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
