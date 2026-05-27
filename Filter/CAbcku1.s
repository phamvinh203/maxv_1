<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CABCKU1">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Ngày vay từ" e="Date from"></header>
      <footer v="Ngày vay từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Ngày vay đến" e="Date to"></header>
    </field>
    <field name="ds_acc">
      <header v="Tài khoản vay" e="Loan Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="loai_ku" dataFormatString="1, 2" clientDefault="1" align="right" allowNulls="false">
      <header v="Loại khế ước" e="Contract Type"></header>
      <footer v="1 - Đi vay, 2 - Cho vay" e=" 1 - Borrow, 2 - Lend"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa42YL7jlXo0ShoGODsFToUQ3own4aR87ci4INT1PLCyFsDZoc+IU1A7tT/V4Zjg8TLA==</encrypted>]]></clientScript>
    </field>
    <field name="ma_ku" onDemand="true">
      <header v="Khế ước" e="Loan Contract Code"></header>
      <items style="AutoComplete" controller="LoanContract" reference="ten_ku%l" key="loai_ku = '{$%c[loai_ku]}' and status = '1'" check="loai_ku = '{$%c[loai_ku]}'"/>
    </field>
    <field name="ten_ku%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv">
      <header v="Dự án" e="Job Code"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd">
      <header v="Hợp đồng" e="Contract Code"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true">
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
      <item value="140, 30, 78, 100, 100, 130"/>
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="11000: [ds_acc].Label, [ds_acc]"/>
      <item value="111000: [loai_ku].Label, [loai_ku], [loai_ku].Description"/>
      <item value="110100: [ma_ku].Label, [ma_ku], [ten_ku%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
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
        <![CDATA[<encrypted>VVszOBReljU6KeJgPCEfWAL7yyXPpW4hm4CU+txo2M74YmEHxk8towpvmlDJC7kkFWPjs0dOaP+EU3/oHQvIw/3m8a1DvGjBo4NJxwhuh/SJhNcxHz3/VS4timE+lgKARO1cgltNfprEN0PysmserV0+3lszctvC2qKQJxfJVMZ24nx2ftxEEcVJpp37HOrV</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>x2D3Ld9Tsw/HWGVp6fiXdFa2VtnOR2kstlhlxHV4iTxgUrQ3tD4+aFo2qLPo0nONQustmHJ3ThoCH6JIwGLYqUFjrIaswEAfSRWzPXep5uzDeEa1JJuXKKa4ueJGP6EhmJZ8qjTR17KPgh1y2mytIzYqjAUWkRsinzJSuvlgvFHHMMvT+T7aetjEQrEd/9ZE4fc1AmOZc6n8Fb6AnPBjSnJXWEDpD09hlHdZUjGRsJnl4Ym18tul4AKES0HR/PL1xatnO45dUC+hGVgtSbIOIoYyCpePRXiUlHoLWnx6Ww9LJ4N7wvewsBbc8oq1ZEBahmn3SvHDml5k95vy0U5rV8rrBKrEWkXIglY1gNNCLUaR1WWxw34fEiEX2znGuVXBxgZm8cxGLlDL69kjpw/QG/7hFGUgqJlWWDV06aYcXJcvjJ+/n5/PmoSB6Zdxb24cMQfN+qWlWolyWuTqBDH2v29oiC3U8lBY7BE5bjK49rz4SbAh3pWY6y5V5lIDOvb9od+XsEQvbXVwLlo5NxCPSp8F1zgVpcwTjvO4mV9Koum3yi5ElzgnPJu2SfQl4uyi28bERq9fdkonqjlHYPQB+aMjv5iNaevl5QpP9RkGYu8sFOdCcVAt6wBxB8oEIfsjP4nTPKZ9RvPmq/Wryk8Xm8lMbyWykW/MCu5GrdfbYI7BkCJPgK7h5K+aKLbeQ5DpOFZ6Q6FTx9xZap3dMUwRntMJSWuGkMYOFPfiET6ASCu8dqE8aIfT8mdnLrtpIQSt</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
