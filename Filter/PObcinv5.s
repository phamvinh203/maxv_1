<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "POBCINV5">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày báo cáo" e="Report Date"/>
    </field>
    <field name="tk">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="so_ngay" type="Decimal" dataFormatString="###0" allowNulls="false" clientDefault="3">
      <header v="Số ngày cảnh báo" e="Days of Warning"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="nh_kh1">
      <header v="Nhóm khách" e="Customer Group"/>
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
      <item value="11: [ngay_bc].Label, [ngay_bc]"/>
      <item value="11100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="11: [so_ngay].Label, [so_ngay]"/>
      <item value="11100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="1111-: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>
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
        <![CDATA[<encrypted>mu9Rz0huPJhoW1tEfpaeihbKsWN+YzpB+wlCKWbef/Im+TjWT5/ja1gNSwYuFhf1IR1akR1EqyivIaz+MO7tl0JEldEhklAJB+DzNZZyB0mlCqPFRek26ENqF2ks/JtHBoVhc7HA/rMD/YCvuPFtr0t+pC7zcyNkGpIerbk0peY8rTYEjOwx4LVg6Zw3Yn0QpVeIQQPFgq9o8+YRedCU9+lG0JneGcgjZj53rwbp8AilvI6u4/vRwCKjiZM2fPpzGCroEpyhOi3ygBoVDR68jx7FVyCTgOvuQTkVTSS2yNT3TReFc/mO5lDngu67ZQE9Chkqu3SyL1AV1C6e4ZP/iw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>v4dsLmW0CRXotDprz6i8Y+e8foFMUdoMMAcU38FoJjfw328yD/5igq1CMWg9tDpXUyE3rMzA9CZw7eSAZs6BmVtAdj5qON0WbRqmxl6SKeRVMboz6z1zI+lkwt+TT5Pu960ACrQULxZvkk9K92PgSp7PpNFub1dYnkmS/0PuTtreWZZbz8SYxAQp+gkoDXUsifi78HIQ5YEmnZF3rRAKow3V927lHfPy9bdUOq75gARro4c6x9CjS4Hfj0c03U1Xwn7MDP0oYyxxbea3tvl9IhAy1cP5D8jW2W4U8ecOxMxa6u2uH+cw4R6v2nRQNbz299aZMJmxwn1YaCmka6/ZVsTmBVrmk9wuiJ77Ql+qrpSOzevfXheBdYB8Njzys45bcp+GppC5l0pjglZd7YuZwr8LZTETeCIVi39VfJtgtbAsA4VeaOwfQEvv9YrhQKBOhQugVJA6+soEx6x/i2YQrivixv+9w+sOom2ZMLNPxp3HnsICr2M0VKRQLsxiNRu5Z3yPxRemP2b7LO40zZKq7ISEY8KN4z/1/xpo3VWPGdVJ5Tc5Xo9EkzibswOA6t+mPZok10OzjPut6f1zGo/+k2IUuZgSDhHNdQk/XtvE0L11Pb+xXRym8IEg1RZdInYkB21TgyTwL6H6T4sxpxTNO5WRZQQcWeCkKzX6a//1BQRgfE77FajHsd4o7XVsJev/lbm//yDAHs8PCE7ELHSvjLCmP9sHx/XVXC4OW+HTPXM=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
