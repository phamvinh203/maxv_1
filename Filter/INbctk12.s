<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "INBCTK12">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>

    <field name="ma_kho">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mặt hàng" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="nh_vt1" categoryIndex="1">
      <header v="Nhóm hàng" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_vt2" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_vt3" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="loai_vt" categoryIndex="1">
      <header v="Loại" e="Item Type"/>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="20" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    &ReportDataTypeField;

    <field name="nh_theo" categoryIndex="2">
      <header v="Nhóm theo" e="Group by"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa48iuUH34KSJcVMNmWD13tUwDLloSPzj5913ZH74D/JQnvAOirG19jVpDo1U7QfXiUg==</encrypted>]]>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="">
          <text v="Không phân nhóm" e="No Group"/>
        </item>
        <item value="0">
          <text v="Loại" e="Item Type"/>
        </item>
        <item value="1">
          <text v="Nhóm hàng" e="Item Group"/>
        </item>
      </items>
    </field>

    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <header v="Thứ tự sắp xếp nhóm" e="Item Group Order Type"/>
      <items style="Mask"/>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="162">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110---: [den_ngay].Label, [den_ngay]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11011-: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="110100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11000-: [nh_theo].Label, [nh_theo]"/>
      <item value="1111--: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 20, 20, 20, 240, 130">
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
        <![CDATA[<encrypted>SttsAkMfEfTRDq9HWeIeJsglz1I1OZlOijzZr76uf30ed7GaDDPOCuUxT+hYiz2ce/wz/KdJcacNYXtBWyAZ5JBj50MnszQX8z8BbKbVXw+BL4JSOKk9CPOtSCxwZ/xr8KhHJsXP2Hbv/P0+zeERQPw+owIPGIk2mvcdSB7mHt5JsM4D2C23/bWyRnZnFNptL6kvzlXJC9Uawz+eyf+dD+daVMskHeDZTM9iY9RHmMULNNzOWkcotGflDQZyhL4qdqBQpxN3jvAISVor7idXAaicYD/GW4vgNpK6vWPnJAqUDB87HwivUV1/wEB3L8SXGsI9ohcSaEF3lz/EWeGInA7nqgP0s2t7LCvkafNMnKQT4RObnOo8c+Z2MintUo6TICDQz2GyC9YxcZSrCPP/k+9OuN4nS2Z1j1ZBu+TUQwl4GCF1VYigjrIupGtGESb2</encrypted>]]>
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
      <![CDATA[<encrypted>6h8Q6zEeBPr1lRH/9ZDlWCo5TtGz6+Q9qo2LrrV0IPPE3TDoKGQU+Ly/NGN1gMcBd24SYnFNpOHwWaHrUXAMfrPRFHlUlQN/HXy3h7lGdVOSDq7KEOg0D7wu+lRjXZKJ+FdTXgqva9Jg6za9XK30789f/ho8ZZiZg6/6gjCLGCBJQFmOoSSVSdKvmE+df0Yf07TDlpqyON/zED1/Q6SlL5TF2SPj1TGe0U8bvTTSdN/B3IKdyMWgedVX8OXRmiosk09uJmy+rJPzBXi/ArNNhpGC4Qu6Z/QfUOVXkPbB3JZWrrfB5C2Qvhg0/B94wGugE+4+CXF3Iz3tFlMp8eEyg7Wtg7aQOoSIhNjEWRMIYg75FpCOA/XVHiVr7tZJhrBvgj9jOtCzpioSEu7XVJmWJrdQnFvE9aXLYLyDUalaExre1nZGzqv61j1R0/q8T0QK/JSajlK8S06uv1wiDpzn3rfTPNr0kClaYgs280isg2jvN0gRBt5hUKC3Wa5kGInB2MeK7NBaLxlhTnBaS/BymTm2HPxUGzLdRl8QZVerPDSv56te3deoqqNEQRfjwX4OASD7bFO9BJntiJuy9aVj6fAE6qM2DPVM86D3ry1GGxzWH5KHlKF1znZYrROEluLCkjnDY6AKrZ6HUti2aZ3lO8SuCzR3YeiMqJzHMdH5/Yc0poCtm1bq7fIxfxY/zL8uOIn4NsOY87mFFIiWXCP1tDe0MkuMe8Q1tXK/Ze4NEM2yuc/Q5tnE8CxRMpRdWNo+AhfShHCasqpWTF1ZnUGk9yLYuYgQ1m7uPX3fF4CyRnyIbP3kCPU7PZ6NDC0daH7mFPGETNqovV5uAZXUKkeoWlFObvinoGfDLbylNgN0tEqZoOrfFv8ublwyfH14jORW</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
