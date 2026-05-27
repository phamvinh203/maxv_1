<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY Form "GLTHPHI3">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
    </field>
    <field name="ky_pt" dataFormatString="1, 2, 3, 4" clientDefault="Default" defaultValue="1" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Tháng, 2 - Quý, 3 - 6 tháng, 4 - Năm" e="1 - Month, 2 - Quarter, 3 - Half a year, 4 - Year"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ky" type="Int16" dataFormatString="#0" clientDefault="Default" defaultValue="3" allowNulls="false">
      <header v="Số kỳ phân tích" e="Analysis Periods"></header>
      <items style="Numeric"></items>
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
          <text v="Mã phí" e="Expense"/>
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
    <field name="nhom_theo1">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="2">
          <text v="Mã phí" e="Expense"/>
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
    <field name="nhom_theo2">
      <header v="Phân nhóm theo" e="Subgroup by"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="2">
          <text v="Mã phí" e="Expense"/>
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
      <items style="AutoComplete" controller="ExpenseGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
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
      <item value="110: [tu_ngay].Label, [tu_ngay]"/>
      <item value="1110000: [ky_pt].Label, [ky_pt], [ky_pt].Description"/>
      <item value="11: [so_ky].Label, [so_ky]"/>
      <item value="11000: [ds_tk].Label, [ds_tk]"/>
      <item value="1110000: [loai].Label, [loai], [loai].Description"/>
      <item value="11000: [ds_tk_gt].Label, [ds_tk_gt]"/>
      <item value="11000: [bc_theo].Label, [bc_theo]"/>
      <item value="11000: [nhom_theo1].Label, [nhom_theo1]"/>
      <item value="11000: [nhom_theo2].Label, [nhom_theo2]"/>
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
        <![CDATA[<encrypted>m2f8bTY7lTfsJKVNLP99FWYLIuKTKzbzvSnmg0lgMPiHli5rpWARGxwEmbfe7szax5leWie7sXx3o3aBgQl2E9wO/SGjKSNeikETnaVWUIPzfSsYtcp7IY9bUbBQah6XMROC+2cR3+bS/yBcLGflWU/Zcn/Yhuha3AuNDFHP4BZiB2pxc0JRo7MPm0KBGbUc5N4hR6sywyRQwm8KnAW31zMjID6myGSK4ndE5xt/5U0SIeZNsy1y0YxS2aKI53vvPbrkSMlIVEVxMtJmgyJYoXE6StwOQLzrymAa1zo8vjY+zZxvEqPdK3fbatKi2cYASuTF7HwCEJ6oVBODwkWgZuurhQXsfFGLZw2hWr8xzeDYS0Tub19/moCOcnz/9b/X</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>tELKh6gXvLuAvCie9fgnwCui4CgocnsEGoqvCjluY6pMxzjQetLpfRbBgEird4xR+pQeRqbzKpElaYXd5jDpNoW5sPLViOaZ/cFK2rAOxlh28R9qEjqF9Q+AAqZhU75ShQ0afIwAIktV/9t34cJ7CTZAcUSoPLRiX+pn4DxN/ggpdQ6+MmnSQHeIJ4UxDcVN66ADalJyylHItVbufOEJe2YxQwYRMsl5gFPmeCPIB1GaaCAPOn8el38efNQUk6LV53m5x7s6PHnG82rCh9AHLG46etiWQtUCNLnkbI1cbcnvS0vfm2H7eXorQzPvUvGp54x+yBgDxsSl2uVmkt77y1PJnTqi1p/7kWyrSIu3eRQBpmdiuVNLU1w/OGrmRKcKBmS4CNni2DZlA5P/qJsqle61bpKESrmmGI+agU+Ud9jV9SzaaDdM0D1/K40ecfbg0RbPMLtRGnLSC11uoPIdLArHAt8eHqzwH/3m40oO7Hy44LGooYDI/CLTbYfs9FDkakXD1a9yFLA749jtZhzJOUAN1hikkTjb6JSKYGXAVXlbCzv0rw8BE6PznBs1k9SgGreAgjVqnIuMicbxK1BtX9oC/GvaG7eItZEqqCJUE0HkHVZZPXPR8DLKvBFUqm/lgwFksqvTHjAa3sLBofm7fxFrzvIcaJWXrVHa91+uVsgHWhZgx0PPu6iMGNKxnZ58y0MaKSDktC46sr65WfRHWA6Waz20zWGRex0IIoZgyIQJCCnButom8nxzpUoYcxbxfmmPVoNSy8rJB+oBFWZ9+2uyEDM2Y7ZCy3ZQRqV7oAS4YxKTHPNu/3GamGtY/0NEguMNqJApyrSxsk2T22k7CxCjwPWpyCUD5bkTcdPWq+y3MgoVCQdshWL1O4akLVl+GlyA1Qqr6EzXruM0GtXspvYyZ7ZYhoRSaswMPAgw6z0DelkP9Wg+AIKWSuf+dgl+</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
