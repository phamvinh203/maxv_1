<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "SOBCCN5">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultARAccount">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1" />
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false" aliasName="defaultARCustomer">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn = 1)" check="kh_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true">
      <header v="" e=""/>
    </field>

    <field name="ngay_ht1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Hạch toán từ ngày" e="GL Date from"></header>
      <footer v="Hạch toán từ/đến ngày" e="GL Date from/to"></footer>
    </field>
    <field name="ngay_ht2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Hạch toán đến ngày" e="GL Date to"></header>
    </field>
    <field name="ngay_hd1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hóa đơn từ ngày" e="Invoices Date from"></header>
      <footer v="Hóa đơn từ/đến ngày" e="Invoices Date from/to"></footer>
    </field>
    <field name="ngay_hd2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hóa đơn đến ngày" e="Invoices Date to"></header>
    </field>

    <field name="tinh_sd" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Xem số dư" e="Balance"/>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs" >
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc">
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
    <view id="Dir" height="">
      <item value="135, 30, 80, 110, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>

      <item value="1101: [ngay_ht1].Description, [ngay_ht1], [ngay_ht2]"/>
      <item value="1101: [ngay_hd1].Description, [ngay_hd1], [ngay_hd2]"/>

      <item value="111000: [tinh_sd].Label, [tinh_sd], [tinh_sd].Description"/>
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
        <![CDATA[<encrypted>i8xzUWEA4lYFM2kilvgBSGv1bOJ4r8qX80Fu20vA0QAw47UNsNG+RaYXe6TjaKl+H5cm1nT4vF349RpeUL1RdAXDaKMiH/slmyN7CE+GgOCH9qnPVOgzv8aIc82gObS7ey2XZ6AqjkRPMQZ9TFdoKJBrw4K0P7E3JiXWyxiikjdAIXZYqFFCO77FKDXAcMo/2nm3qg0+aNG9sPz61eWKzO64WWz90EFzfMoioDE0g866ay6ig+EFJhDHp2Xv4Gge6MdPEyz6shUsmlaaNH5YxcAkh2SvgMRbEbbZqVXr29wla/XTGfDbunV+hVBXNW0BGNyVLUByx5ciW2/b6/5nH8nNXyKRXo6Q/z05RSQ8lLPMXMoACqjsJ+j61S2Ek2acTvZnI+diTACfINdG4BXgajOy07Tzm2ab2BR2Rb9m9KiHVo/8LA2OCvGAZeNEkEpmrX2pA4YcOKDy6nVQQlKbDRbZU/2d1hjB9/+m/Q0LFjvAg7c3bi7+ALyMEEVh/rmewK+/H6AvP2nWRB0cEECqaK1dAm+nuuTKjZSEywJ15w4=</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>3IIG3VvR8liMMNaL8yCXHR3lnElfSYMn0ypAMoqQVzz5ga2fbYhYhmC/gUk08O+dIqvMLSo8JPQgeo3IEzfMX1hUL8fxvN23uucqDfAjTONbawudy18QVsLoDvfGQOf9DTgNPB5UZj+1VQAuvAsMKxW8Ptlht4byO1I1T4HPTM1/XMnjYPhMiNNysDFMlVyYh3TFsen10cAgn63mUAKtbLfjCUYF33tnsYAEuxS10ybAF39s7F0GsCCpA6GKagFQ0Ng2Gbs3oWxEGVRJqCCxAA+B8BIPtxjZRti4Jl1B/WlkmpEZdqle2LoZTZ1HpqPHMTzgoudl0x/fYgtaUdvuQc9fW510H2Tot0AZtRfepVuGQ3BTnH4hBBjYFQlLkP+W9duxL3dNdokdJdR+Fk+9BK3OUjRLzuxgleTV7an/t5YyFnIpFcW6HJxYVH6kA3cmLXrjlTSwi+Qys3ZU0JDf3Y7dcNqxKbKUY45V97+SRjr+r0zxBk1dpXj7xdh//nD+1VmRRqwCX4i04mwzPyF9qI2v0YgkKQevB7zJuetilKJc/zBDjdtshhahcMvfmnYe/YlxU4px5RvWZ6x1DNmcKrLHvTFgvJiG+cAgZeszDO4T5/55zCYsQa5a/CTpDVMPn3wQlrr3wS2lTJYr0nf6lZvHW7WFBLUEvcY39LS2FkmEu7qZsBR6HW2L1b4gkdylanQEjB/5Ce7MXMr9woXobtLzbcDVMvLUT2gxLU5TPNraRZPrCDQwRlODfYSbgcnt+wmYVPqydZ24X+oIQ856aOK+Vlc5dPeR5cOyQLfyXwEkpxa+ku+7vdL3UbHFwbucWk80Bp0z44AvyvW6YZdeB9Gh011dMpVSL2lZqInZuEMDKUWNnSrxu4Sne+4ccvtMy4SoJObhV2E+poAf0ugWOY8Xy8s88ROdXngjC2NA9bpeG6D//v2td6VdOmPTDbyZ</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>2ga57gGKoC4n80lu2Ug7Dr37QvnwA7TqfqEkV/zvfEqBsjnSJd4jtZmWaPeA+CqpjFudaJVqE/MhA40GOJ/FdHM3lgNE1wq21JoLctSaZVCwo42fvIywt89zILro9LZG46klllOmgcEc0sbs5ktnNCmNo9npcHt/xvWaZYYWuRrVBHWLQcimhLWnMD5tzLQMf4URUu+KiNRN9I+X0kswng==</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
