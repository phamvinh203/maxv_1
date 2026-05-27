<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "SOBCCN6">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tk" aliasName="defaultARAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1" />
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date"/>
    </field>
    <field name="loai_ky" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Dư đầu kỳ/cuối kỳ" e="Opening/Closing"/>
      <footer v="1 - Đầu kỳ, 2 - Cuối kỳ" e="1 - Opening, 2 - Closing"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer ID"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(kh_yn = 1 or nv_yn = 1) and status = '1'" check="(kh_yn = 1 or nv_yn = 1)"/>
    </field>
    <field name="ten_kh%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1" categoryIndex="1">
      <header v="Nhóm khách 1" e="Customer Group 1"></header>
      <footer v="Nhóm khách" e="Customer Group"></footer>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh1%l" readOnly="true" categoryIndex="1" width="0">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh2" categoryIndex="1">
      <header v="Nhóm khách 2" e="Customer Group 2"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh2%l" readOnly="true" categoryIndex="1" width="0">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh3" categoryIndex="1">
      <header v="Nhóm khách 3" e="Customer Group 3"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh3%l" readOnly="true" categoryIndex="1" width="0">
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

    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <header v="Thứ tự sắp xếp nhóm" e="Group Order Type"/>
      <items style="Mask"/>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="sx_theo" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="2">
      <header v="Sắp xếp theo" e="Order by"/>
      <footer v="0 - Mã khách, 1 - Tên khách" e="0 - Customer ID,  1 - Customer Name"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="160">
      <item value="120, 30, 80, 110, 100, 100, 30"/>
      <item value="1101000: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110----: [ngay].Label, [ngay]"/>
      <item value="1110000: [loai_ky].Label, [loai_ky], [loai_ky].Description"/>

      <item value="1101000: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="1101000: [nh_kh1].Label, [nh_kh1], [ten_nh1%l]"/>
      <item value="1101000: [nh_kh2].Label, [nh_kh2], [ten_nh2%l]"/>
      <item value="1101000: [nh_kh3].Label, [nh_kh3], [ten_nh3%l]"/>

      <item value="11000--: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000--: [mau_bc].Label, [mau_bc]"/>

      <item value="1111-: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>
      <item value="111000000: [sx_theo].Label, [sx_theo], [sx_theo].Description"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 20, 20, 20, 40, 25, 100, 35, 170">
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
        <![CDATA[<encrypted>2bgbnbYIwjbx4KFIcZWVLNsIDAO+IQV0DkAZFHMoQlCWWxrndafts+Zm4donMlpx/JulPdwnYdOHMknNvssKdyU3Le2KNn44li8wJSLAml+sGdC7cTbIBlKUbyjSnENazOF+Qff++VsQxfgEggzPt3vCC6zcw3gtV4QJXwLuVdku2AAfgHhL/HWDsux+SzKV3wd27YCEl4y1pfKXuyui288SUBl+jv7k2JHws7kOrhWu4+h1bhbtSSqbKVZ3rqDWlV2TQHO3b6pKhylR0PL+HRMKs/d8nzvUdWAtPms1O2ufpR1O7Dis8nwZ2ZAMvrbyVuIebGh4EH1ke1SCENkkD01RnLTZrEjwCbZuyBhsk1EEr+QxVdku736VqaTVSNukAor6AAWFxlNYQIGRhzaYO1lrMwSzBJYg750XYg3HtX+Hsf1u24KKM1eT2nTC74vCceeG2oroORQ66eQhY+XkXoCvivwoCpsJU2MlqMBPVXc=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>QNwOnre2eaLRiI3VtqJiQlO91Apzf4z+Py3ip13RHyDT42gdAI8GMWX/W1HiihaCKoSkby4ciDgr+PD4JQ651/LvDyvzgeI27X2bkOGe5fDa+fXbDx3EFAK8TfVqIBPLc0OfzsySjJP9Wmdu+2bZ+E4QdTFrq5Of6kWJ0oAtkrODGQhOygbvGM1zPc9exwlS3sMdUbuBhknLZl/KqEp3hTAjrWeJaz12jW/wszniGedb8bo99e7k+cyrgC0S+ITUae992Y9YqvBpDQ7+4XxA1LyDAsgyC3Dcb1/L5kgubVQGOcaptm2UXV311yqan/vcD/AXwPXph3LzZqRLHXwBI1lNXRdQ+PBRkei8PWzavyy003G57DQyX18fD5lCCst/</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>rHRSwslZMic5Lbl3gFjEhdCAhQhVpbglNIQoGyIcqogsXmoyRNP3UlNZkTSl3b6oK6zxAlu6cuiOL+58wSzVHcTyKCvIRQwhLODhHdqll70erFq0cOJQXeYPQWzNbJ5m7arAoRjRGIrD0V8I8nofIR5LzRYhR5B2Ic3RkGg7dqgocXXp9S2AUNoeGRwgdvvPE9xgC5RmiSfocG1Yiandm/1En1I/96Acw095EtlcmZGBU3HRiY1aolpQ0sTkBh3HDViwcy2FINy6hDR/FGT3+jcvHob/ba1WyAM9hnNhPYXNIvavKaa1rLr3EKKWKW/n0GtG+3KN0DA0CgFyemFJ96zLOauMPrvCdtyyJsZyi9nWE1E+fI9t+OyMI0TJJ2Hikk6HkMYmyUe50a11s54O9XmDFEUc6hJs/MKFY8lN3yD+15tDEd3vsmKQPZhjntNO99VioX+ydtW3Kynv2f9niKbx24TxmbFPRmb12mMsWrNzltlc1X+4s2Q/yZeu0I3W0CXnU7qbu8yzD77SLMNxdAMH8oBO8U1loGwKWBfRIOKu/FNRCndVXb0a2tFwy8rXzuTsVL7Wn//CULmq8vMGXtvsO/RXI9npT6MqnV+Skz8/vbn6hqh+dV7WB0iqDhvsx2S2wg73igwmlyyhIji2KhzERIlDMroRV24o01V1JM5eN8siCdECWvHh7IHn6fW97CBcBZrkQbceKi6b1TJDJhwZ166I23IfMI20jIrOg2idazFE5RrHCvLjvIZbq/u7RNfZfzuN6BMVYWDSo7r1EJBrYDucXBYkH+3pZvvh2SU0bKDFb3NKlWxSFiDpEEOjGZXIgrjRFTk/bliMNGqh6iM8RbEIf/9wBOMLhD1yxl7YADqi8KkhssnFh9B87C7ln2b8F1/osNREJQY0Gohr7NnYWGNq4vrA8tn+AULxk2U=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>Mb+6g5JnY0S5WL7DBIQ4NmIND/kL6VqFrCYaIIWHpLCYXDbJa2X8CDlnDHN1oVBZYbHc+3DxEDldzXuyKzWY9DZJBflZD0L3Rg8yPNqllxdbm2TlKA9VpcLMpvHIptQctXMen/o06grDaTETHSsL/ZHKPEX2qbD4zS/gsR6WAoM=</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
