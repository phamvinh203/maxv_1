<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "FABCKH3">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="fromPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="toPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Đến kỳ" e="To Period"></header>
      <footer v="Đến kỳ/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="tu_nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year1" defaultValue="(new Date()).getFullYear()">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year2" defaultValue="(new Date()).getFullYear()">
      <header v="Đến năm" e="To Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="loai_ts">
      <header v="Loại tài sản" e="Asset Type"/>
      <items style="AutoComplete" controller="FAType" reference="ten_loai_ts%l" key="status ='1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_loai_ts%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="FADepartment" reference="ten_bp%l" key="status ='1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_bp%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_1">
      <header v="Nhóm tài sản 1" e="Asset Group 1"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm tài sản 2" e="Asset Group 2"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm tài sản 3" e="Asset Group 3"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
    </field>
    <field name="mau_bc">
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
    <view id="Dir">
      <item value="120, 30, 45, 30, 200, 130"/>
      <item value="111---: [tu_ky].Description, [tu_ky], [tu_nam]"/>
      <item value="111---: [den_ky].Description, [den_ky], [den_nam]"/>
      <item value="110010: [loai_ts].Label, [loai_ts], [ten_loai_ts%l]"/>
      <item value="110010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>

      <item value="110010: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="110010: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="110010: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>

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
        <![CDATA[<encrypted>KzBIjI7p7qe0yr57Ht0ubgnNyaji7Devq1zjQ5i5Eiq4udfoh/mSXiLe+DswbIk12I9yrcexw74oeB6rjzHK2wmwkk8W3jf12PnHpHJ9NlT+c7ChsvNfyXNz6fGnfmiBQ4n0PQ2yL70MLbtPG78IVO+50s5VUg1XhU3jIuzdH0E8kSHt+XQNoRgP5vR66ANNuNLqkFZ9XXtZBK5CHJ8uszw2pytMHxnFW/R86dfQaVvFWVbuUFLkvTO8+GAML6Rd9CYk8kf1wiHZpyxc/L5Qlw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>KRhuGVxlao8jdLszGVMujHU447IhFZP70DhfgPKNYIqjR3U2jvRNXet0/3YfOVMzOzKWugdJOuX3/21fJvOBNMs9JzIU+C83iICrw62l1O3B4coS8e48qCao+fkXFI+GfXSybfTPhlYJ3ee2R5sRTP1k6a10mboC7ITCgCkAfGz3rnNv/W+cTK1M24juzGHm0E9LURd5kvVS0lUMgzhnkv/4aad8CsR6cAt5kh6Od7lwIdfLbna2j/rwdimxWPXJfjjt9beag04A/6jWbEYJz8CwOsyfRVdPyPNmhUeJ+jNM2TyZug423d+9UB6BwkKA8rON36kAaaGSCf7L6JHNKuBW5LWz+qnWDdLgsn5RNHLCqClMrXcT5Z/tHqhEeyMMNyWstRIyeU8UtzRoXpY3vIZzm1ilFNWmzvuUEdfT5o4RBY/nN8quCTCVEwE1VtQ6lvxp39yDOSKB6wzrdoMLw7yPzvvCqC6cShwRa9rK8RtTnX3PY3LpFazW8Xchif1Gi0jzGSo2gBF7CjXyNZ05L/VLmZLdnyHUlvaICnqf/vil03UsXzlrjOSKI7w2f5sEjG8R4MAuVtavchzkOlIRksqTSo/KvXAcNEZJQsrMJj8/FOFUot/nuQxxhx3zkywTvZIGQGBvKBMw0A+9nB340FgB329nvzGr2RboRsttdM3nVkNjxHnzNcGaeAP2ThD8</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
