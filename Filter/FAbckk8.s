<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "FABCKK8">
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

    <field name="so_the_ts" allowNulls="false">
      <header v="Thẻ tài sản" e="Asset Card"></header>
      <items style="AutoComplete" controller="FixedAsset" reference="ten_ts%l"/>
    </field>

    <field name="ten_ts%l" readOnly="true">
      <header v="" e=""></header>
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
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111----:[ky].Description, [ky], [nam]"/>
      <item value="11001000:[so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="110000-:[mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>sVV0XVRytihjEQAw92yQ4GWJZk6/ff9rkRUvPdYq+ZR+VV+q4Rvn5q512SIQdp3HcXYBu4Kghmt29Q3patSJALu7ePGVO4tFg4i8fXSUdf4BMXIWFnIiAo/OIMezJYPC</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>LpqAuYIifDo/LW9ou6BiLwMFl0ZRDkOiQkQQBGhROgkGv7hTW829gBNS3wfkI5jFXYKrIgKz+6Zw1LmYF/iuh2yLej5HzQSY3iJNxcFroHMcF7LM1BRKo6eQlZHMDmD9f/XPqysgUoiJH9xeibDkStA5N+dOrpa5aNi1uOO0SWaupAhHFDF3cKfSSqJA90uCmxtY+yRLDFfqwf1rx1PjRBHjqIRBfX6U1XysBoYkjtx3lYhLmghcFXhtYbfE7wLp5eWa2FHPBJ5THygf3MJeFLQFFnVag1mSbLRecX0Eg+JshTxe9yEZJ7L18scAda0Vt8HVoCylDgbYvGpvyTs8AL0zJQ+xErhS6N+WgKZ14JlrNLF3lRIECF/HibdMoJLtV7EI4PylzsCG/9Tp9B3gV81pkva42iQYE63OXBnI/qc69Fz5/Ck4v2aunV87wEAdL2+KceXKtqlJ9jUs3/cuqXGGfiY1qdrOOGGMNW2F2MtFpLtsaVi6eiclDOFuT9whM97JGOkTwGzPO/ikOVQcPT9lKJSkO03rg5WFTSD7zxlPlfERckWcgoOkBgya3bk5HJTJDiOfU+bmAbgrgVSwK3pIPHFaUuXit9LGqr3b47piQ1wRPsF6+pjjMOIE93ei06Cj+amqPWNFVfmb+DalMi+w1KLEFZvd4/s2uU0eZL4=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
