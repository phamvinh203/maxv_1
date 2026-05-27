<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLCD1">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="bu_tru" type="Boolean" categoryIndex="1">
      <header v="Bù trừ số dư" e="Clear Balance Amount"></header>
      <items style="CheckBox">
      </items>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="001">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="002">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
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
      <item value="120, 20, 80, 100, 100, 130"/>
      <item value="1101: [ngay1].Description, [ngay1], [ngay2]"/>
	
	  <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
	  <item value="-1100: [bu_tru], [bu_tru].Label"/>

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
				<![CDATA[<encrypted>IAWxH/LFPkZLbC33jgWD5lnXOFMo+Bz3AHsei51KB0q2fRsxW9bRCMiVXuwszIprdEKUNd92g7x6mYxUghs1wMSuExb85pJ8WA0uZkekocmiA18ij0d88qNw0je4nBLFJWkOTcVLm4S5Gzikbq4GR1LagP71ls5avkMx+7Xlxkbxlu4xniNtjbmMLFdDLptn4Q5ZjgzdQuc44I9kJfcLUKLWtQ3zjVtBq4qcfaudXcRJf0Fvd/k99lsG4WQy5KFN</encrypted>]]>&Form;<![CDATA[<encrypted>5Dk18Vsx8RJ/AEkKNXj6io7kVsvD6QJBCVe1XSqMgbLEJINuf6wgzzEHJKYhFcBZLEp33L4XzRFaZfVj07eydGqz/HJ4KPW1iEFIybxHTAUZ0CjuxODIh7P60b9HKAek6KTrV4ADhm0qHZDSLLvHXoUzXsUhlHqyg5xOPgS2ENdsjsGX3Qsf84mnjwjY8Z2WbfGqe/igmMOwrGWjAS6rb40HK0qx2fyW3UvRSkaNnfvRX7XDAnQ1lPdpf1AVa2cL</encrypted>]]>
			</text>
		</command>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>NkndS2qXjf1tDhkE6PjnhWT51ogbkuOm71yddLCOxvEhWHJ+yRUrmlRa7Y/w5sztnZIjRa+1qjeLgPiuJapKncydk/sZqOapL32Wrl8Ej1oQ7Ke8qbcElNPazEDi0y3SVFx2+vDYP0tI+d8KjAGF8NZfkf7cCoUTekkXtyWYyOzOOzmCdVBtWiZp67KEYuXpXQ+0648HK8u8+SvvdqH9aw8Bc50exdpyEHJ06q/9X8k9TbmNP8IB3j/v6W9iZMAJbPdkiY/uPn+RZiXJ24MiSekjd5UT6vsNudO2LIfnFr2wfdATmRDejq0Paq/Xg6BrnPWy/A+pZVWh3TqXNNkpImxXQ8nTNBcESd0gU5kD7sa8iKjDgbYmYfPv5O165QUFGjp7rJ5PYNmfuojwJNG/v0/k92b4t7JkjyGiruX+AwoApG/mapyUtmjyTdPoUYcS+Jd01tkW1cYl+DhCdjHIfohSuqIgu2mao0skNNePzW0=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>BeKMrbk4ICMBbdohEFmgrZ1kOm0NBZPZmJXIYaGIFQu08d5PP9xFBzAL5XOpJBcSgsufe8v0mHxzRLnM0xlZdb9iOacIl3KSieyQrYnbVofWpPhHIghXlgwTddXmfo0Y/aczcf6ayfHyRCuf50uqtyUA1qeqso1pdq02xnp6EUD6TGtAhjtZC2v78VkGSP4vNjPyrWAnJE7Tu8LRONPBiVudPDAmg7SOOA2C7DkAQJK5nFKxlStUos8tJ6NyTfLqckk4Ly/4L6RLgzCCy/A7K5qJ6hCNsQQPrtyxaVAS3OwKem6NHnoX73drFpJuX8w5hRCaQNT9zQfSuIGxZ2DoaRWPTdtKba48eagAtAtpNd4zCOmggZYaz+9UXeByXMuU9H4X4ZNIZKnBe1mMC3Kw+tl/X+tVEPdYGXew0CMaIJdqLFBY4TjfaFtrTnYvob8DBXhmQ+l5qN1Zln9dCIxcbL86BpCqP9HJd+VE8KZ69ACnDv1gBQvz+eYPSlsQWB/9fzKbnRDVmEwShNM07f4eEqUpb3uNDZtyBNX30RDmOKKu/c25tsgpY/QPeOKaRaQDwa+pQuGrkdKL45DfeHmfcngTz5BiU32stl/6h2k12C03PcdCbNe70HpXTjVRIIi2QcSFTw4SpdZV3jZqHg/TwubS/PS5bJWm7nLmsUCf6UjS7fRmOE7Bkga9xEH6i3ltw4TnxXfqFYrGjTKZ8FSfuVdcvyyGsa/LxgZoGsWmqlm3TukO7uE4l2u4hjFGrytk43yuAnuwFP2caGQ9HlPSknCe1TrOW74rJgzaRFW4KCKD62JJtTVRN85RdAfISkJq6Fycos48MrpripvcuBNGduIHiNqHsgq8XtJ02rrk6kCLhV1HcP2I47BYrrw5doyqHowkYCl8Ak6umb3HUeACTmqFZgzQFPqq23zv1ewYRLqgP3IN3Uz3EIOKTY9BmMWg4CC7OWUdx6XlC13X4cfChXGqbWNoUqTyF+Pd9sRdVeg7wlFUyRCIyHCV7sDrcCPBAaUwHjRROGDc/Ltf1R+qm65ombo8kIJ1FVjQwZtVWsYoDJHD8gaZ5TAbEHoDObMLfyxX3Jbp819hA8H7TkY89Phbi86rGbNcKMqV+oTLlrjFjryTC6tMcU67bpCS3yliRuvdOWwQN5fWZGEjPrbcnMAUvsQvOItdOXkojrDM8BMR8ScXbJPNsgkMREwvUouL4v8aLDULFcBZ1mCUZqjkow==</encrypted>]]>
    </text>
  </script>
  
  &OutlineCss;

</dir>
