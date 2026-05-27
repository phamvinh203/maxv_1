<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLNKC3">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" normal="true" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    
    <field name="ma_kh" aliasName="Customer">
      <header v="Khách hàng" e="Account"></header>
      <items style="AutoComplete" normal="true" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standar Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="64">
      <item value="120, 110, 100, 100, 130"/>
      <item value="11100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="11100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="111: [date_from].Description, [date_from], [date_to]"/>
      <item value="1100: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>vF6NfPjts1sFwtLQSuFhOsur0+lEWblWrNpH7qmfDsStFr5snXNnc6Vg6ZNMnimuRjsv5mIdf9qaGnBTAutKylXSDAyOycaAvVhSmQXkzC+puuioJ/B7TSK3rNmIxBG60JH9Lgy81oniysta8fxIW8bcYtkH2kxiIltANSiMuMrLdtayEqQzwFpJ3tDiZb6jOyDzrn3yI0d4tVcnID+f4+1ShpjLIwrgkE6G+Ytp7D/wL1FFeiVfrInRSfO3J4a8+/Ai2KPTE9FhcAcsyzMVEgNEzfhtdTAT4zt2zORjoIM1IZh6EG92KT85jE4+uWan</encrypted>]]>&Form;<![CDATA[<encrypted>kFO1y391zt/Me+qJ/Zqs/HB77aUhbk+Ya0H6Bpyq4zRqIhPK0/zGrR84fEtrXro/e7hkgfOtpjkwW2v0qtIA6oi86xtrWJnKbyA4xZgSZjZXK31Pprc+eLLa5MLLLo61GTTzHdyYAs5EUQqwoncS2Ubv0aQ27WEuJBgj8ZYQmVa82nh49AtuK0NNrXoJde5J7jsXuQNCfPsUMFCREmRH1jfNfOc7n9/jplnqvTe3n2I1L7lPKM6Z5dWYwiQFS/foj228WBaFCuXLOR47m8Tg0uViCE9/0ZkxHGydnU/1ZwWxjEviY3pyV5weQ973RtqP</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>ZM0Yhb1gBE0SIPvcuakKawZt7zJQdsURdoU6gQ3kqm6sJ2lwvW5/sZFrjs2r5hm12dKTFE+7VoD1uVJaOA6P9cYNg1P7AR2uug7irH8ITGyGv/Aoi3wDf0PnQMsNEYWOGc0YzEv10EcBKgr+3WYfrrPaRRd3asXFDot7Q50TY3DfzlFDgfpgRJ1EoFq0WMGYOJRhgmVwVliV1yK82WE+Tjbh+giLqP4a+mDWJ/jyRQUCPpzLHOn5CQWwDJSZk6r5W6gYzEmDSYADCuMVmB3Odwy9lcz8y7zK3fYhKYvIFyU1ktoackFNPXBGJkZKUVwEocgf6ShC3814O4BKl1kkptn+wvnIVbhwv5EHXKg37sLl2ahuoxrRSckc0OcI0oGChsft2x8JytCV1JZaZJ6HOVL0BxnKeHML1zXP5pQ7e7NqxYs3tjMs9qT8j9d2hvuS81bQ6n+l8WTliGPXG398wrsMoLOfe8zbBrURQN35W6YRQi7pRPycakSGA6zOMWSAWFycIKTWX4YYUZ28W7z0TJjH0WME6XAemrsXxWzuBchHnrEEaMyeIKsqCrXHkdCma+1EGUYL/UxD3woA8z1xwNN0GwSJrW2otNhNpMOXGA1L7yJ33CZuWqEM9CcThSHogUrTZb/+qjLvTMl2T/dd7P85TFWOCPf18sQwhJABnUVJ0kKhAInqmv2Kow+0IXoOI6/TlT+1NxiByZ/skeJPc+vL4Efj2FPngmOmJN0W9tetXGuJaUU7pLAHd44iBiNW5/zW1Pt4D5rU66JMV/aRIbKI3xqaZdeRsPovfYdz5VGesWCtJbzc6GLJsWHldANKSEtihE/o4AeQaR/n9ffPcpbnYySoy29YaKZ5qpgjLY0=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">

      <text>
        <![CDATA[<encrypted>6z34DB+AhCv1K3puiGUPRI2wf7OpUBsUoVu+lHQf/O2qkHf1btP7AQs5GKrhkBuhxtXCE+1/icpFR6NptsL23XhlNCjWTa0VUH/9c7CRLo1qnpuSFNs/PjNqImVB7VWpkFipJKzcFDQOYLel7B1+zT1qHV5i65/rYsuefNVzseI=</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
