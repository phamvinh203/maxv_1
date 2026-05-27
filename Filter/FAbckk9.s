<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "FABCKK9">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Kỳ" e="Period"></header>
      <footer v="Kỳ/năm" e="Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_loai">
      <header v="Loại tài sản" e="Asset Type"></header>
      <items style="AutoComplete" controller="FAType" reference="ten_loai%l" key="status ='1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="FADepartment" reference="ten_bp%l" key="status ='1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_ts1">
      <header v="Nhóm tài sản 1" e="Asset Group 1"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh1%l" readOnly="true" >
      <header v="" e=""></header>
    </field>
    <field name="nh_ts2">
      <header v="Nhóm tài sản 2" e="Asset Group 2"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh2%l" readOnly="true" >
      <header v="" e=""></header>
    </field>
    <field name="nh_ts3">
      <header v="Nhóm tài sản 3" e="Asset Group 3"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh3%l" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
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

    <field name="keys" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111: [ky].Description, [ky], [nam]"/>
      <item value="1100100: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [nh_ts1].Label, [nh_ts1], [ten_nh1%l]"/>
      <item value="1100100: [nh_ts2].Label, [nh_ts2], [ten_nh2%l]"/>
      <item value="1100100: [nh_ts3].Label, [nh_ts3], [ten_nh3%l]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100001: [mau_bc].Label, [mau_bc], [keys]"/>
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
        <![CDATA[<encrypted>s92IylThP7LfqHrX7LzBB94FjQAq3ShCzZT6fI9hb/4sMaK1NnCRfS/YXJ5IhipDItVj7ldvvd2YEa7jQy47r/YdRwX73qrYCpEQqfRLyNOLoCqdbFhfTcZoy5sNAYOAL2pDC8UBgAT+5E9WHIfrgQ==</encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>4uN4TBvDCa7sZGuL7nrEzEVjwlTytTu0dFSlARE6BvJo+fSJ8TO0XAlNgsSIhIA/7VRf11p9nHC5FVi8Q+Cky5EVCvY2ectwamLii++nXJpWVicibim8/pg0TPhH5zHlYENo1rKM3LM15p7R0lHCWw2Un6ZGbTgLAKosHQDoQLPbEUcKxfbdNJm/0sIl3yudUOwL+hR7d709prjTGadJcsDvf70ty719gmWd6v6L9Ah8XpFy0MyDIgf9vXNkuz6VjTSMwYF1GZW/eyazOtIuLOPjnw1L5vMTWOd0Tb3jCfAGKnfJrTWxjrQ1wpEpuqPxKTMbjZX09pPnOeajssDG8TCwHhuzyN3kVlnEB3pP7AQPAKGyA5231LOureFCWAnD</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>VCcQs9l10y16WMR0EU86phrWP5+zMc0iYum1VIaYWsADSD8GWc9RcEyaqC92ea84AnXzJDcLwIq1CMGLW0CfLPLE9+tiiuKDR95NkLP192MR9dBaB0W5Jp7+KCClknXM6ChbDkdXs1p2mS3MzwZcsNLGBjFua5wU2AK8o7VukBRY8+bwOcaLEVkxHx+Qk/6/Fvf9xLPV7xbrMfCTQoTnQLwJDF+i3biQSINPDztu0nsoDfx3xw7VoRB557Ckpig4VhGa5srYNduaPdVukXxm9HcyhcPGPjBOBn/i9oOtQOaIizaInf7KpI27Z+hO9tzAAW6LY5lOOpDdPL80titl1FcxeeczpUGGpdhxAni9vWaN8mCubi/yp0tj6bH1MTNDlMzWedEhwoUtHPhrtf7pWEto/J8BciSAMrwlJEJViktCjZbw5QcAzPvLOfqtUODdwdEXLcgIOVOJnCGYgUtdUUiO8UY+sRZj5l6FXkD5YpoOf7g5twxmQyLJpc9fidmE2oV1+/q9G1RM/p0oKS7SOlNE1juhGRZOw3Y3KGOEjd30ncPc8jiu+Of6FW6svtPvtbcLJwP+znE4C9wn0ZrjH0ijHKPthKMiHs0TkSUQDxmYmdVdMB6RqDv5Vstd97EUmMpCbkzrZWoGvTRdBXqsibAgKwwFJCyh+ZUQg1fOwwkqjSxIYXE3eqVM+Z1Cr5z9QFNceZOGB9YEX8LiZty+xeDyTYjo/85Qmf84k2vD1AE=</encrypted>]]>

    </text>
  </script>

  &OutlineCss;
</dir>
