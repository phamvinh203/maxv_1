<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CODABC5">
  
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
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_tk%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="vu_viec_me" onDemand="true" categoryIndex="1">
      <header v="Dự án mẹ" e="Parent Project Code"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv_me%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_vv_me%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vu_viec" categoryIndex="1">
      <header v="Dự án" e="Project Code"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_vv%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv1" categoryIndex="1">
      <header v="Nhóm dự án 1" e="Project Group 1"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv2" categoryIndex="1">
      <header v="Nhóm dự án 2" e="Project Group 2"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv3" categoryIndex="1">
      <header v="Nhóm dự án 3" e="Project Group 3"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
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
      <footer v="0 - Không, 1 - Dự án mẹ, 2 - Khách hàng" e="0 - None, 1 - Parent Job, 2 - Customer"></footer>
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
      <item value="120, 105, 105, 100, 110"/>
      <item value="111: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="11100: [tk].Label, [tk], [ten_tk%l]"/>
	  
	  <item value="11100: [vu_viec].Label, [vu_viec], [ten_vv%l]"/>
      <item value="11100: [vu_viec_me].Label, [vu_viec_me], [ten_vv_me%l]"/>
      
      <item value="11100: [nhom_vv1].Label, [nhom_vv1], [ten_nh_1%l]"/>
      <item value="11100: [nhom_vv2].Label, [nhom_vv2], [ten_nh_2%l]"/>
      <item value="11100: [nhom_vv3].Label, [nhom_vv3], [ten_nh_3%l]"/>
      <item value="1100: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100: [mau_bc].Label, [mau_bc]"/>

      <item value="11100000: [nh_theo].Label, [nh_theo], [nh_theo].Description"/>
      <item value="1111: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>

      <categories>
        <category index="1" columns="120, 105, 105, 100, 110">
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
        <![CDATA[<encrypted>mV2qBnR3at8OkliDBoJLYw4LyVB69EGEOc9Aaf2sFz7InpKXt5gtD/Oyu1z8xaPA8Xhn7UMAJhKPunl1t1nZ22fIVhFdcAm/3C68CXCzzJo3UM4esiYIZZhfCd84GZoJ6MxKRVM05ozY1NDhEMYoS/wgDXZPLpnMhFboWcXlIPJmI8ntNjYO4eQa8/SsymxEkfmjzJfZchsZKLCqfBexXdSV8Hzl2LYLUhnCZ9Yig5gm+3ayfQBHvu29pXKJNfgdxBs2hwW49avxAzomjNPAvIA6DCvJ3+IwIFLI2M8eOfcB19bjZh0N/X0XsjEorpmQbEQ7x3tfAPRNzMokVbUMAydZRnEZaiZY33sQcNWqtxQhEDJiYMKC3oaqfWpcANNxY9bC1A+ikilU/QQ2hA1ck1pq8yuAwv7vIkVYCDbb9GN+nhQ01ZjrPlSE1ugmMvd7LEiDo2yBpSzgmKZQu6abVag9xku1n0CCmE91wLVeiuo=</encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>Yzyn6QcPmCnDTAzUFP3y/mp2ogsjZiU5AT6/kckxkrWgPUkLdVZkiwu0Y9WjYyeP34raM7csiJMzv/TurDN5fSE4KuZEoyFDam3yiMMxfm5a03wpP2kyLOsBjo4Ft0vfxzavCgrbp0ziLc36IdIzbSpVIDubDIluP4WnttIHU7qSve+cH4KFCkFk0VYRwwnNSQDgqzLrJfw7bTMMjYgNqXlPWlnXAmhtVJelCztgXzbK7Q66sWVcl173TdsEXw0DNVukgUbiqKNCYSlfojafQNKuJiFpKSAAQjLNljRl/7Mqrukjqw7JkSPpPAQAMyPHWZ6FHmzy9pQO/kKadLqh8A6a1FqokXIKr2l/V/oRpO0=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>adZc9n9tts7RkVT5bkyJF7k5HX8a2isCn39zc/re78VaHIpGwIdjnPZG+Afb5Lev58QQodAqCJna4ewFarVMS+8MYSA5Gp0/uUcwfuLcX2tomfZfuZEtD4xFrbLhMMTNrmd6WJiLgzt0B+5nQb8G4DljjLYZrNMOlZAxW0fRLHXsSJ2LVcNfAXlcwoWjiyORLe1i/AGTZ9ijPdmeM+Qp4TFF4RMXTIlIGZ6GNqpRjKLP/sW88DlQVFbc9CLgRmduVl+mODJf8QlFGxkvBxeAGWM+uIL/jJ3+65Shx1Z6OYerbNdOCQO0YOUQQtE8IgiWBIqIkaGHkx2AI/wV29oVnfqYDBORw1TGHqe/Wdnr66oTLw9ymFgC0N8LF9bwTrAHf27OotNTEq5ugr6vO3RSdCfAjrTrMWdLiYC1BFBNt4+liveOKcUbgvbr5ngqdLLBoGjeyIVY6dliN55EwFRJrI/yB9cMhEIzJbKAkzow7ju2nsCMPjxpRGaeDa0avL1dS5huqgzj889KLgXA90iXu3RlsmC3ljGH+FoINW+jgyxaJmXeeenGZlHV8kutOLzdmsf1tIyN2ip5tiJv9lMengrCGS0Fe+NisMmhi6Co0chgngdmbagLbKwnPzNCLYmkgxIkld1HBbWX6O4A56L3iSrUxoWaBglcCwSfJ19M0+CaMXm5MdBIdspP8ptFHaL0e5fsBOKFhQeyDA0FhmvB6ooS5rJM2k/lX6hWa/dGFluH8gII8oWwNYdxJ4IxKzHXTek6oWQ9lgIpYD+UnLW6q7a2GKO4kh1X6sgT/cGS/UwV1eKybmonwU3WJtFbAMfNXAkPNbk/eRQ8D2fb7vwPUGMW0JzkO/eWraV70i0TPRP6kEcMQQm9FWK4ClVEztp+uFmfKL4TNx25/9aGKb557XxP4AJtz4A8tt38w8avh5CSu1Gi8Nj1v190Zvipq9q69ohELyNzUM//zHQvZainC/DToGSrtBEkd6PbQMK4yi8GuRLQLD7makbQMhGIeM5UI9yxSJTQC8PGd70Qo0iZWLLghpXoVZmMrzA490XCyx8oNE3qcggwFWdcYEeW+70noUvp2eXRXyh9PrUF3Om8woHvP+Zn14jXICjG5kMVFZQYJOLlqS6/YUgHMHfSJdgR</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>EXKLHSPWnMu0eGk+gavrYKn6uUbDEZr7/rC6dzmbw1pt6wiky9oF9ML5B6c+TU70baWisc3gaD5xZxhx3xhz+wWeBoxUSVnXKW7yeDZ4GnlFwoHVyNVka/29KZGJZh1aCkeLroau8d9aZ/T85bC/r5sac/+TMiuEqQylqbwxAx8=</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
