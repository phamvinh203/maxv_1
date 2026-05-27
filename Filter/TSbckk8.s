<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "TSBCKK8">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Kỳ" e="Period"></header>
      <footer v="Kỳ/năm" e="Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_loai">
      <header v="Loại CCDC" e="Tool &amp; Supply Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai%l" key="status ='1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true" >
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status ='1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true" >
      <header v="" e=""></header>
    </field>
    <field name="nh_ts1">
      <header v="Nhóm CCDC 1" e="Tool &amp; Supply Group 1"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh1%l" readOnly="true" >
      <header v="" e=""></header>
    </field>
    <field name="nh_ts2">
      <header v="Nhóm CCDC 2" e="Tool &amp; Supply Group 2"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh2%l" readOnly="true" >
      <header v="" e=""></header>
    </field>
    <field name="nh_ts3">
      <header v="Nhóm CCDC 3" e="Tool &amp; Supply Group 3"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh3%l" readOnly="true" >
      <header v="" e=""></header>
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

    <field name="keys" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111: [ky].Description, [ky], [nam]"/>
      <item value="1100100: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [nh_ts1].Label, [nh_ts1], [ten_nh1%l]"/>
      <item value="1100100: [nh_ts2].Label, [nh_ts2], [ten_nh2%l]"/>
      <item value="1100100: [nh_ts3].Label, [nh_ts3], [ten_nh3%l]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100001: [mau_bc].Label, [mau_bc], [keys]"/>
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
        <![CDATA[<encrypted>sVV0XVRytihjEQAw92yQ4HhvC2XowjjnRKmpKc3vgrTUk2oaAID6WIz8fEq16DdMncHexJVk/bx/Vp/tACOarNycShkju3SN1rWDEyZUXLbU84FdE9ORPLdt38g3fukD3D2ge7ilnxV4SYz26expiQ==</encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>4uN4TBvDCa7sZGuL7nrEzLfd8lMS6D8Rup5Oe4nh3lx2RYkgf47q4hQQdgBlXM+uHxnqi/wUph6PuaEE4BI2M2lny9XSSH9iWp8JL9zohohmYxvsXsVGojbqDRWNksgbKEjPPHehSS360hpb+kdGXgeR/6ZnkASS7llURM682Jy+GWZaVa7Nx29kjYcKwKYrcMUEKv9DpTfYpkeYQXHGkw/TgeY7E9fpT/GpdYDsBaHrc3tnrUKG46oxILSU2GwximOFB1ZBILvyv9x6Odp5sGWIUQS1iTvyw6PckL6t0/tXzkL8n7Ar8O/+XlkJ1Ch2+zqpDElQRQMw5svz+VPvq76YYflymiAirQ/D7iMfIYUCmT8+MWySvyNPx6erDDK7</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>ryFiDDvg9+n+Sf5qMiIWWyBz2+5/9T9EGYAdc28f4iI1qkHqI7PPEZ3E/Vdp2wscB/rGioYbFaNid5kavYIToJtVvPd97Kd320yrXDPHEurxTFGgFyjdRG40WH7a81DIe0R6lZcmJtJZng1y132Ycl8oxIMZozmGwnvegNFS6BN530FRr+D13xmgOMKgDYC676TskruX38GxQ4tb4wNQPFpljnnNg+o5bsMy6pnEjpxLvA58w3wZzrwNo2+hwf2+g6FQYnnIIuuF7KKzPCx8dm2cEaXXBSw05n/Ms0NaKOt2zEQXTvANQvu26Kf/1LBSSppfH4pJKZ3sXa2EkPZWpF+CopvB5MD5UPNVMVsaGibj9OWBc2YJPxVqy/oMOOghnOc2y+qxX5MRwaMwzewF0Y3lYpVR6IdK5DBns/rQJIsYwyARM920DE1wx6wQdcg2/vS9EQls0wwyJZERqBD+MIsNwxy7bwmDrs5I+xDmyOmuaQG99gnguOAXlnAY2vDTVXUlNf0a5bxmOxHhfGEG0w8vxFoZeW5LSbODb/ZYaa6aPrUkUZb+31G1t2J30g9wZSZYKBOG7ZQ5QXaS9NwgVZByzy2BzZGHWrs6AaZNsErlXZz+TLjRcW0Eg16RpnDcZ5Zkf6m1OccG3hsTpdAw366RV8NGamONJyuzrZZ07Pe9cvFXhOWXftMkBnCCA6FZIXKoI1vH1clrJyTUwuFAIQh2mnwXC3OzQTU27QmrrN0=</encrypted>]]>

    </text>
  </script>

  &OutlineCss;
</dir>
