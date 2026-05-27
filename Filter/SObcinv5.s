<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "SOBCINV5">
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
    <field name="nh_kh1" categoryIndex="1">
      <header v="Nhóm khách" e="Customer Group"></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=1" check="loai_nh=1"/>
    </field>
    <field name="nh_kh2" categoryIndex="1">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=2" check="loai_nh=2"/>
    </field>
    <field name="nh_kh3" categoryIndex="1">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=3" check="loai_nh=3"/>
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
      <item value="1111: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>
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
        <![CDATA[<encrypted>mu9Rz0huPJhoW1tEfpaeir88Pbwq38j8VxEzzHa1bDETI1yWmnnwlNnn/JDV4lMWQqhOW+jeXO5Rlkc7dpnVJRTLiJrQ08OWBlvFrp404j7k3fYkFzpbqLOgiIPfX07VJaMbTAqEk30rmfpKSRYYhwu90C6Isxts2DyQjlE/7unH+owly6E3KhS/0G9iIcV+DbVrvzb+ktWwQtP3HOq1VGxikM9hBOeQ6aalSIs1U8wqaIqlUmLaXOpat8G1piqlqWW8cR3vLnBB6mAF21osQdexJpBkfZcY0q9hSNMEYBaidTFN4hGZizyMz61RHa6yCJsd3Lj+U1FSoc/fhtqI3g==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>v4dsLmW0CRXotDprz6i8Y+e8foFMUdoMMAcU38FoJjfw328yD/5igq1CMWg9tDpXClxaAzU6TuPC4jAh9b4EG+Vrz+89Q/upOdOeGzAey949Q5MjlZX5q9e55jU8s42uTC9GOLmtrlgRboVkLrgtU2pWWaxLRsq+8WGBmVUddENzjpUcLNtnMoqJaakEN2TsgfWz81FcksXQZeHtkHSWnUAT9kOAdzi+j31fAn0CK1QJxprCbk03005+nZLqL0jrAl1D9WsXW0y4fi+ohziTF14a5YdgFKes3jpSA4VYdyfQRbTt8W4bRtOMwH/AZoa+rzbklM1g0W7E3Rcz4EjJAo4zlmWHUZrwT2qLBXpIfbgvxXSSM1I3XM28wLBIeSlBrvXeWbBAIhJLIG9yt7OkTGT+UuNCx89gKzmK/9XKmUY+RQKU8NSmv0AmZt7VwGv8cXLsLs2UUDdE1hMerci4I8tNmzAFys6mbWNDhpdIXjh2VYYYInAUt6Bbt/AMkq1QcbXknSZfkhXTPqSFLVS3XNJY0JWHZrdrhDRGKJjkCcVbgnie5lUemg3nzVP2d1axer38IxaQr2L5MLtSz4ztJotNWOJEXDXM1bv9yHGRIbl2VHx/AGHhUO3bIJmas6luycGEtCZF3L3DQXL7mAW3CjbKIGtWwjIr8Npj0Mzho9ShjcFS6LWg0H/iXT5WNxs6t70+8lmL7DhrBjA2Cn06YR14+kvCf+WG6HE0gq5RvPw=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
