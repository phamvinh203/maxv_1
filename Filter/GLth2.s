<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLTH2">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="loai_ky" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Đầu kỳ/cuối kỳ" e="Opening/Closing"/>
      <footer v="1 - Đầu kỳ, 2 - Cuối kỳ" e="1 - Opening, 2 - Closing"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="tk_so_cai" type="Boolean" clientDefault="1" categoryIndex="2" hidden="true" readOnly="true">
      <header v="Xem tk số cái" e="View GL Account"></header>
      <items style="CheckBox"></items>
    </field>
    <field name="tk_so_cai_1" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="2" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="0 - Xem tất, 1 - Chỉ xem tk sổ cái" e="0 - All, 1 - GL Account"/>
      <items style="Mask"></items>
    </field>
    <field name="tk" type="Boolean" clientDefault="1" categoryIndex="2">
      <header v="Xem tài khoản" e="Account"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<encrypted>lmFWPI/nVNslkmRSbZ7p+OP2hUnwsjQ6UDvFZJmwB/aH6UZ09Qdbz0oIwjg4Dr8RtQwgnnzqN0zM7O1Os3+Mag==</encrypted>]]></clientScript>
    </field>
    <field name="tk_1" categoryIndex="2">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tk_bac" type="Boolean" categoryIndex="2">
      <header v="Xem tk có bậc &lt;=" e="Level &lt;="></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<encrypted>lmFWPI/nVNslkmRSbZ7p+OP2hUnwsjQ6UDvFZJmwB/aH6UZ09Qdbz0oIwjg4Dr8RtQwgnnzqN0zM7O1Os3+Mag==</encrypted>]]></clientScript>
    </field>
    <field name="tk_bac_1" dataFormatString="###" maxLength="3" clientDefault="99" categoryIndex="2">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="xem_tat" type="Boolean" categoryIndex="2">
      <header v="Xem tất" e="All"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<encrypted>lmFWPI/nVNslkmRSbZ7p+OP2hUnwsjQ6UDvFZJmwB/aH6UZ09Qdbz0oIwjg4Dr8RtQwgnnzqN0zM7O1Os3+Mag==</encrypted>]]></clientScript>
    </field>
    <field name="tk_chi_tiet" type="Boolean" categoryIndex="2">
      <header v="Chỉ xem tài khoản chi tiết" e="Only Detail Account"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<encrypted>lmFWPI/nVNslkmRSbZ7p+OP2hUnwsjQ6UDvFZJmwB/aH6UZ09Qdbz0oIwjg4Dr8RtQwgnnzqN0zM7O1Os3+Mag==</encrypted>]]></clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110---: [ngay].Label, [ngay]"/>
      <item value="111000: [loai_ky].Label, [loai_ky], [loai_ky].Description"/>

      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>

      <item value="11001010-: [tk], [tk].Label, [tk_1], [ten_tk%l]"/>
      <item value="110010-11: [tk_bac], [tk_bac].Label, [tk_bac_1], [tk_so_cai], [tk_so_cai_1]"/>
      <item value="--111100-: [xem_tat], [xem_tat].Label, [tk_chi_tiet], [tk_chi_tiet].Label"/>

      <categories>
        <category index="1" columns="120, 20, 80, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="20, 30, 20, 50, 20, 80, 100, 100, 130">
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
        <![CDATA[<encrypted>Q85AmtzE+WBI8KHkKYl6MVKxwhgfI3PDQh+fYxGcpiWIhepJJ886O54d5maTRiBYuo4pmNXIDwABj2asjYNBs7GbUWvmc4pqw7p/Xf3zSARxakHVZh7g0DP8S9ubr491JVf9Ir8XJ0Y4Kg/jVlc92YybjNVz41WeutX1+8vLb2npLbbmZQywmFa/5Lb4TAVUFBYmu++R9bVzuAUd8eWifw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>9OZ7LmNu9F4XuL9Irx54zkag6R5Ucnu84pCLfB/j4LU4UEw4RJGc4wnL2sVeixgdXrWHA6+OVg+k/6rVcdJYv0m4HA34QfUjGy70EVCShEIzaJU/gYkm717HoMkk0MdlNtSfAK35DgIEPSI1I0v+F8A6bgrVo4TFHfNZeKeUOl7wYduZNy/NiFwuJnfGQS7QrkepLy2ba/YjBMH1uqV8xP+6NKNopbEQ2yKaO0SYtOb4k1cSqCmQlwDCaA+U/EhZDevf8Z801N3DA4ZeAvL7SSiCkYCjbAvQYIhfMIvXuiEst/HPP4ZVa1tO6+1/K6OU1VYcXgi3CIbQXknlMXU4H4mJ302qs2iKg8+ElmVlAPkBCAxZl/BVIyWzX1Qa6P233HByGR54l9VkDDV/ZGXxXIEowmA3ejNXa3pjWPzramKsUS007kK9mvoUyJltoGsXAUCvGI6hmIVIiYePvMhu8Q2VjwTZtg10mHeMYSJVMJgrKU3mZcLHCjirfdLDJYcAtdO7MhFZTyeq9I/7/hmmzzAVmPOs6hrpjFPQotnL8dfeqgidFfModpeEzWq9W51tg3wci2+qMHXb3kfk9IKnkazg5AC4unxB/QV0OcJMLExrGo1as2ICZDFeHfWixwPz9E3fdNstasT/gkdSnvjmHZVJGfeBXRU8Kz1zGHlznsgopXmDNQYja3TxTo9c11pzJwObrgiWruzWT8OVb+oMMxAqGQahhM6LJLhWKO//Tesz/diKj1/k8ECb8W3SbriwBt/zd8NDM6t5WWDmzJOf9/bN1JBBiOy+1nd0Y4pgoZ4iH/dpLQPRqPUksVUu8PfEmt68g12Qn0nGRNtMezDFqU2lXup02ICpGPVHM+vNq6RBc6h+ciBgj0t+aKHXED461DKjQGItFwCuTRGHPkDWUHdOpKUcp3beeL4aIP2DWyO4VdKAoUFN5ktFRXCjZkxhKk8Y3tAUwBwMyziS8vgc7tZBvTUzb2QMebWrB2oxnBy5Dtdtbt1l6NqbrWXMjyttmo02x2h+qknjUiwNTeEWuPn5yfOIFxDZcTPwaWGIr42NFPW4wZ1EVC2VGqjWhvkRpp4QUrvfW6fQvS2Mj+cQ+4i4fdR8JZ5TvA7uj3YrkhLtxUEbElm3LtKss4MVYt+B</encrypted>]]>
    </text>
  </script>

  &OutlineCss;

</dir>
