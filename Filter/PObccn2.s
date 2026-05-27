<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "POBCCN2">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="tk" aliasName="defaultAPAccount" allowNulls="false">
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
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(cc_yn = 1 or nv_yn = 1) and status = '1'" check="(cc_yn = 1 or nv_yn = 1)"/>
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
    <view id="Dir" height="161">
      <item value="120, 30, 75, 105, 100, 130"/>
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
        <category index="1" columns="120, 30, 75, 105, 100, 130">
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
        <![CDATA[<encrypted>91rf7N+gr3XskXbtKWCRKpDVQSVeIq2DliripEmT8xy+oy1hj56tINU2MFPjcZqOVwoenlLtkvWCg4vvKBh+LFaoYGv0GTdPCrxgXT/c1dPEl8EIxxdZhqKdICC+rviDuiOS2Pn4kTSvbRvTWR5T0o4FIlNVdMUbRLXrcuD+ZJTSSmTekqr0ffknwdt+spaKn8sPSfo00xD9nh8eQbYa+k0UfywKcX5z/W54AOI3l+V7Bj0RtmxvKXnmclYZf8CzO0I0czLg3o0tzNoLr03NrhteW+tui/jokHuy9eJ/LMxc2QBQCn4CvxlHLiJUV9pLt3mS69DXr9iNKYuQZES8LQyX2vBTdRF2MMoYP2L3q6AeuBJzg5qgez1xi8DpnT9yPaQdBgQD/dqPta4BT1SxyQDTj4pkhjDa/6wUmdAkXJlYZH31H39zHx8ySNH/DQ/pW3jiOlMvHw2NH13zIuShwNw2rocU6n/SGPedpPCjyJY=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>QNwOnre2eaLRiI3VtqJiQqnB/xzwgr70OxyLAMBV2SqaRXv20dFmCUWCt/gez0Yil6ZjbmQ+3ecm/VSP+kMGAt5RgEbFT+zk7wwbg9Nm39UIl2bJmfs4tt8j1Kc1YdzjlGZf8lUl26cqDvCezoLzm0+QYsvEgtmBA8HprTU2mxaoulIL3tVK5HurOjSjmO0y/TiXl4F5zGkEsFHQtTGZ6ql4QoVODRQTvbl8sAWG+TsyO0/I1Fyub0avma2r0P8WnHhOMMkJnyf0J4IGwhO3LqpMJRq+R7tDGsvr8dZcMUGCdeuvidhVd/cj3HjqSjDyfItHuhxPK20kWRWFPvASjypy8b5E2O/weYhFzHO7TFygJZ7ZRXT0jm+wFrHr7Lhf</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>6h8Q6zEeBPr1lRH/9ZDlWBLUOpWtXjTU5OUdEXwVygLni7ptsj1uNSyIdZXCWlOEq0HgK7muvSO8zd9mGu3IhI+CIXArZzuhSSbayX6U5pBDAvBv02L/SdNiLDq6bLiuYwXFzAJwHaM6XZVk5xK3X9SoM7QB0vbA3tr47vLfJHFgjYnnXKs5Vr9e34wII3KJKXJRJkulmyAoJ67OndoOieh/DicWsh6by9AZdmJcR3aH9Ig5UziFZnInQw/ZokQ/VzJmvjN24ybQvZ2p0q08RRCwi+RXPyKEX1q9+lofXSyAsSWh9iTZcWOtUR/cqCsoUWB7QBw7X8Q74mWnAFViYfUFgcecEzn8g6qwEnCBY4btHkDjyH4eUB8lccZRJimXWZ85cLIMRPoLUzSa30PMtasUVs7V9qAqUWXB0b4PByBlG0W7pHe/5My3YLLtkPAfRHJvh6FKGMpZEnGkouoVBZ/Pl8oCZg/3CGvucajPv7wA6S8R6g8csNC0x6VIRQtwBWChKWAapQ8Y7CL1K2YVgjVzQH44raBR338KVgzk5Z0zzpv9RyMa+pUQct5SwLdLASfzNql2CGjc9eefTnnTpHxfkzdlcTIqswdEWLrl9dnv7HyEkbvscG/Kim8lNZMA46Vq3qzNGyQl15mkE/updVEM7py/ZPMpC98cYeHJBXeeZayOq3JnI3d4p0t45jqrXk406ghVYjM8poe4riOuXrlQlkcNydkSaR3xlPVA2PSeYmR4eoFpQh6yzftWTYBh5zJrQ1++EGyx2CZYVkgwkJSs3MM+LviQy9FBDtUwPz2v3nliROK5x9tTZTLZniBGH9SRsv/Kj+YDZw2Y7N9m1qZR6DPAXEyuOTYZpa5C2mN1g/CSiAFEwwQJu4CiQ21NGljSmrLqLZLbnfYKkdfuLALl2tIev41NjODYkREcOtH3pMK9XnIdKs0xzoHYDEssV7LpnjJr2E7KBlp6EW2ARw452Oyq8ivesdLrcUrEb7+TaonsQvSiGHAsblVQddrS</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>6z34DB+AhCv1K3puiGUPRI2wf7OpUBsUoVu+lHQf/O2qkHf1btP7AQs5GKrhkBuhxtXCE+1/icpFR6NptsL23XhlNCjWTa0VUH/9c7CRLo1qnpuSFNs/PjNqImVB7VWpkFipJKzcFDQOYLel7B1+zT1qHV5i65/rYsuefNVzseI=</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
