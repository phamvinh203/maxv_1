<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLTHPHI5">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ds_tk">
      <header v="Danh sách tài khoản" e="Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="no_co" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Nợ/có" e="Debit/Credit"/>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>
    <field name="ds_tk2">
      <header v="Ds tk không tính g.trừ" e="Non-deduction Acct. List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>

    <field name="bc_theo" clientDefault="1">
      <header v="Báo cáo theo" e="Report by"></header>
      <items style="DropDownList">
        <item value="1">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="2">
          <text v="Phí" e="Expense"/>
        </item>
        <item value="3">
          <text v="Đơn vị" e="Unit"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="nh_theo" clientDefault="">
      <header v="Nhóm theo" e="Group by"></header>
      <items style="DropDownList">
        <item value="">
          <text v="Không nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Đơn vị" e="Unit"/>
        </item>
        <item value="2">
          <text v="Phí" e="Expense"/>
        </item>
        <item value="3">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="4">
          <text v="Đơn vị, Phí" e="Unit, Expense"/>
        </item>
        <item value="5">
          <text v="Đơn vị, Tài khoản" e="Unit, Account"/>
        </item>
        <item value="6">
          <text v="Phí, Đơn vị" e="Expense, Unit"/>
        </item>
        <item value="7">
          <text v="Phí, Tài khoản" e="Expense, Account"/>
        </item>
        <item value="8">
          <text v="Tài khoản, Đơn vị" e="Account, Unit"/>
        </item>
        <item value="9">
          <text v="Tài khoản, Phí" e="Account, Expense"/>
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
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
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
      <item value="130, 10, 25, 75, 100, 100, 120"/>
      <item value="10101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="101000-: [ds_tk].Label, [ds_tk]"/>
      <item value="1011000: [no_co].Label, [no_co], [no_co].Description"/>
      <item value="101000-: [ds_tk2].Label, [ds_tk2]"/>
      <item value="101000-: [bc_theo].Label, [bc_theo]"/>
      <item value="101000-: [nh_theo].Label, [nh_theo]"/>
      <item value="101011-: [nh_phi1].Description, [nh_phi1], [nh_phi2], [nh_phi3]"/>
      <item value="101000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="101000-: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>DH25v8Ntz1smYLH/rbRgYke1dj2x55o4wnKMb2mwgbV3V0XP+MmLRDf2EXYBk8SHNTtRiQRiOwc+BiTi4QVtqPCfzrjgSFwFeBbvKyyRiSU5Knsmq4BO4opUbVaPpD6mvIZODYvuFr6sTpRlcF+H5kw3I45UtIBBR+99mRwkDE8rRqE4rCyic0lZKJPswu9JTioJPpqxyTk0wfKHirX5vZzjG7cPTCwhntdYg5cg1jiDsO24a2To/WfrQQQQDJ3YCUrkzOukfuJKERmjJgnVa7aC9hY9Tf3A9W9zxvu02LuNYV8ch2P/6oAfN8yh0tU6KpE1vPVcKedb+jtJfpg3FwkAdHUx2jurbTCTxDT0vG7EQ0MoYiJtlPQCmWOz073Vj7IfWEYvVahZ4acVrPLL8wKYUeRxk8qdUuzMluuwyQo=</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>

      &OutlineEntry;
      &ScriptQueryFilterString;

      <![CDATA[<encrypted>UpSRtMksU8LcgqVeC7DV35dp1kRyVnaMFWY3VkxKnmpTGdNwa/4nQu4ohdpyPJIsmrn7PdCCRrE0xIGFmJEet/9cYi/+wHw1j6YqouBX7g6uhDaA9o1ToByn1e2MMx2ME/zqGxJnIUzLZhgmH706Y8vGUGZ9eCheZkFOB6HNyDvOjU6xRcyg7wlekqE4BSXmLAJsZHhJDzIRSrNKgzNbh0HRgLbO10QbPTrOA12C/7qJQNzdaWIv2L0bwpOHEUn5KssFoSEC2/wnZAmVMnKL2D3ZP4zowurEtoQWTx2XzDe5y4OWNI3B+0pTQ84gyAh45FtyGZGkryBCDxdH7+sLCYOgUF4+UxfH2LCpmT9FtTxy9TtKS9xZwe5L46iGyuhYqbkmMw5Tpi2ccD4N8JfHjjC1hPFfWzxarvAUZzkWvTIGeLOBpn7ZNDldx5hEpj7Q/kH1XjbdcuSZ8XMCdlrlapYoWcAREJ+4O/ws0QceiKGoUyCI/kas462D58g5HKCUDeeImg8btCEsNLTbEfYWGLmqRE7PvhY1i9hbxfX9BUfSKRdqPIQr0Q5lBilhzTlXEGHseU/ijM3uc+UAlBdFjlIJhQq0a/uoZ2TSCgmn3RfjUJ0KYPX/ot5+Zrcvfn41/pIb25DeS+voPscyA43ML7k/BKuAlKE8+9A32CZMAFXTx00U+dHWCRMXQmqkil0CkkcKFEXIzkBEel3z8xWmd5Y/KUz5l6tpeL8xSx8YLPLFtQ9aCFVfwV51yRvAZc9fmW4bDWfKmwIrQCWEXI8tpVjAgbHfROVB+k+xhsB0jxwq598hrtJiuz6q1Co6hcIDJvtXYiYiqMizu57sFeHyhw==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
