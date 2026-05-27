<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CODABC6">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="vu_viec_me" categoryIndex="1">
      <header v="Dự án mẹ" e="Parent Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv_me%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_vv_me%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="vu_viec" categoryIndex="1">
      <header v="Dự án" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_vv%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="nhom_vv1" categoryIndex="1">
      <header v="Nhóm Dự án 1" e="Project Group 1"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv2" categoryIndex="1">
      <header v="Nhóm dự án 2" e="Project Group 2"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv3" categoryIndex="1">
      <header v="Nhóm dự án 3" e="Project Group 3"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true" categoryIndex="1">
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

    <field name="cach_tinh" dataFormatString="1, 2" clientDefault="1" align="right" categoryIndex="2">
      <header v="Cách tính" e="Calculating Method"></header>
      <footer v="1 - Theo đối ứng, 2 - Theo giảm trừ" e="1 - Reference, 2 - Deduction"/>
      <items style="Mask"></items>
    </field>
    <field name="nhom_theo" dataFormatString="1, 0" clientDefault="0" align="right" categoryIndex="2">
      <header v="Nhóm theo" e="Group by"></header>
      <footer v="1 - Dự án mẹ, 0 - Không" e="1 - Parent Project, 0 - None"/>
      <items style="Mask"></items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="186">
      <item value="120, 25, 80, 105, 100, 120"/>
      <item value="1101: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>

      <item value="110100: [vu_viec_me].Label, [vu_viec_me], [ten_vv_me%l]"/>
      <item value="110100: [vu_viec].Label, [vu_viec], [ten_vv%l]"/>
      <item value="110100: [nhom_vv1].Label, [nhom_vv1], [ten_nh_1%l]"/>
      <item value="110100: [nhom_vv2].Label, [nhom_vv2], [ten_nh_2%l]"/>
      <item value="110100: [nhom_vv3].Label, [nhom_vv3], [ten_nh_3%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>

      <item value="111000: [cach_tinh].Label, [cach_tinh], [cach_tinh].Description"/>
      <item value="111000: [nhom_theo].Label, [nhom_theo], [nhom_theo].Description"/>

      <categories>
        <category index="1" columns="120, 25, 80, 105, 100, 120">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 80, 105, 100, 120">
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
        <![CDATA[<encrypted>yBxsxpf8yuulHiYXWn//qY3LuhfjhwmfsauXkQLqfPeghQJewKPOLuBjCBmhUXqNsrTQCAwEScducSNjGueEI6ocQ16X78rR5f9XfSCGCkSGZe1kk/gVcdKC3o/hNCezL+uEOM0SbOeYbC2IWS6y3VvIn1Zuon6yc8zNsc+51E4ajI7x/dBWUK4SJG9mgnIY6a0GITv5+1pzUzmahuL0fu7/nNYicBoUnDJFTFVIlGeZDX7hSYfGohGmmQpHT8i2</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>8E1McYxu5F16bWrD/bv/T+bo2Qf+81dmWLdH2kFOVqH2DdibLmqJtVw3kk5sG0D/WUxUJzBEQB0/bEPv3mOaAe4mp1wZYsUw/9SmGWvzwNp6Wu85MwwqjLFM1sptWMSg6BEhxP89AJ9mktKvguwYjeIgGgJw6bWGF/arobBz64M4JAR8D0ZaYg5yDpkTN+FyhQxCbNaBPcpKpPEmRc8l4jjqd3RXSa+I91z5u0+c96sbMGJ9s+dCbns+rsfSZKsnxXFOBY1EsIt7RUFTHTKghNx17RsNBrB1zGQq12UBMCNQEtMHqCsotgYBhaH3HnA5dTMAfc8W6SAXfy9mc0V/hPsoDH0P7+qfWdJUHiRbfsyoVsJtkBrHneguAHE1ShDcyc7i1bISx0hiRbZoYW+dypHT9l8LUASVgv4G/5MqPRrJv6TCwqHBKm7a3Zw+e5yhXecDwdPoHXL4iAwwKDwZtYZjFGTVUK9XfN73svSiEZ0vmGDdU74Y5TIP0QstsKg662gFkhQfQyE/IPhbFB10K4dFM5i82PwfpJvCqO1FLN0dM7WS4l42ZFCkfqd7yO2a8cVJzIDbhesPsSEX6D/IPhlQKCaBX4s/kEmF+eXKZe3+h2xXoHishtb+tWno1fhhh9Do/Qq7EEcWd1JoDHjGK8+oIr93jNE+LygakZHxUNk=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
