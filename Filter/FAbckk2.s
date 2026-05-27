<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "FABCKK2">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
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
      <items style="AutoComplete" controller="FAType" reference="ten_loai%l" key="status = '1'">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_bp" categoryIndex="1">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="FADepartment" reference="ten_bp%l" key="status = '1'">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nhom_1" categoryIndex="1">
      <header v="Nhóm tài sản 1" e="Asset Group 1"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2" categoryIndex="1">
      <header v="Nhóm tài sản 2" e="Asset Group 2"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3" categoryIndex="1">
      <header v="Nhóm tài sản 3" e="Asset Group 3"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"></items>
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

    <field name="dRptOpt" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="100" categoryIndex="9">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="FAbckk2Filter" row="1"/>
    </field>
    <field name="sRptOpt" readOnly="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="161">
      <item value="120, 30, 45, 30, 100, 100, 120"/>
      <item value="111--: [ky].Description, [ky], [nam]"/>
      <item value="11001000: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>

      <item value="111000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="111000: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="111000: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="111000: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="1100: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100: [mau_bc].Label, [mau_bc]"/>

      <item value="11: [dRptOpt],[sRptOpt]"/>

      <categories>
        <category index="1" columns="120, 100, 100, 100, 120">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="9" columns="569, 0">
          <header v="Thứ tự sắp xếp" e="Order"/>
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
        <![CDATA[<encrypted>0HTDgP242uPmolAiKfAlDGsisi6Y/iZQP/tWUrp+boKd/6lI1jbwODzcHJatjp0OSmb/CARC3dFuB+pJEfolj5nTPeDsUPLHkb7T4pEs7d8ISOFdpyQlJQITSS+Kc5mM+pNXwPVVTIN6Kd0GHrbmP9dT4pdzmV/1/zh25v4zCIdnqUO6dq7MCa1185huhP42pJMQkmggEyiHNjpCTXNmoUkOKmmsq6TDi38vYZvraG1IqOje4I1HwwpAcpxXb4q+in0vH4xfd3oAzJZg5s9iXm3Xc5CostoRTG6d4mYnRpxTujOc8Ivccz/dM7LkWYTLWq3HUpJbfiSQYr02OaWxBwQyY2sQVhTdZUTYpBAJQsz9sSjLBtqT53R+1HIzY3KrwViSnWdYAQ4ruAcOD/TuYuyUYvaF2Pbnn7KW/w3V7OpPS+Lujbj2VWQESoFDz6fZtTO1WimbskVF3klkNGlYOyhZJwnAAeWs2mVK08HfbVQ=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>0YTCFD80iI93vShVOsfPS+GRndU4HByzJVyWDso7UxNz9SbyMHiMrEokXIN66tsB</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>Iw//uYuWXr14NvdkzCa1YLkyTAAozYjCe2TKjhU4PTBbtqJFDhAivtbif9CePW/SmtIKQk6217VRfbkQ314A5jTwVIvlzxbBxMlR6OkvsBPar3p7pxc0cSSC0iUN3fxj0B2J9GgSNtxh2qhX2xlVIoXiuDEpDEHOCbvO2G3zdCYhjCTaIv0vjj2Vt+rjIHnCBoj8gIu3kNV98yV8EI93HihkKZo4z+sBDm3zWQFJT2PJSBBP5/hkb1/7Dv+l0sHhffK/gs/27qGpBzag9louc0VrwP3d+SkA1NJoVlOyyu+m5xBenkeYJ74X2nNde7EU1AqljTQdWO18LUDcKRxs5MwGbM6+TECI6mze9K3q3JXTL+5LPjG5hzfXA3KQJ9q1Rh777vUmi3VZ3wV8yj8Xz1d6BgUe88zfjPPGo5RsptgvN0WRbeUYXNrwL5kZAcrnwC2sw1Ae86eFzxVOgNZCia9/vs80ogULEYisYfHTy5rqc/vQkJBUKYntynRWkhBC1dn0YT4nukpAXPO44wGYNCLvUbeEDEpJJnpC652zSMAujxry20U9+E2OOUWZ79luo0+d0HAne/Kphkta8zXrP7XdXJ8O7LGiiLFhJWB9q0pop6qysC689R+/8sXCnaRzpAl41PKTUr1vBLN/F47Hsf0jyq9gioY01SJh0zgY+kMg0cnoIiLzsrzT8m3fk2BoResbAA58yDOO9Xy7mg3+yF23vQkCwtlQEBO9D870xgZz2QIvqjeVLI3/AKDkR3UPlMeSAE4IA+SLByfA2zgbXz9krxxX/XxGzmpvrU7f/JrvKXkYFYHBBVMNgq3okQhuYLLCsHXmJ6uCEOswF6vBXa0zEhhJPQD3dHKL6a4xnr2m9gQzxKDyqTD/Ku9s1+2q6hAflM+qN9QXgZ//klDZ96/ccpta3F4kV2GLD8NLplYIGtP7gccPWwiDu/dnc53OoPlUsBSr5i7ZjKEsoAfWv1skmlgwR94279FjgxxdTTlMqbEIPcQnlfwZ8kits0uqdXa8wVWtZkL5Cxb6nF5jhsUAU4yn08TCd4zgZHkaYX8/4PXGImIjrSJcQaff/DU5rou6VtKUzh94G1nt4ajJlt4KbkPpapzjbAA4Pxb1xijHfIwE8M6M30SJ5lq99BJ1FuEz7QzVJuVONy0N0G202sVM0NZbkEG33sPBAQmYSj2sUAyYFtWP14vAYPUPMFKCujC/cuwts6k75yWT0sS7M9HHSdPTgjekjA8UsXGbAs2l1sFDG/Ykv203ptZW+4yJuoe6+eIqCoGHcXFzZypWNt/RWdkF5055m1mHG6gt945EjBuRhnMTXrT5vKQDwBnqhkqJvsJvUm4oQ1xpdob0ikEhXZTRIs4/PeBUeFet0rYmt3yRbw6YDXv90SPA771CX434CpLcUrsQ6y+eBA5QwMxOfHlN/hpM64j73vzS4rEHpG/GcREwopKtmLu3RdtB</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
