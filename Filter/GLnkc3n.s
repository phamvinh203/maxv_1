<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLNKC3N">
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
    <view id="Dir" height ="135">
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
        <![CDATA[<encrypted>Qcdi56y3HfRDXEa+/iEhnVo5iDGXD4o8l98RnJKo1KIhNw/B3YODCgemswsDtZoqqOALW1LBwhdACPPGUNGGqFf2bElmhOxd58ZV1vwu7+puFsJCzMajr7wk3uLlrwjz4MFR0ajQ7iMQ2Sv2zsKdc7O+CM/+JhMb9gPJUVNh9uWXwDNT791Q4xlwQTcYLKXLB+44nPMySUv3ytAdq917wQJQGYldY2JviMblpmafVH0=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>ZJgldoK6WoAa1pIaP4K3EJbMeo5SRfANdXdKNzrgQeE77LHAmbzvx28e6dUmY5+HW8QJaTMGFGWswCnm9geB4a7lhq1IKlB/bz7YwsyS9eVeaiqFLPUYrl+Y5hbqj4UKjA0Zryz2BJwoQM8Jr3m5HX7fDelqoQ/mZASZXCKs36xVDUguVtvyXpXPwQBtn8CHLuD1fLXmxwNSiAniRsucn+H5OHqJTdBzIj3KyKMW96PTUE5WEyBP08O3XsgDnBRz6E/48itSiILSq/jVNkovY3TJ+62AnkkkXkBSc4sGhajImWG+M4KXH12ZoRVmP4xpsldZsPljsVPNOLNIMe0Sje25bM4aqDA8paOys5aMQfjXrqwpeOgqf678OHqgH1w3kAcZ/+qucv6cYEtJZ2pUrHyHuukCjwoHdjZ6vHLMbvAZiknimhWHxvfKwmf5KfSzpgvx8k4KmLzVpWdD1kQLbFw7O0le9x1e+SUPhVY7OEofr89+nG+mXOuUd3CnApbA/ScRK2KfFHsdSGmEQkDqNCwUeuy7jtx0EIYriiP0iu/IQkMNlVVgf8P5AdQUV9uffgW+aULaQEmyUZgT9CMp5R6oJDztuH+7PDljL63FOoDL6A4HNNNpzzqWIPL2E7OzbtR8wJLAl1HjZRK9ws80SFLlhpzvok88iKCNMMBCi2SCFPiqlwDy5OpdTYwbxNW6BMs6Voz5NgeSf4LW2TYdUgLAWtiTxRTlHwcWFkLziwYT3bu+GQnLnLb7MCuZBybmt7XCiesqreMS8BbZ9/9Oqud/0uzPp5s04fUUUdCFMTjEve2mmS8PLwI2yNlImkmBfb2YO43U5jRMMDgZTtYdcydtdszJy4/SLiVH41zFOBUuaP5HaoigR6NL/oGHkqjGYzuq9mFQ6e5EVEfsASlJszdFAm8f/3DG0unlRs6BX2iUl7lOrmg53pIWYoxxQ8Xhzi89NoIgRBCau8rNr3xFE4Nqm8fpcEOKzJW/gLk4pFW2m3sGOIdozQoYdFVPaGgF+JA8RwJZD+69cbj2w6zgbnIuIkVhkqVGRHOqfmoiwBFs3LDz+2+5MB50v61M9I8RhFeYWIpWp0XyizlMGIeB+j3J90aumnMN/mlc8I+Qa43SHLr9cEQ9SRLQb1U5XM9nk81rb8E+wpdjpB8EU2BR1l36lrn0UcsxLdhWjDv1Z+aXoT9TV445mXwQzJzZ8VI5AzdYlolZDYXwxBXMx/OSVIbhAxRPk48e40tAurPAYr8u+mcCzxiF1BLEsDjuuV/OxxEMGnaDUGNRtfwxlUTDtEPD7NfxFxcdvRb+kpxJQ9bvq/ZAVzC07Qbrna4JfDD9PtlotuxmsoGy3CCQ6TzvHrbhaGv7nf2Zv9Q/XzJZXfkgWTI1waaVtrbNaLg5QWS/SBlZ28HCvKS8VN/BULyfqC0V58ZaokilIoE9PszPKLcnEuQCTT8oFQ9OvMIR7nACJAnWo+0W68Bem0kkH1JG2Q==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
