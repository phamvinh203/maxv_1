<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "SOBCHD4">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" normal="true" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date"></header>
    </field>
    <field name="loai_ky" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Dư đầu kỳ/cuối kỳ" e="Opening/Closing"/>
      <footer v="1 - Đầu kỳ, 2 - Cuối kỳ" e="1 - Opening, 2 - Closing"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_hd">
      <header v="Hợp đồng" e="Contract Code"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_hd1" categoryIndex="1">
      <header v="Nhóm hợp đồng" e="Contract Group"></header>
      <items style="AutoComplete" controller="ContractGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_hd2">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ContractGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_hd3">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ContractGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>

    <field name="ma_dvcs" categoryIndex="1">
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

    <field name="sx_theo" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Sắp xếp theo" e="Order by"/>
      <footer v="0 - Mã hợp đồng, 1 - Tên hợp đồng" e="0 - Contract Code, 1 - Contract Name"></footer>
      <items style="Mask"/>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

  </fields>
  <views>
    <view id="Dir" height="137">
      <item value="120, 25, 85, 110, 110, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110: [ngay].Label, [ngay]"/>
      <item value="111000: [loai_ky].Label, [loai_ky], [loai_ky].Description"/>

      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="11011: [nh_hd1].Label, [nh_hd1], [nh_hd2], [nh_hd3]"/>
      <item value="111000: [sx_theo].Label, [sx_theo], [sx_theo].Description"/>
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
        <![CDATA[<encrypted>Dwxk0TyY9HEr44G/Y1U/hl+DbDufj/JHL9oeHV45BKaqu+HZT3pGNyscoPdraGx1fikJRG9xPZ80o21bLjxGLrxJI45Kye/ZElxbAh2UOnhnLsJhyKq4fLn1ukOXf0nFygzw/y9pD3lmXkzz4q9D2JG1ewWjDwfultYM7rs1obvtm6DVPx7Onn6IhX+b6jz5moe8LRCZStajSY7ONUHBBGvKStkkYiJJjXts9G+jibmoJNJmZfoyAYT5zy6DItcphIjtpcZwdb9bAwQm3E8RsAsGr9Z0Mg7iNyMeI8RPNeP2nniCwShsqB6ByJ4gR/x3VppYgECXA7I9Gykc/craaQ==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>6h8Q6zEeBPr1lRH/9ZDlWPR9PsMWmNJjlqvZpd6RRQOHGlCoupdwIXWZMtKyeOx60NslkGRkjfonqz6T+90tlPTrpZPW9T3y6JyykQTwpC9yAB9kqoJ4twJRY/4KpP0x7twQAAFqezfR0kd1iMiER8lhaZlHCbyGBdKIV0ZtyMPAHfgf934aSU3Ydg1JXOJl0ruLvrZW2gF9ZL1hLs8I+8ofLfxloCHX73FR6dbTPttcs/RuUiTgMdp+qPV1nURv4zT1QFs9/01VN6ADqQAz3T5G2m1crV0PPvHEgeu3VcweTTX+dSsM2vgNAZrHaPupltrvc7KmMZ1WjmBVazcI1qBYdr1ia8S38T+ZjZADiMUuLfFnCIHkA5lHzWy0Jz2HPGx5GT2M+zh+vIfdpbcIdKk154eZrRIeG6wpb+rXnnzLV3dj4IjWd4m3wBnB7XF8ivdwHTkdfzny4M9f5ZAGSicyAzlRQmQmpG1Jg1jdm0CErYdfcmQfPCv/fz1eadc9ZIv7WVELR/H8FjCTVUyL+OE+VHe+JwwAxnaasDunybNjadKAMZMjlfJeDdsOF6QrOiTDyXen+HJAESTGcSBNEbF2Jw0+VokXJ2dNsPU7SfXDgp3mh0p+2XA4h+dfmsDHG26vy9gKvmR0v4YqZsczlX0wX2t78BhGJBpV4qIQ76f0ndKo9Vki8Y+34TQhD625f+dcauYEY0IywEehf8ksX2YLRa2t+5jT+rvhXG26gmZa3Gl12EKCqQPfgyV0MuUjYWdYU2Q3D5+C4nUrqpq4yDuxWMBNXIWONLM4bBneGnA=</encrypted>]]>
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
