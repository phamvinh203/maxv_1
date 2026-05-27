<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CABCKU3">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="tk" categoryIndex="1" aliasName="defaultARAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="loai_ku" dataFormatString="1, 2" clientDefault="1" align="right" allowNulls="false">
      <header v="Loại khế ước" e="Contract Type"></header>
      <footer v="1 - Đi vay, 2 - Cho vay" e=" 1 - Borrow, 2 - Lend"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa42YL7jlXo0ShoGODsFToUQ3own4aR87ci4INT1PLCyFsDZoc+IU1A7tT/V4Zjg8TLA==</encrypted>]]></clientScript>
    </field>
    <field name="ma_ku" onDemand="true">
      <header v="Khế ước" e="Loan Contract Code"></header>
      <items style="AutoComplete" controller="LoanContract" reference="ten_ku%l" key="loai_ku = '{$%c[loai_ku]}' and status = '1'" check="loai_ku = '{$%c[loai_ku]}'"/>
    </field>
    <field name="ten_ku%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()" categoryIndex="1">
      <header v="Ngày từ" e="Date from"/>
      <footer v="Ngày từ/đến" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()" categoryIndex="1">
      <header v="đến ngày" e="Date to"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
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
  </fields>

  <views>
    <view id="Dir" height="209">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="111000: [loai_ku].Label, [loai_ku], [loai_ku].Description"/>
      <item value="110100: [ma_ku].Label, [ma_ku], [ten_ku%l]"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
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
        <![CDATA[<encrypted>yLNDi5bqtx+bAmv5KqJ5mhcayeNxyXmzCYN35Cmd9kleizKy7r8gHjOa35g2KjfZbHcvCKr4XRQvwUi4YgHL4mugavA14KwehPZHcem37JTEeQgj7WKqzM/2s+ihRy32YuIqbkY+1//Xveagj4SMZATFFOiygfdYWCXzcQH9tTK3DhRuHowJ3xxSMcO3gz0yUSiuyetT6GuFjhGB5AT9JdAbp6LE3niW9yGAeecO1beDgQKap6P1D5LT6djKkELZXDu1G93rmwrJ/CSHIetuUw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>jMqFMEjbhQNw3rOS7/W3ABbZWXyuIKaMDh8LAYbDNTEIqg6P12dEavvZD2CEv2cEbeLOv2eLQvzjhnIqqdQENPgfZrZHvUwqVOgV84L11bu9irxGSvztMIMll5z9gG7xA/QOrnqZRGO76ZTJyt6XxBd1tRHjg6CvecdDCJz+CfkzBxsNQ4xgXut6oW+JU1oYxtoSWvu/wtBPS0J21QbROMQe7CUqlhT+I4ebCGr+8qafnTx7jXZwLteLs+Dwgiu+1p7WlBgtuzrVqT4hInRnEMMIEIZEjAt8+2INGIlf0AoBS+D+Ds4NkU8svR3DyCEwWaeiWj+44Ymi32MNer2QMrEcAkdNm5g4IYiZmDg0GiukhmTe1O+GUaUlgj73gZVz/xn86rAyltBswuIVC9AtrBCoQclySldS4Iw+dcjmDYYxkZpaCNI50KREBPlA/NQ2xYW69x/Z1WembwXcleIi9BNOzPkoNd6QC8mct5eR+H5bAsg0EpTkYfbEcvq6DR7XefmJwiMFNQsSPKB36N6UeecALJ8VDmGPKeGZzTGENrLuJFj2KQK97Sd2wH1joiumEfYHeBtT6jkIAgHB9vZCxGhB+XvF2bKeVlPkLeHWya5VPNa7qaEfwP0IVZecUZpEARb8fSBd6pMTsIThQLHlwTBqbWUqWgvENeg9Zj3KAeoVqs7psRtWCjWEXDKbI9FITPP4rx0rF/nbixeXrwWxvpjIKyUZVGpKnBHo+j/XwyHjyRGmUHX2SI638fXvRTu/TcvfnHm6O4wBftV39tF875+S9oRawGtymmxhPGuGhU2xzc96FQ7n77I900KYyiKAyI9g32Gt6DuRo6/mw0AMW8gtr7XyzN6sg6hNZBXlJHqsp0RohFfvAMsn0s6zTjlb23WaMnbCVTJ4agZoCddjCBPMcGZnUcLBfHFsvXD+0kfseGv3OBrj0Rrn/ry4fn7u5cS7LuVuMAXvj0XHAuhhPA==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>EXKLHSPWnMu0eGk+gavrYKn6uUbDEZr7/rC6dzmbw1pt6wiky9oF9ML5B6c+TU70baWisc3gaD5xZxhx3xhz+wWeBoxUSVnXKW7yeDZ4GnlFwoHVyNVka/29KZGJZh1aCkeLroau8d9aZ/T85bC/r5sac/+TMiuEqQylqbwxAx8=</encrypted>]]>
      </text>
    </action>
  </response>
  &OutlineCss;

</dir>
