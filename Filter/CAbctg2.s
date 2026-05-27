<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CABCTG2">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" type="String" clientDefault="11">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l"></items>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày" e="Date"></header>
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
      <item value="120, 25, 75, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110---: [ngay].Label, [ngay]"/>
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
        <![CDATA[<encrypted>Lqs2AHDf1+xxd7VZPm/pUNNxmBdqnHbtXqq2yUELp6V1k5iH5D+KD1OZV03vRnL7BzwwjleChzDAkL344njKqjj7U2S1gW1s06SS/nJvk4io8p/C6S9tw8o1VIUuUVhg+HsLctxO0o4pBmwfRyxcF5dhh+kqwOUD+4I0pU/5xbU=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>v4dsLmW0CRXotDprz6i8Y8/Xin1Vp0UKVCbcZUlJqtfzEUXvSZ/R9iVjB5o16gBJE0H5Ws0n/ZqjraZbns7zdODqDimRm7YJFsf1n9Q/YoI+EKhoiGoMD9J+0SDW/7dv4KCBWZd+kacrIPjVfU2Vj3lo3+UGIqWGQC01yR30vQHJQE+7kGrOp9+Px5RDJekk4cmRUfnRmNyhsQRYhS0BM/1g/vNZxBeoHJizZOw+m2z+D5rX9f4YEtlgrrF8fhBz9vqHIiVl5J0wcPJBlw8wSEePI0GYv3/8IT9e/uk0ZXQ42TkRMziHLcVzfUwKrbAOGy7k1u2hlygtk9ySD3tFaJhDIlDbr4ynGtVyQvJEl2P4ws7X5LIVWfR75QsKFAef0SrCT5PrQep5zKqe3VVgb556PoIgYKitbvR3uWB0HNZDbL1B8iFN3Mn5Z3+QavUXHAOFQArHDaSYHAvxhLNPHRBRfRSEvYsgcLai2yT3ujOduGpQkv69mZ3d41jk2I/Sn3ohlKaQqiZADfHa1nNK4iZt3hE7qBoIvTX08xW7AoQLHk7LhlIpkPWIAY7eIU4L5N0+ei39P6x63IYC/gTOmlCLFMNe8LarxBxWS9Nv/NEmevyFASEkvtOLAgJcF6LZovgVZpfx0OQ/GnHo/+zwoQ==</encrypted>]]>
    </text>
  </script>
  &OutlineCss;
</dir>
