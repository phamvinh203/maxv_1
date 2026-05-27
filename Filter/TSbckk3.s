<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "TSBCKK3">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_loai">
      <header v="Loại CCDC" e="Asset Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_1">
      <header v="Nhóm CCDC 1" e="Tool &amp; Supply Group 1"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm CCDC 2" e="Tool &amp; Supply Group 2"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm CCDC 3" e="Tool &amp; Supply Group 3"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_bc" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại báo cáo" e="Report Type"/>
      <footer v="1 - Lấy tất, 2 - Có chuyển bộ phận" e="1 - All, 2 - Transfer"></footer>
      <items style="Mask"/>
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
      <item value="120, 30, 20, 50, 200, 130"/>
      <item value="110-:   [nam].Label, [nam]"/>
      <item value="110010: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="110010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110010: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="110010: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="110010: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="11100-: [loai_bc].Label, [loai_bc], [loai_bc].Description"/>
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
        <![CDATA[<encrypted>69exJcyPkDEglR+RY9/mtj6FbL5isHAm6xC+eSwvfRFnHkMsk98Z8AWFmNX5BkdwUXXku9FIZCaETykF/SGjEBFVy0Tvy/Xlc75mPff7UEz83IIkcBO8/kjYtmzXPvjZmAjcJ/A2Ywp3Jm/o606uVGuZRiKDcar1a5MkNY/iyAzJT9o4E4T+Hqng38W8FnY6</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>olaLgH7GIbbjFBPXz1mHvdM3fRqMoLc9DS/CHsYUJFKe/RxNcBxvrQPUxSECrd447UUxjEcn1StU6jUGv3RfIdTHU9Amd28lIyK+JYCVUI+NaOyf76euGg0rRYP5IAVYK93qxwNPyr8tKEHyD94HGOHDkQFiYP51Y06a2BhrsltTFQ9JnyADfgOxNuTjuUJrD3FU2rZJhwb8lnVJ5u1530pXAJcXhBP5BLdE24e+ytlroXs/U6MWzIG6ZsS+e5O7bJKkSVcqCArZKjhJFavr/lupAu9Bb2YrJf9RJTQmJtP6mDVXBPPFWdUH6eGBVnulCHEgzL3kksEdo72IUBaFRi2zum8fa094/b2oDi4gE3wPaJyck+C96w+UW5kQq77SYkEJwEilrOBiCtEOBaaLKqK+Hem2PCe0rCQ5utoQ2IfaHaU/XEHHFOkY2zL3pl2fZc9RefucHqx5+DyZg9YbKoiAliwdrvND6VRiFLFF4jqp+3YLr0gV1rbVBozwX7oA0ilnc+7HOq4HjjqcQYgtRimTy8X3bYhOXEnrvJO9k4qjuN7GutFmCmgZQSDTvBUmPwYC5EQqs9Oya1Ow57SuNEgi7E6RiQ9L9TWP5yl36P9NjK2hwdaq6KeZGJ21+Yc5zOEEdgqwZXl0bLf3Nk4XCkYOZxu/CRiXfTmpqMDFuk2dWkcLa4r6FQ7E+jAjaWDs</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
