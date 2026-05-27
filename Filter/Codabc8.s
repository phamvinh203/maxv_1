<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CODABC8">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date"></header>
    </field>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" normal="true" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ky" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Dư đầu kỳ/cuối kỳ" e="Opening/Closing"/>
      <footer v="1 - Đầu kỳ, 2 - Cuối kỳ" e="1 - Opening, 2 - Closing"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_vv_me" onDemand="true" categoryIndex="1">
      <header v="Dự án mẹ" e="Parent Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv_me%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_vv_me%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="1">
      <header v="Dự án" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_vv%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_vv1" categoryIndex="1">
      <header v="Nhóm dự án 1" e="Project Group 1"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true" categoryIndex="1" width="0">
      <header v="" e=""></header>
    </field>
    <field name="nh_vv2" categoryIndex="1">
      <header v="Nhóm dự án 2" e="Project Group 2"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true" categoryIndex="1" width="0">
      <header v="" e=""></header>
    </field>
    <field name="nh_vv3" categoryIndex="1">
      <header v="Nhóm dự án 3" e="Project Group 3"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true" categoryIndex="1" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="10" categoryIndex="1">
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

    <field name="nh_theo" dataFormatString="0, 1, 2" clientDefault="0" align="right" categoryIndex="2">
      <header v="Nhóm theo" e="Group by"/>
      <footer v="0 - Không, 1 - Dự án mẹ, 2 - Khách hàng" e="0 - No, 1 - Parent Project, 2 - Customer"></footer>
      <items style="Mask"/>
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
      <item value="120, 25, 80, 105, 100, 120"/>
      <item value="110: [ngay].Label, [ngay]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="111000: [loai_ky].Label, [loai_ky], [loai_ky].Description"/>
	  
	  <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_vv_me].Label, [ma_vv_me], [ten_vv_me%l]"/>
      
      <item value="110100: [nh_vv1].Label, [nh_vv1], [ten_nh_1%l]"/>
      <item value="110100: [nh_vv2].Label, [nh_vv2], [ten_nh_2%l]"/>
      <item value="110100: [nh_vv3].Label, [nh_vv3], [ten_nh_3%l]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>

      <item value="111000: [nh_theo].Label, [nh_theo], [nh_theo].Description"/>
      <item value="1111: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>

      <categories>
        <category index="1" columns="120, 30, 75, 100, 100, 120">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 30, 125, 100, 120">
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
        <![CDATA[<encrypted>lSDLx3ZkPCemGYNL9+MLnFvNxraWy97d2Nj3GZeMZwMvDnsJ9eJCFe2NqhvikpK/s6AvS6+JX6ht7MckG5xgikI8j0l2U0q7imn5GajXjBexQHft0HjP0Ax3mHVAe4IeIAlxjolcysyl4Z+c+MFqCCTVLo9QH9CKJSQGsYwmjTbUPMz4TwPsMbtLAP5dKtARTBiSBCos5PPvSfM4/2j8Wu1PPO/+5SgbUUS+lKs4eFry0tjK0fHhFhfbgfUbyaZedjJn7mCXIBnUV67hGc8OLl3HXYb0zpmaugMoTMIru/y4uCChSVwHaN/B3l3/jTidWQXlh2GZ4UhtTGy2lSlHFqBQHQlojwOTgvSoaUp1Le4VZ8HRfj1yEU67rljn4Y/JVYfKiWFjKvimKSS/K57ocDNcMOi/JBVpzRt+z6mFHLowJ80QJtN7k+F7oCzKTrOOYg/tEQMovwZTty0DEJIgbdrbBQbeWjhoU6ORelSG4JnVtfSISaH846N67NvoXFrm</encrypted>]]>
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
      <![CDATA[<encrypted>jAM+2OWNong2bHD6+883qvTSXIiFlaEfLQJhoJZ5KAP0jg9OMLqx4fIPIFPDsbL7/nIiPj3xpF+6hB6Ya+lXyEIxb/81uqKSq3Rxbd0nmc6tL8Eo4dB2UJt1jk7wMyhz/kZNEXafbMZwuj+zxXVhBTfNhTfhE71byv1AZugv/gyZ5xmJU9mqWBO8yh17G6Ro++WOVZz1/Lhu7sgrwNti19qz1eEFz17xcIHynTrS9gMkWKNWPUQRI+YgEqdwz0uDaZdX7EKx8P8NGqfzmLtjwptltt3uOOflea3+FHjeibfdhaYnihQYHhT4ctAr0ZibNPmnIZwY2xsdMigmfYOdaSetlYExinDWq3zSuMIQDegAniSyBah51i9VkVWfAtuK+egiDTtWCPsFZk3AOkv8FYMWRwdj2oVKCBhi+s08R2L7qcCrSCiVjG2bbmp8d6Z+CjjfRDw339xpsBdJ08JElSx9jQDLQ6lADNjXMWZwos54G9sZ/jxYAptpbFKIkBUdE4sarz3yFD9jYWtWh1Ow64MhvyXH+TP78C5vpueCdxEmvlbIFKFtHUQ3m5pQMaVZH/wz1KyzY0cDlsx6st4mvqBSaxV5fI0esSLiHnI79eHjSn0hzw1Ma9wbmFV/1vwkmQ64uDEtM9Ib2YAtasuQSjvNqIrW1ns/HT54gAnEO09LoAbX+XqKqksbPPZTb5ZmUsZn4LqJ2OuIQ7FlYnhQy7lW0/wfrOK5sFN9qQnEYdQMqxJKYPZ3nnI4qebdcgp85aHn/jPztjsgs5LMbaBdgW4RsBILT5wHdNmhhlFmIsjybtVHt41lZDldASCtswXMMX8klOYD5WPuFLWNzAonS7ljpXYnTPHGUAq/VjQdBVGOKAPIzlmi3CWyvGE6e6Cv7lyYy0WzlSxo+AZM8h9ntQ==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>8HDYmxrt5lmM5WqJ2VZ/jMAExMycWEQ5IjD1g2hfMngspqKY1L+hEVxvlorELloJ6erhw1DakIDqgtVVhiihZkPQykKizKMYFVfmFTQZfXLWyh1LM0kw83km1qYLifimjlPaRpmpVOIzWNvncPJ2OMoSeoGt8f3InjWWZNYgkRk=</encrypted>]]>
      </text>
    </action>
  </response>
  &OutlineCss;
</dir>
