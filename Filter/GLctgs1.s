<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLCTGS1">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ngay_mc" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" defaultValue="new Date()">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"/>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
    </field>

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110---: [ngay_mc].Label, [ngay_mc]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [maxLength]"/>
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
        <![CDATA[<encrypted>FouOyj3PQ9FWin9a9CK189F2qjc5x2368cp60A8N3/nYa7t35ASFDtg953N8QHUIEO5PaUb+2mGAmogz9n97Jq2FcV5fqqD4c/Huq/nVEk8XNR1j1tfi9FqjWvPrmR5T1eXOpUyy1Kr11hybcuO0k4EcS+OMaL0v2GKTc6NJhuEWCHnfMcleHId9ZKblI5Bpc/Bo6y9j92H7hRSWC9xKc0w8BhVhYSIEP1il8dMljxRkKxpn6OGymlAJmVEub2K/</encrypted>]]>&Form;<![CDATA[<encrypted>l2sGHwmuwjpITwFgrQSVTthEpeSclTwnVnX1BQ9caARhRqykGrjd5nslE1XWaQ8ACbj6lIQbuvmsqDOYsrJEmQKJwD4OoM0ayACRQD2Y39jFyIRHs0Xw/Qx0a5BW1EQYzRo884VH9aamu+wjzcNug89WVhyxpoianVS2TUFrYUZQb4TItQ5iSDGloIE5sOBWNA8fitoHhRCPKC4wq8wuayyAnRPZa/wnk09+N9GEmREv8zda12XZHgDIq0atMChMkYUa/Q4BK5LSOaXYv5mwCGwd9uow3i1ssTdq4N4N0Ls5HFYPa/pg5x5zvWhGrMXhpt7zfzowpm2fxtnWM8RlBQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>

      &OutlineEntry;
      &ScriptQueryFilterString;

      <![CDATA[<encrypted>6h8Q6zEeBPr1lRH/9ZDlWKIswmV9IBrLkB68Q3MWOJ8hp21npLOs8FMPF1GrUyph7NM+Pl9a8SDwCkbx2SDEvtNHrEcdX5DpPWGFaTnzWJq155uPmHwqONClwcTvbBrJbFAwO2AmowPOz6yOOVsv9Gp6FplxrOUsRaj3dRc9oB9gBGK9DXluIMDPFBuo8/780ugLZQrc3bxz+W9PcjB7fCpeH5z06pqafMvLN44Li3+ibpfGlGz4LuVYtxqlR+pyIVjHH37IrZHeqqZUkoJifWVTiQ7eDRD2McWCBc2YRg05v/TASiWiqJtSMJGqgsVGbfblo7CeybQpjZooFlUmJnkPp7CcDekdnlTda3wE3afDi0H4R/N1wqVK1RNbK16rht5rlqGdOoKsfuiI1s5ycDWuySuetK0B1VeBI4GmJfWzZ7gcuPpdeKxEbzssxv7lu61iGhepWMeP4Zmi2xoF+J2UBxUN7vsuLeGN3FwoXCu2/AOfmb7HCrAm7LmHG4Jy9aO6OtHGpJGMeCN5gVICgtQ7Rjjuugm1gQv7OAp5BMLvR8Efy2Xv7J9bm91xaKE0IN1jnrk+eSGveTKaUhKBLRqSKnMnryDI9zRL6QGN5G2+2u0W0yDlDWLlYPxp4Q/BlRo21nTdVnDvqIIFDHeCweWqSfLReCQQrMEFhTc1JOAhWWNYrFWp9v90ktGi/Ayqto3odUpYdL5fIyQwy5Q7wnjsDcCLeNA35EFhL3pgpd6B7tFTBku2Nb/ObJLUSoDnplskc/LvRT4NDY903Fb1FwGbJS98hY03Q4FzevuOu9IiKo3BCbUL+vE2qkLK8hWr</encrypted>]]>
    </text>
  </script>

  &OutlineCss;

</dir>
