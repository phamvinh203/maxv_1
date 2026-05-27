<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "POBCCN1N">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultAPAccount">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="tk_cn = 1" check="tk_cn = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ ngày/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="ma_kh">
      <header v="Mã khách" e="Supplier"></header>
      <items style="AutoComplete" controller="Supplier" reference="ten_kh%l" key="status = '1' and (cc_yn=1 or nv_yn=1)" check="cc_yn=1 or nv_yn=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1">
      <header v="Nhóm khách" e="Supplier Group"></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=1" check="loai_nh=1"/>
    </field>
    <field name="nh_kh2">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=2" check="loai_nh=2"/>
    </field>
    <field name="nh_kh3">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=3" check="loai_nh=3"/>
    </field>

    <field name="isbalance" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Tính số dư" e="Balance"/>
      <footer v="1 - Có tính số dư, 0 - Không tính số dư" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="kieu_bc" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Kiểu báo cáo" e="Report Format"/>
      <footer v="1 - In từng trang, 2 - In liên tục" e="1 - Eject Each Page, 2 - Print Sequently"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="10">
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

    <field name="keys" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="126">
      <item value="120, 30, 75, 105, 105, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>

      <item value="111000: [isbalance].Label, [isbalance], [isbalance].Description"/>
      <item value="111000: [kieu_bc].Label, [kieu_bc], [kieu_bc].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [keys]"/>
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
        <![CDATA[<encrypted>sVV0XVRytihjEQAw92yQ4MmSrN/E/DMS9PPCLu0lz6Gs9EMep/qyV4GUcDSkA05VvGC6HzbTE0PDc3BrcFuY2fGCZ1oNbwyHorCWBm8/ikgBl2D2qb7vGexOnsvUsMRd3ytafsID/aC3aiAXC2HLcg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>jAM+2OWNong2bHD6+883qvPi8l0M6Rpb9ixhofCQ0bISA27BXsOk8aqfb6NRIbKuZe5zEGKDiejyO3HGnvAhQk15W2RHFdEsXiNp8FHqIWC+ACn+bS1+OI/JDL+RFiLDstvcJgWZqsh7ORQD7N64MUH/tAUg1FmAETlSrZYxFDZelQ0QAazc8CVmPTFMohGkPDIc4RlQv4DEqYjYEwg+bpE//KRlgGPZqYTNKKvhW8lOS6j43J5EfAS13uxsuGfK8vYIPU5Rpk/WPwxc5xkpZnIriszipwokk6TLte7bs5jijbdzruz//J6iZ6o0jKpO30kmRbnkBWqXwtMjMkxW0AM+LnDRaBe9c9Qjw/Vp4y/AhTVB3U9sakkl0Q2ru2OV9iHnP9WHe38R/w5eFOq+4OYDfzdDn7zL88iTGSIiT8LuTvI5dYgif3+cZ7PmkalA1AsDywsJuX4ge1/macykrP5RN+yZnl4OAIbgh25Vw664MiiuD4Y9xzPw9gL9+bT+DgHkEkNe7Eq2/dn0EPiycGpKN7oX4ALXS4iB25uJMyqgK0CQVSFGZI52ontzJ73/CtkvZfaTnmhX9ZZNy66DrIpTq39OsWuLLzwe4ErCx3WtA9FF1YEVqyxYhHHFVs4M1CoRDQLs+GXT/HymHw9GuxqSnNrjNhK0Q9GqbXTbBZC8l6Z77fgkfYk32ZqdQVNkeZIVAfS7Nrpu8qIQkhomD+ibpnZ+ewhKiZwlFg1XFTYFcnL7PMe2jskMh4aV+2Bn75e3/EQd+wv3Vfs9ekZ6tRMDsBO5wM0q09DmSR0OLzCesa+CbYqnoH2iIRmoJ9V6AF5j2jFxlOn3VIMbzR3ucKwCcsfC3cj+deFtTftY/fCHWgX1JQr2qC1wuXgoEFWNeCl7A/W0UNVUyxFg0OVD7kfzFkgTGhTTjxf34+C7oq24PghYmPonwToWeEfOWADvyYx56nujGvN6ovw2lkzlZ+JeDp+2lReKSdd5rxwA/38=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>6z34DB+AhCv1K3puiGUPRI2wf7OpUBsUoVu+lHQf/O2qkHf1btP7AQs5GKrhkBuhxtXCE+1/icpFR6NptsL23XhlNCjWTa0VUH/9c7CRLo1qnpuSFNs/PjNqImVB7VWpkFipJKzcFDQOYLel7B1+zT1qHV5i65/rYsuefNVzseI=</encrypted>]]>
      </text>
    </action>
  </response>
</dir>
