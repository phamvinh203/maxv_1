<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "POBCINV4">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="date" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Được tt đến ngày" e="Date to"></header>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày tính hạn tt" e="Due Date"/>
    </field>
    <field name="so_ky" type="Decimal" dataFormatString="##0" maxLength="3" align="right" allowNulls="false" clientDefault="30">
      <header v="Số ngày/kỳ" e="Days of Period"></header>
      <items style="Numeric"></items>
    </field>

    <field name="tk">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn = 1 or nv_yn = 1)" check="cc_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="nh_kh1" categoryIndex="1">
      <header v="Nhóm khách 1" e="Customer Group 1"/>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_kh1%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="nh_kh2" categoryIndex="1">
      <header v="Nhóm khách 2" e=" Customer Group 2"/>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_kh2%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="nh_kh3" categoryIndex="1">
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
      <item value="130, 25, 75, 100, 100, 130"/>
      <item value="110: [date].Label, [date]"/>
      <item value="110: [date_to].Label, [date_to]"/>
      <item value="110: [so_ky].Label, [so_ky]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [nh_kh1].Label, [nh_kh1], [ten_nh_kh1%l]"/>
      <item value="110100: [nh_kh2].Label, [nh_kh2], [ten_nh_kh2%l]"/>
      <item value="110100: [nh_kh3].Label, [nh_kh3], [ten_nh_kh3%l]"/>
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
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7bd9FNywYYNz3RxLLMUwzwwhLQy7DE5iEYJ6k4xCkvnwqq3w6Y1387otymw2cBMrnC3N2LRSEoYbFqJc8uSLMYkrxhuHptGwpsRr7JNF8HElL9PbWiJ1tyqE8oQKDPG8W2xJipZYTj/hRE9xxWHyoNycniI+z0KKOKS8cdAmeoh/</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>WK0XD2k1jRLILXCg5nCEsjCNaicTZOJWBtER+ZvDWCBlNQppuYfts4XDzXNts1NJhQWn+YGL4qq/VnvXP5KnFLRm0wlXjxfMwCWVIC7gGBwOXGpX9DdjFBIDcxuwgvRXdjxoFyBLZOx4bPvuK5fick3dTihIgDX0PXQyomnUf5pg9DMSs2i/kARqqfcOm4DXCBUFQh0qO3rJM072y6NreAfv/KwaSUITt8cZhcO5yUV38Sd3NNkwEmv0zIxaYWvt8LluZZXBRQMb653Qjs+52l/h/BgX8LYTEzleu6lLxOaondMGYx+fjuq4y8ID0F6Yt2TuiIFTuVFqcqnhxFo0qHPp690b/scI3O0/HfcEpcziHR1suAYHDdSAdFssBJsFU+N2oSWbfrQu1I+iw3PIg84e3PYEii8sBRqhdGw1R3+XaSFPBDEE1MAbt89axy8KHA19Tg0bAc5d5skQ2LJcwEsIec2DhfLMGuVs2bYjdKintKT0k+ckJdZZO5I5sYYa8tPn5pKLP8rcs2P+exN83Rj5OHg9a3V56vbZQI++zo2dMMWpBeU3p5iTwTcHbZMh6463WcQkYB5RkqTOIQ/1Th9J7/06zLc8ci6XkARjoz6K4rBiaYJnD7U10eufZp+l69b8qnQeuaA1jygOU6glpM2U7AU3jqjWqV3lgE1lLTHRRaTSOgtCwotc15mTyQi10qTmjqvQJsCZVTYkWz0eb4pEeDEZf8gImli1mT8B+qF1XRnV+F3twvOsKL+w4izgCiZ0RRiMHELk6Pmh9e3TcvL7sKaVdwXvrxaM3i8Q6n0/I/5nbCys9QxSMmcTCw3F9HKAmbBXKt3Hyiv94qBFBw==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
