<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CODABC5N">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Từ ngày/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="tk">
      <header v="Ds tài khoản" e="Account"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="vu_viec_me" categoryIndex="1">
      <header v="Ds dự án mẹ" e="Parent Project Code"></header>
      <items style="Lookup" controller="Job" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="vu_viec" categoryIndex="1">
      <header v="Ds dự án" e="Project Code"></header>
      <items style="Lookup" controller="Job" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="nhom_vv1" categoryIndex="1">
      <header v="Nhóm dự án 1" e="Project Group 1"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv2" categoryIndex="1">
      <header v="Nhóm dự án 2" e="Project Group 2"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv3" categoryIndex="1">
      <header v="Nhóm dự án 3" e="Project Group 3"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
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

    <field name="nh_theo" dataFormatString="0, 1, 2" clientDefault="0" align="right" categoryIndex="2">
      <header v="Nhóm theo" e="Group by"/>
      <footer v="0 - Không, 1 - Dư án mẹ, 2 - Khách hàng" e="0 - None, 1 - Parent Project, 2 - Customer"></footer>
      <items style="Mask"></items>
      <clientScript><![CDATA[<encrypted>ALL+J2YIzAZE/i+ScydPEyswwf3P1PWbhEqjJDyp0Bln2L97DUtVvT7bRz8/3yMvZqiN6SlBy0ttOiJ/V3iT0A==</encrypted>]]>&OnSelectionOutline;</clientScript>
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
  </fields>

  <views>
    <view id="Dir" height="185">
      <item value="120, 105, 105, 100, 130"/>
      <item value="111: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="1100: [tk].Label, [tk]"/>
	  
	  <item value="1100: [vu_viec].Label, [vu_viec]"/>
      <item value="1100: [vu_viec_me].Label, [vu_viec_me]"/>
      
      <item value="11100: [nhom_vv1].Label, [nhom_vv1], [ten_nh_1%l]"/>
      <item value="11100: [nhom_vv2].Label, [nhom_vv2], [ten_nh_2%l]"/>
      <item value="11100: [nhom_vv3].Label, [nhom_vv3], [ten_nh_3%l]"/>
      <item value="1100: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100: [mau_bc].Label, [mau_bc]"/>

      <item value="11100000: [nh_theo].Label, [nh_theo], [nh_theo].Description"/>
      <item value="1111: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>

      <categories>
        <category index="1" columns="120, 105, 105, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 25, 25, 100, 75, 130">
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
        <![CDATA[<encrypted>KkGDzLSEvq0dixOaE3C+65LrLd6khp9bEMn+T4ru+HJiEkkDbbfVsauLFHcJAHFaoRrwa4StEdPzh/kz1s8G8ug5JTJ7mfFPDpeMH6VCJpjimwXVupxVA654/eyIQWGMWL9jkcfG79B+Qpv0EOuBAtD3DwrcWPL1ky5xdJftSqV0VFXiD5IQRmvAiPR/Z+0n6TzZw6FiWGr/GtEDFYBI/k/Sg2FEIvh9oaSfNDO58MvhrWt8ExQaUb/5+ltU5/ADrJnF901yLSc1YIGdxbo5ZAjft2Wb7P8ofcQ5qdauhtS1mWuD13qZwKfWU94N3Cx6bnQZOCxuw7mvjBVb6Z2UpXzhYWKjYYQ1ePRtrgxg9Y+LqYySAHsH2Th/8jlkQ0L1bj0d9yiYeddjMomZLw9W2Q==</encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>Yzyn6QcPmCnDTAzUFP3y/qqg6FIwocKwVSRU0o5fQbmtjCXs5t3CQyNzaqLtkgS2oDQrqlAPNZ7Gpax/47TdKAZ4+yYJlNYIseNhvdmkPHSjG6y+SuVwPqcsoU0eOvgOl8onC+G9wJ/8aTotybI6TqPeD4YBe/R6FeS78nPpoPbR96nnr1FA3C2h7twWIhzUKRDCiVgcyO9P3qL7ur6ox5Ve8C2FmC5u2Q2eZ3KNYMq4blCzQ7r+i81bj6WrcfjTlzuZSo42TlD2Ty/Sz42bz5p2EHX3B7LXI0HZqlVVPHoENsI3OHYb1+8tiPW2Pu6c9mt3q4u/Yl+QM3mGwxyNiAr+5nVV6yBsWETUJpasrIk=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>So8cBBoiLLfRIt8I2Ecj/0MXrqa5kJJiV2LKH1/aUxYPT3f669KvWh4Ec6Z1vJSTBxO9J6+i37NZLLYnzQgzIb5YOsU3MolyxUR5S1xNt8wfIs1ezIe/t0wZtz6LnDJW1xezsgGKBVUXugjJDqQe3yhEIwUSnBDlTkclDoXu3hv5Xv1/1tXvND6PFOMTsEZoRLKKA5A5lLAFzvPdFV08ilbiqbNftNxdx8k5r2gaT9xHHbdPYEq7zP+/X4rrkQq0reV4ge8qUOV20yeW53IjDpaGR1jdz/+UjTeWMoNs3sw2M/ojggkDti4YDgRuivkGXKMyejnH0B4hr3RI3yxHnXr0m5HQWTOBrz5acpv3jW//NHKF+of1Ybd9LrJn4ONWEC90ofbgpZJlfuOplMOizECa+hCfrLiGHrxyxqyZhxTYUUF7Fb7DaTqCjugsgleWyyEO43pKsBvipHrLUcZ4R9tyBTkipO2ULKV9BegbXLw1veholfmOVnqe2dC+W9g6NOiy2h+uzz7Oe61Yrw2qDPcl1a/rGag0G3TBz54k4KTP4MvuyRXkW3WH8FLA4nqK6eEeacnAkhWom/ic5Ooy5KGrKHnEWBVxDiYC14xzFp/8Czk2Lp2T3U2OkxgtrjkgX1jXw2IVJfpVBfz6aEmz0BEMRnIO/49eQ5+qpSmGTgHynp7eF+zTsTvuQOWc4yJ5o1N/RLDhj+tpfnuCTB9Yx8hS9kWPWwXbYct4LqkBM4wBFgIOEPAhXEuzSgeSVMU5NJfxmhyUYkFz+pNq5aYOaaDr3uACcVteW1onDy9W4NblLV1zGkrGeUfPHqy4iKIPJsjmOWp0MrQg0yRKFHP8PWo6E5ilIrDXVJBkDvie3NaILvpwD9b6kiq3lW0UwAIy9WhKa9XXXR4ocWDJLKVIGd+A0keHG1R3NYcOIWSTYL5yw/8mV+AcdOacjQfn961eifFwaetTy5dZ32JQ01M3FJPAYX+W/R3RFQSUKgrvLNak81l9+XvBeyYYvoURU4Zk</encrypted>]]>
    </text>
  </script>
  &OutlineCss;
</dir>
