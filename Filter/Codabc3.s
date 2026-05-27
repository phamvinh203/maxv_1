<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CODABC3">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Từ ngày/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="tk" allowNulls="false" aliasName="tk_codabc3">
      <header v="Tài khoản chi phí" e="Expense Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="giam_tru" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Xem giảm trừ" e="Show Deduction"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"/>
      <items style="Mask"></items>
    </field>
    <field name="vu_viec_me" onDemand="true">
      <header v="Dự án mẹ" e="Parent Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv_me%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_vv_me%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vu_viec">
      <header v="Dự án" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_vv%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Kho hàng" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_kho%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer ID"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_kh%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv1">
      <header v="Nhóm dự án 1" e="Project Group 1"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv2">
      <header v="Nhóm dự án 2" e="Project Group 2"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv3">
      <header v="Nhóm dự án 3" e="Project Group 3"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
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
      <item value="120, 25, 80, 105, 100, 100"/>
      <item value="1101: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1110: [giam_tru].Label, [giam_tru], [giam_tru].Description"/>
	  
	  <item value="110100: [vu_viec].Label, [vu_viec], [ten_vv%l]"/>
      <item value="110100: [vu_viec_me].Label, [vu_viec_me], [ten_vv_me%l]"/>
      
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [nhom_vv1].Label, [nhom_vv1], [ten_nh_1%l]"/>
      <item value="110100: [nhom_vv2].Label, [nhom_vv2], [ten_nh_2%l]"/>
      <item value="110100: [nhom_vv3].Label, [nhom_vv3], [ten_nh_3%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>ZUJsl2OJO94lY0u6k15w3FRyH9UtL19swP4CgwvDmQzBF2UWHvnZot2KRHZy+FulOf+9cnqQoF6S1vYPFFrI0UUXR0I5rJrHWwPoUDZeZfu2Hz7GaA0wI7l1sFRH+xBvypoJGbqYWXCk/qGbi1t34ZD5G3yHBNGspxSZ8RY6rPF5PVVtC2qyWlw2BPx1IwkeoUQ77gYNMmizN90+POnechS0oT39MnoT2q4oIaSBxRU=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>5rUCI5WxiXS6llLMU1rsklUQ6yJihPCOgOe6u+qQPYAjehL/te9Fj03nzOugy6Q4iNNWIz4jeirNDfE3gp7/+GFOhB+5nQ0191sD4D7oCNT0F7pQShPx9s+w+Uxtezg8HTo4kKDgkVYK7VoIQbwKQH/y7sV2SxAOhBq66DgM58s2NGcOFY0MBWbOeiRJsHKLlM/9hMiuPjFr7mXy0w1aU20ISB53TQelim3Afm8FTuiYqNKmnFY/5PC5qkn9IWBvm/7X50zOvL+Q/TPtpN4NxRKVLzppu16WnOFJJzZehig7Jx9gq0QmQ3uLLG9TZYJHzgRTYUtcbSUGp9+82yuyHyR2HJqKb1JHADscBOx4/SfQQS6mUUSwb2+p33zMGQfb2rhcBWbCgkTeqirk8EI92V917PNBW+QlS/w0f/MVlfCK0o0CTnVeheBOtC2vklGus2NHH36Gg1nGLRWJi95Mq/M8ZnthXFQpTNo2qba8riwBUt3OolH/KzR1AuLh9qSl5ZCTDImGCDcnvQL0O+FiK2+WCZmjOL1A+pZmhGqSrmlP6tSxKtRGdjDQPK7S1LlD+fcJrETzoxULZj0yAfdb36V02ntxrVypOA16/MxICbS5Pn8XuXyPMmI8KSvnCp4LYD6rbtQqyl4zMEPYr4eKrxMrz+JPGk6LiKOA+JWHwq4=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
