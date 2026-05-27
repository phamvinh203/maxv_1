<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "FABCKK3">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Đến ngày" e="Report Date"></header>
    </field>
    <field name="ma_loai">
      <header v="Loại tài sản" e="Asset Type"></header>
      <items style="AutoComplete" controller="FAType" reference="ten_loai%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true" >
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
      <item value="120, 105, 200, 130"/>
      <item value="11---: [ngay_bc].Label, [ngay_bc]"/>
      <item value="1110: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1110: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1110: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="1110: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="1110: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="110-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110-: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>K8dZYG6ns+vNTqxfy6bKeOG86oVZHLnI/ZKv8Kg5TqNDreoikS/Yh5jCcfx2JOkXiICHzd90FrNeYyJQDz/TD4c94cUab0VvrOj10BdcoFIqiyFakL181HEMAB0n9qcIGkJdg5c17VVdNofTwV/ptwjhS7OsG4LuHUesHgedzVt/p7O1doCmZ8cYGuG4ykxB4ce0NdFsWpCXBDUan1Ymkg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>+6uphk/ZISzQe+44psiOKOp7iFy9x8uaV15tuZfN6odWvvC12hC/3V3AKbXutZSbXdok5BQx9TPMuI9UsJUJWrY0lWCWX7/tAvA0WTSvd/VnvEcMiB5KpLpkVxpNjE7nzc7dQoen6MxQfDOIz37y8qnWOUJ0iehGyXdiw+o9+pbBh61wmVSTKxt9fPfEJskd1Ra1BpSqrGninGTs546ag2aeeKokfjSfaruEQRvs8N3XCs6sq0m3szBN5BbNbfFOI4ntwWUnBFvKWdLTMs0jt0LobM9lTe+pQgFTZRaDI8pMXtje/XXPRaN61GNG/OB7nUbSUlvE5ABgm1qPZRwtOOTGNWk7Ar7xhQfxvLxMXxMNShmgNSivSJV40pqUZbc9SBKzu8MPAwRZ8YGWGuKbWCCDVkTvHTXMDw8cW+8L4qF1SXF9pO1qS3+lAqnxrUDsC0i277Nb4CnHPx/KQDoZc4PqbOregc51iERQMmd6H2DCYo5GPE++1pMLkQ62rchNKtRqtQppQt4yHzemiXU86KQaqH3Nc3LCo+NiX9W879ofuzmnPn7MR0ar7SQRHAsXP4+dgrjVwpEOIvnlnyg5qWV76OF8sMc7ppUrMJHLsxi+OAmiu0x2bcDQQQ9pVCAkQnzAbKeZARFAM20e9zSLqoiISdNoMRTKTsceTvFHST8Zw6F/Li9JcRnJKoIvIyURZBOqqUmYX3r8M+6JrV9jeA==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
