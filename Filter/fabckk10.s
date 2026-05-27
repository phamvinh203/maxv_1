<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "FABCKK10">
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
      <header v="Loại tài sản" e="Asset Type"></header>
      <items style="AutoComplete" controller="FAType" reference="ten_loai%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true" >
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="FADepartment" reference="ten_bp%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true" >
      <header v="" e=""></header>
    </field>
    <field name="nhom_1">
      <header v="Nhóm tài sản 1" e="Asset Group 1"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true" >
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm tài sản 2" e="Asset Group 2"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true" >
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm tài sản 3" e="Asset Group 3"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true" >
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
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
      <item value="111--: [ky].Description, [ky], [nam]"/>
      <item value="1100100: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="1100100: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="1100100: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
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
        <![CDATA[<encrypted>sVV0XVRytihjEQAw92yQ4KfZ6UMJtIG85qvbew+aNksSyefvJQe3CEEeQ4FQV7KZK5Khu0t9t6QQuiD4ZLfZE9fHKba+em5kPXsRwB59J5ULpS48HotfamrnAJ5DdvYDwSVEQRH2NjuzH+rdL84zXw==</encrypted>]]>
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
      <![CDATA[<encrypted>U/Q55zbxjZFHi/dASN9ark/lkeZP4GpPRcoIobE0osr74kZo16UhFhbQTPP43JW6TAvaROuE11rdNI6hAk6zNBIBjJcFAQpnzaXBY1yxhgmY9hU5LqLxX/Ick93mFPdJn+0LURGhXvEg6hjUOlpvdok3SxBL92GFJx93MlBTvy+0dmntfJMCcnH/R1kwTkJ/fQ3LdpYn7yga/7rBDknlDqdzBgM/OApngqWDp2TJG0j1fnWDPsQbRukhemstv+M5njeBIvx1Uxb4Wm3j3SVIcjhVhkBSma596ERgNkgXMVuUb/nJH7Tq347HDgCo4IC+ZvBnqdeSz50Fykihh+eq16uJuDB7wCpPjMogWm70jiQHIWdqsYKzWJget0LApfJ0agZegUMHLy01BglunDTqUO8wEeASiWpTOrXyEg0cK6BYU8jSu8KuwgQ+EgXfyJjAQkyE3IZwdpgLLmpqVg3k6vmuFI7rTzADG5qRLhQuPkwKl7fy3UafY+Qldt+ekQrRCEfAHIL9m5Q4WBaYjUDWCidRoXvERwfniGd96zqCS8iHGeiBS0pycuyDarHYk421osjBy1lJjTT35XO9riBP19VH5dF7q4H/A5wwZSoeHiLOtZC7DJLEng86I6xZVIraUuKBzFm0AeqbTn5T7F0I0KY5CMCx6o8vjXKZXyUOQz/Tt5og6Ur6+cdlXDXuGoOnjI0a7wpH8qLGUXY8ZCoP+Ynnvh49MonPv03NDY5aWF0=</encrypted>]]>

    </text>
  </script>

  &OutlineCss;
</dir>
