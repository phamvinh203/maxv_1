<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "FABCKK5">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ngay_mo_so" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="ma_loai">
      <header v="Loại tài sản" e="Asset Type"></header>
      <items style="AutoComplete" controller="FAType" reference="ten_loai%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="FADepartment" reference="ten_bp%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_1">
      <header v="Nhóm tài sản 1" e="Asset Group 1"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm tài sản 2" e="Asset Group 2"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm tài sản 3" e="Asset Group 3"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true">
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 20, 40, 100, 100, 130"/>
      <item value="11--:   [nam].Label, [nam]"/>
      <item value="1100---: [ngay_mo_so].Label, [ngay_mo_so]"/>
      <item value="1100100: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="1100100: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="1100100: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>v4LYjdn2rctvHpRgS2KK4V2eBFu2Rb5FhNIr8h0E0FZChQh2uDHsCCK1jmQKSfzGjFqyx4GuKY0V3mnqZnFm9OaGVq9O+X5CnD8XYPO+aeiBGOd64TLAKlaRx3JRmwBHngXH0CGR0/LBZZTliCaFZhy7ugTaAyLDDB6Ar405yHB0Ca9lHQe11GsF45s3jcVisWJEUYXgnAVZ4bQuHMeSaRlqWpa/vOaNBr2cPA9MSZjJI9L09h3fY2nYszOE3skDuwtVjUw4bPcfTQeS73tQ9xkEbHHBr+0F2DcmGu/gw5MwGVoslvi3wv0xFY6OYnXTB4Io9gaiVakTE7FpmzkGaDwfpeDKLkRF+mBciAIoUqvoEgZR04AdPdgJBfVHjMUDoLTCph+EXXzro821KfOeNXq0UJNNuTPg2i6sJdqoOIHHxgVG1HNozgk5FRV7LAZm1oOHzTWXFavnp5YPMdm9JL/qzdsCMSzLj0aCshN6cykxLxCBdxbUnhu+JG+aR/Pm9brBCrP43PLXJPSnPTAWkZLOtJQRveLQcywxGHqspX4=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>6h8Q6zEeBPr1lRH/9ZDlWKoF81xSoCwkdO9AAJzrt1Gy0oQ/FY/TSAMGBsKZnh8jvOBzGLYlhsuQLtO5ZvvrCkuL1s2gMqZ+qkk7T5/VqDPtvKs2xMfrpN+Eubnv2l2T7YwZ5FM454zC25REcr8m8zPiwwxPXujrfk82FTLhRNsfBonC/yXf0CBy60n+U4pPdzvbjiVrbKbFsIqhcGay4dAlN/YzTaELhLT1iJXyf2WhK7GTBQkyZtHjRznegrD8Sj8n9zKoZjD7cUcYtPI0Djb4V+XWAbz9lu7mUPHyGv3S1Y39crOv8VYTcxLNQfcw8p7+Ct0D8P6BfWXzn8LbmAzleIoUSJcA/vJuXp+i7AWmud4XJrscmfvG3Txm36Sz9ipi1kQP9+hvVnKFSFQ+kE9FrcEEEq3eFGLZJB/XWBAPXeCvDVIcFR9P+PoJ/gSDZclubm0Awpk3CAEcrlJjUT2DrZOnqe6m8kW4zgz3OlWDcD/Rwc4ueoV/Zy9XRKpoNvF+OSo0LC1PfRbn+hBe0QqG+jRlZW9XGuxkhkNJwLuxVSceXNIOvGfsnWfK3u6W/41alCTIDgfEZ+qvHLlYAl4XYpw1rIcp+kuyY/7SxJHkWqlS+DDVAAEEyW/edylVMUaTj+PlmdPNtqeRBVKb3q0FgV1AxGYdr910vPwsEGk2ankRwZjKSTcJo5cVMq9SX4JvbjCBqBm3zuf3cT35M5TBN09bNXiusW1UOfQcdE1MHOs0MFBwYU6PllnpYpTNWfgqCZCum0yx2gG3ZOUNvw==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
