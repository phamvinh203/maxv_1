<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CABCTM3">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="tk" allowNulls="false" clientDefault="111">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" normal="true" key="status = '1'" check="1 = 1" row ="1"/>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
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

    <command event="Processing" >
      <text>
        <![CDATA[<encrypted>OqKV6H1o0XBOCpLkpBJYInXm/ZJlGh1Tl5DCsgHFRjQkeJwZER0zMNpkWxuWNt9JEi55Y4j2CyUTWU586pwlV2Rnwvr1msf37BgeIc0tut1ng0eIO9H/p3Mqb0Wys8y0wlu8bHVHFL8tY6PB01dahqWIit2Oye4a4hEMpMHqp4y9oQf+zmjy6C+GeRoGvZ4WMRxMBYvDnoBEKqeFz17IZaZqQsjcyKEJl57du/Z0Juw6VNd7h+EyQxXdLzlPxwmMjFCgCoLKFHETXqWYQxZAPQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>jAM+2OWNong2bHD6+883qtQiJBSlhUGZ+ppFBWuFFnE2jDekYHM+74zi+PQiziGwxuJ2Wav/CCoZiTOZ90MG1QrnZ/cpK0H86P5QYXJ5vlcZ4i8SgiSCpr1DCpsrxYcQAX1vskl37fs/Ny+cm55R/QiO1feuHQezTSwlt0ZUgmwTztTMYMHTm04m8wkelXjucFo2ZjGQ/LquDqQADQC/47bpHDwStgNzx/w2haa06aig/67Z/IX58+0+cygfplpoWezfn8+8t0tFo2FC21MX2Instu2TMl4Mt6PTZ3iyOQKgcbw9oYQx/+YlX4ozfAYWhRyxXol6RnGzx9RRG2k+gBxholEgWGWqm/+tra1VLcoUwPUsm5u993+H9ZmV7Tf3FuAl57LHHmHrbvM93V1kc27M+Gd8u53E8SzdesXeUetPVh1FsO6afUsitl/r/gbP8PB8Al9wcVy0EH78YL5A1WWPgVCPTXmqWKxoj+EQYpii302b4lRNA9rdrbN69PSqD3DzIP8bDqH34Uo2va4burml6s/pjrNK9cpVAM0Qbc3JVF1dFCHKW1FPgGFWBC1PCtI0wo2PKSKvcqfraffy9X6i92rxmWPy3Ocw2PjgsXUwuO5n564XwmMUxv/60ITRzunJvx3u4qjoBZaRYCTmuzX6ErXMYevGeGs0tmz/g5qDe0by57+LihBFsxsybO5pJ+rdrj2TLm18eUtfUxBHebBep397HikS6NNb1ui1IG/kJmyssB8PJlhzhByad4uLIEDLzPVUFkjqIqbnm5Kgu08yW3FtSoG2kcinUgKeWS+eg2zqRi9sMVruq7bPTny+lEx6JSKHd1fPF7dnr5gf390vyASP0c9SH9E3XX1qmm1da7qqPgpHiD8clUoCGPGnWbbcls6oQlUlUFDbczgRPg==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>6z34DB+AhCv1K3puiGUPRI2wf7OpUBsUoVu+lHQf/O2qkHf1btP7AQs5GKrhkBuhxtXCE+1/icpFR6NptsL23XhlNCjWTa0VUH/9c7CRLo1qnpuSFNs/PjNqImVB7VWpkFipJKzcFDQOYLel7B1+zT1qHV5i65/rYsuefNVzseI=</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
