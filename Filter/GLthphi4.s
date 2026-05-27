<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY Form "GLTHPHI4">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date From"></header>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date To"></header>
    </field>
    <field name="ds_tk">
      <header v="Danh sách tài khoản" e="Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1=1"/>
    </field>
    <field name="loai" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Nợ/có" e="Debit/Credit"/>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"></items>
    </field>
    <field name="ds_tk_gt">
      <header v="Ds tk không tính g.trừ" e="Non-deduction Accts"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1=1"/>
    </field>
    <field name="bc_theo">
      <header v="Báo cáo theo" e="Report by"/>
      <items style="DropDownList">
        <item value="1">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="2">
          <text v="Phí" e="Expense"/>
        </item>
        <item value="3">
          <text v="Đơn vị cơ sở" e="Unit"/>
        </item>
        <item value="4">
          <text v="Bộ phận" e="Department"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="nhom_theo">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="2">
          <text v="Phí" e="Expense"/>
        </item>
        <item value="3">
          <text v="Đơn vị cơ sở" e="Unit"/>
        </item>
        <item value="4">
          <text v="Bộ phận" e="Department"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="xoay_theo" clientDefault="2">
      <header v="Xoay theo" e="Pivot by"/>
      <items style="DropDownList">
        <item value="1">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="2">
          <text v="Phí" e="Expense"/>
        </item>
        <item value="3">
          <text v="Đơn vị cơ sở" e="Unit"/>
        </item>
        <item value="4">
          <text v="Bộ phận" e="Department"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="nh_phi1">
      <header v="Nhóm phí 1" e="Expense Group 1"></header>
      <footer v="Nhóm phí" e="Expense Group"></footer>
      <items style="AutoComplete" controller="ExpenseGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_phi2">
      <header v="Nhóm phí 2" e="Expense Group 2"></header>
      <items style="AutoComplete" controller="ExpenseGroup"  key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_phi3">
      <header v="Nhóm phí 3" e="Expense Group 3"></header>
      <items style="AutoComplete" controller="ExpenseGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1 "/>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="130, 36, 70, 100, 100, 100, 30, 0"/>
      <item value="1101: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11000: [ds_tk].Label, [ds_tk]"/>
      <item value="1110000: [loai].Label, [loai], [loai].Description"/>
      <item value="11000: [ds_tk_gt].Label, [ds_tk_gt]"/>
      <item value="11000: [bc_theo].Label, [bc_theo]"/>
      <item value="11000: [nhom_theo].Label, [nhom_theo]"/>
      <item value="11000: [xoay_theo].Label, [xoay_theo]"/>
      <item value="11011: [nh_phi1].Description, [nh_phi1], [nh_phi2], [nh_phi3]"/>
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
        <![CDATA[<encrypted>lh7VGj2HPKizJvXM4GdGrUheC6w8Ddy5TM84+vn/1LX8Gg9WGaP7llCnhWbiuBWeEG79pPuR9CW/9Yrh9XL1Nbl1UG+FjK5rbVH1GhltIe5PeOlDjWFBlPiiFtBT27ON3t+TYdN0Mu5sah4TSvFFX3s8VeubhDZACOg2HQvOfIBM1B+uZOwiUk4INmR8bMt6AO/gWxKMQcAJTh1X2O96wQ1H35Y1f0GktxmWL/nDlpQ=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>3xM3xpmpoN7xjY3j8YtagUsv9bgzQgLCJ2T1szzGs87LoQoeS8Dh3i0SRnVJJpezHguE2ysxvuuk3/dM/Ch6WCve4rJna9iVbO5+u3I8ayTdvbE7S2QwIJmo/iO/EBv1Ht4CRCkmuopSTLW9A4hwc0cloZzfnuoqbfSzW7Kk61hxOkEiDqmlOJ2bNsUAfEKvPIBvkF4IFxC13oSnfXJt/6ugBtqBY8J0CAwh6VB6aANVYGZXzChN1h6QmgvZFQstx6R078jFajmCWd5XX/FRC5TgYGWZhuSMeSG85TAa1yJX+RUHeaCcsI5uJ/muPy/zPfj6C/avYkX4922oWY+QzzuS8niEDyxQNVFCEA5ZFctbAeMbdVx4cE5SjmnYvbb8ps+tXRkG9DZjLENwxCgeXfazq6tHNzbB9jYOeJBrKu6pmIQk43qLfJ30zztWZf1nfxjR15+CLwNhC2GzzRxtVOs2yF283uHjwQPSQwNLntxMtSKmRcFwgo3JsE1w/tpp8tsU+edmnFc1+sl/ZFTP2c6at++HRpz/lOjNvTW+ZG6UST+xgxFZOagJ9ZlRVRt8yBNH5+VqmgU1n5F4d4PX7ffJXhQn46g6k919nCEVok+yIZmBJgA9naZjEFA5Z6uCyP7lgYA3QUCUUfb8Bs/7Whedqn26ux3tDOquSc7rMM5TedA74wl3eSyEoLHNRBwPExZhVYPetfxHcre8ktxiyue611DMClQkcjUAwRegAylKhppYLY5P60fI6IuPR/JksB+gK8VzV1qsG7ptzVKVsVYI2qXL/GH1ozRoBU9KGNIE0Rgq8Nfe6EkgUW2EGF9J</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
