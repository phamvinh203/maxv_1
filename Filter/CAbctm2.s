<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CABCTM2">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="tk" allowNulls="false" clientDefault="111">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l"  key="status = '1'" check= "1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
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
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
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

    <command event="Processing" >
      <text>
        <![CDATA[<encrypted>4LepG6vKkXhGcUwA/crI68PreV+PEE47OG/qH48mFJCRuehPgbSLqga2+H1hEmONBDMabXkbRPZLas+2bJw6N27FcPrrirDMoetVIeQmsAGpOglTIisxzTq1X1wNGTQMA4ya6fEYxkN/8SWEbhJ8+SJmHy1lIA9RZTIp6XLXem077DuSk/k8UoGil9lRKAjwe2yWP8JbTvw9WOwkpDN4LvD4PVrAmlVofS6Py6xER0sQt5wRF9KkwZbb4E9Bwk18SohV/TA2effr/r0LDxYvceph07+T87Y2VzT2eeGS+Bs=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>KRhuGVxlao8jdLszGVMujEZiUbfuBfIMwaV7tHzOFqdxpbHjMEo/ileH/Eau1Z5sZGypj1Xye/mtB4O3d1o8y9X+tBZe485mN4ExOZs0A5LJBmgwFm56qw07Qb2X34mXinQqNnkCXCfJ7FX82t4BTfCUsmctnmB+Jn25kJZfpvRW11QLYaWpEHJFokmUa5ZrJuIO1qPMd9W4xQLy7uH9s7yzKzKwbl4bnOSVbH/04BoWV3kGsJA9yFZhI5h3orTCXcMLGkLAaSTucURi1t3xEyA6cE3tuWUr2GBA9+hMNCHUyLUm865f/oQ1bHhmDlpx4mMWjpck5n2YrYRJ39+THRj1meeKKWK5CeQYsV4aC0LAxShZ+Spn/iCV4gOVS6WsXxp5fhUzpDxoOCbLvN+A/NfyEo04LJiFjnDPEINOe4F9UcKAMnNGjBJdEm2Ma/RnOOxAY+NjH/NQddec0kHbw5dJYRfpI4ROJM0gRHpXkle1kOncvq9FsuDimHZWuyoiN5XAPcMGHVF6fxATvmjhlP39yIgibz9jf6boTn4t0SrQYKBGzcISgea/zoZyl9PaY6qnrNS8W76MfR7sxDpQrwxcX37g8sXRop/5DaLa0I/dRLs788XJ4MPkAlYlpBVfnsFEgz0jUTW9U5azlQJBa5lZMcAJlVj1JdRvEvLJ/VuY+OS6uawHA81zdbKiL5OSXyJ5HSklFBzngRmjWL4QJnf+VEXn0zJIXXNseShTXRzcTRVO8qy0+ww+G3wzsw66L4P2ds9pPERWXZ8KxYq4c5AEH7d260M7FVLuiovR6Xg=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetAccountName">
      <text>
        <![CDATA[<encrypted>wOLuvMXwrG5sozH+r+kQ+7NQUNFRWhrR5MpaAq6ikCJNBhv1fWXcZmhlbNWFGY3kR3c49Qx29WkB06gfvIlMlzViCREPYqr9mCRtmnrzIkRmhpJCIvu2Qc/ouDmMHfT+mWnoFLuf3Sm882l7vVsPd82OISFjnpiLfMG1azeTy/0=</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
