<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLNKC4N">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>

    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="10" categoryIndex="1">
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

    <field name="tk_so_cai" type="Boolean" clientDefault="1" categoryIndex="2">
      <header v="Xem tk số cái" e="View GL Account"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<encrypted>lmFWPI/nVNslkmRSbZ7p+OP2hUnwsjQ6UDvFZJmwB/aH6UZ09Qdbz0oIwjg4Dr8RtQwgnnzqN0zM7O1Os3+Mag==</encrypted>]]></clientScript>
    </field>
    <field name="tk_so_cai_1" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="2">
      <header v="" e=""></header>
      <footer v="0 - Xem tất, 1 - Chỉ xem tk sổ cái" e="0 - All, 1 - GL Account"/>
      <items style="Mask"></items>
    </field>
    <field name="tk" type="Boolean" categoryIndex="2">
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

    <field name="keys" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height ="132">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>

      <item value="11001101: [tk_so_cai], [tk_so_cai].Label, [tk_so_cai_1],[tk_so_cai_1].Description, [keys]"/>
      <item value="110010100: [tk], [tk].Label, [tk_1], [ten_tk%l]"/>
      <item value="110010: [tk_bac], [tk_bac].Label, [tk_bac_1]"/>
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
        <![CDATA[<encrypted>cH2qDLLAfDciFWFmPrwKQxfqHasxj7+9TjkxUVgUmj34ndclgQOvf3qAcpe0mjG2wnjwjh7v2RN0aJKj4oOrl0B1v+4+hJGUkNz7CYAP/kX3BHCS1OJwOuZDlDMu853LujI57vD0m9ENc4NKn9YxNILPd6kIpCJb3swJvHMLEXc8TuOnw/ikEnmIO4WvAuRFyIjr/93codItx/39TwfOaM7YvsOp4n4c+QKfE1BQaFM=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>ZJgldoK6WoAa1pIaP4K3EAPeRB3SIK6S/lkWuy+kewhbZ8HhndNR/BDCZP7IrFcRLdcEkCkUDkDSWIQ1k0WdruaJfHkuVDte6v70Z6/+5m/PjQUiCuxdRF3QPrCukZ4iFyNLladobR8JFgVZdtr5yHkTfYLFDoN7w036dJ+PEql1JW72eS8xsCdfx45Gj3/FvNmIU9abI7OF9iqpgT5m4E0ZH3ceIFM/6GJ+mYXZRiRnz7xbDlCJ1gwu4m/6BTgmG4/HpY1csi0B5i+S6gNCqu5V4M0nNXtNZNEV6xlB0TdqYHWB5JWFy4CyhjZm3rWPlzswWrgCkcIAaud9njxeMEyKbJxD3mpMoLiKNyCp3M5kL6+AsnVFHuFSPnqQGdToy+B4WKFDOFqFJ9FgXhVYRBhvCC4T7i3x1OAcwXQpV0TuFPDcJ0twnib4BTQFncy7ALE5r5xsnlnHk/yTWejmAo+siajLcYpA4xXfsstKRVzqJBiik4Xm/xDFfhWUxHIa8VXk6tvM1ZhOirx9r6V44h0SIikocMs3r363IyfRUhPkVnTsJyEuSVrco1NVwLVo3UulfBX61FIe2fRyWcxXqqyJ/h3hJz3BwBdnZHxkkMiYBs/XcO5T/OwmNYKpgw/xVWLaYNCBT4iNC/daHJ5N+/yJqxWVW6Zz0WWP/4Sl7DZIwR0XerpCf4Zi9oKKHLTvm07MwYLAPf4+3Xa0GdaEvmRd193oqRgXp4yCQvRs0vHr4cAovpxdZEoVkUiXPxpF9JjHEKVB4uMZ504izipEgJplmAG/ISe/O0Sc0XgHVNKTdPUQwDFZ2Qx29RWi9uGvrtrKShhfJSY/aa8a55w8wIWugGaSxn1WFFG/jFw+GtCoMrH8vfxfyj6zGA8oPPfnLJFNYZM12y4sg2ay/tLFUjeuOeWefv98mTGHCnSwUFDBkK80Nv82WXP1wwkWkrjhxma6+niKwZyYwYhbxwESUQT98MwzIp2eh3PLQWwiHR7xnMURqr330w49rbczKiz67jW/w701ak/oYCSYSQY0IoA8erPnTvLTBsbh1nWxSgnSrNmoDOeiu5hOVQd9XxvC7V87AVtgDirePjKcUHH746tgTYTwDADWQ7cxFCnsXnE4Yi957EJY3FYbY4XKQZrYBocqTBYDnCJjIaPWWQRaKOzyU6Ok5jJ96dDGRUde4h5dLffvVFhnR+n+SmsUeUA+3xHE0BYcaLlF4ROV9nb3y6A/boPePglE04BLcnSQDCZUqa6a5vhl9/lebAPpKTdkV519MsE5UZc2hRuLruOK9dwfS4gVHkRwdiWU+y/ZXxp8W7u8evpb04N+za6+6vEXJgQTX7Y++/4w61Y38zJY4sMwr+/n07KDfduOLFtcL3hvl8TAiDXIcn5lKqLRQEH8o46P+UQqmJBxfQ6azAz2XnUQumbTp6E4E6uz6XGZMZPRaLICqtuxTPDbu1vGonR6</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
