<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "POBCCN4N">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultAPAccount">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="tk_cn = 1" check="tk_cn = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ht1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Hạch toán từ ngày" e="GL Date from"></header>
      <footer v="Ngày hạch toán từ/đến" e="GL Date from/to"></footer>
    </field>
    <field name="ngay_ht2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Hạch toán đến ngày" e="GL Date to"></header>
    </field>
    <field name="ngay_hd1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hóa đơn từ ngày" e="Invoices Date from"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoices Date from/to"></footer>
    </field>
    <field name="ngay_hd2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hóa đơn đến ngày" e="Invoices Date to"></header>
    </field>
    <field name="ma_kh">
      <header v="Mã khách" e="Supplier"></header>
      <items style="AutoComplete" controller="Supplier" reference="ten_kh%l" key="status = '1' and (cc_yn=1 or nv_yn=1)" check="cc_yn=1 or nv_yn=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1">
      <header v="Nhóm khách" e="Supplier Group"></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=1" check="loai_nh=1"/>
    </field>
    <field name="nh_kh2">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=2" check="loai_nh=2"/>
    </field>
    <field name="nh_kh3">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=3" check="loai_nh=3"/>
    </field>

    <field name="isbalance" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Tính số dư" e="Balance"/>
      <footer v="1 - Có tính số dư, 0 - Không tính số dư" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
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

    <field name="keys" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="126">
      <item value="130, 30, 75, 105, 105, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101: [ngay_ht1].Description, [ngay_ht1], [ngay_ht2]"/>
      <item value="1101: [ngay_hd1].Description, [ngay_hd1], [ngay_hd2]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>

      <item value="111000: [isbalance].Label, [isbalance], [isbalance].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [keys]"/>
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
        <![CDATA[<encrypted>sVV0XVRytihjEQAw92yQ4JtNdUKzGE2eEPQdQa+BtaEHYfeu6RBoCFXwLobQFhs4fk2MDqNEWX19O9+xDRfqg2w+Vauq737xyzhZFN4SvhyEaRxf6f2fxml2KjNqgeBECXipYOQ7xwYuhTV4kzL8uA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>71wPn0mnlj+BFyWewA8+Cph5LYeYPW5YdYofYfKcaE9ow0BwfMdUMDSwHnZepVwovCvmG8vqdF+iG9cLsCt9p/gql4O3CV5J830xbRMiiDKuEJ2a/7qh7JSidyh3DWg0uOPLlFNtax7plSHTCiJWkNJ5rP/6HlWo61lkyfhonVTqpEQ7Y16gcCZtliOc5ZpsRjMUtqfhHXl2o7/aIniIKdO7726qhLWvNHOzazGHvrGpqQuY5yn5usWVXzW2wjlNO3ToR2pk1eVpDw6PqGTWtbpPRfSVMsoX3ARxK/rTeBlWZExLl1OoyqU39MqxcrcC50lN1371EaEbum1JQ88ZA7pAVCVPa51Q6h3LLZQFf90tlyIN3PuudwESDQMkyWs1I3DkMXrUVj6l9Zv3i64WCu+xG8lBpJETlzuFMlK5a+EmLehRY/G5iA/kyg8IbIwj</encrypted>]]>
      <![CDATA[<encrypted>adZc9n9tts7RkVT5bkyJFxeWtGknOc7ucIJqcDu/zBG28+xwdt0xWjJREdI/01P1gq2/gmUmiimdbNdrXNNdS5PtJK/UT5kaxnIdVcKT8vaiv0rbJaRZ3QVb4/GsZkf9K0JO5CKQRbZV+aopT9rekBhz2zy20OhAw1Bf6NpNI0wOvZ5EX3VH25vXFw0CZ1NzL4OTi1PKiDPjMmqwdCN6hX9Ckc1fniy5BZhPnek8j8lYwD9ZQuWpY1rn1c4fHvGeKWS0/lprcJsMzdRfazXkd0+GEo2O8jYDurs80i+rUJo4LCyNM+OTARAmAAhH02NpI4uCpRzIOFrLtIsXdRJgR86o1b7yd9NbrV8mMIZigAIW70NyA3A9jk+U0wIQyDhIt5hdgAatub+BU/BKEGBNuMqsRr5frPJAd+BUmZajh85y8fFeaK7tR0wt7k3tVb6+1KKWH6p3W6BAuuPb4X/xXAv3MSYxiJ2Ighsfr/nKrDIxQ/a/x5d96B9HDVHbBsao0kXlYyDB5g3f/7g1YW8rGUrlV6unmmVtqz7tCfIZJuYi9wVY5YzvyDDWXgq7wX09d6uMw7b5fQtgUMkE79183ZSQ4gxy1js8eX7OzjZdOQgRgv7tRne8GlBLlfWhBqg8gcWbdBPoRlj2KwQen9VzeWY+Q5QEi9VRsnhP1luVXSTFD34AUFH2sHYZFmkDhsJEamIHd89ESyBAA/Fja1sjHAMVLorG863P24U/JT8PQxGeeym3DlEJchF/NzcZNjP/QdhvshPiAfMAwEPg9uKcgcRQ6SpdpQiH4OnykC/9dlr7BgNlZqePg0eObvUs1eieiyb0Ay74rntBE6sU7L5+dVrqewdn1ZOd0yf9Oy3yn/TgriNGw9QSJS/s03NNUVw20mz9CNL68ogZAjCHWvBnVnwQ++1yqMWkj1fE/9ptvKDOhALA68urz5zF7BW4Iicz1XYF5pw/xgzQ3LPqqm1GgWYfGjfabH6c7GjvU7JW3GVLmdcHdvoe4aK2ZBhDIdwj</encrypted>]]>
    </text>
  </script>

  &OutlineCss;

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>6z34DB+AhCv1K3puiGUPRI2wf7OpUBsUoVu+lHQf/O2qkHf1btP7AQs5GKrhkBuhxtXCE+1/icpFR6NptsL23XhlNCjWTa0VUH/9c7CRLo1qnpuSFNs/PjNqImVB7VWpkFipJKzcFDQOYLel7B1+zT1qHV5i65/rYsuefNVzseI=</encrypted>]]>
      </text>
    </action>
  </response>
</dir>
